PRINT 'dimensional_mi_181_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_181_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_181_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_181_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_181_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ADD CONSTRAINT PK_tbn1_mi_181_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ADD CONSTRAINT FK_tbn1_mi_181_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos ADD CONSTRAINT FK_tbn1_mi_181_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_documentos_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_documentos_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_documentos_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_documentos_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			id_documento,
			id_expediente
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos AS tbn1_mi_181_dim_documentos
	USING query ON query.id_documento=tbn1_mi_181_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_181_dim_documentos.id_expediente
	WHEN NOT MATCHED THEN
		INSERT (id_documento,id_expediente) VALUES (
			query.id_documento,
			query.id_expediente)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	id_mae_no_id_declarante int NOT NULL,
	nif_declarante_181 varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	telefono_contacto varchar(9) NOT NULL,
	nombre_contacto varchar(40) NOT NULL,
	CONSTRAINT uk_mi_181_dim_declarantes UNIQUE (id_mae_no_id_declarante,nif_declarante_181,id_contribuyente_declarante,telefono_contacto,nombre_contacto),
	CONSTRAINT FK_tbn1_mi_181_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_181_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_181_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='nif_declarante_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD nif_declarante_181 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD telefono_contacto varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD nombre_contacto varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='nif_declarante_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ALTER COLUMN nif_declarante_181 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ALTER COLUMN telefono_contacto varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ALTER COLUMN nombre_contacto varchar(40) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_181_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_181_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_181_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_declarantes_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_declarantes_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_declarantes_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_declarantes_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			id_mae_no_id_declarante,
			nif_declarante_181,
			id_contribuyente_declarante,
			telefono_contacto,
			nombre_contacto
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarante,
			nif_declarante_181,
			id_contribuyente_declarante,
			telefono_contacto,
			nombre_contacto
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes AS tbn1_mi_181_dim_declarantes
	USING query ON query.id_mae_no_id_declarante=tbn1_mi_181_dim_declarantes.id_mae_no_id_declarante AND query.nif_declarante_181=tbn1_mi_181_dim_declarantes.nif_declarante_181 AND query.id_contribuyente_declarante=tbn1_mi_181_dim_declarantes.id_contribuyente_declarante AND query.telefono_contacto=tbn1_mi_181_dim_declarantes.telefono_contacto AND query.nombre_contacto=tbn1_mi_181_dim_declarantes.nombre_contacto
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarante,nif_declarante_181,id_contribuyente_declarante,telefono_contacto,nombre_contacto) VALUES (
			query.id_mae_no_id_declarante,
			query.nif_declarante_181,
			query.id_contribuyente_declarante,
			query.telefono_contacto,
			query.nombre_contacto)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	id_mae_no_id_declarado int NOT NULL,
	secuencia varchar(9) NOT NULL,
	nif_declarado_181 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	nivel_identificacion_nif_declarado varchar(1) NOT NULL,
	CONSTRAINT uk_mi_181_dim_declarados UNIQUE (id_mae_no_id_declarado,secuencia,nif_declarado_181,nif_declarado_no_identificado,id_contribuyente_declarado  ,nivel_identificacion_nif_declarado),
	CONSTRAINT FK_tbn1_mi_181_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_181_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_181_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='nif_declarado_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD nif_declarado_181 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='nivel_identificacion_nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD nivel_identificacion_nif_declarado varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN secuencia varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='nif_declarado_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN nif_declarado_181 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND COLUMN_NAME='nivel_identificacion_nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ALTER COLUMN nivel_identificacion_nif_declarado varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD CONSTRAINT PK_tbn1_mi_181_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD CONSTRAINT FK_tbn1_mi_181_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados ADD CONSTRAINT FK_tbn1_mi_181_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_declarados_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_declarados_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_declarados_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_declarados_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			id_mae_no_id_declarado,
			secuencia,
			nif_declarado_181,
			nif_declarado_no_identificado,
			id_contribuyente_declarado  ,
			nivel_identificacion_nif_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarado,
			secuencia,
			nif_declarado_181,
			nif_declarado_no_identificado,
			id_contribuyente_declarado  ,
			nivel_identificacion_nif_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados AS tbn1_mi_181_dim_declarados
	USING query ON query.id_mae_no_id_declarado=tbn1_mi_181_dim_declarados.id_mae_no_id_declarado AND query.secuencia=tbn1_mi_181_dim_declarados.secuencia AND query.nif_declarado_181=tbn1_mi_181_dim_declarados.nif_declarado_181 AND query.nif_declarado_no_identificado=tbn1_mi_181_dim_declarados.nif_declarado_no_identificado AND query.id_contribuyente_declarado  =tbn1_mi_181_dim_declarados.id_contribuyente_declarado   AND query.nivel_identificacion_nif_declarado=tbn1_mi_181_dim_declarados.nivel_identificacion_nif_declarado
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarado,secuencia,nif_declarado_181,nif_declarado_no_identificado,id_contribuyente_declarado  ,nivel_identificacion_nif_declarado) VALUES (
			query.id_mae_no_id_declarado,
			query.secuencia,
			query.nif_declarado_181,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado  ,
			query.nivel_identificacion_nif_declarado)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion  int NOT NULL,
	fecha_operacion_prestamo date NOT NULL,
	mes_operacion_prestamo int NOT NULL,
	anyo_operacion_prestamo int NOT NULL,
	CONSTRAINT uk_mi_181_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion ,fecha_operacion_prestamo,mes_operacion_prestamo,anyo_operacion_prestamo),
	CONSTRAINT PK_tbn1_mi_181_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='fecha_operacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD fecha_operacion_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='mes_operacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD mes_operacion_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='anyo_operacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD anyo_operacion_prestamo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='fecha_operacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN fecha_operacion_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='mes_operacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN mes_operacion_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND COLUMN_NAME='anyo_operacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ALTER COLUMN anyo_operacion_prestamo int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos ADD CONSTRAINT PK_tbn1_mi_181_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_periodos_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_periodos_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_periodos_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_periodos_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion ,
			fecha_operacion_prestamo,
			mes_operacion_prestamo,
			anyo_operacion_prestamo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion ,
			fecha_operacion_prestamo,
			mes_operacion_prestamo,
			anyo_operacion_prestamo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos AS tbn1_mi_181_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_181_dim_periodos.ejercicio AND query.fecha_presentacion=tbn1_mi_181_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_181_dim_periodos.mes_presentacion AND query.anyo_presentacion =tbn1_mi_181_dim_periodos.anyo_presentacion  AND query.fecha_operacion_prestamo=tbn1_mi_181_dim_periodos.fecha_operacion_prestamo AND query.mes_operacion_prestamo=tbn1_mi_181_dim_periodos.mes_operacion_prestamo AND query.anyo_operacion_prestamo=tbn1_mi_181_dim_periodos.anyo_operacion_prestamo
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion ,fecha_operacion_prestamo,mes_operacion_prestamo,anyo_operacion_prestamo) VALUES (
			query.ejercicio,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion ,
			query.fecha_operacion_prestamo,
			query.mes_operacion_prestamo,
			query.anyo_operacion_prestamo)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo  varchar(3) NOT NULL,
	id_administracion_declarante int NOT NULL,
	id_tipo_presentacion int NOT NULL,
	CONSTRAINT uk_mi_181_dim_datos_caratula UNIQUE (modelo ,id_administracion_declarante,id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT PK_tbn1_mi_181_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_181_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_datos_caratula_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_datos_caratula_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_datos_caratula_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_datos_caratula_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			modelo ,
			id_administracion_declarante,
			id_tipo_presentacion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo ,
			id_administracion_declarante,
			id_tipo_presentacion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula AS tbn1_mi_181_dim_datos_caratula
	USING query ON query.modelo =tbn1_mi_181_dim_datos_caratula.modelo  AND query.id_administracion_declarante=tbn1_mi_181_dim_datos_caratula.id_administracion_declarante AND query.id_tipo_presentacion=tbn1_mi_181_dim_datos_caratula.id_tipo_presentacion
	WHEN NOT MATCHED THEN
		INSERT (modelo ,id_administracion_declarante,id_tipo_presentacion) VALUES (
			query.modelo ,
			query.id_administracion_declarante,
			query.id_tipo_presentacion)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_externo_declarante bit NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	es_complementaria varchar(1) NOT NULL,
	es_sustitutiva varchar(1) NOT NULL,
	es_rehabilitacion varchar(1) NOT NULL,
	es_externo_declarado bit NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	sw_representante  varchar(1) NOT NULL,
	CONSTRAINT uk_mi_181_dim_marcas UNIQUE (es_externo_declarante,es_contribuyente_declarante,es_complementaria,es_sustitutiva,es_rehabilitacion,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado   ,sw_representante ),
	CONSTRAINT PK_tbn1_mi_181_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_complementaria varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_sustitutiva varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_rehabilitacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='sw_representante ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD sw_representante  varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_complementaria varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_sustitutiva varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_rehabilitacion varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND COLUMN_NAME='sw_representante ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ALTER COLUMN sw_representante  varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas ADD CONSTRAINT PK_tbn1_mi_181_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_marcas_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_marcas_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_marcas_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_marcas_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			es_externo_declarante,
			es_contribuyente_declarante,
			es_complementaria,
			es_sustitutiva,
			es_rehabilitacion,
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado   ,
			sw_representante 
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_externo_declarante,
			es_contribuyente_declarante,
			es_complementaria,
			es_sustitutiva,
			es_rehabilitacion,
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado   ,
			sw_representante 
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas AS tbn1_mi_181_dim_marcas
	USING query ON query.es_externo_declarante=tbn1_mi_181_dim_marcas.es_externo_declarante AND query.es_contribuyente_declarante=tbn1_mi_181_dim_marcas.es_contribuyente_declarante AND query.es_complementaria=tbn1_mi_181_dim_marcas.es_complementaria AND query.es_sustitutiva=tbn1_mi_181_dim_marcas.es_sustitutiva AND query.es_rehabilitacion=tbn1_mi_181_dim_marcas.es_rehabilitacion AND query.es_externo_declarado=tbn1_mi_181_dim_marcas.es_externo_declarado AND query.es_contribuyente_declarado=tbn1_mi_181_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_181_dim_marcas.es_identificado_declarado AND query.sw_identificado_declarado   =tbn1_mi_181_dim_marcas.sw_identificado_declarado    AND query.sw_representante =tbn1_mi_181_dim_marcas.sw_representante 
	WHEN NOT MATCHED THEN
		INSERT (es_externo_declarante,es_contribuyente_declarante,es_complementaria,es_sustitutiva,es_rehabilitacion,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado   ,sw_representante ) VALUES (
			query.es_externo_declarante,
			query.es_contribuyente_declarante,
			query.es_complementaria,
			query.es_sustitutiva,
			query.es_rehabilitacion,
			query.es_externo_declarado,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.sw_representante )
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	id_administracion_declarado int NOT NULL,
	id_provincia int NOT NULL,
	numero_identificacion_prestamo varchar(20) NOT NULL,
	id_origen_operacion_181 int NOT NULL,
	id_clave_operacion_181 int NOT NULL,
	id_subclave_operacion_181 int NOT NULL,
	id_situacion_inmueble_181 int NOT NULL,
	referencia_catastral varchar(20) NOT NULL,
	id_tipo_identificacion_181 int NOT NULL,
	id_clave_intervencion_operacion_181 int NOT NULL,
	CONSTRAINT uk_mi_181_dim_datos_detalle UNIQUE (id_administracion_declarado,id_provincia,numero_identificacion_prestamo,id_origen_operacion_181,id_clave_operacion_181,id_subclave_operacion_181,id_situacion_inmueble_181,referencia_catastral,id_tipo_identificacion_181,id_clave_intervencion_operacion_181),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_origen_operacion_181 FOREIGN KEY (id_origen_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_origen_operacion_181(id_origen_operacion_181),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_clave_operacion_181 FOREIGN KEY (id_clave_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_operacion_181(id_clave_operacion_181),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_subclave_operacion_181 FOREIGN KEY (id_subclave_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_subclave_operacion_181(id_subclave_operacion_181),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_situacion_inmueble_181 FOREIGN KEY (id_situacion_inmueble_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_situacion_inmueble_181(id_situacion_inmueble_181),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_tipo_identificacion_181 FOREIGN KEY (id_tipo_identificacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipo_identificacion_181(id_tipo_identificacion_181),
	CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_clave_intervencion_operacion_181 FOREIGN KEY (id_clave_intervencion_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_intervencion_operacion_181(id_clave_intervencion_operacion_181),
	CONSTRAINT PK_tbn1_mi_181_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='numero_identificacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD numero_identificacion_prestamo varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_origen_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_origen_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_clave_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_clave_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_subclave_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_subclave_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_situacion_inmueble_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_situacion_inmueble_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='referencia_catastral')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD referencia_catastral varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_tipo_identificacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_tipo_identificacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_clave_intervencion_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD id_clave_intervencion_operacion_181 int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_administracion_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='numero_identificacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN numero_identificacion_prestamo varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_origen_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_origen_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_clave_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_clave_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_subclave_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_subclave_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_situacion_inmueble_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_situacion_inmueble_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='referencia_catastral' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN referencia_catastral varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_tipo_identificacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_tipo_identificacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND COLUMN_NAME='id_clave_intervencion_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ALTER COLUMN id_clave_intervencion_operacion_181 int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT PK_tbn1_mi_181_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_dim_provincias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_origen_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_origen_operacion_181 FOREIGN KEY (id_origen_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_origen_operacion_181(id_origen_operacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_clave_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_clave_operacion_181 FOREIGN KEY (id_clave_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_operacion_181(id_clave_operacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_subclave_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_subclave_operacion_181 FOREIGN KEY (id_subclave_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_subclave_operacion_181(id_subclave_operacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_situacion_inmueble_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_situacion_inmueble_181 FOREIGN KEY (id_situacion_inmueble_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_situacion_inmueble_181(id_situacion_inmueble_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_tipo_identificacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_tipo_identificacion_181 FOREIGN KEY (id_tipo_identificacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipo_identificacion_181(id_tipo_identificacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_clave_intervencion_operacion_181')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_181_dim_datos_detalle_tbn1_mi_mae_clave_intervencion_operacion_181 FOREIGN KEY (id_clave_intervencion_operacion_181) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_clave_intervencion_operacion_181(id_clave_intervencion_operacion_181)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_datos_detalle_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_datos_detalle_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_datos_detalle_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_datos_detalle_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			id_administracion_declarado,
			id_provincia,
			numero_identificacion_prestamo,
			id_origen_operacion_181,
			id_clave_operacion_181,
			id_subclave_operacion_181,
			id_situacion_inmueble_181,
			referencia_catastral,
			id_tipo_identificacion_181,
			id_clave_intervencion_operacion_181
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_administracion_declarado,
			id_provincia,
			numero_identificacion_prestamo,
			id_origen_operacion_181,
			id_clave_operacion_181,
			id_subclave_operacion_181,
			id_situacion_inmueble_181,
			referencia_catastral,
			id_tipo_identificacion_181,
			id_clave_intervencion_operacion_181
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle AS tbn1_mi_181_dim_datos_detalle
	USING query ON query.id_administracion_declarado=tbn1_mi_181_dim_datos_detalle.id_administracion_declarado AND query.id_provincia=tbn1_mi_181_dim_datos_detalle.id_provincia AND query.numero_identificacion_prestamo=tbn1_mi_181_dim_datos_detalle.numero_identificacion_prestamo AND query.id_origen_operacion_181=tbn1_mi_181_dim_datos_detalle.id_origen_operacion_181 AND query.id_clave_operacion_181=tbn1_mi_181_dim_datos_detalle.id_clave_operacion_181 AND query.id_subclave_operacion_181=tbn1_mi_181_dim_datos_detalle.id_subclave_operacion_181 AND query.id_situacion_inmueble_181=tbn1_mi_181_dim_datos_detalle.id_situacion_inmueble_181 AND query.referencia_catastral=tbn1_mi_181_dim_datos_detalle.referencia_catastral AND query.id_tipo_identificacion_181=tbn1_mi_181_dim_datos_detalle.id_tipo_identificacion_181 AND query.id_clave_intervencion_operacion_181=tbn1_mi_181_dim_datos_detalle.id_clave_intervencion_operacion_181
	WHEN NOT MATCHED THEN
		INSERT (id_administracion_declarado,id_provincia,numero_identificacion_prestamo,id_origen_operacion_181,id_clave_operacion_181,id_subclave_operacion_181,id_situacion_inmueble_181,referencia_catastral,id_tipo_identificacion_181,id_clave_intervencion_operacion_181) VALUES (
			query.id_administracion_declarado,
			query.id_provincia,
			query.numero_identificacion_prestamo,
			query.id_origen_operacion_181,
			query.id_clave_operacion_181,
			query.id_subclave_operacion_181,
			query.id_situacion_inmueble_181,
			query.referencia_catastral,
			query.id_tipo_identificacion_181,
			query.id_clave_intervencion_operacion_181)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas(
	id_dim_prestamistas int IDENTITY(1,1),
	nif_prestamista varchar(12) NOT NULL,
	nombre_prestamista  varchar(40) NOT NULL,
	CONSTRAINT uk_mi_181_dim_prestamistas UNIQUE (nif_prestamista,nombre_prestamista ),
	CONSTRAINT PK_tbn1_mi_181_dim_prestamistas PRIMARY KEY CLUSTERED (id_dim_prestamistas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND COLUMN_NAME='id_dim_prestamistas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ADD id_dim_prestamistas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND COLUMN_NAME='nif_prestamista')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ADD nif_prestamista varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND COLUMN_NAME='nombre_prestamista ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ADD nombre_prestamista  varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND COLUMN_NAME='id_dim_prestamistas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ALTER COLUMN id_dim_prestamistas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND COLUMN_NAME='nif_prestamista' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ALTER COLUMN nif_prestamista varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND COLUMN_NAME='nombre_prestamista ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ALTER COLUMN nombre_prestamista  varchar(40) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_dim_prestamistas' AND CONSTRAINT_NAME='PK_tbn1_mi_181_dim_prestamistas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas ADD CONSTRAINT PK_tbn1_mi_181_dim_prestamistas PRIMARY KEY CLUSTERED (id_dim_prestamistas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_dim_prestamistas_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_dim_prestamistas_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_dim_prestamistas_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_dim_prestamistas_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			nif_prestamista,
			nombre_prestamista 
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_prestamista,
			nombre_prestamista 
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas AS tbn1_mi_181_dim_prestamistas
	USING query ON query.nif_prestamista=tbn1_mi_181_dim_prestamistas.nif_prestamista AND query.nombre_prestamista =tbn1_mi_181_dim_prestamistas.nombre_prestamista 
	WHEN NOT MATCHED THEN
		INSERT (nif_prestamista,nombre_prestamista ) VALUES (
			query.nif_prestamista,
			query.nombre_prestamista )
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO



PRINT 'dimensional_mi_181_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_datos_detalle int NOT NULL,
	id_dim_prestamistas int NOT NULL,
	importe_prestamo decimal(18, 2),
	importe_amortizacion decimal(18, 2),
	importe_intereses decimal(18, 2),
	importe_gastos_amortizacion decimal(18, 2),
	porcentaje_participacion numeric(6, 3),
	importe_gastos_financiacion decimal(18, 2),
	saldo_inicial_ejercicio decimal(18, 2),
	saldo_final_ejercicio decimal(18, 2),
	importe_valor_tasacion_inmueble decimal(18, 2),
	porcentaje_financiacion numeric(5, 2),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle(id_dim_datos_detalle),
	CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_prestamistas FOREIGN KEY (id_dim_prestamistas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas(id_dim_prestamistas),
	CONSTRAINT PK_tbn1_mi_181_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_prestamistas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD id_dim_prestamistas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD importe_prestamo decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_amortizacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD importe_amortizacion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_intereses')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD importe_intereses decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_gastos_amortizacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD importe_gastos_amortizacion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD porcentaje_participacion numeric(6, 3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_gastos_financiacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD importe_gastos_financiacion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='saldo_inicial_ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD saldo_inicial_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='saldo_final_ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD saldo_final_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_valor_tasacion_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD importe_valor_tasacion_inmueble decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='porcentaje_financiacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD porcentaje_financiacion numeric(5, 2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='id_dim_prestamistas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN id_dim_prestamistas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_prestamo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN importe_prestamo decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_amortizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN importe_amortizacion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_intereses' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN importe_intereses decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_gastos_amortizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN importe_gastos_amortizacion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN porcentaje_participacion numeric(6, 3) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_gastos_financiacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN importe_gastos_financiacion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='saldo_inicial_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN saldo_inicial_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='saldo_final_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN saldo_final_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='importe_valor_tasacion_inmueble' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN importe_valor_tasacion_inmueble decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND COLUMN_NAME='porcentaje_financiacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ALTER COLUMN porcentaje_financiacion numeric(5, 2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_181_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT PK_tbn1_mi_181_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle(id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_181_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_181_fact_tbn1_mi_181_dim_prestamistas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact ADD CONSTRAINT FK_tbn1_mi_181_fact_tbn1_mi_181_dim_prestamistas FOREIGN KEY (id_dim_prestamistas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas(id_dim_prestamistas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_181_fact_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_181_fact_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_181_fact_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_181_fact_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

	;WITH
	query AS (
		SELECT
			documentos.id_dim_documentos AS id_dim_documentos,
			declarantes.id_dim_declarantes AS id_dim_declarantes,
			declarados.id_dim_declarados AS id_dim_declarados,
			periodos.id_dim_periodos AS id_dim_periodos,
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			marcas.id_dim_marcas AS id_dim_marcas,
			datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
			prestamistas.id_dim_prestamistas AS id_dim_prestamistas,
			sum(ds_t.importe_prestamo) AS importe_prestamo,
			sum(ds_t.importe_amortizacion) AS importe_amortizacion,
			sum(ds_t.importe_intereses) AS importe_intereses,
			sum(ds_t.importe_gastos_amortizacion) AS importe_gastos_amortizacion,
			sum(ds_t.porcentaje_participacion) AS porcentaje_participacion,
			sum(ds_t.importe_gastos_financiacion) AS importe_gastos_financiacion,
			sum(ds_t.saldo_inicial_ejercicio) AS saldo_inicial_ejercicio,
			sum(ds_t.saldo_final_ejercicio) AS saldo_final_ejercicio,
			sum(ds_t.importe_valor_tasacion_inmueble) AS importe_valor_tasacion_inmueble,
			sum(ds_t.porcentaje_financiacion) AS porcentaje_financiacion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarantes AS declarantes ON (declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante AND declarantes.nif_declarante_181=ds_t.nif_declarante_181 AND declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes.telefono_contacto=ds_t.telefono_contacto AND declarantes.nombre_contacto=ds_t.nombre_contacto)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_declarados AS declarados ON (declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado AND declarados.secuencia=ds_t.secuencia AND declarados.nif_declarado_181=ds_t.nif_declarado_181 AND declarados.nif_declarado_no_identificado=ds_t.nif_declarado_no_identificado AND declarados.id_contribuyente_declarado  =ds_t.id_contribuyente_declarado   AND declarados.nivel_identificacion_nif_declarado=ds_t.nivel_identificacion_nif_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion =ds_t.anyo_presentacion  AND periodos.fecha_operacion_prestamo=ds_t.fecha_operacion_prestamo AND periodos.mes_operacion_prestamo=ds_t.mes_operacion_prestamo AND periodos.anyo_operacion_prestamo=ds_t.anyo_operacion_prestamo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo =ds_t.modelo  AND datos_caratula.id_administracion_declarante=ds_t.id_administracion_declarante AND datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_marcas AS marcas ON (marcas.es_externo_declarante=ds_t.es_externo_declarante AND marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_complementaria=ds_t.es_complementaria AND marcas.es_sustitutiva=ds_t.es_sustitutiva AND marcas.es_rehabilitacion=ds_t.es_rehabilitacion AND marcas.es_externo_declarado=ds_t.es_externo_declarado AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado AND marcas.sw_identificado_declarado   =ds_t.sw_identificado_declarado    AND marcas.sw_representante =ds_t.sw_representante )
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_datos_detalle AS datos_detalle ON (datos_detalle.id_administracion_declarado=ds_t.id_administracion_declarado AND datos_detalle.id_provincia=ds_t.id_provincia AND datos_detalle.numero_identificacion_prestamo=ds_t.numero_identificacion_prestamo AND datos_detalle.id_origen_operacion_181=ds_t.id_origen_operacion_181 AND datos_detalle.id_clave_operacion_181=ds_t.id_clave_operacion_181 AND datos_detalle.id_subclave_operacion_181=ds_t.id_subclave_operacion_181 AND datos_detalle.id_situacion_inmueble_181=ds_t.id_situacion_inmueble_181 AND datos_detalle.referencia_catastral=ds_t.referencia_catastral AND datos_detalle.id_tipo_identificacion_181=ds_t.id_tipo_identificacion_181 AND datos_detalle.id_clave_intervencion_operacion_181=ds_t.id_clave_intervencion_operacion_181)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_181_dim_prestamistas AS prestamistas ON (prestamistas.nif_prestamista=ds_t.nif_prestamista AND prestamistas.nombre_prestamista =ds_t.nombre_prestamista )
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			declarantes.id_dim_declarantes,
			declarados.id_dim_declarados,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			marcas.id_dim_marcas,
			datos_detalle.id_dim_datos_detalle,
			prestamistas.id_dim_prestamistas
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_181_fact AS tbn1_mi_181_fact
	USING query ON query.id_dim_documentos=tbn1_mi_181_fact.id_dim_documentos AND query.id_dim_declarantes=tbn1_mi_181_fact.id_dim_declarantes AND query.id_dim_declarados=tbn1_mi_181_fact.id_dim_declarados AND query.id_dim_periodos=tbn1_mi_181_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_181_fact.id_dim_datos_caratula AND query.id_dim_marcas=tbn1_mi_181_fact.id_dim_marcas AND query.id_dim_datos_detalle=tbn1_mi_181_fact.id_dim_datos_detalle AND query.id_dim_prestamistas=tbn1_mi_181_fact.id_dim_prestamistas
	WHEN MATCHED AND ((tbn1_mi_181_fact.importe_prestamo<>query.importe_prestamo OR (tbn1_mi_181_fact.importe_prestamo IS NULL AND query.importe_prestamo IS NOT NULL) OR (tbn1_mi_181_fact.importe_prestamo IS NOT NULL AND query.importe_prestamo IS NULL)
			OR tbn1_mi_181_fact.importe_amortizacion<>query.importe_amortizacion OR (tbn1_mi_181_fact.importe_amortizacion IS NULL AND query.importe_amortizacion IS NOT NULL) OR (tbn1_mi_181_fact.importe_amortizacion IS NOT NULL AND query.importe_amortizacion IS NULL)
			OR tbn1_mi_181_fact.importe_intereses<>query.importe_intereses OR (tbn1_mi_181_fact.importe_intereses IS NULL AND query.importe_intereses IS NOT NULL) OR (tbn1_mi_181_fact.importe_intereses IS NOT NULL AND query.importe_intereses IS NULL)
			OR tbn1_mi_181_fact.importe_gastos_amortizacion<>query.importe_gastos_amortizacion OR (tbn1_mi_181_fact.importe_gastos_amortizacion IS NULL AND query.importe_gastos_amortizacion IS NOT NULL) OR (tbn1_mi_181_fact.importe_gastos_amortizacion IS NOT NULL AND query.importe_gastos_amortizacion IS NULL)
			OR tbn1_mi_181_fact.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_181_fact.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_181_fact.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
			OR tbn1_mi_181_fact.importe_gastos_financiacion<>query.importe_gastos_financiacion OR (tbn1_mi_181_fact.importe_gastos_financiacion IS NULL AND query.importe_gastos_financiacion IS NOT NULL) OR (tbn1_mi_181_fact.importe_gastos_financiacion IS NOT NULL AND query.importe_gastos_financiacion IS NULL)
			OR tbn1_mi_181_fact.saldo_inicial_ejercicio<>query.saldo_inicial_ejercicio OR (tbn1_mi_181_fact.saldo_inicial_ejercicio IS NULL AND query.saldo_inicial_ejercicio IS NOT NULL) OR (tbn1_mi_181_fact.saldo_inicial_ejercicio IS NOT NULL AND query.saldo_inicial_ejercicio IS NULL)
			OR tbn1_mi_181_fact.saldo_final_ejercicio<>query.saldo_final_ejercicio OR (tbn1_mi_181_fact.saldo_final_ejercicio IS NULL AND query.saldo_final_ejercicio IS NOT NULL) OR (tbn1_mi_181_fact.saldo_final_ejercicio IS NOT NULL AND query.saldo_final_ejercicio IS NULL)
			OR tbn1_mi_181_fact.importe_valor_tasacion_inmueble<>query.importe_valor_tasacion_inmueble OR (tbn1_mi_181_fact.importe_valor_tasacion_inmueble IS NULL AND query.importe_valor_tasacion_inmueble IS NOT NULL) OR (tbn1_mi_181_fact.importe_valor_tasacion_inmueble IS NOT NULL AND query.importe_valor_tasacion_inmueble IS NULL)
			OR tbn1_mi_181_fact.porcentaje_financiacion<>query.porcentaje_financiacion OR (tbn1_mi_181_fact.porcentaje_financiacion IS NULL AND query.porcentaje_financiacion IS NOT NULL) OR (tbn1_mi_181_fact.porcentaje_financiacion IS NOT NULL AND query.porcentaje_financiacion IS NULL))) THEN
		UPDATE SET
			importe_prestamo=query.importe_prestamo,
			importe_amortizacion=query.importe_amortizacion,
			importe_intereses=query.importe_intereses,
			importe_gastos_amortizacion=query.importe_gastos_amortizacion,
			porcentaje_participacion=query.porcentaje_participacion,
			importe_gastos_financiacion=query.importe_gastos_financiacion,
			saldo_inicial_ejercicio=query.saldo_inicial_ejercicio,
			saldo_final_ejercicio=query.saldo_final_ejercicio,
			importe_valor_tasacion_inmueble=query.importe_valor_tasacion_inmueble,
			porcentaje_financiacion=query.porcentaje_financiacion
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,id_dim_prestamistas,importe_prestamo,importe_amortizacion,importe_intereses,importe_gastos_amortizacion,porcentaje_participacion,importe_gastos_financiacion,saldo_inicial_ejercicio,saldo_final_ejercicio,importe_valor_tasacion_inmueble,porcentaje_financiacion) VALUES (
			query.id_dim_documentos,
			query.id_dim_declarantes,
			query.id_dim_declarados,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_marcas,
			query.id_dim_datos_detalle,
			query.id_dim_prestamistas,
			query.importe_prestamo,
			query.importe_amortizacion,
			query.importe_intereses,
			query.importe_gastos_amortizacion,
			query.porcentaje_participacion,
			query.importe_gastos_financiacion,
			query.saldo_inicial_ejercicio,
			query.saldo_final_ejercicio,
			query.importe_valor_tasacion_inmueble,
			query.porcentaje_financiacion
			)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO



/*****************/
/*SP CON LOS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_181_prestamos_hipotecarios_ssis' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_181_prestamos_hipotecarios_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_181_prestamos_hipotecarios_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_mi_181_prestamos_hipotecarios_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_documentos_ssis	 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_periodos_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_datos_caratula_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_marcas_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_declarantes_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_declarados_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_datos_detalle_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_dim_prestamistas_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_181_fact_ssis  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;

	END TRY

	BEGIN CATCH
		--- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie


END

GO

/***********************/
/*FIN - SP CON LOS EXEC*/
/***********************/