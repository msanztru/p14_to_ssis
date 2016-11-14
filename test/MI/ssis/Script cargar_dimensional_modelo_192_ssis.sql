
PRINT 'cargar_dimensional_modelo_192.sql'
GO

/*************/
/*DIMENSIONES*/
/*************/

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_192_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_192_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_192_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_192_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ADD CONSTRAINT PK_tbn1_mi_192_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ADD CONSTRAINT FK_tbn1_mi_192_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos ADD CONSTRAINT FK_tbn1_mi_192_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_documentos_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_documentos_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_documentos_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_documentos_ssis',
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos AS tbn1_mi_192_dim_documentos
	USING query ON query.id_documento=tbn1_mi_192_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_192_dim_documentos.id_expediente
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	id_mae_no_id_declarante int NOT NULL,
	nif_declarante_192 varchar(12) NOT NULL,
	nif_declarante_no_identificado   varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	CONSTRAINT uk_mi_192_dim_declarantes UNIQUE (id_mae_no_id_declarante,nif_declarante_192,nif_declarante_no_identificado  ,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo),
	CONSTRAINT FK_tbn1_mi_192_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_192_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_192_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='nif_declarante_192')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD nif_declarante_192 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado  ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD nif_declarante_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD cod_presentador_colectivo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='nif_declarante_192' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN nif_declarante_192 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN nif_declarante_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_192_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_192_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_192_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_declarantes_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_declarantes_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_declarantes_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_declarantes_ssis',
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
			nif_declarante_192,
			nif_declarante_no_identificado  ,
			id_contribuyente_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarante,
			nif_declarante_192,
			nif_declarante_no_identificado  ,
			id_contribuyente_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes AS tbn1_mi_192_dim_declarantes
	USING query ON query.id_mae_no_id_declarante=tbn1_mi_192_dim_declarantes.id_mae_no_id_declarante AND query.nif_declarante_192=tbn1_mi_192_dim_declarantes.nif_declarante_192 AND query.nif_declarante_no_identificado  =tbn1_mi_192_dim_declarantes.nif_declarante_no_identificado   AND query.id_contribuyente_declarante=tbn1_mi_192_dim_declarantes.id_contribuyente_declarante AND query.telefono=tbn1_mi_192_dim_declarantes.telefono AND query.razon_social=tbn1_mi_192_dim_declarantes.razon_social AND query.cod_presentador_colectivo=tbn1_mi_192_dim_declarantes.cod_presentador_colectivo
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarante,nif_declarante_192,nif_declarante_no_identificado  ,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo) VALUES (
			query.id_mae_no_id_declarante,
			query.nif_declarante_192,
			query.nif_declarante_no_identificado  ,
			query.id_contribuyente_declarante,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	id_mae_no_id_declarado int NOT NULL,
	es_representante varchar(1) NOT NULL,
	cod_valor varchar(12) NOT NULL,
	secuencia  varchar(11) NOT NULL,
	nif_declarado_192 varchar(12) NOT NULL,
	nif_declarado_no_identificado   varchar(12) NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	nro_orden decimal(8, 0) NOT NULL,
	CONSTRAINT uk_mi_192_dim_declarados UNIQUE (id_mae_no_id_declarado,es_representante,cod_valor,secuencia ,nif_declarado_192,nif_declarado_no_identificado  ,id_contribuyente_declarado  ,nro_orden),
	CONSTRAINT FK_tbn1_mi_192_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_192_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_192_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD es_representante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='cod_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD cod_valor varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='secuencia ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD secuencia  varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='nif_declarado_192')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD nif_declarado_192 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado  ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD nif_declarado_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='nro_orden')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD nro_orden decimal(8, 0)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN es_representante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='cod_valor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN cod_valor varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='secuencia ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN secuencia  varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='nif_declarado_192' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN nif_declarado_192 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN nif_declarado_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND COLUMN_NAME='nro_orden' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ALTER COLUMN nro_orden decimal(8, 0) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD CONSTRAINT PK_tbn1_mi_192_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD CONSTRAINT FK_tbn1_mi_192_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados ADD CONSTRAINT FK_tbn1_mi_192_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_declarados_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_declarados_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_declarados_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_declarados_ssis',
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
			es_representante,
			cod_valor,
			secuencia ,
			nif_declarado_192,
			nif_declarado_no_identificado  ,
			id_contribuyente_declarado  ,
			nro_orden
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarado,
			es_representante,
			cod_valor,
			secuencia ,
			nif_declarado_192,
			nif_declarado_no_identificado  ,
			id_contribuyente_declarado  ,
			nro_orden
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados AS tbn1_mi_192_dim_declarados
	USING query ON query.id_mae_no_id_declarado=tbn1_mi_192_dim_declarados.id_mae_no_id_declarado AND query.es_representante=tbn1_mi_192_dim_declarados.es_representante AND query.cod_valor=tbn1_mi_192_dim_declarados.cod_valor AND query.secuencia =tbn1_mi_192_dim_declarados.secuencia  AND query.nif_declarado_192=tbn1_mi_192_dim_declarados.nif_declarado_192 AND query.nif_declarado_no_identificado  =tbn1_mi_192_dim_declarados.nif_declarado_no_identificado   AND query.id_contribuyente_declarado  =tbn1_mi_192_dim_declarados.id_contribuyente_declarado   AND query.nro_orden=tbn1_mi_192_dim_declarados.nro_orden
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarado,es_representante,cod_valor,secuencia ,nif_declarado_192,nif_declarado_no_identificado  ,id_contribuyente_declarado  ,nro_orden) VALUES (
			query.id_mae_no_id_declarado,
			query.es_representante,
			query.cod_valor,
			query.secuencia ,
			query.nif_declarado_192,
			query.nif_declarado_no_identificado  ,
			query.id_contribuyente_declarado  ,
			query.nro_orden)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int  NOT NULL,
	fecha_carga date NOT NULL,
	fecha_transmision date NOT NULL,
	mes_transmision int NOT NULL,
	anyo_transmision int  NOT NULL,
	fecha_adquisicion date NOT NULL,
	mes_adquisicion int NOT NULL,
	anyo_adquisicion int  NOT NULL,
	CONSTRAINT uk_mi_192_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_carga,fecha_transmision,mes_transmision,anyo_transmision,fecha_adquisicion,mes_adquisicion,anyo_adquisicion),
	CONSTRAINT PK_tbn1_mi_192_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD anyo_presentacion int 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_carga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD fecha_carga date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_transmision')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD fecha_transmision date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='mes_transmision')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD mes_transmision int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='anyo_transmision')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD anyo_transmision int 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_adquisicion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD fecha_adquisicion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='mes_adquisicion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD mes_adquisicion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='anyo_adquisicion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD anyo_adquisicion int 
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN anyo_presentacion int  NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_carga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN fecha_carga date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_transmision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN fecha_transmision date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='mes_transmision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN mes_transmision int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='anyo_transmision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN anyo_transmision int  NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='fecha_adquisicion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN fecha_adquisicion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='mes_adquisicion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN mes_adquisicion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND COLUMN_NAME='anyo_adquisicion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ALTER COLUMN anyo_adquisicion int  NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos ADD CONSTRAINT PK_tbn1_mi_192_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_periodos_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_periodos_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_periodos_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_periodos_ssis',
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
			anyo_presentacion,
			fecha_carga,
			fecha_transmision,
			mes_transmision,
			anyo_transmision,
			fecha_adquisicion,
			mes_adquisicion,
			anyo_adquisicion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_carga,
			fecha_transmision,
			mes_transmision,
			anyo_transmision,
			fecha_adquisicion,
			mes_adquisicion,
			anyo_adquisicion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos AS tbn1_mi_192_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_192_dim_periodos.ejercicio AND query.fecha_presentacion=tbn1_mi_192_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_192_dim_periodos.mes_presentacion AND query.anyo_presentacion=tbn1_mi_192_dim_periodos.anyo_presentacion AND query.fecha_carga=tbn1_mi_192_dim_periodos.fecha_carga AND query.fecha_transmision=tbn1_mi_192_dim_periodos.fecha_transmision AND query.mes_transmision=tbn1_mi_192_dim_periodos.mes_transmision AND query.anyo_transmision=tbn1_mi_192_dim_periodos.anyo_transmision AND query.fecha_adquisicion=tbn1_mi_192_dim_periodos.fecha_adquisicion AND query.mes_adquisicion=tbn1_mi_192_dim_periodos.mes_adquisicion AND query.anyo_adquisicion=tbn1_mi_192_dim_periodos.anyo_adquisicion
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_carga,fecha_transmision,mes_transmision,anyo_transmision,fecha_adquisicion,mes_adquisicion,anyo_adquisicion) VALUES (
			query.ejercicio,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.fecha_carga,
			query.fecha_transmision,
			query.mes_transmision,
			query.anyo_transmision,
			query.fecha_adquisicion,
			query.mes_adquisicion,
			query.anyo_adquisicion)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo  varchar(3)    NOT NULL,
	delegacion_hacienda varchar(2) NOT NULL,
	id_tipo_presentacion int NOT NULL,
	id_administracion int NOT NULL,
	id_tipo_declaracion int NOT NULL,
	CONSTRAINT uk_mi_192_dim_datos_caratula UNIQUE (modelo ,delegacion_hacienda,id_tipo_presentacion,id_administracion,id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT PK_tbn1_mi_192_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD modelo  varchar(3)   
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD delegacion_hacienda varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD id_administracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD id_tipo_declaracion int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ALTER COLUMN modelo  varchar(3)    NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ALTER COLUMN id_administracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_192_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_datos_caratula_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_datos_caratula_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_datos_caratula_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_datos_caratula_ssis',
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
			delegacion_hacienda,
			id_tipo_presentacion,
			id_administracion,
			id_tipo_declaracion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo ,
			delegacion_hacienda,
			id_tipo_presentacion,
			id_administracion,
			id_tipo_declaracion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula AS tbn1_mi_192_dim_datos_caratula
	USING query ON query.modelo =tbn1_mi_192_dim_datos_caratula.modelo  AND query.delegacion_hacienda=tbn1_mi_192_dim_datos_caratula.delegacion_hacienda AND query.id_tipo_presentacion=tbn1_mi_192_dim_datos_caratula.id_tipo_presentacion AND query.id_administracion=tbn1_mi_192_dim_datos_caratula.id_administracion AND query.id_tipo_declaracion=tbn1_mi_192_dim_datos_caratula.id_tipo_declaracion
	WHEN NOT MATCHED THEN
		INSERT (modelo ,delegacion_hacienda,id_tipo_presentacion,id_administracion,id_tipo_declaracion) VALUES (
			query.modelo ,
			query.delegacion_hacienda,
			query.id_tipo_presentacion,
			query.id_administracion,
			query.id_tipo_declaracion)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_externo bit NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante   varchar(1)   NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	es_erroneo_declarante bit NOT NULL,
	es_historico bit NOT NULL,
	es_erroneo_declarado bit NOT NULL,
	CONSTRAINT uk_mi_192_dim_marcas UNIQUE (es_externo,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo_declarante,es_historico,es_erroneo_declarado),
	CONSTRAINT PK_tbn1_mi_192_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_externo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante  ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD sw_identificado_declarante   varchar(1)  
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_erroneo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_erroneo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_historico bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD es_erroneo_declarado bit
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_externo bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN sw_identificado_declarante   varchar(1)   NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_erroneo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_erroneo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_historico bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas ADD CONSTRAINT PK_tbn1_mi_192_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_marcas_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_marcas_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_marcas_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_marcas_ssis',
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
			es_externo,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante  ,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado   ,
			es_erroneo_declarante,
			es_historico,
			es_erroneo_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_externo,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante  ,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado   ,
			es_erroneo_declarante,
			es_historico,
			es_erroneo_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas AS tbn1_mi_192_dim_marcas
	USING query ON query.es_externo=tbn1_mi_192_dim_marcas.es_externo AND query.es_contribuyente_declarante=tbn1_mi_192_dim_marcas.es_contribuyente_declarante AND query.es_identificado_declarante=tbn1_mi_192_dim_marcas.es_identificado_declarante AND query.sw_identificado_declarante  =tbn1_mi_192_dim_marcas.sw_identificado_declarante   AND query.es_contribuyente_declarado=tbn1_mi_192_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_192_dim_marcas.es_identificado_declarado AND query.sw_identificado_declarado   =tbn1_mi_192_dim_marcas.sw_identificado_declarado    AND query.es_erroneo_declarante=tbn1_mi_192_dim_marcas.es_erroneo_declarante AND query.es_historico=tbn1_mi_192_dim_marcas.es_historico AND query.es_erroneo_declarado=tbn1_mi_192_dim_marcas.es_erroneo_declarado
	WHEN NOT MATCHED THEN
		INSERT (es_externo,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo_declarante,es_historico,es_erroneo_declarado) VALUES (
			query.es_externo,
			query.es_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante  ,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.es_erroneo_declarante,
			query.es_historico,
			query.es_erroneo_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	id_clave_origen int NOT NULL,
	id_clave_operacion int NOT NULL,
	id_clave_traspaso int NOT NULL,
	id_clave_declarado int NOT NULL,
	id_provincia int NOT NULL,
	id_pais int NOT NULL,
	id_clave_residencia int NOT NULL,
	id_clave_declarante int NOT NULL,
	id_tipo_operacion_192 int NOT NULL,
	CONSTRAINT uk_mi_192_dim_datos_detalle UNIQUE (id_clave_origen,id_clave_operacion,id_clave_traspaso,id_clave_declarado,id_provincia,id_pais,id_clave_residencia,id_clave_declarante,id_tipo_operacion_192),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen(id_clave_origen),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_claves_operacion_192 FOREIGN KEY (id_clave_operacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_operacion_192(id_clave_operacion_192),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_claves_traspaso FOREIGN KEY (id_clave_traspaso) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_traspaso(id_clave_traspaso),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado(id_clave_declarado),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mae_claves_residencia FOREIGN KEY (id_clave_residencia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_residencia(id_clave_residencia),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mae_claves_declarante FOREIGN KEY (id_clave_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_declarante(id_clave_declarante),
	CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_tipos_operacion_192 FOREIGN KEY (id_tipo_operacion_192) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_operacion_192(id_tipo_operacion_192),
	CONSTRAINT PK_tbn1_mi_192_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_clave_origen int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_clave_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_traspaso')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_clave_traspaso int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_clave_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_residencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_clave_residencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_clave_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_tipo_operacion_192')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD id_tipo_operacion_192 int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_clave_origen int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_clave_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_traspaso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_clave_traspaso int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_clave_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_residencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_clave_residencia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_clave_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_clave_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND COLUMN_NAME='id_tipo_operacion_192' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ALTER COLUMN id_tipo_operacion_192 int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='PK_tbn1_mi_192_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT PK_tbn1_mi_192_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_mi_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen(id_clave_origen)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_claves_operacion_192')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_claves_operacion_192 FOREIGN KEY (id_clave_operacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_operacion_192(id_clave_operacion_192)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_claves_traspaso')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_claves_traspaso FOREIGN KEY (id_clave_traspaso) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_traspaso(id_clave_traspaso)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_mi_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado(id_clave_declarado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_provincias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_mae_claves_residencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mae_claves_residencia FOREIGN KEY (id_clave_residencia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_residencia(id_clave_residencia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_mae_claves_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mae_claves_declarante FOREIGN KEY (id_clave_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_declarante(id_clave_declarante)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_tipos_operacion_192')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_192_dim_datos_detalle_tbn1_mi_mae_tipos_operacion_192 FOREIGN KEY (id_tipo_operacion_192) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_operacion_192(id_tipo_operacion_192)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_dim_datos_detalle_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_dim_datos_detalle_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_dim_datos_detalle_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_dim_datos_detalle_ssis',
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
			id_clave_origen,
			id_clave_operacion,
			id_clave_traspaso,
			id_clave_declarado,
			id_provincia,
			id_pais,
			id_clave_residencia,
			id_clave_declarante,
			id_tipo_operacion_192
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_clave_origen,
			id_clave_operacion,
			id_clave_traspaso,
			id_clave_declarado,
			id_provincia,
			id_pais,
			id_clave_residencia,
			id_clave_declarante,
			id_tipo_operacion_192
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle AS tbn1_mi_192_dim_datos_detalle
	USING query ON query.id_clave_origen=tbn1_mi_192_dim_datos_detalle.id_clave_origen AND query.id_clave_operacion=tbn1_mi_192_dim_datos_detalle.id_clave_operacion AND query.id_clave_traspaso=tbn1_mi_192_dim_datos_detalle.id_clave_traspaso AND query.id_clave_declarado=tbn1_mi_192_dim_datos_detalle.id_clave_declarado AND query.id_provincia=tbn1_mi_192_dim_datos_detalle.id_provincia AND query.id_pais=tbn1_mi_192_dim_datos_detalle.id_pais AND query.id_clave_residencia=tbn1_mi_192_dim_datos_detalle.id_clave_residencia AND query.id_clave_declarante=tbn1_mi_192_dim_datos_detalle.id_clave_declarante AND query.id_tipo_operacion_192=tbn1_mi_192_dim_datos_detalle.id_tipo_operacion_192
	WHEN NOT MATCHED THEN
		INSERT (id_clave_origen,id_clave_operacion,id_clave_traspaso,id_clave_declarado,id_provincia,id_pais,id_clave_residencia,id_clave_declarante,id_tipo_operacion_192) VALUES (
			query.id_clave_origen,
			query.id_clave_operacion,
			query.id_clave_traspaso,
			query.id_clave_declarado,
			query.id_provincia,
			query.id_pais,
			query.id_clave_residencia,
			query.id_clave_declarante,
			query.id_tipo_operacion_192)
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


/*******************/
/*FIN - DIMENSIONES*/
/*******************/



/******/
/*FACT*/
/******/



IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_datos_detalle int NOT NULL,
	volumen_operaciones decimal(18,2),
	porc_participacion decimal(7, 2),
	num_participes decimal(3, 0),
	importe_transmision decimal(18, 2),
	importe_adquisicion decimal(18, 2),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle(id_dim_datos_detalle),
	CONSTRAINT PK_tbn1_mi_192_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD volumen_operaciones decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='porc_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD porc_participacion decimal(7, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='num_participes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD num_participes decimal(3, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='importe_transmision')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD importe_transmision decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='importe_adquisicion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD importe_adquisicion decimal(18, 2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN volumen_operaciones decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='porc_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN porc_participacion decimal(7, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='num_participes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN num_participes decimal(3, 0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='importe_transmision' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN importe_transmision decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND COLUMN_NAME='importe_adquisicion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ALTER COLUMN importe_adquisicion decimal(18, 2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_192_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT PK_tbn1_mi_192_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_192_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_192_fact_tbn1_mi_192_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact ADD CONSTRAINT FK_tbn1_mi_192_fact_tbn1_mi_192_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle(id_dim_datos_detalle)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_192_fact_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_192_fact_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_192_fact_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_mi_192_fact_ssis',
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
			sum(ds_t.volumen_operaciones) AS volumen_operaciones,
			sum(ds_t.porc_participacion) AS porc_participacion,
			sum(ds_t.num_participes) AS num_participes,
			sum(ds_t.importe_transmision) AS importe_transmision,
			sum(ds_t.importe_adquisicion) AS importe_adquisicion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarantes AS declarantes ON (declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante AND declarantes.nif_declarante_192=ds_t.nif_declarante_192 AND declarantes.nif_declarante_no_identificado  =ds_t.nif_declarante_no_identificado   AND declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes.telefono=ds_t.telefono AND declarantes.razon_social=ds_t.razon_social AND declarantes.cod_presentador_colectivo=ds_t.cod_presentador_colectivo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_declarados AS declarados ON (declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado AND declarados.es_representante=ds_t.es_representante AND declarados.cod_valor=ds_t.cod_valor AND declarados.secuencia =ds_t.secuencia  AND declarados.nif_declarado_192=ds_t.nif_declarado_192 AND declarados.nif_declarado_no_identificado  =ds_t.nif_declarado_no_identificado   AND declarados.id_contribuyente_declarado  =ds_t.id_contribuyente_declarado   AND declarados.nro_orden=ds_t.nro_orden)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion=ds_t.anyo_presentacion AND periodos.fecha_carga=ds_t.fecha_carga AND periodos.fecha_transmision=ds_t.fecha_transmision AND periodos.mes_transmision=ds_t.mes_transmision AND periodos.anyo_transmision=ds_t.anyo_transmision AND periodos.fecha_adquisicion=ds_t.fecha_adquisicion AND periodos.mes_adquisicion=ds_t.mes_adquisicion AND periodos.anyo_adquisicion=ds_t.anyo_adquisicion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo =ds_t.modelo  AND datos_caratula.delegacion_hacienda=ds_t.delegacion_hacienda AND datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion AND datos_caratula.id_administracion=ds_t.id_administracion AND datos_caratula.id_tipo_declaracion=ds_t.id_tipo_declaracion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_marcas AS marcas ON (marcas.es_externo=ds_t.es_externo AND marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_identificado_declarante=ds_t.es_identificado_declarante AND marcas.sw_identificado_declarante  =ds_t.sw_identificado_declarante   AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado AND marcas.sw_identificado_declarado   =ds_t.sw_identificado_declarado    AND marcas.es_erroneo_declarante=ds_t.es_erroneo_declarante AND marcas.es_historico=ds_t.es_historico AND marcas.es_erroneo_declarado=ds_t.es_erroneo_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_192_dim_datos_detalle AS datos_detalle ON (datos_detalle.id_clave_origen=ds_t.id_clave_origen AND datos_detalle.id_clave_operacion=ds_t.id_clave_operacion AND datos_detalle.id_clave_traspaso=ds_t.id_clave_traspaso AND datos_detalle.id_clave_declarado=ds_t.id_clave_declarado AND datos_detalle.id_provincia=ds_t.id_provincia AND datos_detalle.id_pais=ds_t.id_pais AND datos_detalle.id_clave_residencia=ds_t.id_clave_residencia AND datos_detalle.id_clave_declarante=ds_t.id_clave_declarante AND datos_detalle.id_tipo_operacion_192=ds_t.id_tipo_operacion_192)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			declarantes.id_dim_declarantes,
			declarados.id_dim_declarados,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			marcas.id_dim_marcas,
			datos_detalle.id_dim_datos_detalle
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_192_fact AS tbn1_mi_192_fact
	USING query ON query.id_dim_documentos=tbn1_mi_192_fact.id_dim_documentos AND query.id_dim_declarantes=tbn1_mi_192_fact.id_dim_declarantes AND query.id_dim_declarados=tbn1_mi_192_fact.id_dim_declarados AND query.id_dim_periodos=tbn1_mi_192_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_192_fact.id_dim_datos_caratula AND query.id_dim_marcas=tbn1_mi_192_fact.id_dim_marcas AND query.id_dim_datos_detalle=tbn1_mi_192_fact.id_dim_datos_detalle
	WHEN MATCHED AND ((tbn1_mi_192_fact.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_192_fact.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_192_fact.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_192_fact.porc_participacion<>query.porc_participacion OR (tbn1_mi_192_fact.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL) OR (tbn1_mi_192_fact.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
			OR tbn1_mi_192_fact.num_participes<>query.num_participes OR (tbn1_mi_192_fact.num_participes IS NULL AND query.num_participes IS NOT NULL) OR (tbn1_mi_192_fact.num_participes IS NOT NULL AND query.num_participes IS NULL)
			OR tbn1_mi_192_fact.importe_transmision<>query.importe_transmision OR (tbn1_mi_192_fact.importe_transmision IS NULL AND query.importe_transmision IS NOT NULL) OR (tbn1_mi_192_fact.importe_transmision IS NOT NULL AND query.importe_transmision IS NULL)
			OR tbn1_mi_192_fact.importe_adquisicion<>query.importe_adquisicion OR (tbn1_mi_192_fact.importe_adquisicion IS NULL AND query.importe_adquisicion IS NOT NULL) OR (tbn1_mi_192_fact.importe_adquisicion IS NOT NULL AND query.importe_adquisicion IS NULL))) THEN
		UPDATE SET
			volumen_operaciones=query.volumen_operaciones,
			porc_participacion=query.porc_participacion,
			num_participes=query.num_participes,
			importe_transmision=query.importe_transmision,
			importe_adquisicion=query.importe_adquisicion
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,volumen_operaciones,porc_participacion,num_participes,importe_transmision,importe_adquisicion) VALUES (
			query.id_dim_documentos,
			query.id_dim_declarantes,
			query.id_dim_declarados,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_marcas,
			query.id_dim_datos_detalle,
			query.volumen_operaciones,
			query.porc_participacion,
			query.num_participes,
			query.importe_transmision,
			query.importe_adquisicion
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


/************/
/*FIN - FACT*/
/************/


/*****************/
/*SP CON LOS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_192_operaciones_letras_tesoro_ssis' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_192_operaciones_letras_tesoro_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_192_operaciones_letras_tesoro_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_mi_192_operaciones_letras_tesoro_ssis',
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
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_documentos_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_periodos_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_datos_caratula_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_marcas_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_declarantes_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_declarados_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_dim_datos_detalle_ssis @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_192_fact_ssis @log;
		
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