PRINT 'Script maestros_integridad_mf.sql'


--tbn1_mae_claves_tipos_entidad_mf
USE dbn1_stg_dhyf
GO
																													
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_tipos_entidad_integridad_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_tipos_entidad_integridad_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_tipos_entidad_integridad_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_tipos_entidad_integridad_mf'
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
    SELECT	DISTINCT 
			q.cod_clave_tipo_entidad_mf,
			'CLAVE FALTANTE MAESTRO' AS clave_tipo_entidad_mf,
			'APLIC. MF' origen
	FROM
	(
	SELECT
	  mcab_tipo_entidad AS cod_clave_tipo_entidad_mf
    FROM dbo.tbn1mcab_mf
    GROUP BY mcab_tipo_entidad
	UNION
    SELECT
	  mcab_ext_tipo_enti AS cod_clave_tipo_entidad_mf
    FROM dbo.tbn1mcab_mf
    GROUP BY mcab_ext_tipo_enti
	) q
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf(cod_clave_tipo_entidad_mf,clave_tipo_entidad_mf,origen)
  SELECT
    query.cod_clave_tipo_entidad_mf,
    query.clave_tipo_entidad_mf,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tbn1_mae_claves_tipos_entidad_mf ON (tbn1_mae_claves_tipos_entidad_mf.cod_clave_tipo_entidad_mf=query.cod_clave_tipo_entidad_mf)
  WHERE tbn1_mae_claves_tipos_entidad_mf.cod_clave_tipo_entidad_mf IS NULL

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



--tbn1_mae_claves_actividad_ppal_mf
USE dbn1_stg_dhyf
GO
																													
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_claves_actividad_ppal_integridad_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_claves_actividad_ppal_integridad_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_claves_actividad_ppal_integridad_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_claves_actividad_ppal_integridad_mf'
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
	  mcab_act_ppal AS cod_clave_actividad_ppal_mf,
	  'CLAVE FALTANTE MAESTRO' AS clave_actividad_ppal_mf,
      'APLIC. MF' AS origen
    FROM dbo.tbn1mcab_mf
    GROUP BY mcab_act_ppal
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf(cod_clave_actividad_ppal_mf,clave_actividad_ppal_mf,origen)
  SELECT
    query.cod_clave_actividad_ppal_mf,
    query.clave_actividad_ppal_mf,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf tbn1_mae_claves_actividad_ppal_mf 
		ON tbn1_mae_claves_actividad_ppal_mf.cod_clave_actividad_ppal_mf=query.cod_clave_actividad_ppal_mf
  WHERE tbn1_mae_claves_actividad_ppal_mf.cod_clave_actividad_ppal_mf IS NULL

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestros_integridad_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestros_integridad_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestros_integridad_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestros_integridad_mf'
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
		EXEC spn1_cargar_mae_claves_tipos_entidad_integridad_mf @log
		EXEC spn1_cargar_mae_claves_actividad_ppal_integridad_mf @log
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