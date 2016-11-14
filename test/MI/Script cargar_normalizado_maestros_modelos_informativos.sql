PRINT 'cargar_normalizado_maestros_modelos_informativos.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_maestros_modelos_informativos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_maestros_modelos_informativos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_maestros_modelos_informativos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_modelos_informativos'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclaves @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_socio @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza_193 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_operacion_factura @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_modalidad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_registro @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_pago @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_alta @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_perceptor @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_cuenta @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_donacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_bien @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_170 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_171 @log;	
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_199 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_346 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_180 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf_decl @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_af @log;
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante @log;   1
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_internos @log; 2
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_externos @log; 3
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso @log;	4
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos @log;	5
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos @log;	6
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_integridad	@log;  
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192 @log;	7
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos @log;	8
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos @log;  9
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192 @log;  10
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos	@log;	11
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos	@log;	12  
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia @log;  13
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_externos @log;  14
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_internos @log;  15
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_no_identificados @log;

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

