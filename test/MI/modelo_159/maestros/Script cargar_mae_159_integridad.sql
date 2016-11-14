PRINT 'Script cargar_mae_modelo_159_integridad.sql'
GO


-- Carga INTEGRIDAD de los maestros propios del 159:
	--tbn1_mae_situacion_inmueble
	--tbn1_mae_tipo_bien
	--tbn1_mae_tipo_importe
	--tbn1_mae_tipo_lectura
	--tbn1_mae_unidad_consumo
	--tbn1_mae_unidad_potencia
	--tbn1_mae_tipo_domicilio

	
	
------------------------------------------------tbn1_mae_situacion_inmueble------------------------------------------------	

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_situacion_inmueble_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_situacion_inmueble_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_situacion_inmueble_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_situacion_inmueble_integridad'
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
      mfpe59_situacion AS cod_situacion_inmueble,
      mfpe59_situacion AS situacion_inmueble,
      'pe59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_situacion 

  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble(cod_situacion_inmueble,situacion_inmueble,origen)
  SELECT
    query.cod_situacion_inmueble,
    query.situacion_inmueble,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble tbn1_mae_situacion_inmueble ON (tbn1_mae_situacion_inmueble.cod_situacion_inmueble=query.cod_situacion_inmueble)
  WHERE tbn1_mae_situacion_inmueble.cod_situacion_inmueble IS NULL;

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
------------------------------------------------tbn1_mae_tipo_bien------------------------------------------------
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_tipo_bien_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_tipo_bien_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_tipo_bien_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_bien_integridad'
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


      mfpe59_tipo_bien AS cod_tipo_bien,
      mfpe59_tipo_bien AS tipo_bien,
      'pe59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_tipo_bien
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien(cod_tipo_bien,tipo_bien,origen)
  SELECT


    query.cod_tipo_bien,
    query.tipo_bien,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien tbn1_mae_tipo_bien ON (tbn1_mae_tipo_bien.cod_tipo_bien=query.cod_tipo_bien)
  WHERE tbn1_mae_tipo_bien.cod_tipo_bien IS NULL;

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


------------------------------------------------tbn1_mae_unidad_consumo------------------------------------------------	

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_unidad_consumo_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_unidad_consumo_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_unidad_consumo_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_unidad_consumo_integridad'
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
      mfpe59_unidad_medida    AS cod_unidad_consumo,
      mfpe59_unidad_medida    AS unidad_consumo,
      'im59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_unidad_medida   
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo(cod_unidad_consumo,unidad_consumo,origen)
  SELECT
    query.cod_unidad_consumo,
    query.unidad_consumo,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo tbn1_mae_unidad_consumo ON (tbn1_mae_unidad_consumo.cod_unidad_consumo=query.cod_unidad_consumo)
  WHERE tbn1_mae_unidad_consumo.cod_unidad_consumo IS NULL;

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

------------------------------------------------tbn1_mae_unidad_potencia------------------------------------------------	


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_unidad_potencia_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_unidad_potencia_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_unidad_potencia_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_unidad_potencia_integridad'
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
      mfpe59_pot_unidad     AS cod_unidad_potencia,
      mfpe59_pot_unidad     AS unidad_potencia,
      'im59_mf' AS origen
    FROM dbo.tbn1pe59_mf
    GROUP BY mfpe59_pot_unidad    
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia(cod_unidad_potencia,unidad_potencia,origen)
  SELECT
    query.cod_unidad_potencia,
    query.unidad_potencia,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia tbn1_mae_unidad_potencia ON (tbn1_mae_unidad_potencia.cod_unidad_potencia=query.cod_unidad_potencia)
  WHERE tbn1_mae_unidad_potencia.cod_unidad_potencia IS NULL;

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

------------------------------------------------tbn1_mae_tipo_lectura------------------------------------------------	

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_tipo_lectura_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_tipo_lectura_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_tipo_lectura_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_lectura_integridad'
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
      mfco59_con_tipo   AS cod_tipo_lectura,
      mfco59_con_tipo   AS tipo_lectura,
      'im59_mf' AS origen
    FROM dbo.tbn1co59_mf
    GROUP BY mfco59_con_tipo  
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_lectura(cod_tipo_lectura,tipo_lectura,origen)
  SELECT
    query.cod_tipo_lectura,
    query.tipo_lectura,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_lectura tbn1_mae_tipo_lectura ON (tbn1_mae_tipo_lectura.cod_tipo_lectura=query.cod_tipo_lectura)
  WHERE tbn1_mae_tipo_lectura.cod_tipo_lectura IS NULL;

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

------------------------------------------------tbn1_mae_tipo_importe------------------------------------------------	

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_tipo_importe_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_tipo_importe_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_tipo_importe_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_importe_integridad'
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
      mfim59_tipo  AS cod_tipo_importe,
      mfim59_tipo  AS tipo_importe,
      'im59_mf' AS origen
    FROM dbo.tbn1im59_mf
    GROUP BY mfim59_tipo 
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe tbn1_mae_tipo_importe ON (tbn1_mae_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mae_tipo_importe.cod_tipo_importe IS NULL;

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

------------------------------------------------tbn1_mae_tipo_domicilio------------------------------------------------
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_tipo_domicilio_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_tipo_domicilio_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_tipo_domicilio_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_domicilio_integridad'
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
      sddomi_tipo AS cod_tipo_domicilio,
      sddomi_tipo AS tipo_domicilio,
      'domi_sd' AS origen
    FROM dbo.tbn1domi_sd
    GROUP BY sddomi_tipo
  )
  INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio(cod_tipo_domicilio,tipo_domicilio,origen)
  SELECT


    query.cod_tipo_domicilio,
    query.tipo_domicilio,
    query.origen
  FROM query
  LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio tbn1_mae_tipo_domicilio ON (tbn1_mae_tipo_domicilio.cod_tipo_domicilio=query.cod_tipo_domicilio)
  WHERE tbn1_mae_tipo_domicilio.cod_tipo_domicilio IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mae_modelo_159_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mae_modelo_159_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_mae_modelo_159_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mae_modelo_159_integridad'
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
	
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_situacion_inmueble_integridad @log;   
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_bien_integridad @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_unidad_consumo_integridad @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_unidad_potencia_integridad @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_lectura_integridad @log;		
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_importe_integridad @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mae_tipo_domicilio_integridad @log;		
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