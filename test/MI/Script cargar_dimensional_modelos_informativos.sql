﻿PRINT 'cargar_dimensional_modelos_informativos.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelos_informativos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelos_informativos;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelos_informativos(@logpadre int=null) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelos_informativos'
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
	 
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_maestros_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_maestros_af @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_maestros_bw @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_190 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_187 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_188 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_193 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_194 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_196 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_182 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_180 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_345 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_347 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_170_tarjetas_credito_debito @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_171_imposiciones_disposiciones_cobros_fondos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_189_valores_seguros_y_rentas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_192_operaciones_letras_tesoro @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques @log;
  -- EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dm_mi_198 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_346_subvenciones_indemnizaciones_agricultores_ganaderos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_781_cuentas_vivienda @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_181_prestamos_hipotecarios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_848_volumen_operaciones_IAE @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_270_gravamen_premios_y_loterias @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_296_renta_no_residentes_sin_establecimiento_permanente @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_184_irfp_sociedades_irnr @log;

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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_modelos_informativos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_modelos_informativos;
GO

CREATE PROCEDURE dbo.spn1_cargar_modelos_informativos(@logpadre int=null) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_modelos_informativos'
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

  SET @continuar_en_caso_error=1;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_modelos_informativos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelos_informativos @log;

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

