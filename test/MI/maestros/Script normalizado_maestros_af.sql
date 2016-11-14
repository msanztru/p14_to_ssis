PRINT 'normalizado_maestros_af.sql'
GO

/************************/
/*tbn1_claves_residencia*/
/************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_claves_residencia')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_claves_residencia(
	  id_clave_residencia	int IDENTITY(1,1),
	  cod_clave_residencia	varchar(1),
	  clave_residencia		varchar(100),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT uk_claves_residencia UNIQUE (cod_clave_residencia),
	  CONSTRAINT PK_tbn1_claves_residencia PRIMARY KEY CLUSTERED (id_clave_residencia)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_claves_residencia' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_claves_residencia
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_claves_residencia(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia'
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

		;WITH query AS
		(
			SELECT	cod_clave_residencia,
					clave_residencia,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'R' cod_clave_residencia,
							'Residente y no residente que obtenga rentas mediante establecimiento permanente' clave_residencia
					UNION ALL 
					SELECT	'N' cod_clave_residencia,
							'No residente que obtenga rentas sin mediación establecimiento permanente' clave_residencia
					) claves_residencia
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_claves_residencia AS tbn1_claves_residencia
		USING query ON query.cod_clave_residencia = tbn1_claves_residencia.cod_clave_residencia
		
		WHEN MATCHED AND 
		(
			tbn1_claves_residencia.clave_residencia	<> query.clave_residencia	OR (tbn1_claves_residencia.clave_residencia IS NULL AND query.clave_residencia	IS NOT NULL)	OR  (tbn1_claves_residencia.clave_residencia	IS NOT NULL AND query.clave_residencia	IS NULL)
		OR	tbn1_claves_residencia.origen			<> query.origen				OR (tbn1_claves_residencia.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_claves_residencia.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				clave_residencia = query.clave_residencia,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_residencia,
				clave_residencia,
				origen
			) 
			VALUES 
			(
				query.cod_clave_residencia,
				query.clave_residencia,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_claves_residencia_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_claves_residencia_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_claves_residencia_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_internos'
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
			SELECT	da20clresidencia AS cod_clave_residencia,
					'CLAVE FALTANTE MAESTRO' AS clave_residencia,
					'INT. M-192' AS origen
			FROM	dbo.tbn120da_af
			GROUP BY da20clresidencia
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_claves_residencia
		(
			cod_clave_residencia,
			clave_residencia,
			origen
		)
		SELECT	query.cod_clave_residencia,
				query.clave_residencia,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_residencia 
						ON tbn1_claves_residencia.cod_clave_residencia = query.cod_clave_residencia
		WHERE	tbn1_claves_residencia.cod_clave_residencia IS NULL

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_claves_residencia_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_claves_residencia_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_claves_residencia_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_externos'
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
			SELECT	px20clresidencia AS cod_clave_residencia,
					'CLAVE FALTANTE MAESTRO' AS clave_residencia,
					'EXT. M-192' AS origen
			FROM	dbo.tbn12xpe_af
			GROUP BY px20clresidencia
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_claves_residencia
		(
			cod_clave_residencia,
			clave_residencia,
			origen
		)
		SELECT	query.cod_clave_residencia,
				query.clave_residencia,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_residencia 
						ON tbn1_claves_residencia.cod_clave_residencia = query.cod_clave_residencia
		WHERE	tbn1_claves_residencia.cod_clave_residencia IS NULL

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

/*FIN - tbn1_claves_residencia*/


/************************/
/*tbn1_claves_declarante*/
/************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_claves_declarante')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_claves_declarante(
	  id_clave_declarante	int IDENTITY(1,1),
	  cod_clave_declarante	varchar(1),
	  clave_declarante		varchar(150),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT uk_claves_declarante UNIQUE (cod_clave_declarante),
	  CONSTRAINT PK_tbn1_claves_declarante PRIMARY KEY CLUSTERED (id_clave_declarante)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_claves_declarante' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_claves_declarante
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_claves_declarante(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante'
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

		;WITH query AS
		(
			SELECT	cod_clave_declarante,
					clave_declarante,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'A' cod_clave_declarante,
							'Entidades gestoras declaran las operaciones de terceros' clave_declarante
					UNION ALL 
					SELECT	'B' cod_clave_declarante,
							'La Central de Anotaciones declara las operaciones por cuenta propia realizadas por los titulares de dichas cuentas' clave_declarante
					) claves_declarante
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_claves_declarante AS tbn1_claves_declarante
		USING query ON query.cod_clave_declarante = tbn1_claves_declarante.cod_clave_declarante
		
		WHEN MATCHED AND 
		(
			tbn1_claves_declarante.clave_declarante	<> query.clave_declarante	OR (tbn1_claves_declarante.clave_declarante IS NULL AND query.clave_declarante	IS NOT NULL)	OR  (tbn1_claves_declarante.clave_declarante	IS NOT NULL AND query.clave_declarante	IS NULL)
		OR	tbn1_claves_declarante.origen			<> query.origen				OR (tbn1_claves_declarante.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_claves_declarante.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				clave_declarante = query.clave_declarante,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_declarante,
				clave_declarante,
				origen
			) 
			VALUES 
			(
				query.cod_clave_declarante,
				query.clave_declarante,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_claves_declarante_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_claves_declarante_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_claves_declarante_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_internos'
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
			SELECT	da20cldeclarante AS cod_clave_declarante,
					'CLAVE FALTANTE MAESTRO' AS clave_declarante,
					'INT. M-192' AS origen
			FROM	dbo.tbn120da_af
			GROUP BY da20cldeclarante
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_claves_declarante
		(
			cod_clave_declarante,
			clave_declarante,
			origen
		)
		SELECT	query.cod_clave_declarante,
				query.clave_declarante,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_declarante 
						ON tbn1_claves_declarante.cod_clave_declarante = query.cod_clave_declarante
		WHERE	tbn1_claves_declarante.cod_clave_declarante IS NULL

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_claves_declarante_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_claves_declarante_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_claves_declarante_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_externos'
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
			SELECT	px20cldeclarante AS cod_clave_declarante,
					'CLAVE FALTANTE MAESTRO' AS clave_declarante,
					'EXT. M-192' AS origen
			FROM	dbo.tbn12xpe_af
			GROUP BY px20cldeclarante
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_claves_declarante
		(
			cod_clave_declarante,
			clave_declarante,
			origen
		)
		SELECT	query.cod_clave_declarante,
				query.clave_declarante,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_declarante 
						ON tbn1_claves_declarante.cod_clave_declarante = query.cod_clave_declarante
		WHERE	tbn1_claves_declarante.cod_clave_declarante IS NULL

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

/*FIN - tbn1_claves_declarante*/



/*****************************/
/*tbn1_mi_tipos_operacion_192*/
/*****************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_operacion_192')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192(
	  id_tipo_operacion_192		int IDENTITY(1,1),
	  cod_tipo_operacion_192	varchar(2),
	  tipo_operacion_192		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_tipos_operacion_192 UNIQUE (cod_tipo_operacion_192),
	  CONSTRAINT PK_tbn1_mi_tipos_operacion_192 PRIMARY KEY CLUSTERED (id_tipo_operacion_192)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_operacion_192' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_operacion_192
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_operacion_192(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192'
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

		;WITH query AS
		(
			SELECT	cod_tipo_operacion_192,
					tipo_operacion_192,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'01' cod_tipo_operacion_192,
							'Suscripción' tipo_operacion_192
					UNION ALL 
					SELECT	'02' cod_tipo_operacion_192,
							'Compra o recompra' tipo_operacion_192
					UNION ALL 
					SELECT	'03' cod_tipo_operacion_192,
							'Préstamo de valores' tipo_operacion_192
					UNION ALL 
					SELECT	'04' cod_tipo_operacion_192,
							'Alta por traspaso de otra entidad gestora' tipo_operacion_192
					UNION ALL 
					SELECT	'05' cod_tipo_operacion_192,
							'Transformación de títulos valores' tipo_operacion_192
					UNION ALL 
					SELECT	'06' cod_tipo_operacion_192,
							'Cesiones temporales afectas a cuentas financieras' tipo_operacion_192
					UNION ALL 
					SELECT	'07' cod_tipo_operacion_192,
							'Cesiones temporales no afectas a cuentas financieras' tipo_operacion_192
					UNION ALL 
					SELECT	'08' cod_tipo_operacion_192,
							'Retrocesión de préstamo de valores' tipo_operacion_192
					UNION ALL 
					SELECT	'09' cod_tipo_operacion_192,
							'Transmisiones no realizadas en mercado secundario Art.37 Ley 24/1988' tipo_operacion_192
					UNION ALL 
					SELECT	'10' cod_tipo_operacion_192,
							'Otras operaciones generadoras de rendimientos' tipo_operacion_192
					UNION ALL 
					SELECT	'11' cod_tipo_operacion_192,
							'Amortización' tipo_operacion_192
					UNION ALL 
					SELECT	'12' cod_tipo_operacion_192,
							'Venta o reventa' tipo_operacion_192
					UNION ALL 
					SELECT	'13' cod_tipo_operacion_192,
							'Préstamo de valores' tipo_operacion_192
					UNION ALL 
					SELECT	'14' cod_tipo_operacion_192,
							'Baja por traspaso a otra entidad gestora' tipo_operacion_192
					UNION ALL 
					SELECT	'15' cod_tipo_operacion_192,
							'Transformación de títulos valores' tipo_operacion_192
					UNION ALL 
					SELECT	'16' cod_tipo_operacion_192,
							'Cancelación de cesiones temporales afectas a cuentas financieras' tipo_operacion_192
					UNION ALL 
					SELECT	'17' cod_tipo_operacion_192,
							'Cancelación de cesiones temporales no afectas a cuentas financieras' tipo_operacion_192
					UNION ALL 
					SELECT	'18' cod_tipo_operacion_192,
							'Retrocesión de préstamo de valores' tipo_operacion_192
					UNION ALL 
					SELECT	'19' cod_tipo_operacion_192,
							'Transmisiones no realizadas en mercado secundario Art.37 Ley 24/1988' tipo_operacion_192
					UNION ALL 
					SELECT	'20' cod_tipo_operacion_192,
							'Otras operaciones generadoras de rendimientos' tipo_operacion_192
					) tipos_operacion_192
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 AS tbn1_mi_tipos_operacion_192
		USING query ON query.cod_tipo_operacion_192 = tbn1_mi_tipos_operacion_192.cod_tipo_operacion_192
		
		WHEN MATCHED AND 
		(
			tbn1_mi_tipos_operacion_192.tipo_operacion_192	<> query.tipo_operacion_192	OR (tbn1_mi_tipos_operacion_192.tipo_operacion_192 IS NULL AND query.tipo_operacion_192	IS NOT NULL)	OR  (tbn1_mi_tipos_operacion_192.tipo_operacion_192	IS NOT NULL AND query.tipo_operacion_192	IS NULL)
		OR	tbn1_mi_tipos_operacion_192.origen			<> query.origen				OR (tbn1_mi_tipos_operacion_192.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_tipos_operacion_192.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				tipo_operacion_192 = query.tipo_operacion_192,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_tipo_operacion_192,
				tipo_operacion_192,
				origen
			) 
			VALUES 
			(
				query.cod_tipo_operacion_192,
				query.tipo_operacion_192,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos'
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
			SELECT	da20tipooper AS cod_tipo_operacion_192,
					'TIPO FALTANTE MAESTRO' AS tipo_operacion_192,
					'INT. M-192' AS origen
			FROM	dbo.tbn120da_af
			GROUP BY da20tipooper
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192
		(
			cod_tipo_operacion_192,
			tipo_operacion_192,
			origen
		)
		SELECT	query.cod_tipo_operacion_192,
				query.tipo_operacion_192,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 
						ON tbn1_mi_tipos_operacion_192.cod_tipo_operacion_192 = query.cod_tipo_operacion_192
		WHERE	tbn1_mi_tipos_operacion_192.cod_tipo_operacion_192 IS NULL

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos'
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
			SELECT	px20tipooper AS cod_tipo_operacion_192,
					'TIPO FALTANTE MAESTRO' AS tipo_operacion_192,
					'EXT. M-192' AS origen
			FROM	dbo.tbn12xpe_af
			GROUP BY px20tipooper
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192
		(
			cod_tipo_operacion_192,
			tipo_operacion_192,
			origen
		)
		SELECT	query.cod_tipo_operacion_192,
				query.tipo_operacion_192,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 
						ON tbn1_mi_tipos_operacion_192.cod_tipo_operacion_192 = query.cod_tipo_operacion_192
		WHERE	tbn1_mi_tipos_operacion_192.cod_tipo_operacion_192 IS NULL

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

/*FIN - tbn1_mi_tipos_operacion_192*/


/*************************/
/*tbn1_mi_claves_traspaso*/
/*************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_traspaso')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso(
	  id_clave_traspaso		int IDENTITY(1,1),
	  cod_clave_traspaso	varchar(1),
	  clave_traspaso		varchar(100),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_claves_traspaso UNIQUE (cod_clave_traspaso),
	  CONSTRAINT PK_tbn1_mi_claves_traspaso PRIMARY KEY CLUSTERED (id_clave_traspaso)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_traspaso' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_traspaso
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_traspaso(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso'
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

		;WITH query AS
		(
			SELECT	cod_clave_traspaso,
					clave_traspaso,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'T' cod_clave_traspaso,
							'Traspaso' clave_traspaso
					) claves_traspaso
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso AS tbn1_mi_claves_traspaso
		USING query ON query.cod_clave_traspaso = tbn1_mi_claves_traspaso.cod_clave_traspaso
		
		WHEN MATCHED AND 
		(
			tbn1_mi_claves_traspaso.clave_traspaso	<> query.clave_traspaso	OR (tbn1_mi_claves_traspaso.clave_traspaso	IS NULL AND query.clave_traspaso	IS NOT NULL)	OR  (tbn1_mi_claves_traspaso.clave_traspaso	IS NOT NULL AND query.clave_traspaso	IS NULL)
		OR	tbn1_mi_claves_traspaso.origen			<> query.origen			OR (tbn1_mi_claves_traspaso.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_claves_traspaso.origen			IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				clave_traspaso = query.clave_traspaso,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_traspaso,
				clave_traspaso,
				origen
			) 
			VALUES 
			(
				query.cod_clave_traspaso,
				query.clave_traspaso,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos'
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
			SELECT	da20cltraspaso AS cod_clave_traspaso,
					'CLAVE FALTANTE MAESTRO' AS clave_traspaso,
					'INT. M-192' AS origen
			FROM	dbo.tbn120da_af
			GROUP BY da20cltraspaso
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso
		(
			cod_clave_traspaso,
			clave_traspaso,
			origen
		)
		SELECT	query.cod_clave_traspaso,
				query.clave_traspaso,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso 
						ON tbn1_mi_claves_traspaso.cod_clave_traspaso = query.cod_clave_traspaso
		WHERE	tbn1_mi_claves_traspaso.cod_clave_traspaso IS NULL

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos'
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
			SELECT	px20cltraspaso AS cod_clave_traspaso,
					'CLAVE FALTANTE MAESTRO' AS clave_traspaso,
					'EXT. M-192' AS origen
			FROM	dbo.tbn12xpe_af
			GROUP BY px20cltraspaso
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso
		(
			cod_clave_traspaso,
			clave_traspaso,
			origen
		)
		SELECT	query.cod_clave_traspaso,
				query.clave_traspaso,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso 
						ON tbn1_mi_claves_traspaso.cod_clave_traspaso = query.cod_clave_traspaso
		WHERE	tbn1_mi_claves_traspaso.cod_clave_traspaso IS NULL

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
	
/*FIN - tbn1_mi_claves_traspaso*/



/******************************/
/*tbn1_mi_claves_operacion_192*/
/******************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_operacion_192')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192(
	  id_clave_operacion_192	int IDENTITY(1,1),
	  cod_clave_operacion_192	varchar(1),
	  clave_operacion_192		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT uk_mi_claves_operacion_192 UNIQUE (cod_clave_operacion_192),
	  CONSTRAINT PK_tbn1_mi_claves_operacion_192 PRIMARY KEY CLUSTERED (id_clave_operacion_192)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_operacion_192' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_operacion_192
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_operacion_192(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192'
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

		;WITH query AS
		(
			SELECT	cod_clave_operacion_192,
					clave_operacion_192,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'A' cod_clave_operacion_192,
							'Alta' clave_operacion_192
					UNION ALL 
					SELECT	'B' cod_clave_operacion_192,
							'Baja' clave_operacion_192
					) claves_operacion_192
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 AS tbn1_mi_claves_operacion_192
		USING query ON query.cod_clave_operacion_192 = tbn1_mi_claves_operacion_192.cod_clave_operacion_192
		
		WHEN MATCHED AND 
		(
			tbn1_mi_claves_operacion_192.clave_operacion_192	<> query.clave_operacion_192	OR (tbn1_mi_claves_operacion_192.clave_operacion_192	IS NULL AND query.clave_operacion_192	IS NOT NULL)	OR  (tbn1_mi_claves_operacion_192.clave_operacion_192	IS NOT NULL AND query.clave_operacion_192	IS NULL)
		OR	tbn1_mi_claves_operacion_192.origen					<> query.origen					OR (tbn1_mi_claves_operacion_192.origen					IS NULL AND query.origen				IS NOT NULL)	OR  (tbn1_mi_claves_operacion_192.origen				IS NOT NULL AND query.origen				IS NULL)
		)
		THEN
			UPDATE SET
				clave_operacion_192 = query.clave_operacion_192,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_operacion_192,
				clave_operacion_192,
				origen
			) 
			VALUES 
			(
				query.cod_clave_operacion_192,
				query.clave_operacion_192,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos'
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
			SELECT	da20cloperacion AS cod_clave_operacion_192,
					'CLAVE FALTANTE MAESTRO' AS clave_operacion_192,
					'INT. M-192' AS origen
			FROM	dbo.tbn120da_af
			GROUP BY da20cloperacion
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192
		(
			cod_clave_operacion_192,
			clave_operacion_192,
			origen
		)
		SELECT	query.cod_clave_operacion_192,
				query.clave_operacion_192,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 
						ON tbn1_mi_claves_operacion_192.cod_clave_operacion_192 = query.cod_clave_operacion_192
		WHERE	tbn1_mi_claves_operacion_192.cod_clave_operacion_192 IS NULL

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos'
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
			SELECT	px20cloperacion AS cod_clave_operacion_192,
					'CLAVE FALTANTE MAESTRO' AS clave_operacion_192,
					'EXT. M-192' AS origen
			FROM	dbo.tbn12xpe_af
			GROUP BY px20cloperacion
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192
		(
			cod_clave_operacion_192,
			clave_operacion_192,
			origen
		)
		SELECT	query.cod_clave_operacion_192,
				query.clave_operacion_192,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 
						ON tbn1_mi_claves_operacion_192.cod_clave_operacion_192 = query.cod_clave_operacion_192
		WHERE	tbn1_mi_claves_operacion_192.cod_clave_operacion_192 IS NULL

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

/*FIN - tbn1_mi_claves_operacion_192*/



/*********************/
/*tbn1_mi_clave_valor*/
/*********************/

--TABLA--
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor(
  id_clave_valor int IDENTITY(1,1),
  cod_clave_valor varchar(1),
  clave_valor varchar(300),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_valor UNIQUE (cod_clave_valor),
  CONSTRAINT PK_tbn1_mi_clave_valor PRIMARY KEY CLUSTERED (id_clave_valor)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='id_clave_valor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD id_clave_valor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='cod_clave_valor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD cod_clave_valor varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='clave_valor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD clave_valor varchar(300)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_VALOR_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='id_clave_valor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN id_clave_valor int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='cod_clave_valor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN cod_clave_valor varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='clave_valor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN clave_valor varchar(300) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_valor' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_valor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor ADD CONSTRAINT PK_tbn1_mi_clave_valor PRIMARY KEY CLUSTERED (id_clave_valor)

GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_valor' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_valor;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_valor(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_valor'
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

	;WITH query AS 
	(
		SELECT	cod_clave_valor,
				descripcion_clave_valor AS clave_valor,
				'MAESTRO' AS origen
		FROM	(
				SELECT	'A' AS cod_clave_valor,
						'Acciones o participaciones en sociedades de responsabilidad limitada' AS descripcion_clave_valor
				UNION 
				SELECT	'B' AS cod_clave_valor,
						'Activos financieros con rendimiento explícito excluidos de la obligación de practicar retención' AS descripcion_clave_valor
				UNION 
				SELECT	'C' AS cod_clave_valor,
						'Activos financieros con rendimiento implícito excluidos de la obligación de practicar retención' AS descripcion_clave_valor
				UNION 
				SELECT	'D' AS cod_clave_valor,
						'Principales segregados' AS descripcion_clave_valor
				UNION 
				SELECT	'E' AS cod_clave_valor,
						'Cupones segregados' AS descripcion_clave_valor
				UNION 
				SELECT	'F' AS cod_clave_valor,
						'Derechos de Garantía' AS descripcion_clave_valor
				UNION 
				SELECT	'G' AS cod_clave_valor,
						'Derechos de Disfrute' AS descripcion_clave_valor
				UNION 
				SELECT	'H' AS cod_clave_valor,
						'Derechos de suscripción' AS descripcion_clave_valor
				UNION 
				SELECT	'I' AS cod_clave_valor,
						'Otros' AS descripcion_clave_valor
				UNION 
				--SELECT	'J' AS cod_clave_valor,
				--		'Activos financieros con rendimiento explícito excluidos de la obligación de practicar retención, emitidos por Entes Públicos Territoriales con plazo de amortización igual o inferior a dos años y cuyo importe de la operación (valor de amortización) coincida con el valor de nominal' AS descripcion_clave_valor
				--UNION 
				SELECT	'K' AS cod_clave_valor,
						'Participaciones preferentes' AS descripcion_clave_valor
				UNION 
				SELECT	'M' AS cod_clave_valor,
						'Acciones y participaciones en instituciones de inversión colectiva. Sólo se podrá consignar esta clave, CLAVE OPERACIOÓN = "P" o "Q"' AS descripcion_clave_valor
				) clave_valor
	)
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor AS t
  USING query ON query.cod_clave_valor = t.cod_clave_valor
  WHEN MATCHED AND ((t.clave_valor<>query.clave_valor OR (t.clave_valor IS NULL AND query.clave_valor IS NOT NULL) OR  (t.clave_valor IS NOT NULL AND query.clave_valor IS NULL)
                    OR t.origen<>query.origen OR (t.origen IS NULL AND query.origen IS NOT NULL) OR  (t.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_valor=query.clave_valor,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_valor,clave_valor,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_valor,
      query.clave_valor,
      query.origen,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

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

/*FIN - tbn1_mi_clave_valor*/





/***********************/
/*SP PADRE CON LOS EXEC*/
/***********************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_maestros_af' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_maestros_af;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_maestros_af(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_af'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	
	IF @logpadre IS NOT NULL 
	AND EXISTS	(
					SELECT	1 AS expr1
					FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
					WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
					AND		excluido=1
				) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error='EXCLUÍDO'
		WHERE	id_log=@log;
		RETURN
	END

	BEGIN TRY
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_internos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_externos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_internos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_externos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_valor @log
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error=error_message(),
				procedimiento_error=error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO

/*FIN - SP PADRE CON LOS EXEC*/