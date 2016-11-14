PRINT 'dimensional_mi_270_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_270_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_270_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_270_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_270_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ADD CONSTRAINT PK_tbn1_mi_270_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ADD CONSTRAINT FK_tbn1_mi_270_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos ADD CONSTRAINT FK_tbn1_mi_270_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_documentos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos AS tbn1_mi_270_dim_documentos
	USING query ON query.id_documento=tbn1_mi_270_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_270_dim_documentos.id_expediente
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	fecha_sorteo date NOT NULL,
	mes_sorteo int NOT NULL,
	anyo_sorteo int NOT NULL,
	fecha_pago date NOT NULL,
	mes_pago int NOT NULL,
	anyo_pago int NOT NULL,
	fecha_nacimiento date NOT NULL,
	mes_nacimiento int NOT NULL,
	anyo_nacimiento int NOT NULL,
	CONSTRAINT uk_mi_270_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_sorteo,mes_sorteo,anyo_sorteo,fecha_pago,mes_pago,anyo_pago,fecha_nacimiento,mes_nacimiento,anyo_nacimiento),
	CONSTRAINT PK_tbn1_mi_270_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_sorteo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD fecha_sorteo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_sorteo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD mes_sorteo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_sorteo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD anyo_sorteo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD fecha_pago date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD mes_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD anyo_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD fecha_nacimiento date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD mes_nacimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD anyo_nacimiento int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_sorteo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN fecha_sorteo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_sorteo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN mes_sorteo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_sorteo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN anyo_sorteo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN fecha_pago date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN mes_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN anyo_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='fecha_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN fecha_nacimiento date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='mes_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN mes_nacimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND COLUMN_NAME='anyo_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ALTER COLUMN anyo_nacimiento int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos ADD CONSTRAINT PK_tbn1_mi_270_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_periodos'
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
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_sorteo,
			mes_sorteo,
			anyo_sorteo,
			fecha_pago,
			mes_pago,
			anyo_pago,
			fecha_nacimiento,
			mes_nacimiento,
			anyo_nacimiento
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_sorteo,
			mes_sorteo,
			anyo_sorteo,
			fecha_pago,
			mes_pago,
			anyo_pago,
			fecha_nacimiento,
			mes_nacimiento,
			anyo_nacimiento
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos AS tbn1_mi_270_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_270_dim_periodos.ejercicio AND query.fecha_presentacion=tbn1_mi_270_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_270_dim_periodos.mes_presentacion AND query.anyo_presentacion=tbn1_mi_270_dim_periodos.anyo_presentacion AND query.fecha_sorteo=tbn1_mi_270_dim_periodos.fecha_sorteo AND query.mes_sorteo=tbn1_mi_270_dim_periodos.mes_sorteo AND query.anyo_sorteo=tbn1_mi_270_dim_periodos.anyo_sorteo AND query.fecha_pago=tbn1_mi_270_dim_periodos.fecha_pago AND query.mes_pago=tbn1_mi_270_dim_periodos.mes_pago AND query.anyo_pago=tbn1_mi_270_dim_periodos.anyo_pago AND query.fecha_nacimiento=tbn1_mi_270_dim_periodos.fecha_nacimiento AND query.mes_nacimiento=tbn1_mi_270_dim_periodos.mes_nacimiento AND query.anyo_nacimiento=tbn1_mi_270_dim_periodos.anyo_nacimiento
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_sorteo,mes_sorteo,anyo_sorteo,fecha_pago,mes_pago,anyo_pago,fecha_nacimiento,mes_nacimiento,anyo_nacimiento) VALUES (
			query.ejercicio,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.fecha_sorteo,
			query.mes_sorteo,
			query.anyo_sorteo,
			query.fecha_pago,
			query.mes_pago,
			query.anyo_pago,
			query.fecha_nacimiento,
			query.mes_nacimiento,
			query.anyo_nacimiento)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo varchar(3) NOT NULL,
	delegacion_hacienda varchar(2) NOT NULL,
	id_tipo_presentacion int NOT NULL,
	id_tipo_declaracion int NOT NULL,
	id_administracion int NOT NULL,
	CONSTRAINT uk_mi_270_dim_datos_caratula UNIQUE (modelo,delegacion_hacienda,id_tipo_presentacion,id_tipo_declaracion,id_administracion),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT PK_tbn1_mi_270_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD delegacion_hacienda varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD id_administracion int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ALTER COLUMN modelo varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ALTER COLUMN id_administracion int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_270_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_datos_caratula'
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
			modelo,
			delegacion_hacienda,
			id_tipo_presentacion,
			id_tipo_declaracion,
			id_administracion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo,
			delegacion_hacienda,
			id_tipo_presentacion,
			id_tipo_declaracion,
			id_administracion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula AS tbn1_mi_270_dim_datos_caratula
	USING query ON query.modelo=tbn1_mi_270_dim_datos_caratula.modelo AND query.delegacion_hacienda=tbn1_mi_270_dim_datos_caratula.delegacion_hacienda AND query.id_tipo_presentacion=tbn1_mi_270_dim_datos_caratula.id_tipo_presentacion AND query.id_tipo_declaracion=tbn1_mi_270_dim_datos_caratula.id_tipo_declaracion AND query.id_administracion=tbn1_mi_270_dim_datos_caratula.id_administracion
	WHEN NOT MATCHED THEN
		INSERT (modelo,delegacion_hacienda,id_tipo_presentacion,id_tipo_declaracion,id_administracion) VALUES (
			query.modelo,
			query.delegacion_hacienda,
			query.id_tipo_presentacion,
			query.id_tipo_declaracion,
			query.id_administracion)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	nif_declarante_270 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	CONSTRAINT uk_mi_270_dim_declarantes UNIQUE (nif_declarante_270,nif_declarante_no_identificado,id_contribuyente_declarante,id_mae_no_id_declarante,telefono,razon_social,cod_presentador_colectivo),
	CONSTRAINT FK_tbn1_mi_270_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_270_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT PK_tbn1_mi_270_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='nif_declarante_270')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD nif_declarante_270 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD cod_presentador_colectivo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='nif_declarante_270' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN nif_declarante_270 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_270_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_270_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_270_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_declarantes'
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
			nif_declarante_270,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			id_mae_no_id_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_declarante_270,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			id_mae_no_id_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes AS tbn1_mi_270_dim_declarantes
	USING query ON query.nif_declarante_270=tbn1_mi_270_dim_declarantes.nif_declarante_270 AND query.nif_declarante_no_identificado=tbn1_mi_270_dim_declarantes.nif_declarante_no_identificado AND query.id_contribuyente_declarante=tbn1_mi_270_dim_declarantes.id_contribuyente_declarante AND query.id_mae_no_id_declarante=tbn1_mi_270_dim_declarantes.id_mae_no_id_declarante AND query.telefono=tbn1_mi_270_dim_declarantes.telefono AND query.razon_social=tbn1_mi_270_dim_declarantes.razon_social AND query.cod_presentador_colectivo=tbn1_mi_270_dim_declarantes.cod_presentador_colectivo
	WHEN NOT MATCHED THEN
		INSERT (nif_declarante_270,nif_declarante_no_identificado,id_contribuyente_declarante,id_mae_no_id_declarante,telefono,razon_social,cod_presentador_colectivo) VALUES (
			query.nif_declarante_270,
			query.nif_declarante_no_identificado,
			query.id_contribuyente_declarante,
			query.id_mae_no_id_declarante,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_contribuyente_declarante bit NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	es_erroneo_declarante bit NOT NULL,
	hay_observaciones bit NOT NULL,
	es_historico bit NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	es_erroneo_declarado bit NOT NULL,
	CONSTRAINT uk_mi_270_dim_marcas UNIQUE (es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_erroneo_declarante,hay_observaciones,es_historico,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado),
	CONSTRAINT PK_tbn1_mi_270_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_erroneo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_erroneo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD hay_observaciones bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_historico bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD es_erroneo_declarado bit
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_erroneo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_erroneo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN hay_observaciones bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_historico bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas ADD CONSTRAINT PK_tbn1_mi_270_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_marcas'
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
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_erroneo_declarante,
			hay_observaciones,
			es_historico,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_erroneo_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_erroneo_declarante,
			hay_observaciones,
			es_historico,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_erroneo_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas AS tbn1_mi_270_dim_marcas
	USING query ON query.es_contribuyente_declarante=tbn1_mi_270_dim_marcas.es_contribuyente_declarante AND query.es_identificado_declarante=tbn1_mi_270_dim_marcas.es_identificado_declarante AND query.sw_identificado_declarante=tbn1_mi_270_dim_marcas.sw_identificado_declarante AND query.es_erroneo_declarante=tbn1_mi_270_dim_marcas.es_erroneo_declarante AND query.hay_observaciones=tbn1_mi_270_dim_marcas.hay_observaciones AND query.es_historico=tbn1_mi_270_dim_marcas.es_historico AND query.es_contribuyente_declarado=tbn1_mi_270_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_270_dim_marcas.es_identificado_declarado AND query.sw_identificado_declarado=tbn1_mi_270_dim_marcas.sw_identificado_declarado AND query.es_erroneo_declarado=tbn1_mi_270_dim_marcas.es_erroneo_declarado
	WHEN NOT MATCHED THEN
		INSERT (es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_erroneo_declarante,hay_observaciones,es_historico,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado) VALUES (
			query.es_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.es_erroneo_declarante,
			query.hay_observaciones,
			query.es_historico,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.es_erroneo_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	secuencia varchar(11) NOT NULL,
	nif_declarado_270 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	gestor_cobro varchar(1) NOT NULL,
	nif_pais_residencia_fiscal varchar(20) NOT NULL,
	CONSTRAINT uk_mi_270_dim_declarados UNIQUE (secuencia,nif_declarado_270,nif_declarado_no_identificado,id_contribuyente_declarado,id_mae_no_id_declarado,gestor_cobro,nif_pais_residencia_fiscal),
	CONSTRAINT FK_tbn1_mi_270_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_270_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT PK_tbn1_mi_270_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='nif_declarado_270')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD nif_declarado_270 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='gestor_cobro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD gestor_cobro varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='nif_pais_residencia_fiscal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD nif_pais_residencia_fiscal varchar(20)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN secuencia varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='nif_declarado_270' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN nif_declarado_270 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='gestor_cobro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN gestor_cobro varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND COLUMN_NAME='nif_pais_residencia_fiscal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ALTER COLUMN nif_pais_residencia_fiscal varchar(20) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD CONSTRAINT PK_tbn1_mi_270_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD CONSTRAINT FK_tbn1_mi_270_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados ADD CONSTRAINT FK_tbn1_mi_270_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_declarados'
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
			secuencia,
			nif_declarado_270,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			id_mae_no_id_declarado,
			gestor_cobro,
			nif_pais_residencia_fiscal
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			secuencia,
			nif_declarado_270,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			id_mae_no_id_declarado,
			gestor_cobro,
			nif_pais_residencia_fiscal
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados AS tbn1_mi_270_dim_declarados
	USING query ON query.secuencia=tbn1_mi_270_dim_declarados.secuencia AND query.nif_declarado_270=tbn1_mi_270_dim_declarados.nif_declarado_270 AND query.nif_declarado_no_identificado=tbn1_mi_270_dim_declarados.nif_declarado_no_identificado AND query.id_contribuyente_declarado=tbn1_mi_270_dim_declarados.id_contribuyente_declarado AND query.id_mae_no_id_declarado=tbn1_mi_270_dim_declarados.id_mae_no_id_declarado AND query.gestor_cobro=tbn1_mi_270_dim_declarados.gestor_cobro AND query.nif_pais_residencia_fiscal=tbn1_mi_270_dim_declarados.nif_pais_residencia_fiscal
	WHEN NOT MATCHED THEN
		INSERT (secuencia,nif_declarado_270,nif_declarado_no_identificado,id_contribuyente_declarado,id_mae_no_id_declarado,gestor_cobro,nif_pais_residencia_fiscal) VALUES (
			query.secuencia,
			query.nif_declarado_270,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado,
			query.id_mae_no_id_declarado,
			query.gestor_cobro,
			query.nif_pais_residencia_fiscal)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	nif_representante_legal varchar(9) NOT NULL,
	nombre_representante_legal varchar(40) NOT NULL,
	id_mae_tipos_perceptor int NOT NULL,
	id_clave_personalidad int NOT NULL,
	id_provincia int NOT NULL,
	lugar_nacimiento varchar(35) NOT NULL,
	id_pais_nacimiento int NOT NULL,
	id_pais_residencia_fiscal int NOT NULL,
	id_tipo_importe int NOT NULL,
	CONSTRAINT uk_mi_270_dim_datos_detalle UNIQUE (nif_representante_legal,nombre_representante_legal,id_mae_tipos_perceptor,id_clave_personalidad,id_provincia,lugar_nacimiento,id_pais_nacimiento,id_pais_residencia_fiscal,id_tipo_importe),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_mae_tipos_perceptor FOREIGN KEY (id_mae_tipos_perceptor) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor(id_mae_tipos_perceptor),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_mae_claves_personalidad FOREIGN KEY (id_clave_personalidad) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(id_mae_claves_personalidad),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais_nacimiento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_paises1 FOREIGN KEY (id_pais_residencia_fiscal) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_270_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='nif_representante_legal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD nif_representante_legal varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='nombre_representante_legal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD nombre_representante_legal varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_mae_tipos_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_mae_tipos_perceptor int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_clave_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_clave_personalidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='lugar_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD lugar_nacimiento varchar(35)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_pais_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_pais_nacimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_pais_residencia_fiscal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_pais_residencia_fiscal int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD id_tipo_importe int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='nif_representante_legal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN nif_representante_legal varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='nombre_representante_legal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN nombre_representante_legal varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_mae_tipos_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_mae_tipos_perceptor int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_clave_personalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_clave_personalidad int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='lugar_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN lugar_nacimiento varchar(35) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_pais_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_pais_nacimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_pais_residencia_fiscal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_pais_residencia_fiscal int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='PK_tbn1_mi_270_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT PK_tbn1_mi_270_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_detalle_tbn1_mae_tipos_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_mae_tipos_perceptor FOREIGN KEY (id_mae_tipos_perceptor) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor(id_mae_tipos_perceptor)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_detalle_tbn1_mae_claves_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_mae_claves_personalidad FOREIGN KEY (id_clave_personalidad) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(id_mae_claves_personalidad)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_provincias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais_nacimiento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_paises1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_paises1 FOREIGN KEY (id_pais_residencia_fiscal) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_mi_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_270_dim_datos_detalle_tbn1_dim_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_dim_datos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_dim_datos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_dim_datos_detalle(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_datos_detalle'
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
			nif_representante_legal,
			nombre_representante_legal,
			id_mae_tipos_perceptor,
			id_clave_personalidad,
			id_provincia,
			lugar_nacimiento,
			id_pais_nacimiento,
			id_pais_residencia_fiscal,
			id_tipo_importe
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_representante_legal,
			nombre_representante_legal,
			id_mae_tipos_perceptor,
			id_clave_personalidad,
			id_provincia,
			lugar_nacimiento,
			id_pais_nacimiento,
			id_pais_residencia_fiscal,
			id_tipo_importe
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle AS tbn1_mi_270_dim_datos_detalle
	USING query ON query.nif_representante_legal=tbn1_mi_270_dim_datos_detalle.nif_representante_legal AND query.nombre_representante_legal=tbn1_mi_270_dim_datos_detalle.nombre_representante_legal AND query.id_mae_tipos_perceptor=tbn1_mi_270_dim_datos_detalle.id_mae_tipos_perceptor AND query.id_clave_personalidad=tbn1_mi_270_dim_datos_detalle.id_clave_personalidad AND query.id_provincia=tbn1_mi_270_dim_datos_detalle.id_provincia AND query.lugar_nacimiento=tbn1_mi_270_dim_datos_detalle.lugar_nacimiento AND query.id_pais_nacimiento=tbn1_mi_270_dim_datos_detalle.id_pais_nacimiento AND query.id_pais_residencia_fiscal=tbn1_mi_270_dim_datos_detalle.id_pais_residencia_fiscal AND query.id_tipo_importe=tbn1_mi_270_dim_datos_detalle.id_tipo_importe
	WHEN NOT MATCHED THEN
		INSERT (nif_representante_legal,nombre_representante_legal,id_mae_tipos_perceptor,id_clave_personalidad,id_provincia,lugar_nacimiento,id_pais_nacimiento,id_pais_residencia_fiscal,id_tipo_importe) VALUES (
			query.nif_representante_legal,
			query.nombre_representante_legal,
			query.id_mae_tipos_perceptor,
			query.id_clave_personalidad,
			query.id_provincia,
			query.lugar_nacimiento,
			query.id_pais_nacimiento,
			query.id_pais_residencia_fiscal,
			query.id_tipo_importe)
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

