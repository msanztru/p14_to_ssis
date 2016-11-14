/*****************/
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero'
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
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_documentos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_periodos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_caratula @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_marcas @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_declarantes @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_detalle_1 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_detalle_2 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_declarados @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_fact @log
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT
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