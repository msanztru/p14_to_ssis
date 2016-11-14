PRINT 'Script maestros_integridad_296.sql'

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_paises_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_paises_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_pais AS cod_pais,
      'PAÍS FALTANTE MAESTRO' AS pais,
      'MODELO 296' AS origen
	FROM	dbo.tbn1a296_nr
	GROUP BY a296_pais
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_paises(cod_pais,pais,origen)
  SELECT
    query.cod_pais,
    query.pais,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises ON (tbn1_paises.cod_pais=query.cod_pais)
  WHERE tbn1_paises.cod_pais IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_presentacion_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      d296_tipo_presen AS cod_tipo_presentacion,
      'TIPO FALTANTE MAESTRO' AS tipo_presentacion,
      'MODELO 296' AS origen
    FROM dbo.tbn1d296_nr
    GROUP BY d296_tipo_presen
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(cod_tipo_presentacion,tipo_presentacion,origen)
  SELECT
    query.cod_tipo_presentacion,
    query.tipo_presentacion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ON (tbn1_mi_tipo_presentacion.cod_tipo_presentacion=query.cod_tipo_presentacion)
  WHERE tbn1_mi_tipo_presentacion.cod_tipo_presentacion IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_declaracion_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      d296_comple_susti AS cod_tipo_declaracion,
      'TIPO FALTANTE MAESTRO' AS tipo_declaracion,
      'MODELO 296' AS origen
    FROM dbo.tbn1d296_nr
    GROUP BY d296_comple_susti
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(cod_tipo_declaracion,tipo_declaracion,origen)
  SELECT
    query.cod_tipo_declaracion,
    query.tipo_declaracion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ON (tbn1_mi_tipo_declaracion.cod_tipo_declaracion=query.cod_tipo_declaracion)
  WHERE tbn1_mi_tipo_declaracion.cod_tipo_declaracion IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_soporte_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      d296_tipo_soporte AS cod_tipo_soporte,
      'TIPO FALTANTE MAESTRO' AS tipo_soporte,
      'MODELO 296' AS origen
    FROM dbo.tbn1d296_nr
    GROUP BY d296_tipo_soporte
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(cod_tipo_soporte,tipo_soporte,origen)
  SELECT
    query.cod_tipo_soporte,
    query.tipo_soporte,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ON (tbn1_mi_tipos_soporte.cod_tipo_soporte=query.cod_tipo_soporte)
  WHERE tbn1_mi_tipos_soporte.cod_tipo_soporte IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_identificacion_fondo_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_codigo AS cod_clave_identificacion_fondo,
      'TIPO FALTANTE MAESTRO' AS clave_identificacion_fondo,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_codigo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo(cod_clave_identificacion_fondo,clave_identificacion_fondo,origen)
  SELECT
    query.cod_clave_identificacion_fondo,
    query.clave_identificacion_fondo,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ON (tbn1_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo=query.cod_clave_identificacion_fondo)
  WHERE tbn1_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_codigo_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_codigo_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_codigo_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_codigo_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_codigo AS cod_tipo_codigo,
      'TIPO FALTANTE MAESTRO' AS tipo_codigo,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_codigo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo(cod_tipo_codigo,tipo_codigo,origen)
  SELECT
    query.cod_tipo_codigo,
    query.tipo_codigo,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ON (tbn1_mi_tipo_codigo.cod_tipo_codigo=query.cod_tipo_codigo)
  WHERE tbn1_mi_tipo_codigo.cod_tipo_codigo IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_naturalezas_renta_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_naturalezas_renta_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_naturalezas_renta_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_naturalezas_renta_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_naturaleza AS cod_naturaleza_renta,
      'CLAVE FALTANTE MAESTRO' AS naturaleza_renta,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_naturaleza
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta(cod_naturaleza_renta,naturaleza_renta,origen)
  SELECT
    query.cod_naturaleza_renta,
    query.naturaleza_renta,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta tbn1_mae_naturalezas_renta ON (tbn1_mae_naturalezas_renta.cod_naturaleza_renta=query.cod_naturaleza_renta)
  WHERE tbn1_mae_naturalezas_renta.cod_naturaleza_renta IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_tipos_renta_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_tipos_renta_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_tipos_renta_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_tipos_renta_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_clave_ej2008 AS cod_clave_tipo_renta,
      'CLAVE FALTANTE MAESTRO' AS clave_tipo_renta,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_clave_ej2008
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta(cod_clave_tipo_renta,clave_tipo_renta,origen)
  SELECT
    query.cod_clave_tipo_renta,
    query.clave_tipo_renta,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta tbn1_mae_claves_tipos_renta ON (tbn1_mae_claves_tipos_renta.cod_clave_tipo_renta=query.cod_clave_tipo_renta)
  WHERE tbn1_mae_claves_tipos_renta.cod_clave_tipo_renta IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_subclaves_tipos_renta_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_subclaves_tipos_renta_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_subclaves_tipos_renta_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_subclaves_tipos_renta_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_subclave AS cod_subclave_tipo_renta,
      'CLAVE FALTANTE MAESTRO' AS subclave_tipo_renta,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_subclave
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta(cod_subclave_tipo_renta,subclave_tipo_renta,origen)
  SELECT
    query.cod_subclave_tipo_renta,
    query.subclave_tipo_renta,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta tbn1_mae_subclaves_tipos_renta ON (tbn1_mae_subclaves_tipos_renta.cod_subclave_tipo_renta=query.cod_subclave_tipo_renta)
  WHERE tbn1_mae_subclaves_tipos_renta.cod_subclave_tipo_renta IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_pago_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_pago_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_pago_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_pago_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_pago AS cod_clave_pago,
      'CLAVE FALTANTE MAESTRO' AS clave_pago,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_pago
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago(cod_clave_pago,clave_pago,origen)
  SELECT
    query.cod_clave_pago,
    query.clave_pago,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago tbn1_mae_claves_pago ON (tbn1_mae_claves_pago.cod_clave_pago=query.cod_clave_pago)
  WHERE tbn1_mae_claves_pago.cod_clave_pago IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_entidades_bancarias_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_entidades_bancarias_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_entidades_bancarias_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_entidades_bancarias_integridad_296'
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

  ;WITH
  query AS (
    SELECT
      a296_banco_valor AS cod_entidad_bancaria,
      'CLAVE FALTANTE MAESTRO' AS entidad_bancaria,
      'MODELO 296' AS origen
    FROM dbo.tbn1a296_nr
    GROUP BY a296_banco_valor
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(cod_entidad_bancaria,entidad_bancaria,origen)
  SELECT
    query.cod_entidad_bancaria,
    query.entidad_bancaria,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias tbn1_mae_entidades_bancarias ON (tbn1_mae_entidades_bancarias.cod_entidad_bancaria=query.cod_entidad_bancaria)
  WHERE tbn1_mae_entidades_bancarias.cod_entidad_bancaria IS NULL;

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


/*****************/
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestros_integridad_296' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestros_integridad_296;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestros_integridad_296(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestros_integridad_296'
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
		EXEC spn1_cargar_normalizado_paises_integridad_296 @log
		EXEC spn1_cargar_normalizado_mi_tipo_presentacion_integridad_296 @log
		EXEC spn1_cargar_normalizado_mi_tipos_soporte_integridad_296 @log
		EXEC spn1_cargar_normalizado_mi_tipo_declaracion_integridad_296 @log
		EXEC spn1_cargar_normalizado_mi_clave_identificacion_fondo_integridad_296 @log
		EXEC spn1_cargar_normalizado_mi_tipo_codigo_integridad_296 @log
		EXEC spn1_cargar_mae_naturalezas_renta_integridad_296 @log
		EXEC spn1_cargar_mae_claves_tipos_renta_integridad_296 @log
		EXEC spn1_cargar_mae_subclaves_tipos_renta_integridad_296 @log
		EXEC spn1_cargar_mae_claves_pago_integridad_296 @log
		EXEC spn1_cargar_mae_entidades_bancarias_integridad_296 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
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