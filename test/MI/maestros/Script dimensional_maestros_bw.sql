PRINT 'dimensional_maestros_bw.sql'
GO


/*********************************/
/*tbn1_mi_mae_origen_operacion_181*/
/*********************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_origen_operacion_181')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_origen_operacion_181(
	  id_origen_operacion_181		int NOT NULL,
	  cod_origen_operacion_181	varchar(2),
	  origen_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_origen_operacion_181 PRIMARY KEY CLUSTERED (id_origen_operacion_181)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_origen_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_origen_operacion_181;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_origen_operacion_181(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_origen_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_origen_operacion_181,
					cod_origen_operacion_181,
					origen_operacion_181,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_origen_operacion_181 AS destino
		USING query ON query.id_origen_operacion_181 = destino.id_origen_operacion_181
		
		WHEN MATCHED 
		AND (
				destino.cod_origen_operacion_181<>query.cod_origen_operacion_181 OR (destino.cod_origen_operacion_181 IS NULL AND query.cod_origen_operacion_181 IS NOT NULL) OR (destino.cod_origen_operacion_181 IS NOT NULL AND query.cod_origen_operacion_181 IS NULL)
			OR	destino.origen_operacion_181<>query.origen_operacion_181 OR (destino.origen_operacion_181 IS NULL AND query.origen_operacion_181 IS NOT NULL) OR (destino.origen_operacion_181 IS NOT NULL AND query.origen_operacion_181 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_origen_operacion_181 = query.cod_origen_operacion_181,
					origen_operacion_181 = query.origen_operacion_181,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_origen_operacion_181,
				cod_origen_operacion_181,
				origen_operacion_181,
				origen
			) 
			VALUES 
			(
				query.id_origen_operacion_181,
				query.cod_origen_operacion_181,
				query.origen_operacion_181,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO


/*********************************/
/*tbn1_mi_mae_clave_operacion_181*/
/*********************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_clave_operacion_181')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_operacion_181(
	  id_clave_operacion_181		int NOT NULL,
	  cod_clave_operacion_181	varchar(2),
	  clave_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_clave_operacion_181 PRIMARY KEY CLUSTERED (id_clave_operacion_181)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_clave_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_clave_operacion_181;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_clave_operacion_181(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_clave_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_clave_operacion_181,
					cod_clave_operacion_181,
					clave_operacion_181,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_operacion_181 AS destino
		USING query ON query.id_clave_operacion_181 = destino.id_clave_operacion_181
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_operacion_181<>query.cod_clave_operacion_181 OR (destino.cod_clave_operacion_181 IS NULL AND query.cod_clave_operacion_181 IS NOT NULL) OR (destino.cod_clave_operacion_181 IS NOT NULL AND query.cod_clave_operacion_181 IS NULL)
			OR	destino.clave_operacion_181<>query.clave_operacion_181 OR (destino.clave_operacion_181 IS NULL AND query.clave_operacion_181 IS NOT NULL) OR (destino.clave_operacion_181 IS NOT NULL AND query.clave_operacion_181 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_operacion_181 = query.cod_clave_operacion_181,
					clave_operacion_181 = query.clave_operacion_181,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_operacion_181,
				cod_clave_operacion_181,
				clave_operacion_181,
				origen
			) 
			VALUES 
			(
				query.id_clave_operacion_181,
				query.cod_clave_operacion_181,
				query.clave_operacion_181,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO

/***************************************/
/*tbn1_mi_mae_subclave_operacion_181*/
/***************************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_subclave_operacion_181')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_subclave_operacion_181(
	  id_subclave_operacion_181		int NOT NULL,
	  cod_subclave_operacion_181	varchar(2),
	  subclave_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_subclave_operacion_181 PRIMARY KEY CLUSTERED (id_subclave_operacion_181)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_subclave_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_subclave_operacion_181;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_subclave_operacion_181(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_subclave_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_subclave_operacion_181,
					cod_subclave_operacion_181,
					subclave_operacion_181,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_subclave_operacion_181 AS destino
		USING query ON query.id_subclave_operacion_181 = destino.id_subclave_operacion_181
		
		WHEN MATCHED 
		AND (
				destino.cod_subclave_operacion_181<>query.cod_subclave_operacion_181 OR (destino.cod_subclave_operacion_181 IS NULL AND query.cod_subclave_operacion_181 IS NOT NULL) OR (destino.cod_subclave_operacion_181 IS NOT NULL AND query.cod_subclave_operacion_181 IS NULL)
			OR	destino.subclave_operacion_181<>query.subclave_operacion_181 OR (destino.subclave_operacion_181 IS NULL AND query.subclave_operacion_181 IS NOT NULL) OR (destino.subclave_operacion_181 IS NOT NULL AND query.subclave_operacion_181 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_subclave_operacion_181 = query.cod_subclave_operacion_181,
					subclave_operacion_181 = query.subclave_operacion_181,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_subclave_operacion_181,
				cod_subclave_operacion_181,
				subclave_operacion_181,
				origen
			) 
			VALUES 
			(
				query.id_subclave_operacion_181,
				query.cod_subclave_operacion_181,
				query.subclave_operacion_181,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO

/***************************************/
/*tbn1_mi_mae_situacion_inmueble_181*/
/***************************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_situacion_inmueble_181')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_situacion_inmueble_181(
	  id_situacion_inmueble_181		int NOT NULL,
	  cod_situacion_inmueble_181	varchar(2),
	  situacion_inmueble_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_situacion_inmueble_181 PRIMARY KEY CLUSTERED (id_situacion_inmueble_181)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_situacion_inmueble_181' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_situacion_inmueble_181;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_situacion_inmueble_181(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_situacion_inmueble_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_situacion_inmueble_181,
					cod_situacion_inmueble_181,
					situacion_inmueble_181,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_situacion_inmueble_181 AS destino
		USING query ON query.id_situacion_inmueble_181 = destino.id_situacion_inmueble_181
		
		WHEN MATCHED 
		AND (
				destino.cod_situacion_inmueble_181<>query.cod_situacion_inmueble_181 OR (destino.cod_situacion_inmueble_181 IS NULL AND query.cod_situacion_inmueble_181 IS NOT NULL) OR (destino.cod_situacion_inmueble_181 IS NOT NULL AND query.cod_situacion_inmueble_181 IS NULL)
			OR	destino.situacion_inmueble_181<>query.situacion_inmueble_181 OR (destino.situacion_inmueble_181 IS NULL AND query.situacion_inmueble_181 IS NOT NULL) OR (destino.situacion_inmueble_181 IS NOT NULL AND query.situacion_inmueble_181 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_situacion_inmueble_181 = query.cod_situacion_inmueble_181,
					situacion_inmueble_181 = query.situacion_inmueble_181,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_situacion_inmueble_181,
				cod_situacion_inmueble_181,
				situacion_inmueble_181,
				origen
			) 
			VALUES 
			(
				query.id_situacion_inmueble_181,
				query.cod_situacion_inmueble_181,
				query.situacion_inmueble_181,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO


/*************************************/
/*tbn1_mi_mae_tipo_identificacion_181*/
/*************************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_tipo_identificacion_181')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipo_identificacion_181(
	  id_tipo_identificacion_181		int NOT NULL,
	  cod_tipo_identificacion_181	varchar(2),
	  tipo_identificacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_tipo_identificacion_181 PRIMARY KEY CLUSTERED (id_tipo_identificacion_181)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_tipo_identificacion_181' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_tipo_identificacion_181;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_tipo_identificacion_181(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_tipo_identificacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_tipo_identificacion_181,
					cod_tipo_identificacion_181,
					tipo_identificacion_181,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipo_identificacion_181 AS destino
		USING query ON query.id_tipo_identificacion_181 = destino.id_tipo_identificacion_181
		
		WHEN MATCHED 
		AND (
				destino.cod_tipo_identificacion_181<>query.cod_tipo_identificacion_181 OR (destino.cod_tipo_identificacion_181 IS NULL AND query.cod_tipo_identificacion_181 IS NOT NULL) OR (destino.cod_tipo_identificacion_181 IS NOT NULL AND query.cod_tipo_identificacion_181 IS NULL)
			OR	destino.tipo_identificacion_181<>query.tipo_identificacion_181 OR (destino.tipo_identificacion_181 IS NULL AND query.tipo_identificacion_181 IS NOT NULL) OR (destino.tipo_identificacion_181 IS NOT NULL AND query.tipo_identificacion_181 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_tipo_identificacion_181 = query.cod_tipo_identificacion_181,
					tipo_identificacion_181 = query.tipo_identificacion_181,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_tipo_identificacion_181,
				cod_tipo_identificacion_181,
				tipo_identificacion_181,
				origen
			) 
			VALUES 
			(
				query.id_tipo_identificacion_181,
				query.cod_tipo_identificacion_181,
				query.tipo_identificacion_181,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO

/**********************************************/
/*tbn1_mi_mae_clave_intervencion_operacion_181*/
/**********************************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_clave_intervencion_operacion_181')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_intervencion_operacion_181(
	  id_clave_intervencion_operacion_181		int NOT NULL,
	  cod_clave_intervencion_operacion_181	varchar(2),
	  clave_intervencion_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_clave_intervencion_operacion_181 PRIMARY KEY CLUSTERED (id_clave_intervencion_operacion_181)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_clave_intervencion_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_clave_intervencion_operacion_181;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_clave_intervencion_operacion_181(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_clave_intervencion_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_clave_intervencion_operacion_181,
					cod_clave_intervencion_operacion_181,
					clave_intervencion_operacion_181,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_intervencion_operacion_181 AS destino
		USING query ON query.id_clave_intervencion_operacion_181 = destino.id_clave_intervencion_operacion_181
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_intervencion_operacion_181<>query.cod_clave_intervencion_operacion_181 OR (destino.cod_clave_intervencion_operacion_181 IS NULL AND query.cod_clave_intervencion_operacion_181 IS NOT NULL) OR (destino.cod_clave_intervencion_operacion_181 IS NOT NULL AND query.cod_clave_intervencion_operacion_181 IS NULL)
			OR	destino.clave_intervencion_operacion_181<>query.clave_intervencion_operacion_181 OR (destino.clave_intervencion_operacion_181 IS NULL AND query.clave_intervencion_operacion_181 IS NOT NULL) OR (destino.clave_intervencion_operacion_181 IS NOT NULL AND query.clave_intervencion_operacion_181 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_intervencion_operacion_181 = query.cod_clave_intervencion_operacion_181,
					clave_intervencion_operacion_181 = query.clave_intervencion_operacion_181,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_intervencion_operacion_181,
				cod_clave_intervencion_operacion_181,
				clave_intervencion_operacion_181,
				origen
			) 
			VALUES 
			(
				query.id_clave_intervencion_operacion_181,
				query.cod_clave_intervencion_operacion_181,
				query.clave_intervencion_operacion_181,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO


/******************************/
/*SP PADRE CON LAS EJECUCIONES*/
/******************************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_maestros_bw' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_maestros_bw;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_maestros_bw(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_maestros_bw'
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

							  
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_origen_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_clave_operacion_181 @log;	
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_subclave_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_situacion_inmueble_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_tipo_identificacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_clave_intervencion_operacion_181 @log;
  			

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

