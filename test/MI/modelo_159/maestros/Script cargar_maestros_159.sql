PRINT 'Script cargar_maestros_159.sql'




------------------------------------------------ PAISES 159 (mfpe59_cie_pais) ------------------------------------------------

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_paises_integridad_159_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_159_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_159_1(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_paises_integridad_159_1'
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
      mfpe59_cie_pais  AS cod_pais,
      mfpe59_cie_pais  AS pais,
      'pe59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_cie_pais 

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

------------------------------------------------ PAISES 159 (mfpe59_cups_pais) ------------------------------------------------

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_paises_integridad_159_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_159_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_paises_integridad_159_2(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_paises_integridad_159_2'
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
      mfpe59_cups_pais   AS cod_pais,
      mfpe59_cups_pais   AS pais,
      'pe59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_cups_pais  

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

------------------------------------------------  (mfpe59_tipo_codigo) ------------------------------------------------

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_159' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_159;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_159(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_159'
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
      mfpe59_tipo_codigo AS cod_clave_tipo_codigo,
      mfpe59_tipo_codigo AS clave_tipo_codigo,
      'pe59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_tipo_codigo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(cod_clave_tipo_codigo,clave_tipo_codigo,origen)
  SELECT
    query.cod_clave_tipo_codigo,
    query.clave_tipo_codigo,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ON (tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo=query.cod_clave_tipo_codigo)
  WHERE tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NULL;

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
----------------------------------------------------------------------------------------------------------------------------------------------------


/*****************/
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestros_159' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestros_159;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestros_159(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestros_159'
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
		
		--cabe_mf
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda_integridad @log; --cabe_mf, cabe_admon, id_administracion_declarante
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_administracion_hacienda @log;
	
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf @log;    --cabe_mf, cabe_tiposoporte, id_tipo_presentacion
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_presentacion @log;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf @log;     --cabe_mf, cabe_tipodecl, id_tipo_presentacion
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_declaracion @log;

		--pe59_mf
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_paises_integridad_159_1 @log;  --pe59_mf, mfpe59_cie_pais, id_pais_residencia
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_paises_integridad_159_2 @log;  --pe59_mf, mfpe59_cups_pais, id_cups_pais
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_paises @log;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_159 @log;   --pe59_mf, mfpe59_tipo_codigo, id_tipo_codigo      
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_tipo_codigo @log;
		
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_modelo_159 @log; --pe59_mf, carga nuevos mae del 159
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_modelo_159_integridad @log;
	

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