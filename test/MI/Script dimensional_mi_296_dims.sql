PRINT 'dimensional_mi_296_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_296_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_296_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_296_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_296_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ADD CONSTRAINT PK_tbn1_mi_296_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ADD CONSTRAINT FK_tbn1_mi_296_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos ADD CONSTRAINT FK_tbn1_mi_296_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_documentos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos AS tbn1_mi_296_dim_documentos
	USING query ON query.id_documento=tbn1_mi_296_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_296_dim_documentos.id_expediente
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	id_tipo_presentacion int NOT NULL,
	id_tipo_soporte int NOT NULL,
	referencia_presentacion_colectiva varchar(9) NOT NULL,
	id_tipo_declaracion int NOT NULL,
	contador_revisiones decimal(2,0) NOT NULL,
	usuario_retenedor varchar(8) NOT NULL,
	id_administracion_declarante int NOT NULL,
	CONSTRAINT uk_mi_296_dim_datos_caratula UNIQUE (id_tipo_presentacion,id_tipo_soporte,referencia_presentacion_colectiva,id_tipo_declaracion,contador_revisiones,usuario_retenedor,id_administracion_declarante),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(id_tipo_soporte),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT PK_tbn1_mi_296_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='referencia_presentacion_colectiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD referencia_presentacion_colectiva varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD contador_revisiones decimal(2,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='usuario_retenedor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD usuario_retenedor varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD id_administracion_declarante int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='referencia_presentacion_colectiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN referencia_presentacion_colectiva varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN contador_revisiones decimal(2,0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='usuario_retenedor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN usuario_retenedor varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_296_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipos_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(id_tipo_soporte)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_datos_caratula'
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
			id_tipo_presentacion,
			id_tipo_soporte,
			referencia_presentacion_colectiva,
			id_tipo_declaracion,
			contador_revisiones,
			usuario_retenedor,
			id_administracion_declarante
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_tipo_presentacion,
			id_tipo_soporte,
			referencia_presentacion_colectiva,
			id_tipo_declaracion,
			contador_revisiones,
			usuario_retenedor,
			id_administracion_declarante
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula AS tbn1_mi_296_dim_datos_caratula
	USING query ON query.id_tipo_presentacion=tbn1_mi_296_dim_datos_caratula.id_tipo_presentacion AND query.id_tipo_soporte=tbn1_mi_296_dim_datos_caratula.id_tipo_soporte AND query.referencia_presentacion_colectiva=tbn1_mi_296_dim_datos_caratula.referencia_presentacion_colectiva AND query.id_tipo_declaracion=tbn1_mi_296_dim_datos_caratula.id_tipo_declaracion AND query.contador_revisiones=tbn1_mi_296_dim_datos_caratula.contador_revisiones AND query.usuario_retenedor=tbn1_mi_296_dim_datos_caratula.usuario_retenedor AND query.id_administracion_declarante=tbn1_mi_296_dim_datos_caratula.id_administracion_declarante
	WHEN NOT MATCHED THEN
		INSERT (id_tipo_presentacion,id_tipo_soporte,referencia_presentacion_colectiva,id_tipo_declaracion,contador_revisiones,usuario_retenedor,id_administracion_declarante) VALUES (
			query.id_tipo_presentacion,
			query.id_tipo_soporte,
			query.referencia_presentacion_colectiva,
			query.id_tipo_declaracion,
			query.contador_revisiones,
			query.usuario_retenedor,
			query.id_administracion_declarante)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	fecha_devengo date NOT NULL,
	mes_devengo int NOT NULL,
	anyo_devengo int NOT NULL,
	fecha_inicio_prestamo date NOT NULL,
	mes_inicio_prestamo int NOT NULL,
	anyo_inicio_prestamo int NOT NULL,
	fecha_vencimiento_prestamo date NOT NULL,
	mes_vencimiento_prestamo int NOT NULL,
	anyo_vencimiento_prestamo int NOT NULL,
	CONSTRAINT uk_mi_296_dim_periodos UNIQUE (fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_devengo,mes_devengo,anyo_devengo,fecha_inicio_prestamo,mes_inicio_prestamo,anyo_inicio_prestamo,fecha_vencimiento_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo),
	CONSTRAINT PK_tbn1_mi_296_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD fecha_devengo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD mes_devengo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD anyo_devengo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_inicio_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD fecha_inicio_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_inicio_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD mes_inicio_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_inicio_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD anyo_inicio_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_vencimiento_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD fecha_vencimiento_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_vencimiento_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD mes_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_vencimiento_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD anyo_vencimiento_prestamo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN fecha_devengo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN mes_devengo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN anyo_devengo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_inicio_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN fecha_inicio_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_inicio_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN mes_inicio_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_inicio_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN anyo_inicio_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='fecha_vencimiento_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN fecha_vencimiento_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='mes_vencimiento_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN mes_vencimiento_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND COLUMN_NAME='anyo_vencimiento_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ALTER COLUMN anyo_vencimiento_prestamo int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos ADD CONSTRAINT PK_tbn1_mi_296_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_periodos'
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
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_devengo,
			mes_devengo,
			anyo_devengo,
			fecha_inicio_prestamo,
			mes_inicio_prestamo,
			anyo_inicio_prestamo,
			fecha_vencimiento_prestamo,
			mes_vencimiento_prestamo,
			anyo_vencimiento_prestamo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_devengo,
			mes_devengo,
			anyo_devengo,
			fecha_inicio_prestamo,
			mes_inicio_prestamo,
			anyo_inicio_prestamo,
			fecha_vencimiento_prestamo,
			mes_vencimiento_prestamo,
			anyo_vencimiento_prestamo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos AS tbn1_mi_296_dim_periodos
	USING query ON query.fecha_presentacion=tbn1_mi_296_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_296_dim_periodos.mes_presentacion AND query.anyo_presentacion=tbn1_mi_296_dim_periodos.anyo_presentacion AND query.fecha_devengo=tbn1_mi_296_dim_periodos.fecha_devengo AND query.mes_devengo=tbn1_mi_296_dim_periodos.mes_devengo AND query.anyo_devengo=tbn1_mi_296_dim_periodos.anyo_devengo AND query.fecha_inicio_prestamo=tbn1_mi_296_dim_periodos.fecha_inicio_prestamo AND query.mes_inicio_prestamo=tbn1_mi_296_dim_periodos.mes_inicio_prestamo AND query.anyo_inicio_prestamo=tbn1_mi_296_dim_periodos.anyo_inicio_prestamo AND query.fecha_vencimiento_prestamo=tbn1_mi_296_dim_periodos.fecha_vencimiento_prestamo AND query.mes_vencimiento_prestamo=tbn1_mi_296_dim_periodos.mes_vencimiento_prestamo AND query.anyo_vencimiento_prestamo=tbn1_mi_296_dim_periodos.anyo_vencimiento_prestamo
	WHEN NOT MATCHED THEN
		INSERT (fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_devengo,mes_devengo,anyo_devengo,fecha_inicio_prestamo,mes_inicio_prestamo,anyo_inicio_prestamo,fecha_vencimiento_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo) VALUES (
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.fecha_devengo,
			query.mes_devengo,
			query.anyo_devengo,
			query.fecha_inicio_prestamo,
			query.mes_inicio_prestamo,
			query.anyo_inicio_prestamo,
			query.fecha_vencimiento_prestamo,
			query.mes_vencimiento_prestamo,
			query.anyo_vencimiento_prestamo)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_anulada bit NOT NULL,
	es_mediador bit NOT NULL,
	es_pendiente bit NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	es_identificado_declarado bit NOT NULL,
	CONSTRAINT uk_mi_296_dim_marcas UNIQUE (es_anulada,es_mediador,es_pendiente,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_contribuyente_declarado,es_identificado_declarado),
	CONSTRAINT PK_tbn1_mi_296_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_anulada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_anulada bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_mediador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_mediador bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_pendiente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_pendiente bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD es_identificado_declarado bit
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_anulada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_anulada bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_mediador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_mediador bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_pendiente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_pendiente bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas ADD CONSTRAINT PK_tbn1_mi_296_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_marcas'
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
			es_anulada,
			es_mediador,
			es_pendiente,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_contribuyente_declarado,
			es_identificado_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_anulada,
			es_mediador,
			es_pendiente,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_contribuyente_declarado,
			es_identificado_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas AS tbn1_mi_296_dim_marcas
	USING query ON query.es_anulada=tbn1_mi_296_dim_marcas.es_anulada AND query.es_mediador=tbn1_mi_296_dim_marcas.es_mediador AND query.es_pendiente=tbn1_mi_296_dim_marcas.es_pendiente AND query.es_contribuyente_declarante=tbn1_mi_296_dim_marcas.es_contribuyente_declarante AND query.es_identificado_declarante=tbn1_mi_296_dim_marcas.es_identificado_declarante AND query.sw_identificado_declarante=tbn1_mi_296_dim_marcas.sw_identificado_declarante AND query.es_contribuyente_declarado=tbn1_mi_296_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_296_dim_marcas.es_identificado_declarado
	WHEN NOT MATCHED THEN
		INSERT (es_anulada,es_mediador,es_pendiente,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_contribuyente_declarado,es_identificado_declarado) VALUES (
			query.es_anulada,
			query.es_mediador,
			query.es_pendiente,
			query.es_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1(
	id_dim_declarantes_1 int IDENTITY(1,1),
	telefono_contacto varchar(10) NOT NULL,
	nombre_contacto varchar(40) NOT NULL,
	nif_declarante_296 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	CONSTRAINT uk_mi_296_dim_declarantes_1 UNIQUE (telefono_contacto,nombre_contacto,nif_declarante_296,nif_declarante_no_identificado,id_contribuyente_declarante,id_mae_no_id_declarante),
	CONSTRAINT FK_tbn1_mi_296_dim_declarantes_1_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_296_dim_declarantes_1_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT PK_tbn1_mi_296_dim_declarantes_1 PRIMARY KEY CLUSTERED (id_dim_declarantes_1)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='id_dim_declarantes_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD id_dim_declarantes_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD telefono_contacto varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD nombre_contacto varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='nif_declarante_296')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD nif_declarante_296 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD id_mae_no_id_declarante int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='id_dim_declarantes_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN id_dim_declarantes_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN telefono_contacto varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN nombre_contacto varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='nif_declarante_296' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN nif_declarante_296 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_declarantes_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD CONSTRAINT PK_tbn1_mi_296_dim_declarantes_1 PRIMARY KEY CLUSTERED (id_dim_declarantes_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarantes_1_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarantes_1_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarantes_1_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarantes_1_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_declarantes_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_declarantes_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_declarantes_1(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarantes_1'
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
			telefono_contacto,
			nombre_contacto,
			nif_declarante_296,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			id_mae_no_id_declarante
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			telefono_contacto,
			nombre_contacto,
			nif_declarante_296,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			id_mae_no_id_declarante
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 AS tbn1_mi_296_dim_declarantes_1
	USING query ON query.telefono_contacto=tbn1_mi_296_dim_declarantes_1.telefono_contacto AND query.nombre_contacto=tbn1_mi_296_dim_declarantes_1.nombre_contacto AND query.nif_declarante_296=tbn1_mi_296_dim_declarantes_1.nif_declarante_296 AND query.nif_declarante_no_identificado=tbn1_mi_296_dim_declarantes_1.nif_declarante_no_identificado AND query.id_contribuyente_declarante=tbn1_mi_296_dim_declarantes_1.id_contribuyente_declarante AND query.id_mae_no_id_declarante=tbn1_mi_296_dim_declarantes_1.id_mae_no_id_declarante
	WHEN NOT MATCHED THEN
		INSERT (telefono_contacto,nombre_contacto,nif_declarante_296,nif_declarante_no_identificado,id_contribuyente_declarante,id_mae_no_id_declarante) VALUES (
			query.telefono_contacto,
			query.nombre_contacto,
			query.nif_declarante_296,
			query.nif_declarante_no_identificado,
			query.id_contribuyente_declarante,
			query.id_mae_no_id_declarante)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1(
	id_dim_declarados_1 int IDENTITY(1,1),
	secuencia varchar(11) NOT NULL,
	nif_declarado_296 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	CONSTRAINT uk_mi_296_dim_declarados_1 UNIQUE (secuencia,nif_declarado_296,nif_declarado_no_identificado,id_contribuyente_declarado,sw_identificado_declarado,id_mae_no_id_declarado),
	CONSTRAINT FK_tbn1_mi_296_dim_declarados_1_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_296_dim_declarados_1_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT PK_tbn1_mi_296_dim_declarados_1 PRIMARY KEY CLUSTERED (id_dim_declarados_1)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='id_dim_declarados_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD id_dim_declarados_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='nif_declarado_296')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD nif_declarado_296 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD id_mae_no_id_declarado int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='id_dim_declarados_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN id_dim_declarados_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN secuencia varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='nif_declarado_296' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN nif_declarado_296 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_declarados_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD CONSTRAINT PK_tbn1_mi_296_dim_declarados_1 PRIMARY KEY CLUSTERED (id_dim_declarados_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarados_1_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarados_1_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarados_1_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarados_1_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_declarados_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_declarados_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_declarados_1(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarados_1'
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
			nif_declarado_296,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			sw_identificado_declarado,
			id_mae_no_id_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			secuencia,
			nif_declarado_296,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			sw_identificado_declarado,
			id_mae_no_id_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 AS tbn1_mi_296_dim_declarados_1
	USING query ON query.secuencia=tbn1_mi_296_dim_declarados_1.secuencia AND query.nif_declarado_296=tbn1_mi_296_dim_declarados_1.nif_declarado_296 AND query.nif_declarado_no_identificado=tbn1_mi_296_dim_declarados_1.nif_declarado_no_identificado AND query.id_contribuyente_declarado=tbn1_mi_296_dim_declarados_1.id_contribuyente_declarado AND query.sw_identificado_declarado=tbn1_mi_296_dim_declarados_1.sw_identificado_declarado AND query.id_mae_no_id_declarado=tbn1_mi_296_dim_declarados_1.id_mae_no_id_declarado
	WHEN NOT MATCHED THEN
		INSERT (secuencia,nif_declarado_296,nif_declarado_no_identificado,id_contribuyente_declarado,sw_identificado_declarado,id_mae_no_id_declarado) VALUES (
			query.secuencia,
			query.nif_declarado_296,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado,
			query.sw_identificado_declarado,
			query.id_mae_no_id_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1(
	id_dim_datos_detalle_1 int IDENTITY(1,1),
	id_pais int NOT NULL,
	id_mae_naturalezas_renta int NOT NULL,
	id_mae_claves_tipos_renta int NOT NULL,
	id_mae_subclaves_tipos_renta int NOT NULL,
	id_clave_identificacion_fondo int NOT NULL,
	cod_emisor varchar(12) NOT NULL,
	id_mae_claves_pago int NOT NULL,
	id_tipo_codigo int NOT NULL,
	id_mae_entidades_bancarias int NOT NULL,
	sucursal varchar(4) NOT NULL,
	digito_control varchar(2) NOT NULL,
	num_cuenta varchar(10) NOT NULL,
	ejercicio_devengo smallint NOT NULL,
	clave_presentacion_2008 decimal(2,0) NOT NULL,
	CONSTRAINT uk_mi_296_dim_datos_detalle_1 UNIQUE (id_pais,id_mae_naturalezas_renta,id_mae_claves_tipos_renta,id_mae_subclaves_tipos_renta,id_clave_identificacion_fondo,cod_emisor,id_mae_claves_pago,id_tipo_codigo,id_mae_entidades_bancarias,sucursal,digito_control,num_cuenta,ejercicio_devengo,clave_presentacion_2008),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_naturalezas_renta FOREIGN KEY (id_mae_naturalezas_renta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta(id_mae_naturalezas_renta),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_claves_tipos_renta FOREIGN KEY (id_mae_claves_tipos_renta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta(id_mae_claves_tipos_renta),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_subclaves_tipos_renta FOREIGN KEY (id_mae_subclaves_tipos_renta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta(id_mae_subclaves_tipos_renta),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo(id_clave_identificacion_fondo),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_claves_pago FOREIGN KEY (id_mae_claves_pago) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago(id_mae_claves_pago),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_mi_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo(id_tipo_codigo),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_entidades_bancarias FOREIGN KEY (id_mae_entidades_bancarias) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(id_mae_entidades_bancarias),
	CONSTRAINT PK_tbn1_mi_296_dim_datos_detalle_1 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_1)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_dim_datos_detalle_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_naturalezas_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_mae_naturalezas_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_claves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_mae_claves_tipos_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_subclaves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_mae_subclaves_tipos_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_clave_identificacion_fondo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='cod_emisor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD cod_emisor varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_claves_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_mae_claves_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_tipo_codigo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_entidades_bancarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD id_mae_entidades_bancarias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD sucursal varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='digito_control')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD digito_control varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD num_cuenta varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD ejercicio_devengo smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='clave_presentacion_2008')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD clave_presentacion_2008 decimal(2,0)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_dim_datos_detalle_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_dim_datos_detalle_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_naturalezas_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_mae_naturalezas_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_claves_tipos_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_mae_claves_tipos_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_subclaves_tipos_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_mae_subclaves_tipos_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_clave_identificacion_fondo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='cod_emisor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN cod_emisor varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_claves_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_mae_claves_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_tipo_codigo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_entidades_bancarias' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN id_mae_entidades_bancarias int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN sucursal varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='digito_control' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN digito_control varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN num_cuenta varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN ejercicio_devengo smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND COLUMN_NAME='clave_presentacion_2008' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ALTER COLUMN clave_presentacion_2008 decimal(2,0) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT PK_tbn1_mi_296_dim_datos_detalle_1 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_naturalezas_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_naturalezas_renta FOREIGN KEY (id_mae_naturalezas_renta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta(id_mae_naturalezas_renta)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_claves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_claves_tipos_renta FOREIGN KEY (id_mae_claves_tipos_renta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta(id_mae_claves_tipos_renta)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_subclaves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_subclaves_tipos_renta FOREIGN KEY (id_mae_subclaves_tipos_renta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta(id_mae_subclaves_tipos_renta)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_mi_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo(id_clave_identificacion_fondo)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_claves_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_claves_pago FOREIGN KEY (id_mae_claves_pago) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago(id_mae_claves_pago)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_mi_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_dim_mi_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo(id_tipo_codigo)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_entidades_bancarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_1_tbn1_mae_entidades_bancarias FOREIGN KEY (id_mae_entidades_bancarias) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(id_mae_entidades_bancarias)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_datos_detalle_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_datos_detalle_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_datos_detalle_1(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_datos_detalle_1'
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
			id_pais,
			id_mae_naturalezas_renta,
			id_mae_claves_tipos_renta,
			id_mae_subclaves_tipos_renta,
			id_clave_identificacion_fondo,
			cod_emisor,
			id_mae_claves_pago,
			id_tipo_codigo,
			id_mae_entidades_bancarias,
			sucursal,
			digito_control,
			num_cuenta,
			ejercicio_devengo,
			clave_presentacion_2008
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_pais,
			id_mae_naturalezas_renta,
			id_mae_claves_tipos_renta,
			id_mae_subclaves_tipos_renta,
			id_clave_identificacion_fondo,
			cod_emisor,
			id_mae_claves_pago,
			id_tipo_codigo,
			id_mae_entidades_bancarias,
			sucursal,
			digito_control,
			num_cuenta,
			ejercicio_devengo,
			clave_presentacion_2008
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 AS tbn1_mi_296_dim_datos_detalle_1
	USING query ON query.id_pais=tbn1_mi_296_dim_datos_detalle_1.id_pais AND query.id_mae_naturalezas_renta=tbn1_mi_296_dim_datos_detalle_1.id_mae_naturalezas_renta AND query.id_mae_claves_tipos_renta=tbn1_mi_296_dim_datos_detalle_1.id_mae_claves_tipos_renta AND query.id_mae_subclaves_tipos_renta=tbn1_mi_296_dim_datos_detalle_1.id_mae_subclaves_tipos_renta AND query.id_clave_identificacion_fondo=tbn1_mi_296_dim_datos_detalle_1.id_clave_identificacion_fondo AND query.cod_emisor=tbn1_mi_296_dim_datos_detalle_1.cod_emisor AND query.id_mae_claves_pago=tbn1_mi_296_dim_datos_detalle_1.id_mae_claves_pago AND query.id_tipo_codigo=tbn1_mi_296_dim_datos_detalle_1.id_tipo_codigo AND query.id_mae_entidades_bancarias=tbn1_mi_296_dim_datos_detalle_1.id_mae_entidades_bancarias AND query.sucursal=tbn1_mi_296_dim_datos_detalle_1.sucursal AND query.digito_control=tbn1_mi_296_dim_datos_detalle_1.digito_control AND query.num_cuenta=tbn1_mi_296_dim_datos_detalle_1.num_cuenta AND query.ejercicio_devengo=tbn1_mi_296_dim_datos_detalle_1.ejercicio_devengo AND query.clave_presentacion_2008=tbn1_mi_296_dim_datos_detalle_1.clave_presentacion_2008
	WHEN NOT MATCHED THEN
		INSERT (id_pais,id_mae_naturalezas_renta,id_mae_claves_tipos_renta,id_mae_subclaves_tipos_renta,id_clave_identificacion_fondo,cod_emisor,id_mae_claves_pago,id_tipo_codigo,id_mae_entidades_bancarias,sucursal,digito_control,num_cuenta,ejercicio_devengo,clave_presentacion_2008) VALUES (
			query.id_pais,
			query.id_mae_naturalezas_renta,
			query.id_mae_claves_tipos_renta,
			query.id_mae_subclaves_tipos_renta,
			query.id_clave_identificacion_fondo,
			query.cod_emisor,
			query.id_mae_claves_pago,
			query.id_tipo_codigo,
			query.id_mae_entidades_bancarias,
			query.sucursal,
			query.digito_control,
			query.num_cuenta,
			query.ejercicio_devengo,
			query.clave_presentacion_2008)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2(
	id_dim_declarantes_2 int IDENTITY(1,1),
	cod_extranjero_declarante varchar(12) NOT NULL,
	nombre_declarante varchar(40) NOT NULL,
	id_mae_claves_personalidad_declarante int NOT NULL,
	c_o_declarante varchar(1) NOT NULL,
	fecha_poder_declarante date NOT NULL,
	mes_poder_declarante int NOT NULL,
	anyo_poder_declarante int NOT NULL,
	nacionalidad_declarante varchar(30) NOT NULL,
	id_mae_sexos_declarante int NOT NULL,
	fecha_nacimiento_declarante date NOT NULL,
	mes_nacimiento_declarante int NOT NULL,
	anyo_nacimiento_declarante int NOT NULL,
	nif_pais_residencia_fiscal_declarante varchar(20) NOT NULL,
	CONSTRAINT uk_mi_296_dim_declarantes_2 UNIQUE (cod_extranjero_declarante,nombre_declarante,id_mae_claves_personalidad_declarante,c_o_declarante,fecha_poder_declarante,mes_poder_declarante,anyo_poder_declarante,nacionalidad_declarante,id_mae_sexos_declarante,fecha_nacimiento_declarante,mes_nacimiento_declarante,anyo_nacimiento_declarante,nif_pais_residencia_fiscal_declarante),
	CONSTRAINT FK_tbn1_mi_296_dim_declarantes_2_tbn1_mae_claves_personalidad FOREIGN KEY (id_mae_claves_personalidad_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(id_mae_claves_personalidad),
	CONSTRAINT FK_tbn1_mi_296_dim_declarantes_2_tbn1_mae_sexos FOREIGN KEY (id_mae_sexos_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_sexos(id_mae_sexos),
	CONSTRAINT PK_tbn1_mi_296_dim_declarantes_2 PRIMARY KEY CLUSTERED (id_dim_declarantes_2)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='id_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD id_dim_declarantes_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='cod_extranjero_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD cod_extranjero_declarante varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='nombre_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD nombre_declarante varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_personalidad_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD id_mae_claves_personalidad_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='c_o_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD c_o_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='fecha_poder_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD fecha_poder_declarante date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='mes_poder_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD mes_poder_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='anyo_poder_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD anyo_poder_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='nacionalidad_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD nacionalidad_declarante varchar(30)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='id_mae_sexos_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD id_mae_sexos_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='fecha_nacimiento_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD fecha_nacimiento_declarante date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='mes_nacimiento_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD mes_nacimiento_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='anyo_nacimiento_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD anyo_nacimiento_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD nif_pais_residencia_fiscal_declarante varchar(20)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='id_dim_declarantes_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN id_dim_declarantes_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='cod_extranjero_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN cod_extranjero_declarante varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='nombre_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN nombre_declarante varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_personalidad_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN id_mae_claves_personalidad_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='c_o_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN c_o_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='fecha_poder_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN fecha_poder_declarante date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='mes_poder_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN mes_poder_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='anyo_poder_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN anyo_poder_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='nacionalidad_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN nacionalidad_declarante varchar(30) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='id_mae_sexos_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN id_mae_sexos_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='fecha_nacimiento_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN fecha_nacimiento_declarante date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='mes_nacimiento_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN mes_nacimiento_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='anyo_nacimiento_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN anyo_nacimiento_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ALTER COLUMN nif_pais_residencia_fiscal_declarante varchar(20) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD CONSTRAINT PK_tbn1_mi_296_dim_declarantes_2 PRIMARY KEY CLUSTERED (id_dim_declarantes_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarantes_2_tbn1_mae_claves_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarantes_2_tbn1_mae_claves_personalidad FOREIGN KEY (id_mae_claves_personalidad_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(id_mae_claves_personalidad)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarantes_2' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarantes_2_tbn1_mae_sexos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarantes_2_tbn1_mae_sexos FOREIGN KEY (id_mae_sexos_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_sexos(id_mae_sexos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_declarantes_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_declarantes_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_declarantes_2(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarantes_2'
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
			cod_extranjero_declarante,
			nombre_declarante,
			id_mae_claves_personalidad_declarante,
			c_o_declarante,
			fecha_poder_declarante,
			mes_poder_declarante,
			anyo_poder_declarante,
			nacionalidad_declarante,
			id_mae_sexos_declarante,
			fecha_nacimiento_declarante,
			mes_nacimiento_declarante,
			anyo_nacimiento_declarante,
			nif_pais_residencia_fiscal_declarante
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			cod_extranjero_declarante,
			nombre_declarante,
			id_mae_claves_personalidad_declarante,
			c_o_declarante,
			fecha_poder_declarante,
			mes_poder_declarante,
			anyo_poder_declarante,
			nacionalidad_declarante,
			id_mae_sexos_declarante,
			fecha_nacimiento_declarante,
			mes_nacimiento_declarante,
			anyo_nacimiento_declarante,
			nif_pais_residencia_fiscal_declarante
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 AS tbn1_mi_296_dim_declarantes_2
	USING query ON query.cod_extranjero_declarante=tbn1_mi_296_dim_declarantes_2.cod_extranjero_declarante AND query.nombre_declarante=tbn1_mi_296_dim_declarantes_2.nombre_declarante AND query.id_mae_claves_personalidad_declarante=tbn1_mi_296_dim_declarantes_2.id_mae_claves_personalidad_declarante AND query.c_o_declarante=tbn1_mi_296_dim_declarantes_2.c_o_declarante AND query.fecha_poder_declarante=tbn1_mi_296_dim_declarantes_2.fecha_poder_declarante AND query.mes_poder_declarante=tbn1_mi_296_dim_declarantes_2.mes_poder_declarante AND query.anyo_poder_declarante=tbn1_mi_296_dim_declarantes_2.anyo_poder_declarante AND query.nacionalidad_declarante=tbn1_mi_296_dim_declarantes_2.nacionalidad_declarante AND query.id_mae_sexos_declarante=tbn1_mi_296_dim_declarantes_2.id_mae_sexos_declarante AND query.fecha_nacimiento_declarante=tbn1_mi_296_dim_declarantes_2.fecha_nacimiento_declarante AND query.mes_nacimiento_declarante=tbn1_mi_296_dim_declarantes_2.mes_nacimiento_declarante AND query.anyo_nacimiento_declarante=tbn1_mi_296_dim_declarantes_2.anyo_nacimiento_declarante AND query.nif_pais_residencia_fiscal_declarante=tbn1_mi_296_dim_declarantes_2.nif_pais_residencia_fiscal_declarante
	WHEN NOT MATCHED THEN
		INSERT (cod_extranjero_declarante,nombre_declarante,id_mae_claves_personalidad_declarante,c_o_declarante,fecha_poder_declarante,mes_poder_declarante,anyo_poder_declarante,nacionalidad_declarante,id_mae_sexos_declarante,fecha_nacimiento_declarante,mes_nacimiento_declarante,anyo_nacimiento_declarante,nif_pais_residencia_fiscal_declarante) VALUES (
			query.cod_extranjero_declarante,
			query.nombre_declarante,
			query.id_mae_claves_personalidad_declarante,
			query.c_o_declarante,
			query.fecha_poder_declarante,
			query.mes_poder_declarante,
			query.anyo_poder_declarante,
			query.nacionalidad_declarante,
			query.id_mae_sexos_declarante,
			query.fecha_nacimiento_declarante,
			query.mes_nacimiento_declarante,
			query.anyo_nacimiento_declarante,
			query.nif_pais_residencia_fiscal_declarante)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2(
	id_dim_datos_detalle_2 int IDENTITY(1,1),
	id_administracion_declarado int NOT NULL,
	fecha_poder_declarado date NOT NULL,
	mes_poder_declarado int NOT NULL,
	anyo_poder_declarado int NOT NULL,
	CONSTRAINT uk_mi_296_dim_datos_detalle_2 UNIQUE (id_administracion_declarado,fecha_poder_declarado,mes_poder_declarado,anyo_poder_declarado),
	CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_2_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT PK_tbn1_mi_296_dim_datos_detalle_2 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_2)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='id_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD id_dim_datos_detalle_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='fecha_poder_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD fecha_poder_declarado date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='mes_poder_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD mes_poder_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='anyo_poder_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD anyo_poder_declarado int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='id_dim_datos_detalle_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ALTER COLUMN id_dim_datos_detalle_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ALTER COLUMN id_administracion_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='fecha_poder_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ALTER COLUMN fecha_poder_declarado date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='mes_poder_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ALTER COLUMN mes_poder_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND COLUMN_NAME='anyo_poder_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ALTER COLUMN anyo_poder_declarado int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD CONSTRAINT PK_tbn1_mi_296_dim_datos_detalle_2 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_datos_detalle_2' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_datos_detalle_2_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 ADD CONSTRAINT FK_tbn1_mi_296_dim_datos_detalle_2_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_datos_detalle_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_datos_detalle_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_datos_detalle_2(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_datos_detalle_2'
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
			id_administracion_declarado,
			fecha_poder_declarado,
			mes_poder_declarado,
			anyo_poder_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_administracion_declarado,
			fecha_poder_declarado,
			mes_poder_declarado,
			anyo_poder_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 AS tbn1_mi_296_dim_datos_detalle_2
	USING query ON query.id_administracion_declarado=tbn1_mi_296_dim_datos_detalle_2.id_administracion_declarado AND query.fecha_poder_declarado=tbn1_mi_296_dim_datos_detalle_2.fecha_poder_declarado AND query.mes_poder_declarado=tbn1_mi_296_dim_datos_detalle_2.mes_poder_declarado AND query.anyo_poder_declarado=tbn1_mi_296_dim_datos_detalle_2.anyo_poder_declarado
	WHEN NOT MATCHED THEN
		INSERT (id_administracion_declarado,fecha_poder_declarado,mes_poder_declarado,anyo_poder_declarado) VALUES (
			query.id_administracion_declarado,
			query.fecha_poder_declarado,
			query.mes_poder_declarado,
			query.anyo_poder_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2(
	id_dim_declarados_2 int IDENTITY(1,1),
	cod_extranjero_declarado varchar(12) NOT NULL,
	nombre_declarado varchar(40) NOT NULL,
	id_mae_claves_personalidad_declarado int NOT NULL,
	c_o_declarado varchar(1) NOT NULL,
	nacionalidad_declarado varchar(30) NOT NULL,
	id_mae_sexos_declarado int NOT NULL,
	fecha_nacimiento_declarado date NOT NULL,
	mes_nacimiento_declarado int NOT NULL,
	anyo_nacimiento_declarado int NOT NULL,
	nif_pais_residencia_fiscal_declarado varchar(20) NOT NULL,
	CONSTRAINT uk_mi_296_dim_declarados_2 UNIQUE (cod_extranjero_declarado,nombre_declarado,id_mae_claves_personalidad_declarado,c_o_declarado,nacionalidad_declarado,id_mae_sexos_declarado,fecha_nacimiento_declarado,mes_nacimiento_declarado,anyo_nacimiento_declarado,nif_pais_residencia_fiscal_declarado),
	CONSTRAINT FK_tbn1_mi_296_dim_declarados_2_tbn1_mae_claves_personalidad FOREIGN KEY (id_mae_claves_personalidad_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(id_mae_claves_personalidad),
	CONSTRAINT FK_tbn1_mi_296_dim_declarados_2_tbn1_mae_sexos FOREIGN KEY (id_mae_sexos_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_sexos(id_mae_sexos),
	CONSTRAINT PK_tbn1_mi_296_dim_declarados_2 PRIMARY KEY CLUSTERED (id_dim_declarados_2)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='id_dim_declarados_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD id_dim_declarados_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='cod_extranjero_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD cod_extranjero_declarado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='nombre_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD nombre_declarado varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='id_mae_claves_personalidad_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD id_mae_claves_personalidad_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='c_o_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD c_o_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='nacionalidad_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD nacionalidad_declarado varchar(30)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='id_mae_sexos_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD id_mae_sexos_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='fecha_nacimiento_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD fecha_nacimiento_declarado date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='mes_nacimiento_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD mes_nacimiento_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='anyo_nacimiento_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD anyo_nacimiento_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD nif_pais_residencia_fiscal_declarado varchar(20)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='id_dim_declarados_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN id_dim_declarados_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='cod_extranjero_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN cod_extranjero_declarado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='nombre_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN nombre_declarado varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='id_mae_claves_personalidad_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN id_mae_claves_personalidad_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='c_o_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN c_o_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='nacionalidad_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN nacionalidad_declarado varchar(30) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='id_mae_sexos_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN id_mae_sexos_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='fecha_nacimiento_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN fecha_nacimiento_declarado date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='mes_nacimiento_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN mes_nacimiento_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='anyo_nacimiento_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN anyo_nacimiento_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ALTER COLUMN nif_pais_residencia_fiscal_declarado varchar(20) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND CONSTRAINT_NAME='PK_tbn1_mi_296_dim_declarados_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD CONSTRAINT PK_tbn1_mi_296_dim_declarados_2 PRIMARY KEY CLUSTERED (id_dim_declarados_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarados_2_tbn1_mae_claves_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarados_2_tbn1_mae_claves_personalidad FOREIGN KEY (id_mae_claves_personalidad_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(id_mae_claves_personalidad)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_dim_declarados_2' AND CONSTRAINT_NAME='FK_tbn1_mi_296_dim_declarados_2_tbn1_mae_sexos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 ADD CONSTRAINT FK_tbn1_mi_296_dim_declarados_2_tbn1_mae_sexos FOREIGN KEY (id_mae_sexos_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_sexos(id_mae_sexos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_dim_declarados_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_dim_declarados_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_dim_declarados_2(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarados_2'
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
			cod_extranjero_declarado,
			nombre_declarado,
			id_mae_claves_personalidad_declarado,
			c_o_declarado,
			nacionalidad_declarado,
			id_mae_sexos_declarado,
			fecha_nacimiento_declarado,
			mes_nacimiento_declarado,
			anyo_nacimiento_declarado,
			nif_pais_residencia_fiscal_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			cod_extranjero_declarado,
			nombre_declarado,
			id_mae_claves_personalidad_declarado,
			c_o_declarado,
			nacionalidad_declarado,
			id_mae_sexos_declarado,
			fecha_nacimiento_declarado,
			mes_nacimiento_declarado,
			anyo_nacimiento_declarado,
			nif_pais_residencia_fiscal_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 AS tbn1_mi_296_dim_declarados_2
	USING query ON query.cod_extranjero_declarado=tbn1_mi_296_dim_declarados_2.cod_extranjero_declarado AND query.nombre_declarado=tbn1_mi_296_dim_declarados_2.nombre_declarado AND query.id_mae_claves_personalidad_declarado=tbn1_mi_296_dim_declarados_2.id_mae_claves_personalidad_declarado AND query.c_o_declarado=tbn1_mi_296_dim_declarados_2.c_o_declarado AND query.nacionalidad_declarado=tbn1_mi_296_dim_declarados_2.nacionalidad_declarado AND query.id_mae_sexos_declarado=tbn1_mi_296_dim_declarados_2.id_mae_sexos_declarado AND query.fecha_nacimiento_declarado=tbn1_mi_296_dim_declarados_2.fecha_nacimiento_declarado AND query.mes_nacimiento_declarado=tbn1_mi_296_dim_declarados_2.mes_nacimiento_declarado AND query.anyo_nacimiento_declarado=tbn1_mi_296_dim_declarados_2.anyo_nacimiento_declarado AND query.nif_pais_residencia_fiscal_declarado=tbn1_mi_296_dim_declarados_2.nif_pais_residencia_fiscal_declarado
	WHEN NOT MATCHED THEN
		INSERT (cod_extranjero_declarado,nombre_declarado,id_mae_claves_personalidad_declarado,c_o_declarado,nacionalidad_declarado,id_mae_sexos_declarado,fecha_nacimiento_declarado,mes_nacimiento_declarado,anyo_nacimiento_declarado,nif_pais_residencia_fiscal_declarado) VALUES (
			query.cod_extranjero_declarado,
			query.nombre_declarado,
			query.id_mae_claves_personalidad_declarado,
			query.c_o_declarado,
			query.nacionalidad_declarado,
			query.id_mae_sexos_declarado,
			query.fecha_nacimiento_declarado,
			query.mes_nacimiento_declarado,
			query.anyo_nacimiento_declarado,
			query.nif_pais_residencia_fiscal_declarado)
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

