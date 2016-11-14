PRINT 'Script cargar_mae_modelo_159.sql'
GO


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_modelo_159' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_modelo_159;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_modelo_159(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_modelo_159'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

		--maestros modelo 159
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_situacion_inmueble @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_bien @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_unidad_consumo @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_unidad_potencia @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_lectura @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_importe @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_domicilio @log;
		
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
		
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

