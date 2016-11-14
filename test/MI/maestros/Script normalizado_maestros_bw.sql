PRINT 'normalizado_maestros_bw.sql'
GO


/*********************************************/
/* tbn1_mi_clave_intervencion_operacion_181 */
/*******************************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_intervencion_operacion_181')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181(
	  id_clave_intervencion_operacion_181		int IDENTITY(1,1),
	  cod_clave_intervencion_operacion_181	varchar(2),
	  clave_intervencion_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_clave_intervencion_operacion_181 UNIQUE (cod_clave_intervencion_operacion_181),
	  CONSTRAINT PK_tbn1_mi_clave_intervencion_operacion_181 PRIMARY KEY CLUSTERED (id_clave_intervencion_operacion_181)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_intervencion_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY
--(1/2/3/'  Desde 2009. Clave iintervención declarante: 1=Concesionaria 2=Intermediaria 3=Otra intervención
		;WITH query AS
		(
			SELECT	cod_clave_intervencion_operacion_181,
					clave_intervencion_operacion_181,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'' cod_clave_intervencion_operacion_181,
							'Sin informar' clave_intervencion_operacion_181
					UNION ALL
					SELECT	'0' cod_clave_intervencion_operacion_181,
							'Sin informar' clave_intervencion_operacion_181
					UNION ALL
					SELECT	'1' cod_clave_intervencion_operacion_181,
							'Concesionaria' clave_intervencion_operacion_181
					UNION ALL 
					SELECT	'2' cod_clave_intervencion_operacion_181, 
							'Intermediaria' clave_intervencion_operacion_181
					UNION ALL 
					SELECT	'3' cod_clave_intervencion_operacion_181,
							'Otra intervención' clave_intervencion_operacion_181
					) clave_intervencion_operacion_181
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181 AS tbn1_mi_clave_intervencion_operacion_181
		USING query ON query.cod_clave_intervencion_operacion_181 = tbn1_mi_clave_intervencion_operacion_181.cod_clave_intervencion_operacion_181
		
		WHEN MATCHED AND 
		(
			tbn1_mi_clave_intervencion_operacion_181.clave_intervencion_operacion_181	<> query.clave_intervencion_operacion_181	OR (tbn1_mi_clave_intervencion_operacion_181.clave_intervencion_operacion_181 IS NULL AND query.clave_intervencion_operacion_181	IS NOT NULL)	OR  (tbn1_mi_clave_intervencion_operacion_181.clave_intervencion_operacion_181	IS NOT NULL AND query.clave_intervencion_operacion_181	IS NULL)
		OR	tbn1_mi_clave_intervencion_operacion_181.origen			<> query.origen				OR (tbn1_mi_clave_intervencion_operacion_181.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_clave_intervencion_operacion_181.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				clave_intervencion_operacion_181 = query.clave_intervencion_operacion_181,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_intervencion_operacion_181,
				clave_intervencion_operacion_181,
				origen
			) 
			VALUES 
			(
				query.cod_clave_intervencion_operacion_181,
				query.clave_intervencion_operacion_181,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_internos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	printop AS cod_clave_intervencion_operacion_181,
					'CLAVE INTERVENCIÓN FALTANTE MAESTRO' AS clave_intervencion_operacion_181,
					'INT. M-181' AS origen
			FROM	dbo.tbn1pres_bw
			GROUP BY printop
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181
		(
			cod_clave_intervencion_operacion_181,
			clave_intervencion_operacion_181,
			origen
		)
		SELECT	query.cod_clave_intervencion_operacion_181,
				query.clave_intervencion_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181 
						ON tbn1_mi_clave_intervencion_operacion_181.cod_clave_intervencion_operacion_181 = query.cod_clave_intervencion_operacion_181
		WHERE	tbn1_mi_clave_intervencion_operacion_181.cod_clave_intervencion_operacion_181 IS NULL

		EXECUTE dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_externos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pxintop AS cod_clave_intervencion_operacion_181,
					'CLAVE INTERVENCIÓN FALTANTE MAESTRO' AS clave_intervencion_operacion_181,
					'EXT. M-181' AS origen
			FROM	dbo.tbn1i3pr_bw
			GROUP BY pxintop
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181
		(
			cod_clave_intervencion_operacion_181,
			clave_intervencion_operacion_181,
			origen
		)
		SELECT	query.cod_clave_intervencion_operacion_181,
				query.clave_intervencion_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181 
						ON tbn1_mi_clave_intervencion_operacion_181.cod_clave_intervencion_operacion_181 = query.cod_clave_intervencion_operacion_181
		WHERE	tbn1_mi_clave_intervencion_operacion_181.cod_clave_intervencion_operacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO


/*****************************/
/*tbn1_mi_clave_operacion_181*/
/*****************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_181')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181(
	  id_clave_operacion_181		int IDENTITY(1,1),
	  cod_clave_operacion_181	varchar(2),
	  clave_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_clave_operacion_181 UNIQUE (cod_clave_operacion_181),
	  CONSTRAINT PK_tbn1_mi_clave_operacion_181 PRIMARY KEY CLUSTERED (id_clave_operacion_181)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_181
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_181(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY
--Tipo Operación (A/B/C/D/E/ )Desde 2009. A=Préstamo hipotecario B=Demás préstamos C=Crédito hipotecario D=Demás créditos E=Otras operaciones financieras
		;WITH query AS
		(
			SELECT	cod_clave_operacion_181,
					clave_operacion_181,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'' cod_clave_operacion_181,
							'Sin informar' clave_operacion_181
					UNION ALL 
					SELECT	'A' cod_clave_operacion_181,
							'Préstamo hipotecario' clave_operacion_181
					UNION ALL 
					SELECT	'B' cod_clave_operacion_181, 
							'Demás préstamos' clave_operacion_181
					UNION ALL 
					SELECT	'C' cod_clave_operacion_181,
							'Crédito hipotecario' clave_operacion_181
					UNION ALL 
					SELECT	'D' cod_clave_operacion_181,
							'Demás créditos' clave_operacion_181
					UNION ALL 
					SELECT	'E' cod_clave_operacion_181,
							'Otras operaciones financieras' clave_operacion_181
					) clave_operacion_181
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181 AS tbn1_mi_clave_operacion_181
		USING query ON query.cod_clave_operacion_181 = tbn1_mi_clave_operacion_181.cod_clave_operacion_181
		
		WHEN MATCHED AND 
		(
			tbn1_mi_clave_operacion_181.clave_operacion_181	<> query.clave_operacion_181	OR (tbn1_mi_clave_operacion_181.clave_operacion_181 IS NULL AND query.clave_operacion_181	IS NOT NULL)	OR  (tbn1_mi_clave_operacion_181.clave_operacion_181	IS NOT NULL AND query.clave_operacion_181	IS NULL)
		OR	tbn1_mi_clave_operacion_181.origen			<> query.origen				OR (tbn1_mi_clave_operacion_181.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_clave_operacion_181.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				clave_operacion_181 = query.clave_operacion_181,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_operacion_181,
				clave_operacion_181,
				origen
			) 
			VALUES 
			(
				query.cod_clave_operacion_181,
				query.clave_operacion_181,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_181_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_internos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS   
		(
			SELECT	prclave AS cod_clave_operacion_181,
					'CLAVE FALTANTE MAESTRO' AS clave_operacion_181,
					'INT. M-181' AS origen
			FROM	dbo.tbn1pres_bw
			GROUP BY prclave
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181
		(
			cod_clave_operacion_181,
			clave_operacion_181,
			origen
		)
		SELECT	query.cod_clave_operacion_181,
				query.clave_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181 
						ON tbn1_mi_clave_operacion_181.cod_clave_operacion_181 = query.cod_clave_operacion_181
		WHERE	tbn1_mi_clave_operacion_181.cod_clave_operacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_181_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_externos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pxclave AS cod_clave_operacion_181,
					'CLAVE FALTANTE MAESTRO' AS clave_operacion_181,
					'EXT. M-181' AS origen
			FROM	dbo.tbn1i3pr_bw
			GROUP BY pxclave
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181
		(
			cod_clave_operacion_181,
			clave_operacion_181,
			origen
		)
		SELECT	query.cod_clave_operacion_181,
				query.clave_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181 
						ON tbn1_mi_clave_operacion_181.cod_clave_operacion_181 = query.cod_clave_operacion_181
		WHERE	tbn1_mi_clave_operacion_181.cod_clave_operacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

/*FIN - tbn1_mi_clave_operacion_181*/

/***********************************/
/* tbn1_mi_origen_operacion_181 */
/**********************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion_181')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181(
	  id_origen_operacion_181		int IDENTITY(1,1),
	  cod_origen_operacion_181	varchar(2),
	  origen_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_origen_operacion_181 UNIQUE (cod_origen_operacion_181),
	  CONSTRAINT PK_tbn1_mi_origen_operaciones_181 PRIMARY KEY CLUSTERED (id_origen_operacion_181)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_origen_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion_181
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion_181(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY
--(A/C/F/J/M/ )  --Desde 2009. A=Constitución C=Cancelación F=Operaciones origen otros ejercicios J=Modif.yCancel. en ejer. M=Modificación'
		;WITH query AS
		(
			SELECT	cod_origen_operacion_181,
					origen_operacion_181,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'' cod_origen_operacion_181,
							'Sin informar' origen_operacion_181
					UNION ALL
					SELECT	'A' cod_origen_operacion_181,
							'Constitución' origen_operacion_181
					UNION ALL 
					SELECT	'C' cod_origen_operacion_181, 
							'Cancelación' origen_operacion_181
					UNION ALL 
					SELECT	'F' cod_origen_operacion_181,
							'Operaciones origen otros ejercicios' origen_operacion_181
					UNION ALL 
					SELECT	'J' cod_origen_operacion_181,
							'Modif.yCancel. en ejer.' origen_operacion_181
					UNION ALL 
					SELECT	'M' cod_origen_operacion_181,
							'Modificación' origen_operacion_181
					) origen_operacion_181
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181 AS tbn1_mi_origen_operacion_181
		USING query ON query.cod_origen_operacion_181 = tbn1_mi_origen_operacion_181.cod_origen_operacion_181
		
		WHEN MATCHED AND 
		(
			tbn1_mi_origen_operacion_181.origen_operacion_181	<> query.origen_operacion_181	OR (tbn1_mi_origen_operacion_181.origen_operacion_181 IS NULL AND query.origen_operacion_181	IS NOT NULL)	OR  (tbn1_mi_origen_operacion_181.origen_operacion_181	IS NOT NULL AND query.origen_operacion_181	IS NULL)
		OR	tbn1_mi_origen_operacion_181.origen			<> query.origen				OR (tbn1_mi_origen_operacion_181.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_origen_operacion_181.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				origen_operacion_181 = query.origen_operacion_181,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_origen_operacion_181,
				origen_operacion_181,
				origen
			) 
			VALUES 
			(
				query.cod_origen_operacion_181,
				query.origen_operacion_181,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_origen_operacion_181_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_internos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	prorige AS cod_origen_operacion_181,
					'ORIGEN FALTANTE MAESTRO' AS origen_operacion_181,
					'INT. M-181' AS origen
			FROM	dbo.tbn1pres_bw
			GROUP BY prorige
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181
		(
			cod_origen_operacion_181,
			origen_operacion_181,
			origen
		)
		SELECT	query.cod_origen_operacion_181,
				query.origen_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181 
						ON tbn1_mi_origen_operacion_181.cod_origen_operacion_181 = query.cod_origen_operacion_181
		WHERE	tbn1_mi_origen_operacion_181.cod_origen_operacion_181 IS NULL

		EXECUTE dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_origen_operacion_181_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_externos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pxorige AS cod_origen_operacion_181,
					'ORIGEN FALTANTE MAESTRO' AS origen_operacion_181,
					'EXT. M-181' AS origen
			FROM	dbo.tbn1i3pr_bw
			GROUP BY pxorige
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181
		(
			cod_origen_operacion_181,
			origen_operacion_181,
			origen
		)
		SELECT	query.cod_origen_operacion_181,
				query.origen_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181 
						ON tbn1_mi_origen_operacion_181.cod_origen_operacion_181 = query.cod_origen_operacion_181
		WHERE	tbn1_mi_origen_operacion_181.cod_origen_operacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

/*FIN - tbn1_mi_origen_operacion_181*/


/********************************/
/*tbn1_mi_situacion_inmueble_181*/
/********************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_situacion_inmueble_181')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181(
	  id_situacion_inmueble_181		int IDENTITY(1,1),
	  cod_situacion_inmueble_181	varchar(2),
	  situacion_inmueble_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_situacion_inmueble_181 UNIQUE (cod_situacion_inmueble_181),
	  CONSTRAINT PK_tbn1_mi_situacion_inmueble_181 PRIMARY KEY CLUSTERED (id_situacion_inmueble_181)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_situacion_inmueble_181' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY
--(01234) Desde 2009. 1=Territorio español 2=País Vasco/Navarra 3=1 o 2 sin ref.catastral 4=Extranjero
		;WITH query AS
		(
			SELECT	cod_situacion_inmueble_181,
					situacion_inmueble_181,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'' cod_situacion_inmueble_181,
							'Sin informar' situacion_inmueble_181
					UNION ALL 
					SELECT	'0' cod_situacion_inmueble_181,
							'Sin informar' situacion_inmueble_181
					UNION ALL 
					SELECT	'1' cod_situacion_inmueble_181,
							'Territorio español' situacion_inmueble_181
					UNION ALL 
					SELECT	'2' cod_situacion_inmueble_181, 
							'País Vasco/Navarra' situacion_inmueble_181
					UNION ALL 
					SELECT	'3' cod_situacion_inmueble_181,
							'Territorio español o País Vasco/Navarra sin ref.catastral' situacion_inmueble_181
					UNION ALL 
					SELECT	'4' cod_situacion_inmueble_181,
							'Extranjero' situacion_inmueble_181
					) situacion_inmueble_181
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181 AS tbn1_mi_situacion_inmueble_181
		USING query ON query.cod_situacion_inmueble_181 = tbn1_mi_situacion_inmueble_181.cod_situacion_inmueble_181
		
		WHEN MATCHED AND 
		(
			tbn1_mi_situacion_inmueble_181.situacion_inmueble_181	<> query.situacion_inmueble_181	OR (tbn1_mi_situacion_inmueble_181.situacion_inmueble_181 IS NULL AND query.situacion_inmueble_181	IS NOT NULL)	OR  (tbn1_mi_situacion_inmueble_181.situacion_inmueble_181	IS NOT NULL AND query.situacion_inmueble_181	IS NULL)
		OR	tbn1_mi_situacion_inmueble_181.origen			<> query.origen				OR (tbn1_mi_situacion_inmueble_181.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_situacion_inmueble_181.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				situacion_inmueble_181 = query.situacion_inmueble_181,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_situacion_inmueble_181,
				situacion_inmueble_181,
				origen
			) 
			VALUES 
			(
				query.cod_situacion_inmueble_181,
				query.situacion_inmueble_181,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_internos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS   
		(
			SELECT	prsitua AS cod_situacion_inmueble_181,
					'SITUACION FALTANTE MAESTRO' AS situacion_inmueble_181,
					'INT. M-181' AS origen
			FROM	dbo.tbn1pres_bw
			GROUP BY prsitua
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181
		(
			cod_situacion_inmueble_181,
			situacion_inmueble_181,
			origen
		)
		SELECT	query.cod_situacion_inmueble_181,
				query.situacion_inmueble_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181 
						ON tbn1_mi_situacion_inmueble_181.cod_situacion_inmueble_181 = query.cod_situacion_inmueble_181
		WHERE	tbn1_mi_situacion_inmueble_181.cod_situacion_inmueble_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_externos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pxsitua AS cod_situacion_inmueble_181,
					'SITUACION FALTANTE MAESTRO' AS situacion_inmueble_181,
					'EXT. M-181' AS origen
			FROM	dbo.tbn1i3pr_bw
			GROUP BY pxsitua
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181
		(
			cod_situacion_inmueble_181,
			situacion_inmueble_181,
			origen
		)
		SELECT	query.cod_situacion_inmueble_181,
				query.situacion_inmueble_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181 
						ON tbn1_mi_situacion_inmueble_181.cod_situacion_inmueble_181 = query.cod_situacion_inmueble_181
		WHERE	tbn1_mi_situacion_inmueble_181.cod_situacion_inmueble_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

/*FIN - tbn1_mi_situacion_inmueble_181*/

/*********************************/
/*tbn1_mi_subclave_operacion_181*/
/*********************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclave_operacion_181')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181(
	  id_subclave_operacion_181		int IDENTITY(1,1),
	  cod_subclave_operacion_181	varchar(2),
	  subclave_operacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_subclave_operacion_181 UNIQUE (cod_subclave_operacion_181),
	  CONSTRAINT PK_tbn1_mi_subclave_operacion_181 PRIMARY KEY CLUSTERED (id_subclave_operacion_181)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_subclave_operacion_181' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_subclave_operacion_181
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_subclave_operacion_181(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY
--(012345)  Desde 2009. 1=Bien inmueble vivienda habitual2=Bien inmueble no viv.hab.3=Derecho real bien inmueble viv.habitual4=Derecho realBI no viv.hab.5=Otro destino
		;WITH query AS
		(
			SELECT	cod_subclave_operacion_181,
					subclave_operacion_181,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'' cod_subclave_operacion_181,
							'Sin informar' subclave_operacion_181
					UNION ALL
					SELECT	'0' cod_subclave_operacion_181,
							'Sin informar' subclave_operacion_181
					UNION ALL 
					SELECT	'1' cod_subclave_operacion_181,
							'Bien inmueble viv.habitual' subclave_operacion_181
					UNION ALL 
					SELECT	'2' cod_subclave_operacion_181, 
							'Bien inmueble no viv.habitual' subclave_operacion_181
					UNION ALL 
					SELECT	'3' cod_subclave_operacion_181,
							'Derecho real bien inmueble viv.habitual' subclave_operacion_181
					UNION ALL 
					SELECT	'4' cod_subclave_operacion_181,
							'Derecho real bien inmueble no viv.habitual' subclave_operacion_181
					UNION ALL 
					SELECT	'5' cod_subclave_operacion_181,
							'Otro destino' subclave_operacion_181
					) subclave_operacion_181
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181 AS tbn1_mi_subclave_operacion_181
		USING query ON query.cod_subclave_operacion_181 = tbn1_mi_subclave_operacion_181.cod_subclave_operacion_181
		
		WHEN MATCHED AND 
		(
			tbn1_mi_subclave_operacion_181.subclave_operacion_181	<> query.subclave_operacion_181	OR (tbn1_mi_subclave_operacion_181.subclave_operacion_181 IS NULL AND query.subclave_operacion_181	IS NOT NULL)	OR  (tbn1_mi_subclave_operacion_181.subclave_operacion_181	IS NOT NULL AND query.subclave_operacion_181	IS NULL)
		OR	tbn1_mi_subclave_operacion_181.origen			<> query.origen				OR (tbn1_mi_subclave_operacion_181.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_subclave_operacion_181.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				subclave_operacion_181 = query.subclave_operacion_181,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_subclave_operacion_181,
				subclave_operacion_181,
				origen
			) 
			VALUES 
			(
				query.cod_subclave_operacion_181,
				query.subclave_operacion_181,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_internos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS   
		(
			SELECT	prsubcl AS cod_subclave_operacion_181,
					'SUBCLAVE FALTANTE MAESTRO' AS subclave_operacion_181,
					'INT. M-181' AS origen
			FROM	dbo.tbn1pres_bw
			GROUP BY prsubcl
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181
		(
			cod_subclave_operacion_181,
			subclave_operacion_181,
			origen
		)
		SELECT	query.cod_subclave_operacion_181,
				query.subclave_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181 
						ON tbn1_mi_subclave_operacion_181.cod_subclave_operacion_181 = query.cod_subclave_operacion_181
		WHERE	tbn1_mi_subclave_operacion_181.cod_subclave_operacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_externos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pxsubcl AS cod_subclave_operacion_181,
					'SUBCLAVE FALTANTE MAESTRO' AS subclave_operacion_181,
					'EXT. M-181' AS origen
			FROM	dbo.tbn1i3pr_bw
			GROUP BY pxsubcl
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181
		(
			cod_subclave_operacion_181,
			subclave_operacion_181,
			origen
		)
		SELECT	query.cod_subclave_operacion_181,
				query.subclave_operacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181 
						ON tbn1_mi_subclave_operacion_181.cod_subclave_operacion_181 = query.cod_subclave_operacion_181
		WHERE	tbn1_mi_subclave_operacion_181.cod_subclave_operacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

/*FIN - tbn1_mi_subclave_operacion_181*/

/**********************************/
/*tbn1_mi_tipo_identificacion_181*/
/********************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion_181')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181(
	  id_tipo_identificacion_181		int IDENTITY(1,1),
	  cod_tipo_identificacion_181	varchar(2),
	  tipo_identificacion_181		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_tipo_identificacion_181 UNIQUE (cod_tipo_identificacion_181),
	  CONSTRAINT PK_tbn1_mi_tipo_identificacion_181 PRIMARY KEY CLUSTERED (id_tipo_identificacion_181)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_identificacion_181' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY
--(C/O/ ) C=Identificación con Código Cuenta Cliente(CCC) O =Otra identificación
		;WITH query AS
		(
			SELECT	cod_tipo_identificacion_181,
					tipo_identificacion_181,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'' cod_tipo_identificacion_181,
							'Sin informar' tipo_identificacion_181
					UNION ALL
					SELECT	'C' cod_tipo_identificacion_181,
							'Identificación con Código Cuenta Cliente(CCC)' tipo_identificacion_181
					UNION ALL 
					SELECT	'O' cod_tipo_identificacion_181, 
							'Otra identificación' tipo_identificacion_181
					) tipo_identificacion_181
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181 AS tbn1_mi_tipo_identificacion_181
		USING query ON query.cod_tipo_identificacion_181 = tbn1_mi_tipo_identificacion_181.cod_tipo_identificacion_181
		
		WHEN MATCHED AND 
		(
			tbn1_mi_tipo_identificacion_181.tipo_identificacion_181	<> query.tipo_identificacion_181	OR (tbn1_mi_tipo_identificacion_181.tipo_identificacion_181 IS NULL AND query.tipo_identificacion_181	IS NOT NULL)	OR  (tbn1_mi_tipo_identificacion_181.tipo_identificacion_181	IS NOT NULL AND query.tipo_identificacion_181	IS NULL)
		OR	tbn1_mi_tipo_identificacion_181.origen			<> query.origen				OR (tbn1_mi_tipo_identificacion_181.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_tipo_identificacion_181.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				tipo_identificacion_181 = query.tipo_identificacion_181,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_tipo_identificacion_181,
				tipo_identificacion_181,
				origen
			) 
			VALUES 
			(
				query.cod_tipo_identificacion_181,
				query.tipo_identificacion_181,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_internos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	prtiden AS cod_tipo_identificacion_181,
					'IDENTIFICACION FALTANTE MAESTRO' AS tipo_identificacion_181,
					'INT. M-181' AS origen
			FROM	dbo.tbn1pres_bw
			GROUP BY prtiden
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181
		(
			cod_tipo_identificacion_181,
			tipo_identificacion_181,
			origen
		)
		SELECT	query.cod_tipo_identificacion_181,
				query.tipo_identificacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181 
						ON tbn1_mi_tipo_identificacion_181.cod_tipo_identificacion_181 = query.cod_tipo_identificacion_181
		WHERE	tbn1_mi_tipo_identificacion_181.cod_tipo_identificacion_181 IS NULL

		EXECUTE dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_externos'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pxtiden AS cod_tipo_identificacion_181,
					'IDENTIFICACION FALTANTE MAESTRO' AS tipo_identificacion_181,
					'EXT. M-181' AS origen
			FROM	dbo.tbn1i3pr_bw
			GROUP BY pxtiden
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181
		(
			cod_tipo_identificacion_181,
			tipo_identificacion_181,
			origen
		)
		SELECT	query.cod_tipo_identificacion_181,
				query.tipo_identificacion_181,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181 
						ON tbn1_mi_tipo_identificacion_181.cod_tipo_identificacion_181 = query.cod_tipo_identificacion_181
		WHERE	tbn1_mi_tipo_identificacion_181.cod_tipo_identificacion_181 IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO

/*FIN - tbn1_mi_tipo_identificacion_181*/

