PRINT 'dimensional_mi_184_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int,
	id_expediente int,
	CONSTRAINT uk_mi_184_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_184_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_184_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_184_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ALTER COLUMN id_documento int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ALTER COLUMN id_expediente int NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ADD CONSTRAINT PK_tbn1_mi_184_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ADD CONSTRAINT FK_tbn1_mi_184_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos ADD CONSTRAINT FK_tbn1_mi_184_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_documentos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos AS tbn1_mi_184_dim_documentos
	USING query ON (query.id_documento=tbn1_mi_184_dim_documentos.id_documento OR (query.id_documento IS NULL AND tbn1_mi_184_dim_documentos.id_documento IS NULL)) AND (query.id_expediente=tbn1_mi_184_dim_documentos.id_expediente OR (query.id_expediente IS NULL AND tbn1_mi_184_dim_documentos.id_expediente IS NULL))
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint,
	fecha_presentacion date,
	mes_presentacion int,
	anyo_presentacion int,
	fecha_alta date,
	mes_alta int,
	anyo_alta int,
	CONSTRAINT uk_mi_184_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta),
	CONSTRAINT PK_tbn1_mi_184_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD anyo_alta int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN ejercicio smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN fecha_presentacion date NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN mes_presentacion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN anyo_presentacion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN fecha_alta date NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN mes_alta int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ALTER COLUMN anyo_alta int NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos ADD CONSTRAINT PK_tbn1_mi_184_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_periodos'
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
			fecha_alta,
			mes_alta,
			anyo_alta
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_alta,
			mes_alta,
			anyo_alta
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos AS tbn1_mi_184_dim_periodos
	USING query ON (query.ejercicio=tbn1_mi_184_dim_periodos.ejercicio OR (query.ejercicio IS NULL AND tbn1_mi_184_dim_periodos.ejercicio IS NULL)) AND (query.fecha_presentacion=tbn1_mi_184_dim_periodos.fecha_presentacion OR (query.fecha_presentacion IS NULL AND tbn1_mi_184_dim_periodos.fecha_presentacion IS NULL)) AND (query.mes_presentacion=tbn1_mi_184_dim_periodos.mes_presentacion OR (query.mes_presentacion IS NULL AND tbn1_mi_184_dim_periodos.mes_presentacion IS NULL)) AND (query.anyo_presentacion=tbn1_mi_184_dim_periodos.anyo_presentacion OR (query.anyo_presentacion IS NULL AND tbn1_mi_184_dim_periodos.anyo_presentacion IS NULL)) AND (query.fecha_alta=tbn1_mi_184_dim_periodos.fecha_alta OR (query.fecha_alta IS NULL AND tbn1_mi_184_dim_periodos.fecha_alta IS NULL)) AND (query.mes_alta=tbn1_mi_184_dim_periodos.mes_alta OR (query.mes_alta IS NULL AND tbn1_mi_184_dim_periodos.mes_alta IS NULL)) AND (query.anyo_alta=tbn1_mi_184_dim_periodos.anyo_alta OR (query.anyo_alta IS NULL AND tbn1_mi_184_dim_periodos.anyo_alta IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta) VALUES (
			query.ejercicio,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.fecha_alta,
			query.mes_alta,
			query.anyo_alta)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo varchar(3),
	id_administracion_declarante int,
	id_mae_entidades_bancarias int,
	id_tipo_presentacion int,
	id_tipo_declaracion int,
	regimen_fiscal_deducciones varchar(1),
	CONSTRAINT uk_mi_184_dim_datos_caratula UNIQUE (modelo,id_administracion_declarante,id_mae_entidades_bancarias,id_tipo_presentacion,id_tipo_declaracion,regimen_fiscal_deducciones),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_mae_entidades_bancarias FOREIGN KEY (id_mae_entidades_bancarias) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(id_mae_entidades_bancarias),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT PK_tbn1_mi_184_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_mae_entidades_bancarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD id_mae_entidades_bancarias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD regimen_fiscal_deducciones varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN modelo varchar(3) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN id_administracion_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_mae_entidades_bancarias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN id_mae_entidades_bancarias int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ALTER COLUMN regimen_fiscal_deducciones varchar(1) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_184_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_caratula_tbn1_mae_entidades_bancarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_mae_entidades_bancarias FOREIGN KEY (id_mae_entidades_bancarias) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(id_mae_entidades_bancarias)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_caratula'
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
			id_administracion_declarante,
			id_mae_entidades_bancarias,
			id_tipo_presentacion,
			id_tipo_declaracion,
			regimen_fiscal_deducciones
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo,
			id_administracion_declarante,
			id_mae_entidades_bancarias,
			id_tipo_presentacion,
			id_tipo_declaracion,
			regimen_fiscal_deducciones
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula AS tbn1_mi_184_dim_datos_caratula
	USING query ON (query.modelo=tbn1_mi_184_dim_datos_caratula.modelo OR (query.modelo IS NULL AND tbn1_mi_184_dim_datos_caratula.modelo IS NULL)) AND (query.id_administracion_declarante=tbn1_mi_184_dim_datos_caratula.id_administracion_declarante OR (query.id_administracion_declarante IS NULL AND tbn1_mi_184_dim_datos_caratula.id_administracion_declarante IS NULL)) AND (query.id_mae_entidades_bancarias=tbn1_mi_184_dim_datos_caratula.id_mae_entidades_bancarias OR (query.id_mae_entidades_bancarias IS NULL AND tbn1_mi_184_dim_datos_caratula.id_mae_entidades_bancarias IS NULL)) AND (query.id_tipo_presentacion=tbn1_mi_184_dim_datos_caratula.id_tipo_presentacion OR (query.id_tipo_presentacion IS NULL AND tbn1_mi_184_dim_datos_caratula.id_tipo_presentacion IS NULL)) AND (query.id_tipo_declaracion=tbn1_mi_184_dim_datos_caratula.id_tipo_declaracion OR (query.id_tipo_declaracion IS NULL AND tbn1_mi_184_dim_datos_caratula.id_tipo_declaracion IS NULL)) AND (query.regimen_fiscal_deducciones=tbn1_mi_184_dim_datos_caratula.regimen_fiscal_deducciones OR (query.regimen_fiscal_deducciones IS NULL AND tbn1_mi_184_dim_datos_caratula.regimen_fiscal_deducciones IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (modelo,id_administracion_declarante,id_mae_entidades_bancarias,id_tipo_presentacion,id_tipo_declaracion,regimen_fiscal_deducciones) VALUES (
			query.modelo,
			query.id_administracion_declarante,
			query.id_mae_entidades_bancarias,
			query.id_tipo_presentacion,
			query.id_tipo_declaracion,
			query.regimen_fiscal_deducciones)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante(
	id_dim_marcas_declarante int IDENTITY(1,1),
	es_externo_declarante bit,
	es_contribuyente_declarante bit,
	es_identificado_declarante bit,
	sw_identificado_declarante varchar(1),
	es_objeto_extranjero varchar (1),
	es_regimen_impuesto_soc_extranjero bit,
	es_erroneo_dato_ec_declarante varchar(1),
	CONSTRAINT uk_mi_184_dim_marcas_declarante UNIQUE (es_externo_declarante,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_objeto_extranjero,es_regimen_impuesto_soc_extranjero,es_erroneo_dato_ec_declarante),
	CONSTRAINT PK_tbn1_mi_184_dim_marcas_declarante PRIMARY KEY CLUSTERED (id_dim_marcas_declarante)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='id_dim_marcas_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD id_dim_marcas_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_objeto_extranjero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD es_objeto_extranjero varchar (1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_regimen_impuesto_soc_extranjero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD es_regimen_impuesto_soc_extranjero bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_erroneo_dato_ec_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD es_erroneo_dato_ec_declarante varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='id_dim_marcas_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN id_dim_marcas_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN es_externo_declarante bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN es_contribuyente_declarante bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN es_identificado_declarante bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN sw_identificado_declarante varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_objeto_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN es_objeto_extranjero varchar (1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_regimen_impuesto_soc_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN es_regimen_impuesto_soc_extranjero bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND COLUMN_NAME='es_erroneo_dato_ec_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ALTER COLUMN es_erroneo_dato_ec_declarante varchar(1) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarante' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_marcas_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante ADD CONSTRAINT PK_tbn1_mi_184_dim_marcas_declarante PRIMARY KEY CLUSTERED (id_dim_marcas_declarante)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_marcas_declarante' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_marcas_declarante;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_marcas_declarante(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_marcas_declarante'
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
			es_externo_declarante,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_objeto_extranjero,
			es_regimen_impuesto_soc_extranjero,
			es_erroneo_dato_ec_declarante
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_externo_declarante,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_objeto_extranjero,
			es_regimen_impuesto_soc_extranjero,
			es_erroneo_dato_ec_declarante
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante AS tbn1_mi_184_dim_marcas_declarante
	USING query ON (query.es_externo_declarante=tbn1_mi_184_dim_marcas_declarante.es_externo_declarante OR (query.es_externo_declarante IS NULL AND tbn1_mi_184_dim_marcas_declarante.es_externo_declarante IS NULL)) AND (query.es_contribuyente_declarante=tbn1_mi_184_dim_marcas_declarante.es_contribuyente_declarante OR (query.es_contribuyente_declarante IS NULL AND tbn1_mi_184_dim_marcas_declarante.es_contribuyente_declarante IS NULL)) AND (query.es_identificado_declarante=tbn1_mi_184_dim_marcas_declarante.es_identificado_declarante OR (query.es_identificado_declarante IS NULL AND tbn1_mi_184_dim_marcas_declarante.es_identificado_declarante IS NULL)) AND (query.sw_identificado_declarante=tbn1_mi_184_dim_marcas_declarante.sw_identificado_declarante OR (query.sw_identificado_declarante IS NULL AND tbn1_mi_184_dim_marcas_declarante.sw_identificado_declarante IS NULL)) AND (query.es_objeto_extranjero=tbn1_mi_184_dim_marcas_declarante.es_objeto_extranjero OR (query.es_objeto_extranjero IS NULL AND tbn1_mi_184_dim_marcas_declarante.es_objeto_extranjero IS NULL)) AND (query.es_regimen_impuesto_soc_extranjero=tbn1_mi_184_dim_marcas_declarante.es_regimen_impuesto_soc_extranjero OR (query.es_regimen_impuesto_soc_extranjero IS NULL AND tbn1_mi_184_dim_marcas_declarante.es_regimen_impuesto_soc_extranjero IS NULL)) AND (query.es_erroneo_dato_ec_declarante=tbn1_mi_184_dim_marcas_declarante.es_erroneo_dato_ec_declarante OR (query.es_erroneo_dato_ec_declarante IS NULL AND tbn1_mi_184_dim_marcas_declarante.es_erroneo_dato_ec_declarante IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (es_externo_declarante,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_objeto_extranjero,es_regimen_impuesto_soc_extranjero,es_erroneo_dato_ec_declarante) VALUES (
			query.es_externo_declarante,
			query.es_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.es_objeto_extranjero,
			query.es_regimen_impuesto_soc_extranjero,
			query.es_erroneo_dato_ec_declarante)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	nif_declarante_184 varchar(12),
	nif_declarante_no_identificado varchar(12),
	id_contribuyente_declarante int,
	id_mae_no_id_declarante int,
	telefono varchar(10),
	persona_relacionarse varchar(40),
	cod_presentador_colectivo int,
	CONSTRAINT uk_mi_184_dim_declarantes UNIQUE (nif_declarante_184,nif_declarante_no_identificado,id_contribuyente_declarante,id_mae_no_id_declarante,telefono,persona_relacionarse,cod_presentador_colectivo),
	CONSTRAINT FK_tbn1_mi_184_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_184_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT PK_tbn1_mi_184_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='nif_declarante_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD nif_declarante_184 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='persona_relacionarse')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD persona_relacionarse varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD cod_presentador_colectivo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='nif_declarante_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN nif_declarante_184 varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN nif_declarante_no_identificado varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN telefono varchar(10) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='persona_relacionarse' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN persona_relacionarse varchar(40) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ALTER COLUMN cod_presentador_colectivo int NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_184_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_184_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_184_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_declarantes'
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
			nif_declarante_184,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			id_mae_no_id_declarante,
			telefono,
			persona_relacionarse,
			cod_presentador_colectivo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_declarante_184,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			id_mae_no_id_declarante,
			telefono,
			persona_relacionarse,
			cod_presentador_colectivo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes AS tbn1_mi_184_dim_declarantes
	USING query ON (query.nif_declarante_184=tbn1_mi_184_dim_declarantes.nif_declarante_184 OR (query.nif_declarante_184 IS NULL AND tbn1_mi_184_dim_declarantes.nif_declarante_184 IS NULL)) AND (query.nif_declarante_no_identificado=tbn1_mi_184_dim_declarantes.nif_declarante_no_identificado OR (query.nif_declarante_no_identificado IS NULL AND tbn1_mi_184_dim_declarantes.nif_declarante_no_identificado IS NULL)) AND (query.id_contribuyente_declarante=tbn1_mi_184_dim_declarantes.id_contribuyente_declarante OR (query.id_contribuyente_declarante IS NULL AND tbn1_mi_184_dim_declarantes.id_contribuyente_declarante IS NULL)) AND (query.id_mae_no_id_declarante=tbn1_mi_184_dim_declarantes.id_mae_no_id_declarante OR (query.id_mae_no_id_declarante IS NULL AND tbn1_mi_184_dim_declarantes.id_mae_no_id_declarante IS NULL)) AND (query.telefono=tbn1_mi_184_dim_declarantes.telefono OR (query.telefono IS NULL AND tbn1_mi_184_dim_declarantes.telefono IS NULL)) AND (query.persona_relacionarse=tbn1_mi_184_dim_declarantes.persona_relacionarse OR (query.persona_relacionarse IS NULL AND tbn1_mi_184_dim_declarantes.persona_relacionarse IS NULL)) AND (query.cod_presentador_colectivo=tbn1_mi_184_dim_declarantes.cod_presentador_colectivo OR (query.cod_presentador_colectivo IS NULL AND tbn1_mi_184_dim_declarantes.cod_presentador_colectivo IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (nif_declarante_184,nif_declarante_no_identificado,id_contribuyente_declarante,id_mae_no_id_declarante,telefono,persona_relacionarse,cod_presentador_colectivo) VALUES (
			query.nif_declarante_184,
			query.nif_declarante_no_identificado,
			query.id_contribuyente_declarante,
			query.id_mae_no_id_declarante,
			query.telefono,
			query.persona_relacionarse,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2(
	id_dim_declarantes_2 int IDENTITY(1,1),
	id_mae_claves_tipos_entidad int,
	id_mae_claves_actividad_ppal int,
	id_mae_claves_tipos_entidad_extranjero int,
	id_pais_extranjero int,
	renta_residentes_extranjero decimal (8, 2),
	cif_representante varchar (9),
	nombre_representante varchar (40),
	CONSTRAINT uk_mi_184_dim_declarantes_2 UNIQUE (id_mae_claves_tipos_entidad,id_mae_claves_actividad_ppal,id_mae_claves_tipos_entidad_extranjero,id_pais_extranjero,renta_residentes_extranjero,cif_representante,nombre_representante),
	CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_tipos_entidad_mf FOREIGN KEY (id_mae_claves_tipos_entidad) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf(id_mae_claves_tipos_entidad_mf),
	CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_actividad_ppal_mf FOREIGN KEY (id_mae_claves_actividad_ppal) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf(id_mae_claves_actividad_ppal_mf),
	CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_tipos_entidad_mf1 FOREIGN KEY (id_mae_claves_tipos_entidad_extranjero) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf(id_mae_claves_tipos_entidad_mf),
	CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_dim_paises FOREIGN KEY (id_pais_extranjero) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT PK_tbn1_mi_184_dim_declarantes_2 PRIMARY KEY CLUSTERED (id_dim_declarantes_2)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD id_dim_declarantes_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_tipos_entidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD id_mae_claves_tipos_entidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_actividad_ppal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD id_mae_claves_actividad_ppal int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_tipos_entidad_extranjero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD id_mae_claves_tipos_entidad_extranjero int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_pais_extranjero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD id_pais_extranjero int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='renta_residentes_extranjero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD renta_residentes_extranjero decimal (8, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='cif_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD cif_representante varchar (9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='nombre_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD nombre_representante varchar (40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_dim_declarantes_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN id_dim_declarantes_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_tipos_entidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN id_mae_claves_tipos_entidad int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_actividad_ppal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN id_mae_claves_actividad_ppal int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_mae_claves_tipos_entidad_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN id_mae_claves_tipos_entidad_extranjero int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='id_pais_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN id_pais_extranjero int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='renta_residentes_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN renta_residentes_extranjero decimal (8, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='cif_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN cif_representante varchar (9) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND COLUMN_NAME='nombre_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ALTER COLUMN nombre_representante varchar (40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD CONSTRAINT PK_tbn1_mi_184_dim_declarantes_2 PRIMARY KEY CLUSTERED (id_dim_declarantes_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_tipos_entidad_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_tipos_entidad_mf FOREIGN KEY (id_mae_claves_tipos_entidad) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf(id_mae_claves_tipos_entidad_mf)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_actividad_ppal_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_actividad_ppal_mf FOREIGN KEY (id_mae_claves_actividad_ppal) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf(id_mae_claves_actividad_ppal_mf)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_tipos_entidad_mf1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_mae_claves_tipos_entidad_mf1 FOREIGN KEY (id_mae_claves_tipos_entidad_extranjero) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf(id_mae_claves_tipos_entidad_mf)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarantes_2' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarantes_2_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 ADD CONSTRAINT FK_tbn1_mi_184_dim_declarantes_2_tbn1_dim_paises FOREIGN KEY (id_pais_extranjero) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_declarantes_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_declarantes_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_declarantes_2(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_declarantes_2'
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
			id_mae_claves_tipos_entidad,
			id_mae_claves_actividad_ppal,
			id_mae_claves_tipos_entidad_extranjero,
			id_pais_extranjero,
			renta_residentes_extranjero,
			cif_representante,
			nombre_representante
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_claves_tipos_entidad,
			id_mae_claves_actividad_ppal,
			id_mae_claves_tipos_entidad_extranjero,
			id_pais_extranjero,
			renta_residentes_extranjero,
			cif_representante,
			nombre_representante
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 AS tbn1_mi_184_dim_declarantes_2
	USING query ON (query.id_mae_claves_tipos_entidad=tbn1_mi_184_dim_declarantes_2.id_mae_claves_tipos_entidad OR (query.id_mae_claves_tipos_entidad IS NULL AND tbn1_mi_184_dim_declarantes_2.id_mae_claves_tipos_entidad IS NULL)) AND (query.id_mae_claves_actividad_ppal=tbn1_mi_184_dim_declarantes_2.id_mae_claves_actividad_ppal OR (query.id_mae_claves_actividad_ppal IS NULL AND tbn1_mi_184_dim_declarantes_2.id_mae_claves_actividad_ppal IS NULL)) AND (query.id_mae_claves_tipos_entidad_extranjero=tbn1_mi_184_dim_declarantes_2.id_mae_claves_tipos_entidad_extranjero OR (query.id_mae_claves_tipos_entidad_extranjero IS NULL AND tbn1_mi_184_dim_declarantes_2.id_mae_claves_tipos_entidad_extranjero IS NULL)) AND (query.id_pais_extranjero=tbn1_mi_184_dim_declarantes_2.id_pais_extranjero OR (query.id_pais_extranjero IS NULL AND tbn1_mi_184_dim_declarantes_2.id_pais_extranjero IS NULL)) AND (query.renta_residentes_extranjero=tbn1_mi_184_dim_declarantes_2.renta_residentes_extranjero OR (query.renta_residentes_extranjero IS NULL AND tbn1_mi_184_dim_declarantes_2.renta_residentes_extranjero IS NULL)) AND (query.cif_representante=tbn1_mi_184_dim_declarantes_2.cif_representante OR (query.cif_representante IS NULL AND tbn1_mi_184_dim_declarantes_2.cif_representante IS NULL)) AND (query.nombre_representante=tbn1_mi_184_dim_declarantes_2.nombre_representante OR (query.nombre_representante IS NULL AND tbn1_mi_184_dim_declarantes_2.nombre_representante IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (id_mae_claves_tipos_entidad,id_mae_claves_actividad_ppal,id_mae_claves_tipos_entidad_extranjero,id_pais_extranjero,renta_residentes_extranjero,cif_representante,nombre_representante) VALUES (
			query.id_mae_claves_tipos_entidad,
			query.id_mae_claves_actividad_ppal,
			query.id_mae_claves_tipos_entidad_extranjero,
			query.id_pais_extranjero,
			query.renta_residentes_extranjero,
			query.cif_representante,
			query.nombre_representante)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	id_administracion_declarado int,
	id_provincia int,
	id_pais int,
	domicilio_fiscal varchar(40),
	CONSTRAINT uk_mi_184_dim_datos_detalle UNIQUE (id_administracion_declarado,id_provincia,id_pais,domicilio_fiscal),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT PK_tbn1_mi_184_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='domicilio_fiscal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD domicilio_fiscal varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ALTER COLUMN id_administracion_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ALTER COLUMN id_provincia int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ALTER COLUMN id_pais int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND COLUMN_NAME='domicilio_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ALTER COLUMN domicilio_fiscal varchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD CONSTRAINT PK_tbn1_mi_184_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_provincias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_datos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_detalle(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_detalle'
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
			id_provincia,
			id_pais,
			domicilio_fiscal
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_administracion_declarado,
			id_provincia,
			id_pais,
			domicilio_fiscal
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle AS tbn1_mi_184_dim_datos_detalle
	USING query ON (query.id_administracion_declarado=tbn1_mi_184_dim_datos_detalle.id_administracion_declarado OR (query.id_administracion_declarado IS NULL AND tbn1_mi_184_dim_datos_detalle.id_administracion_declarado IS NULL)) AND (query.id_provincia=tbn1_mi_184_dim_datos_detalle.id_provincia OR (query.id_provincia IS NULL AND tbn1_mi_184_dim_datos_detalle.id_provincia IS NULL)) AND (query.id_pais=tbn1_mi_184_dim_datos_detalle.id_pais OR (query.id_pais IS NULL AND tbn1_mi_184_dim_datos_detalle.id_pais IS NULL)) AND (query.domicilio_fiscal=tbn1_mi_184_dim_datos_detalle.domicilio_fiscal OR (query.domicilio_fiscal IS NULL AND tbn1_mi_184_dim_datos_detalle.domicilio_fiscal IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (id_administracion_declarado,id_provincia,id_pais,domicilio_fiscal) VALUES (
			query.id_administracion_declarado,
			query.id_provincia,
			query.id_pais,
			query.domicilio_fiscal)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado(
	id_dim_marcas_declarado int IDENTITY(1,1),
	es_externo_declarado bit,
	es_contribuyente_declarado bit,
	es_identificado_declarado bit,
	sw_identificado_declarado varchar(1),
	es_representante varchar(1),
	id_mae_claves_participe_184 int,
	es_miembro_31_diciembre bit,
	es_ejerce_actividad bit,
	es_erroneo_declarado varchar(1),
	es_erroneo_dato_ec_declarado varchar(1),
	CONSTRAINT uk_mi_184_dim_marcas_declarado UNIQUE (es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_representante,id_mae_claves_participe_184,es_miembro_31_diciembre,es_ejerce_actividad,es_erroneo_declarado,es_erroneo_dato_ec_declarado),
	CONSTRAINT FK_tbn1_mi_184_dim_marcas_declarado_tbn1_mae_claves_participe_184 FOREIGN KEY (id_mae_claves_participe_184) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_participe_184(id_mae_claves_participe_184),
	CONSTRAINT PK_tbn1_mi_184_dim_marcas_declarado PRIMARY KEY CLUSTERED (id_dim_marcas_declarado)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='id_dim_marcas_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD id_dim_marcas_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_representante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='id_mae_claves_participe_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD id_mae_claves_participe_184 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_miembro_31_diciembre')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_miembro_31_diciembre bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_ejerce_actividad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_ejerce_actividad bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_erroneo_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_erroneo_dato_ec_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD es_erroneo_dato_ec_declarado varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='id_dim_marcas_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN id_dim_marcas_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_externo_declarado bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_contribuyente_declarado bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_identificado_declarado bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN sw_identificado_declarado varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_representante varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='id_mae_claves_participe_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN id_mae_claves_participe_184 int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_miembro_31_diciembre' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_miembro_31_diciembre bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_ejerce_actividad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_ejerce_actividad bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_erroneo_declarado varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND COLUMN_NAME='es_erroneo_dato_ec_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ALTER COLUMN es_erroneo_dato_ec_declarado varchar(1) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_marcas_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD CONSTRAINT PK_tbn1_mi_184_dim_marcas_declarado PRIMARY KEY CLUSTERED (id_dim_marcas_declarado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_marcas_declarado' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_marcas_declarado_tbn1_mae_claves_participe_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado ADD CONSTRAINT FK_tbn1_mi_184_dim_marcas_declarado_tbn1_mae_claves_participe_184 FOREIGN KEY (id_mae_claves_participe_184) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_participe_184(id_mae_claves_participe_184)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_marcas_declarado' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_marcas_declarado;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_marcas_declarado(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_marcas_declarado'
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
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_representante,
			id_mae_claves_participe_184,
			es_miembro_31_diciembre,
			es_ejerce_actividad,
			es_erroneo_declarado,
			es_erroneo_dato_ec_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_representante,
			id_mae_claves_participe_184,
			es_miembro_31_diciembre,
			es_ejerce_actividad,
			es_erroneo_declarado,
			es_erroneo_dato_ec_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado AS tbn1_mi_184_dim_marcas_declarado
	USING query ON (query.es_externo_declarado=tbn1_mi_184_dim_marcas_declarado.es_externo_declarado OR (query.es_externo_declarado IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_externo_declarado IS NULL)) AND (query.es_contribuyente_declarado=tbn1_mi_184_dim_marcas_declarado.es_contribuyente_declarado OR (query.es_contribuyente_declarado IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_contribuyente_declarado IS NULL)) AND (query.es_identificado_declarado=tbn1_mi_184_dim_marcas_declarado.es_identificado_declarado OR (query.es_identificado_declarado IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_identificado_declarado IS NULL)) AND (query.sw_identificado_declarado=tbn1_mi_184_dim_marcas_declarado.sw_identificado_declarado OR (query.sw_identificado_declarado IS NULL AND tbn1_mi_184_dim_marcas_declarado.sw_identificado_declarado IS NULL)) AND (query.es_representante=tbn1_mi_184_dim_marcas_declarado.es_representante OR (query.es_representante IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_representante IS NULL)) AND (query.id_mae_claves_participe_184=tbn1_mi_184_dim_marcas_declarado.id_mae_claves_participe_184 OR (query.id_mae_claves_participe_184 IS NULL AND tbn1_mi_184_dim_marcas_declarado.id_mae_claves_participe_184 IS NULL)) AND (query.es_miembro_31_diciembre=tbn1_mi_184_dim_marcas_declarado.es_miembro_31_diciembre OR (query.es_miembro_31_diciembre IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_miembro_31_diciembre IS NULL)) AND (query.es_ejerce_actividad=tbn1_mi_184_dim_marcas_declarado.es_ejerce_actividad OR (query.es_ejerce_actividad IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_ejerce_actividad IS NULL)) AND (query.es_erroneo_declarado=tbn1_mi_184_dim_marcas_declarado.es_erroneo_declarado OR (query.es_erroneo_declarado IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_erroneo_declarado IS NULL)) AND (query.es_erroneo_dato_ec_declarado=tbn1_mi_184_dim_marcas_declarado.es_erroneo_dato_ec_declarado OR (query.es_erroneo_dato_ec_declarado IS NULL AND tbn1_mi_184_dim_marcas_declarado.es_erroneo_dato_ec_declarado IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_representante,id_mae_claves_participe_184,es_miembro_31_diciembre,es_ejerce_actividad,es_erroneo_declarado,es_erroneo_dato_ec_declarado) VALUES (
			query.es_externo_declarado,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.es_representante,
			query.id_mae_claves_participe_184,
			query.es_miembro_31_diciembre,
			query.es_ejerce_actividad,
			query.es_erroneo_declarado,
			query.es_erroneo_dato_ec_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	secuencia int,
	nif_declarado_184 varchar(12),
	nif_declarado_no_identificado varchar(12),
	id_contribuyente_declarado int,
	id_mae_no_id_declarado int,
	CONSTRAINT uk_mi_184_dim_declarados UNIQUE (secuencia,nif_declarado_184,nif_declarado_no_identificado,id_contribuyente_declarado,id_mae_no_id_declarado),
	CONSTRAINT FK_tbn1_mi_184_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_184_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT PK_tbn1_mi_184_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD secuencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='nif_declarado_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD nif_declarado_184 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD id_mae_no_id_declarado int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ALTER COLUMN secuencia int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='nif_declarado_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ALTER COLUMN nif_declarado_184 varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ALTER COLUMN id_contribuyente_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD CONSTRAINT PK_tbn1_mi_184_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD CONSTRAINT FK_tbn1_mi_184_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados ADD CONSTRAINT FK_tbn1_mi_184_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_declarados'
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
			nif_declarado_184,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			id_mae_no_id_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			secuencia,
			nif_declarado_184,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			id_mae_no_id_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados AS tbn1_mi_184_dim_declarados
	USING query ON (query.secuencia=tbn1_mi_184_dim_declarados.secuencia OR (query.secuencia IS NULL AND tbn1_mi_184_dim_declarados.secuencia IS NULL)) AND (query.nif_declarado_184=tbn1_mi_184_dim_declarados.nif_declarado_184 OR (query.nif_declarado_184 IS NULL AND tbn1_mi_184_dim_declarados.nif_declarado_184 IS NULL)) AND (query.nif_declarado_no_identificado=tbn1_mi_184_dim_declarados.nif_declarado_no_identificado OR (query.nif_declarado_no_identificado IS NULL AND tbn1_mi_184_dim_declarados.nif_declarado_no_identificado IS NULL)) AND (query.id_contribuyente_declarado=tbn1_mi_184_dim_declarados.id_contribuyente_declarado OR (query.id_contribuyente_declarado IS NULL AND tbn1_mi_184_dim_declarados.id_contribuyente_declarado IS NULL)) AND (query.id_mae_no_id_declarado=tbn1_mi_184_dim_declarados.id_mae_no_id_declarado OR (query.id_mae_no_id_declarado IS NULL AND tbn1_mi_184_dim_declarados.id_mae_no_id_declarado IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (secuencia,nif_declarado_184,nif_declarado_no_identificado,id_contribuyente_declarado,id_mae_no_id_declarado) VALUES (
			query.secuencia,
			query.nif_declarado_184,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante(
	id_dim_datos_economicos_declarante int IDENTITY(1,1),
	id_mae_claves_184_declarante int,
	id_mae_subclaves_184_declarante int,
	campo_declarante smallint,
	orden_declarante smallint,
	CONSTRAINT uk_mi_184_dim_datos_economicos_declarante UNIQUE (id_mae_claves_184_declarante,id_mae_subclaves_184_declarante,campo_declarante,orden_declarante),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarante_tbn1_mae_claves_184 FOREIGN KEY (id_mae_claves_184_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184(id_mae_claves_184),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarante_tbn1_mae_subclaves_184 FOREIGN KEY (id_mae_subclaves_184_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184(id_mae_subclaves_184),
	CONSTRAINT PK_tbn1_mi_184_dim_datos_economicos_declarante PRIMARY KEY CLUSTERED (id_dim_datos_economicos_declarante)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='id_dim_datos_economicos_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD id_dim_datos_economicos_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='id_mae_claves_184_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD id_mae_claves_184_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='id_mae_subclaves_184_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD id_mae_subclaves_184_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='campo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD campo_declarante smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='orden_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD orden_declarante smallint
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='id_dim_datos_economicos_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ALTER COLUMN id_dim_datos_economicos_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='id_mae_claves_184_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ALTER COLUMN id_mae_claves_184_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='id_mae_subclaves_184_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ALTER COLUMN id_mae_subclaves_184_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='campo_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ALTER COLUMN campo_declarante smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND COLUMN_NAME='orden_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ALTER COLUMN orden_declarante smallint NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_datos_economicos_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD CONSTRAINT PK_tbn1_mi_184_dim_datos_economicos_declarante PRIMARY KEY CLUSTERED (id_dim_datos_economicos_declarante)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_economicos_declarante_tbn1_mae_claves_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarante_tbn1_mae_claves_184 FOREIGN KEY (id_mae_claves_184_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184(id_mae_claves_184)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarante' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_economicos_declarante_tbn1_mae_subclaves_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarante_tbn1_mae_subclaves_184 FOREIGN KEY (id_mae_subclaves_184_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184(id_mae_subclaves_184)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_datos_economicos_declarante' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_economicos_declarante;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_economicos_declarante(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_economicos_declarante'
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
			id_mae_claves_184_declarante,
			id_mae_subclaves_184_declarante,
			campo_declarante,
			orden_declarante
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_claves_184_declarante,
			id_mae_subclaves_184_declarante,
			campo_declarante,
			orden_declarante
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante AS tbn1_mi_184_dim_datos_economicos_declarante
	USING query ON (query.id_mae_claves_184_declarante=tbn1_mi_184_dim_datos_economicos_declarante.id_mae_claves_184_declarante OR (query.id_mae_claves_184_declarante IS NULL AND tbn1_mi_184_dim_datos_economicos_declarante.id_mae_claves_184_declarante IS NULL)) AND (query.id_mae_subclaves_184_declarante=tbn1_mi_184_dim_datos_economicos_declarante.id_mae_subclaves_184_declarante OR (query.id_mae_subclaves_184_declarante IS NULL AND tbn1_mi_184_dim_datos_economicos_declarante.id_mae_subclaves_184_declarante IS NULL)) AND (query.campo_declarante=tbn1_mi_184_dim_datos_economicos_declarante.campo_declarante OR (query.campo_declarante IS NULL AND tbn1_mi_184_dim_datos_economicos_declarante.campo_declarante IS NULL)) AND (query.orden_declarante=tbn1_mi_184_dim_datos_economicos_declarante.orden_declarante OR (query.orden_declarante IS NULL AND tbn1_mi_184_dim_datos_economicos_declarante.orden_declarante IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (id_mae_claves_184_declarante,id_mae_subclaves_184_declarante,campo_declarante,orden_declarante) VALUES (
			query.id_mae_claves_184_declarante,
			query.id_mae_subclaves_184_declarante,
			query.campo_declarante,
			query.orden_declarante)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado(
	id_dim_datos_economicos_declarado int IDENTITY(1,1),
	id_mae_claves_184_declarado int,
	id_mae_subclaves_184_declarado int,
	campo_declarado smallint,
	orden_declarado smallint,
	CONSTRAINT uk_mi_184_dim_datos_economicos_declarado UNIQUE (id_mae_claves_184_declarado,id_mae_subclaves_184_declarado,campo_declarado,orden_declarado),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarado_tbn1_mae_claves_184 FOREIGN KEY (id_mae_claves_184_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184(id_mae_claves_184),
	CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarado_tbn1_mae_subclaves_184 FOREIGN KEY (id_mae_subclaves_184_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184(id_mae_subclaves_184),
	CONSTRAINT PK_tbn1_mi_184_dim_datos_economicos_declarado PRIMARY KEY CLUSTERED (id_dim_datos_economicos_declarado)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='id_dim_datos_economicos_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD id_dim_datos_economicos_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='id_mae_claves_184_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD id_mae_claves_184_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='id_mae_subclaves_184_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD id_mae_subclaves_184_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='campo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD campo_declarado smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='orden_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD orden_declarado smallint
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='id_dim_datos_economicos_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ALTER COLUMN id_dim_datos_economicos_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='id_mae_claves_184_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ALTER COLUMN id_mae_claves_184_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='id_mae_subclaves_184_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ALTER COLUMN id_mae_subclaves_184_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='campo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ALTER COLUMN campo_declarado smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND COLUMN_NAME='orden_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ALTER COLUMN orden_declarado smallint NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND CONSTRAINT_NAME='PK_tbn1_mi_184_dim_datos_economicos_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD CONSTRAINT PK_tbn1_mi_184_dim_datos_economicos_declarado PRIMARY KEY CLUSTERED (id_dim_datos_economicos_declarado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_economicos_declarado_tbn1_mae_claves_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarado_tbn1_mae_claves_184 FOREIGN KEY (id_mae_claves_184_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184(id_mae_claves_184)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_dim_datos_economicos_declarado' AND CONSTRAINT_NAME='FK_tbn1_mi_184_dim_datos_economicos_declarado_tbn1_mae_subclaves_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado ADD CONSTRAINT FK_tbn1_mi_184_dim_datos_economicos_declarado_tbn1_mae_subclaves_184 FOREIGN KEY (id_mae_subclaves_184_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184(id_mae_subclaves_184)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_dim_datos_economicos_declarado' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_economicos_declarado;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_dim_datos_economicos_declarado(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_economicos_declarado'
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
			id_mae_claves_184_declarado,
			id_mae_subclaves_184_declarado,
			campo_declarado,
			orden_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_claves_184_declarado,
			id_mae_subclaves_184_declarado,
			campo_declarado,
			orden_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado AS tbn1_mi_184_dim_datos_economicos_declarado
	USING query ON (query.id_mae_claves_184_declarado=tbn1_mi_184_dim_datos_economicos_declarado.id_mae_claves_184_declarado OR (query.id_mae_claves_184_declarado IS NULL AND tbn1_mi_184_dim_datos_economicos_declarado.id_mae_claves_184_declarado IS NULL)) AND (query.id_mae_subclaves_184_declarado=tbn1_mi_184_dim_datos_economicos_declarado.id_mae_subclaves_184_declarado OR (query.id_mae_subclaves_184_declarado IS NULL AND tbn1_mi_184_dim_datos_economicos_declarado.id_mae_subclaves_184_declarado IS NULL)) AND (query.campo_declarado=tbn1_mi_184_dim_datos_economicos_declarado.campo_declarado OR (query.campo_declarado IS NULL AND tbn1_mi_184_dim_datos_economicos_declarado.campo_declarado IS NULL)) AND (query.orden_declarado=tbn1_mi_184_dim_datos_economicos_declarado.orden_declarado OR (query.orden_declarado IS NULL AND tbn1_mi_184_dim_datos_economicos_declarado.orden_declarado IS NULL))
	WHEN NOT MATCHED THEN
		INSERT (id_mae_claves_184_declarado,id_mae_subclaves_184_declarado,campo_declarado,orden_declarado) VALUES (
			query.id_mae_claves_184_declarado,
			query.id_mae_subclaves_184_declarado,
			query.campo_declarado,
			query.orden_declarado)
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

