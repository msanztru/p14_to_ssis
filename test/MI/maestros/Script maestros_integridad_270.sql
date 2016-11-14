PRINT 'Script maestros_integridad_270.sql'

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_personalidad_integridad_270' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_personalidad_integridad_270;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_personalidad_integridad_270(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_personalidad_integridad_270'
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
      af270d_clave AS cod_clave_personalidad,
      'CLAVE FALTANTE MAESTRO' AS clave_personalidad,
      'MODELO 270' AS origen
    FROM dbo.tbn1270d_af
    GROUP BY af270d_clave
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(cod_clave_personalidad,clave_personalidad,origen)
  SELECT
    query.cod_clave_personalidad,
    query.clave_personalidad,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad tbn1_mae_claves_personalidad ON (tbn1_mae_claves_personalidad.cod_clave_personalidad=query.cod_clave_personalidad)
  WHERE tbn1_mae_claves_personalidad.cod_clave_personalidad IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_tipos_perceptor_integridad_270' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_tipos_perceptor_integridad_270;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_tipos_perceptor_integridad_270(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipos_perceptor_integridad_270'
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
      af270d_tipo AS cod_tipo_perceptor,
      'CLAVE FALTANTE MAESTRO' AS tipo_perceptor,
      'MODELO 270' AS origen
    FROM dbo.tbn1270d_af
    GROUP BY af270d_tipo
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor(cod_tipo_perceptor,tipo_perceptor,origen)
  SELECT
    query.cod_tipo_perceptor,
    query.tipo_perceptor,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor tbn1_mae_tipos_perceptor ON (tbn1_mae_tipos_perceptor.cod_tipo_perceptor=query.cod_tipo_perceptor)
  WHERE tbn1_mae_tipos_perceptor.cod_tipo_perceptor IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_provincias_integridad_270' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_provincias_integridad_270;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_provincias_integridad_270(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_provincias_integridad_270'
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
      cast(af270d_provin as integer) AS cod_provincia,
	  af270d_provin AS cod_provincia2,
      'PROVINCIA FALTANTE MAESTRO' AS provincia,
      'MODELO 270' AS origen
    FROM dbo.tbn1270d_af
    GROUP BY af270d_provin
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_provincias(cod_provincia,cod_provincia2,provincia,origen)
  SELECT
	query.cod_provincia,
    query.cod_provincia2,
    query.provincia,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias ON (tbn1_provincias.cod_provincia=query.cod_provincia)
  WHERE tbn1_provincias.cod_provincia IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_paises_integridad_270' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_270;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_270(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_paises_integridad_270'
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
      paises.cod_pais AS cod_pais,
      'PAÍS FALTANTE MAESTRO' AS pais,
      'MODELO 270' AS origen
    FROM 
		(
			SELECT	af270d_pais_nac AS cod_pais
			FROM	dbo.tbn1270d_af
			GROUP BY af270d_pais_nac
			UNION
			SELECT	af270d_prf_pais AS cod_pais
			FROM	dbo.tbn1270d_af
			GROUP BY af270d_prf_pais
		) paises

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe_integridad_270' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_270;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_270(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_270'
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
      af270i_tipo AS cod_tipo_importe,
      'TIPO FALTANTE MAESTRO' AS tipo_importe,
      'MODELO 270' AS origen
    FROM dbo.tbn1270i_af
    GROUP BY af270i_tipo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON (tbn1_mi_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mi_tipo_importe.cod_tipo_importe IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestros_integridad_270' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestros_integridad_270;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestros_integridad_270(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestros_integridad_270'
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
		EXEC spn1_cargar_mae_claves_personalidad_integridad_270 @log
		EXEC spn1_cargar_mae_tipos_perceptor_integridad_270 @log
		EXEC spn1_cargar_normalizado_provincias_integridad_270 @log
		EXEC spn1_cargar_normalizado_paises_integridad_270 @log
		EXEC spn1_cargar_normalizado_mi_tipo_importe_integridad_270 @log
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