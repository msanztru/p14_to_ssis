/*****************/
/*SP CON LAS EXEC*/
/*****************/


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques'
  SET NOCOUNT ON
  DECLARE @log int
  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log)
  DECLARE @continuar_en_caso_error bit=0
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log
    RETURN
  END
     BEGIN TRY

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_datos_caratula @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_declarantes @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_datos_detalle @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_declarados @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_documentos @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_cheques @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_representantes @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_periodos @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_marcas @log
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_fact_operaciones_entidades_credito_cheques @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_fact @log

  EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

