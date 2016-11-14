---------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------tbn130op_af---------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_integridad_clave_operacion_193' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_integridad_clave_operacion_193;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_integridad_clave_operacion_193(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_integridad_clave_operacion_193'
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
  
	----INTERNOS
    SELECT
      op30claveoper AS cod_clave_operacion_193,
      op30claveoper AS clave_operacion_193,
      '30op_af' AS origen
    FROM dbo.tbn130op_af
    GROUP BY op30claveoper
	
	UNION 
	
	----EXTERNOS
	SELECT
	
      ox30claveoper AS cod_clave_operacion_193,
      ox30claveoper AS clave_operacion_193,
      '3xop_af' AS origen
    FROM dbo.tbn13xop_af
    GROUP BY ox30claveoper
	
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193(cod_clave_operacion_193,clave_operacion_193,origen)
  SELECT
    query.cod_clave_operacion_193,
    query.clave_operacion_193,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 tbn1_mae_clave_operacion_193 ON (tbn1_mae_clave_operacion_193.cod_clave_operacion_193=query.cod_clave_operacion_193)
  WHERE tbn1_mae_clave_operacion_193.cod_clave_operacion_193 IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_naturaleza_integridad_193' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_naturaleza_integridad_193;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_naturaleza_integridad_193(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza_193'
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
  
	----INTERNOS
    SELECT
	  op30claveoper AS cod_clave,
      op30clavenatur AS cod_naturaleza,
      op30clavenatur AS naturaleza,
      '30op_af' AS origen
    FROM dbo.tbn130op_af
    GROUP BY op30claveoper,op30clavenatur	
	
	UNION
	
	----EXTERNOS
	SELECT
	  ox30claveoper AS cod_clave,
      ox30clavenatur AS cod_naturaleza,
      ox30clavenatur AS naturaleza,
      '3xop_af' AS origen
    FROM dbo.tbn13xop_af
    GROUP BY ox30claveoper, ox30clavenatur	
	
  )
 INSERT dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193(cod_clave,cod_naturaleza,naturaleza,origen)
  SELECT
    query.cod_clave,
    query.cod_naturaleza,
    query.naturaleza,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ON (tbn1_mi_naturaleza_193.cod_clave=query.cod_clave AND tbn1_mi_naturaleza_193.cod_naturaleza=query.cod_naturaleza)
  WHERE tbn1_mi_naturaleza_193.cod_clave IS NULL AND tbn1_mi_naturaleza_193.cod_naturaleza IS NULL ;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestros_integridad_193' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestros_integridad_193;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestros_integridad_193(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestros_integridad_193'
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
	
		EXEC spn1_cargar_mae_integridad_clave_operacion_193 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza_193 @log;
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