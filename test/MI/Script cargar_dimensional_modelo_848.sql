PRINT 'dimensional_mi_848_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_848_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_848_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_848_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_848_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_848_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ADD CONSTRAINT PK_tbn1_mi_848_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_848_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ADD CONSTRAINT FK_tbn1_mi_848_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_848_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos ADD CONSTRAINT FK_tbn1_mi_848_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_documentos'
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
			id_documento,
			id_expediente
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos AS tbn1_mi_848_dim_documentos
	USING query ON query.id_documento=tbn1_mi_848_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_848_dim_documentos.id_expediente
	WHEN NOT MATCHED THEN
		INSERT (id_documento,id_expediente) VALUES (
			query.id_documento,
			query.id_expediente)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_alta date NOT NULL,
	anyo_alta int NOT NULL,
	fecha_modificacion date NOT NULL,
	anyo_modificacion int NOT NULL,
	fecha_baja date NOT NULL,
	anyo_baja int NOT NULL,
	fecha_envio_IAE date NOT NULL,
	anyo_envio_IAE int NOT NULL,
	fecha_alta_rel_no_identif date NOT NULL,
	anyo_alta_rel_no_identif int NOT NULL,
	fecha_modificacion_rel_no_identif date NOT NULL,
	anyo_modificacion_rel_no_identif int NOT NULL,
	CONSTRAINT uk_mi_848_dim_periodos UNIQUE (ejercicio,fecha_alta,anyo_alta,fecha_modificacion,anyo_modificacion,fecha_baja,anyo_baja,fecha_envio_IAE,anyo_envio_IAE,fecha_alta_rel_no_identif,anyo_alta_rel_no_identif,fecha_modificacion_rel_no_identif,anyo_modificacion_rel_no_identif),
	CONSTRAINT PK_tbn1_mi_848_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_modificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD fecha_modificacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_modificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD anyo_modificacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_baja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD fecha_baja date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_baja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD anyo_baja int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_envio_IAE')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD fecha_envio_IAE date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_envio_IAE')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD anyo_envio_IAE int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_alta_rel_no_identif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD fecha_alta_rel_no_identif date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_alta_rel_no_identif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD anyo_alta_rel_no_identif int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_modificacion_rel_no_identif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD fecha_modificacion_rel_no_identif date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_modificacion_rel_no_identif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD anyo_modificacion_rel_no_identif int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_modificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN fecha_modificacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_modificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN anyo_modificacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_baja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN fecha_baja date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_baja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN anyo_baja int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_envio_IAE' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN fecha_envio_IAE date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_envio_IAE' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN anyo_envio_IAE int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_alta_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN fecha_alta_rel_no_identif date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_alta_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN anyo_alta_rel_no_identif int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='fecha_modificacion_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN fecha_modificacion_rel_no_identif date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND COLUMN_NAME='anyo_modificacion_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ALTER COLUMN anyo_modificacion_rel_no_identif int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_848_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos ADD CONSTRAINT PK_tbn1_mi_848_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_periodos'
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
			ejercicio,
			fecha_alta,
			anyo_alta,
			fecha_modificacion,
			anyo_modificacion,
			fecha_baja,
			anyo_baja,
			fecha_envio_IAE,
			anyo_envio_IAE,
			fecha_alta_rel_no_identif,
			anyo_alta_rel_no_identif,
			fecha_modificacion_rel_no_identif,
			anyo_modificacion_rel_no_identif
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_alta,
			anyo_alta,
			fecha_modificacion,
			anyo_modificacion,
			fecha_baja,
			anyo_baja,
			fecha_envio_IAE,
			anyo_envio_IAE,
			fecha_alta_rel_no_identif,
			anyo_alta_rel_no_identif,
			fecha_modificacion_rel_no_identif,
			anyo_modificacion_rel_no_identif
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos AS tbn1_mi_848_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_848_dim_periodos.ejercicio AND query.fecha_alta=tbn1_mi_848_dim_periodos.fecha_alta AND query.anyo_alta=tbn1_mi_848_dim_periodos.anyo_alta AND query.fecha_modificacion=tbn1_mi_848_dim_periodos.fecha_modificacion AND query.anyo_modificacion=tbn1_mi_848_dim_periodos.anyo_modificacion AND query.fecha_baja=tbn1_mi_848_dim_periodos.fecha_baja AND query.anyo_baja=tbn1_mi_848_dim_periodos.anyo_baja AND query.fecha_envio_IAE=tbn1_mi_848_dim_periodos.fecha_envio_IAE AND query.anyo_envio_IAE=tbn1_mi_848_dim_periodos.anyo_envio_IAE AND query.fecha_alta_rel_no_identif=tbn1_mi_848_dim_periodos.fecha_alta_rel_no_identif AND query.anyo_alta_rel_no_identif=tbn1_mi_848_dim_periodos.anyo_alta_rel_no_identif AND query.fecha_modificacion_rel_no_identif=tbn1_mi_848_dim_periodos.fecha_modificacion_rel_no_identif AND query.anyo_modificacion_rel_no_identif=tbn1_mi_848_dim_periodos.anyo_modificacion_rel_no_identif
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_alta,anyo_alta,fecha_modificacion,anyo_modificacion,fecha_baja,anyo_baja,fecha_envio_IAE,anyo_envio_IAE,fecha_alta_rel_no_identif,anyo_alta_rel_no_identif,fecha_modificacion_rel_no_identif,anyo_modificacion_rel_no_identif) VALUES (
			query.ejercicio,
			query.fecha_alta,
			query.anyo_alta,
			query.fecha_modificacion,
			query.anyo_modificacion,
			query.fecha_baja,
			query.anyo_baja,
			query.fecha_envio_IAE,
			query.anyo_envio_IAE,
			query.fecha_alta_rel_no_identif,
			query.anyo_alta_rel_no_identif,
			query.fecha_modificacion_rel_no_identif,
			query.anyo_modificacion_rel_no_identif)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo  varchar(3) NOT NULL,
	casilla_presentacion varchar(2) NOT NULL,
	referencia_bizkaibai varchar(13) NOT NULL,
	CONSTRAINT uk_mi_848_dim_datos_caratula UNIQUE (modelo ,casilla_presentacion,referencia_bizkaibai),
	CONSTRAINT PK_tbn1_mi_848_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='casilla_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ADD casilla_presentacion varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='referencia_bizkaibai')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ADD referencia_bizkaibai varchar(13)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='casilla_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ALTER COLUMN casilla_presentacion varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND COLUMN_NAME='referencia_bizkaibai' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ALTER COLUMN referencia_bizkaibai varchar(13) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_848_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_848_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_datos_caratula'
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
			modelo ,
			casilla_presentacion,
			referencia_bizkaibai
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo ,
			casilla_presentacion,
			referencia_bizkaibai
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula AS tbn1_mi_848_dim_datos_caratula
	USING query ON query.modelo =tbn1_mi_848_dim_datos_caratula.modelo  AND query.casilla_presentacion=tbn1_mi_848_dim_datos_caratula.casilla_presentacion AND query.referencia_bizkaibai=tbn1_mi_848_dim_datos_caratula.referencia_bizkaibai
	WHEN NOT MATCHED THEN
		INSERT (modelo ,casilla_presentacion,referencia_bizkaibai) VALUES (
			query.modelo ,
			query.casilla_presentacion,
			query.referencia_bizkaibai)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	nif_presentador_848 varchar(12) NOT NULL,
	id_contribuyente_presentador int NOT NULL,
	CONSTRAINT uk_mi_848_dim_declarantes UNIQUE (nif_presentador_848,id_contribuyente_presentador),
	CONSTRAINT FK_tbn1_mi_848_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_presentador) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_848_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND COLUMN_NAME='nif_presentador_848')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ADD nif_presentador_848 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND COLUMN_NAME='id_contribuyente_presentador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ADD id_contribuyente_presentador int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND COLUMN_NAME='nif_presentador_848' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ALTER COLUMN nif_presentador_848 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND COLUMN_NAME='id_contribuyente_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ALTER COLUMN id_contribuyente_presentador int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_848_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_848_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_848_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_848_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_presentador) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_declarantes'
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
			nif_presentador_848,
			id_contribuyente_presentador
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_presentador_848,
			id_contribuyente_presentador
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes AS tbn1_mi_848_dim_declarantes
	USING query ON query.nif_presentador_848=tbn1_mi_848_dim_declarantes.nif_presentador_848 AND query.id_contribuyente_presentador=tbn1_mi_848_dim_declarantes.id_contribuyente_presentador
	WHEN NOT MATCHED THEN
		INSERT (nif_presentador_848,id_contribuyente_presentador) VALUES (
			query.nif_presentador_848,
			query.id_contribuyente_presentador)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_contribuyente_presentador bit NOT NULL,
	es_contribuyente_relacionado bit NOT NULL,
	es_identificado_relacionado bit NOT NULL,
	sw_identificado_relacionado varchar(1) NOT NULL,
	CONSTRAINT uk_mi_848_dim_marcas UNIQUE (es_contribuyente_presentador,es_contribuyente_relacionado,es_identificado_relacionado,sw_identificado_relacionado),
	CONSTRAINT PK_tbn1_mi_848_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='es_contribuyente_presentador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ADD es_contribuyente_presentador bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='es_contribuyente_relacionado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ADD es_contribuyente_relacionado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='es_identificado_relacionado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ADD es_identificado_relacionado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='sw_identificado_relacionado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ADD sw_identificado_relacionado varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='es_contribuyente_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ALTER COLUMN es_contribuyente_presentador bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='es_contribuyente_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ALTER COLUMN es_contribuyente_relacionado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='es_identificado_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ALTER COLUMN es_identificado_relacionado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND COLUMN_NAME='sw_identificado_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ALTER COLUMN sw_identificado_relacionado varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_848_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas ADD CONSTRAINT PK_tbn1_mi_848_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_marcas'
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
			es_contribuyente_presentador,
			es_contribuyente_relacionado,
			es_identificado_relacionado,
			sw_identificado_relacionado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_contribuyente_presentador,
			es_contribuyente_relacionado,
			es_identificado_relacionado,
			sw_identificado_relacionado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas AS tbn1_mi_848_dim_marcas
	USING query ON query.es_contribuyente_presentador=tbn1_mi_848_dim_marcas.es_contribuyente_presentador AND query.es_contribuyente_relacionado=tbn1_mi_848_dim_marcas.es_contribuyente_relacionado AND query.es_identificado_relacionado=tbn1_mi_848_dim_marcas.es_identificado_relacionado AND query.sw_identificado_relacionado=tbn1_mi_848_dim_marcas.sw_identificado_relacionado
	WHEN NOT MATCHED THEN
		INSERT (es_contribuyente_presentador,es_contribuyente_relacionado,es_identificado_relacionado,sw_identificado_relacionado) VALUES (
			query.es_contribuyente_presentador,
			query.es_contribuyente_relacionado,
			query.es_identificado_relacionado,
			query.sw_identificado_relacionado)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	nif_relacionado_848 varchar(12) NOT NULL,
	nif_relacionado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_relacionado int NOT NULL,
	apellidos_nombre_relacionado_no_identif varchar(40) NOT NULL,
	CONSTRAINT uk_mi_848_dim_declarados UNIQUE (nif_relacionado_848,nif_relacionado_no_identificado,id_contribuyente_relacionado,apellidos_nombre_relacionado_no_identif),
	CONSTRAINT FK_tbn1_mi_848_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_relacionado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_848_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='nif_relacionado_848')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD nif_relacionado_848 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='nif_relacionado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD nif_relacionado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='id_contribuyente_relacionado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD id_contribuyente_relacionado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='apellidos_nombre_relacionado_no_identif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD apellidos_nombre_relacionado_no_identif varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='nif_relacionado_848' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ALTER COLUMN nif_relacionado_848 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='nif_relacionado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ALTER COLUMN nif_relacionado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='id_contribuyente_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ALTER COLUMN id_contribuyente_relacionado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND COLUMN_NAME='apellidos_nombre_relacionado_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ALTER COLUMN apellidos_nombre_relacionado_no_identif varchar(40) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_848_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD CONSTRAINT PK_tbn1_mi_848_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_848_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados ADD CONSTRAINT FK_tbn1_mi_848_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_relacionado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_declarados'
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
			nif_relacionado_848,
			nif_relacionado_no_identificado,
			id_contribuyente_relacionado,
			apellidos_nombre_relacionado_no_identif
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_relacionado_848,
			nif_relacionado_no_identificado,
			id_contribuyente_relacionado,
			apellidos_nombre_relacionado_no_identif
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados AS tbn1_mi_848_dim_declarados
	USING query ON query.nif_relacionado_848=tbn1_mi_848_dim_declarados.nif_relacionado_848 AND query.nif_relacionado_no_identificado=tbn1_mi_848_dim_declarados.nif_relacionado_no_identificado AND query.id_contribuyente_relacionado=tbn1_mi_848_dim_declarados.id_contribuyente_relacionado AND query.apellidos_nombre_relacionado_no_identif=tbn1_mi_848_dim_declarados.apellidos_nombre_relacionado_no_identif
	WHEN NOT MATCHED THEN
		INSERT (nif_relacionado_848,nif_relacionado_no_identificado,id_contribuyente_relacionado,apellidos_nombre_relacionado_no_identif) VALUES (
			query.nif_relacionado_848,
			query.nif_relacionado_no_identificado,
			query.id_contribuyente_relacionado,
			query.apellidos_nombre_relacionado_no_identif)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

PRINT 'dimensional_mi_848_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_declarados int NOT NULL,
	volumen_operaciones decimal(18,  0),
	CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados(id_dim_declarados),
	CONSTRAINT PK_tbn1_mi_848_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD volumen_operaciones decimal(18,  0)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ALTER COLUMN volumen_operaciones decimal(18,  0) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_848_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT PK_tbn1_mi_848_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_848_fact_tbn1_mi_848_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_848_fact_tbn1_mi_848_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_848_fact_tbn1_mi_848_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_848_fact_tbn1_mi_848_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_848_fact_tbn1_mi_848_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_848_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_848_fact_tbn1_mi_848_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact ADD CONSTRAINT FK_tbn1_mi_848_fact_tbn1_mi_848_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados(id_dim_declarados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_848_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_848_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_848_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_fact'
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
			documentos.id_dim_documentos AS id_dim_documentos,
			periodos.id_dim_periodos AS id_dim_periodos,
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			declarantes.id_dim_declarantes AS id_dim_declarantes,
			marcas.id_dim_marcas AS id_dim_marcas,
			declarados.id_dim_declarados AS id_dim_declarados,
			sum(ds_t.volumen_operaciones) AS volumen_operaciones
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_alta=ds_t.fecha_alta AND periodos.anyo_alta=ds_t.anyo_alta AND periodos.fecha_modificacion=ds_t.fecha_modificacion AND periodos.anyo_modificacion=ds_t.anyo_modificacion AND periodos.fecha_baja=ds_t.fecha_baja AND periodos.anyo_baja=ds_t.anyo_baja AND periodos.fecha_envio_IAE=ds_t.fecha_envio_IAE AND periodos.anyo_envio_IAE=ds_t.anyo_envio_IAE AND periodos.fecha_alta_rel_no_identif=ds_t.fecha_alta_rel_no_identif AND periodos.anyo_alta_rel_no_identif=ds_t.anyo_alta_rel_no_identif AND periodos.fecha_modificacion_rel_no_identif=ds_t.fecha_modificacion_rel_no_identif AND periodos.anyo_modificacion_rel_no_identif=ds_t.anyo_modificacion_rel_no_identif)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo =ds_t.modelo  AND datos_caratula.casilla_presentacion=ds_t.casilla_presentacion AND datos_caratula.referencia_bizkaibai=ds_t.referencia_bizkaibai)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarantes AS declarantes ON (declarantes.nif_presentador_848=ds_t.nif_presentador_848 AND declarantes.id_contribuyente_presentador=ds_t.id_contribuyente_presentador)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_marcas AS marcas ON (marcas.es_contribuyente_presentador=ds_t.es_contribuyente_presentador AND marcas.es_contribuyente_relacionado=ds_t.es_contribuyente_relacionado AND marcas.es_identificado_relacionado=ds_t.es_identificado_relacionado AND marcas.sw_identificado_relacionado=ds_t.sw_identificado_relacionado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_848_dim_declarados AS declarados ON (declarados.nif_relacionado_848=ds_t.nif_relacionado_848 AND declarados.nif_relacionado_no_identificado=ds_t.nif_relacionado_no_identificado AND declarados.id_contribuyente_relacionado=ds_t.id_contribuyente_relacionado AND declarados.apellidos_nombre_relacionado_no_identif=ds_t.apellidos_nombre_relacionado_no_identif)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			declarantes.id_dim_declarantes,
			marcas.id_dim_marcas,
			declarados.id_dim_declarados
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_848_fact AS tbn1_mi_848_fact
	USING query ON query.id_dim_documentos=tbn1_mi_848_fact.id_dim_documentos AND query.id_dim_periodos=tbn1_mi_848_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_848_fact.id_dim_datos_caratula AND query.id_dim_declarantes=tbn1_mi_848_fact.id_dim_declarantes AND query.id_dim_marcas=tbn1_mi_848_fact.id_dim_marcas AND query.id_dim_declarados=tbn1_mi_848_fact.id_dim_declarados
	WHEN MATCHED AND ((tbn1_mi_848_fact.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_848_fact.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_848_fact.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL))) THEN
		UPDATE SET
			volumen_operaciones=query.volumen_operaciones
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_periodos,id_dim_datos_caratula,id_dim_declarantes,id_dim_marcas,id_dim_declarados,volumen_operaciones) VALUES (
			query.id_dim_documentos,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_declarantes,
			query.id_dim_marcas,
			query.id_dim_declarados,
			query.volumen_operaciones
			)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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
/*SP CON LOS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_848_volumen_operaciones_IAE' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_848_volumen_operaciones_IAE;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_848_volumen_operaciones_IAE(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_848_volumen_operaciones_IAE'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL 
	AND EXISTS
	(
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

		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_documentos	 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_periodos  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_datos_caratula  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_marcas  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_declarantes  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_dim_declarados  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_848_fact  @log
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





/***********************/
/*FIN - SP CON LOS EXEC*/
/***********************/


