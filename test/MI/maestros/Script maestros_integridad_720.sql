USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_bienes_720_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_bienes_720_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_bienes_720_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_bienes_720_integridad'
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
      mf720d_bien_clave AS cod_clave_bien_720,
      'CLAVE FALTANTE MAESTRO' AS clave_bien_720,
      'MODELO 720' AS origen
    FROM dbo.tbn1720d_mf
    GROUP BY mf720d_bien_clave
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720(cod_clave_bien_720,clave_bien_720,origen)
  SELECT
    query.cod_clave_bien_720,
    query.clave_bien_720,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 tbn1_mae_claves_bienes_720 ON (tbn1_mae_claves_bienes_720.cod_clave_bien_720=query.cod_clave_bien_720)
  WHERE tbn1_mae_claves_bienes_720.cod_clave_bien_720 IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_cuenta_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_cuenta_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_cuenta_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_cuenta_integridad'
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
      mf720c_clave_cuenta AS cod_clave_cuenta,
      'CLAVE FALTANTE MAESTRO' AS clave_cuenta,
      'MODELO 720' AS origen
    FROM dbo.tbn1720c_mf
    GROUP BY mf720c_clave_cuenta
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta(cod_clave_cuenta,clave_cuenta,origen)
  SELECT
    query.cod_clave_cuenta,
    query.clave_cuenta,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta tbn1_mae_claves_cuenta ON (tbn1_mae_claves_cuenta.cod_clave_cuenta=query.cod_clave_cuenta)
  WHERE tbn1_mae_claves_cuenta.cod_clave_cuenta IS NULL;

	--incluir registro -1
	
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta
		WHERE	id_mae_claves_cuenta = -1
	)
		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta
		(
			id_mae_claves_cuenta,
			cod_clave_cuenta,
			clave_cuenta,
			origen
		)
		VALUES
		(
			-1,
			'-',
			'N/A',
			'MOD. 720'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta OFF

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_identificacion_valor_accion_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_identificacion_valor_accion_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_identificacion_valor_accion_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_identificacion_valor_accion_integridad'
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
      mf720v_clave_ident AS cod_clave_identificacion_valor_accion,
      'CLAVE FALTANTE MAESTRO' AS clave_identificacion_valor_accion,
      'MODELO 720' AS origen
    FROM dbo.tbn1720v_mf
    GROUP BY mf720v_clave_ident
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion(cod_clave_identificacion_valor_accion,clave_identificacion_valor_accion,origen)
  SELECT
    query.cod_clave_identificacion_valor_accion,
    query.clave_identificacion_valor_accion,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion tbn1_mae_claves_identificacion_valor_accion ON (tbn1_mae_claves_identificacion_valor_accion.cod_clave_identificacion_valor_accion=query.cod_clave_identificacion_valor_accion)
  WHERE tbn1_mae_claves_identificacion_valor_accion.cod_clave_identificacion_valor_accion IS NULL;

	--incluir registro -1
	
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion
		WHERE	id_mae_claves_identificacion_valor_accion = -1
	)
		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion
		(
			id_mae_claves_identificacion_valor_accion,
			cod_clave_identificacion_valor_accion,
			clave_identificacion_valor_accion,
			origen
		)
		VALUES
		(
			-1,
			'-',
			'N/A',
			'MOD. 720'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion OFF

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_titularidad_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_titularidad_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_titularidad_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_titularidad_integridad'
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
      mf720d_tit_clave AS cod_clave_titularidad,
      'CLAVE FALTANTE MAESTRO' AS clave_titularidad,
      'MODELO 720' AS origen
    FROM dbo.tbn1720d_mf
    GROUP BY mf720d_tit_clave
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad(cod_clave_titularidad,clave_titularidad,origen)
  SELECT
    query.cod_clave_titularidad,
    query.clave_titularidad,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad tbn1_mi_clave_titularidad ON (tbn1_mi_clave_titularidad.cod_clave_titularidad=query.cod_clave_titularidad)
  WHERE tbn1_mi_clave_titularidad.cod_clave_titularidad IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_entidades_bancarias_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_entidades_bancarias_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_entidades_bancarias_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_entidades_bancarias_integridad'
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
      mfdecl_banco AS cod_entidad_bancaria,
      'CLAVE FALTANTE MAESTRO' AS entidad_bancaria,
      'APLIC. MF' AS origen
    FROM dbo.tbn1decl_mf
    GROUP BY mfdecl_banco
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




USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_origenes_bienes_720_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_origenes_bienes_720_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_origenes_bienes_720_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_origenes_bienes_720_integridad'
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
      mf720d_origen_bien AS cod_origen_bien_720,
      'CLAVE FALTANTE MAESTRO' AS origen_bien_720,
      'MODELO 720' AS origen
    FROM dbo.tbn1720d_mf
    GROUP BY mf720d_origen_bien
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720(cod_origen_bien_720,origen_bien_720,origen)
  SELECT
    query.cod_origen_bien_720,
    query.origen_bien_720,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 tbn1_mae_origenes_bienes_720 ON (tbn1_mae_origenes_bienes_720.cod_origen_bien_720=query.cod_origen_bien_720)
  WHERE tbn1_mae_origenes_bienes_720.cod_origen_bien_720 IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_subclaves_bienes_720_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_subclaves_bienes_720_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_subclaves_bienes_720_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_subclaves_bienes_720_integridad'
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
	  mf720d_bien_clave AS cod_clave_bien_720,
      mf720d_bien_subclave AS cod_subclave_bien_720,
      'CLAVE FALTANTE MAESTRO' AS subclave_bien_720,
      'MODELO 720' AS origen
    FROM dbo.tbn1720d_mf
    GROUP BY mf720d_bien_clave, mf720d_bien_subclave
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_bienes_720(cod_clave_bien_720,cod_subclave_bien_720,subclave_bien_720,origen)
  SELECT
    query.cod_clave_bien_720,
    query.cod_subclave_bien_720,
	query.subclave_bien_720,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_bienes_720 tbn1_mae_subclaves_bienes_720 ON (tbn1_mae_subclaves_bienes_720.cod_subclave_bien_720=query.cod_subclave_bien_720)
  WHERE tbn1_mae_subclaves_bienes_720.cod_clave_bien_720 IS NULL AND tbn1_mae_subclaves_bienes_720.cod_subclave_bien_720 IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_spn1_cargar_mae_claves_tipos_bienes_muebles_inmuebles_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_spn1_cargar_mae_claves_tipos_bienes_muebles_inmuebles_integridad
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_spn1_cargar_mae_claves_tipos_bienes_muebles_inmuebles_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_spn1_cargar_mae_claves_tipos_bienes_muebles_inmuebles_integridad'
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

  ;WITH
  query AS (
    SELECT
	  mf720b_tipo_bien AS cod_clave_tipo_bien_mueble_inmueble,
      'CLAVE FALTANTE MAESTRO' AS clave_tipo_bien_mueble_inmueble,
      'MODELO 720' AS origen
    FROM dbo.tbn1720b_mf
    GROUP BY mf720b_tipo_bien
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles(cod_clave_tipo_bien_mueble_inmueble,clave_tipo_bien_mueble_inmueble,origen)
  SELECT
    query.cod_clave_tipo_bien_mueble_inmueble,
    query.clave_tipo_bien_mueble_inmueble,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles t ON (t.cod_clave_tipo_bien_mueble_inmueble = query.cod_clave_tipo_bien_mueble_inmueble)
  WHERE t.cod_clave_tipo_bien_mueble_inmueble IS NULL

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

----REVISAR DÓNDE ESTABAN LAS EXEC Y PONERLO BIEN EN UNSOLO EJECUTOR AQUÍ ABAJO Y LLAMARLE DONDE CORRESPONDA (MIRAR EL 296 COMO EJEMPLO)-------
/*****************/
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestros_integridad_720' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestros_integridad_720
GO

CREATE PROCEDURE dbo.spn1_cargar_maestros_integridad_720(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestros_integridad_720'
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
		EXEC spn1_cargar_mae_claves_bienes_720_integridad @log
		EXEC spn1_cargar_mae_claves_cuenta_integridad @log
		EXEC spn1_cargar_mae_claves_identificacion_valor_accion_integridad @log
		EXEC spn1_cargar_mae_claves_titularidad_integridad @log
		EXEC spn1_cargar_mae_entidades_bancarias_integridad @log
		EXEC spn1_cargar_mae_origenes_bienes_720_integridad @log
		EXEC spn1_cargar_mae_subclaves_bienes_720_integridad @log
		EXEC spn1_cargar_mae_spn1_cargar_mae_claves_tipos_bienes_muebles_inmuebles_integridad @log
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