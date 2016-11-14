PRINT 'dimensional_mi_720_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_720_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_720_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_720_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_720_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ADD CONSTRAINT PK_tbn1_mi_720_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ADD CONSTRAINT FK_tbn1_mi_720_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos ADD CONSTRAINT FK_tbn1_mi_720_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_documentos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos AS tbn1_mi_720_dim_documentos
	USING query ON query.id_documento=tbn1_mi_720_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_720_dim_documentos.id_expediente
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	id_mae_no_id_declarante int NOT NULL,
	nif_declarante_720 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	telefono varchar(10) NOT NULL,
	persona_relacionarse varchar(40) NOT NULL,
	CONSTRAINT uk_mi_720_dim_declarantes UNIQUE (id_mae_no_id_declarante,nif_declarante_720,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,persona_relacionarse),
	CONSTRAINT FK_tbn1_mi_720_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_720_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_720_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='nif_declarante_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD nif_declarante_720 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='persona_relacionarse')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD persona_relacionarse varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='nif_declarante_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN nif_declarante_720 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND COLUMN_NAME='persona_relacionarse' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ALTER COLUMN persona_relacionarse varchar(40) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_720_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_720_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_720_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_declarantes'
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
			id_mae_no_id_declarante,
			nif_declarante_720,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			telefono,
			persona_relacionarse
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarante,
			nif_declarante_720,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			telefono,
			persona_relacionarse
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes AS tbn1_mi_720_dim_declarantes
	USING query ON query.id_mae_no_id_declarante=tbn1_mi_720_dim_declarantes.id_mae_no_id_declarante AND query.nif_declarante_720=tbn1_mi_720_dim_declarantes.nif_declarante_720 AND query.nif_declarante_no_identificado=tbn1_mi_720_dim_declarantes.nif_declarante_no_identificado AND query.id_contribuyente_declarante=tbn1_mi_720_dim_declarantes.id_contribuyente_declarante AND query.telefono=tbn1_mi_720_dim_declarantes.telefono AND query.persona_relacionarse=tbn1_mi_720_dim_declarantes.persona_relacionarse
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarante,nif_declarante_720,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,persona_relacionarse) VALUES (
			query.id_mae_no_id_declarante,
			query.nif_declarante_720,
			query.nif_declarante_no_identificado,
			query.id_contribuyente_declarante,
			query.telefono,
			query.persona_relacionarse)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	id_mae_no_id_declarado int NOT NULL,
	secuencia int NOT NULL,
	nif_declarado_720 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	id_mae_claves_titularidad int NOT NULL,
	otra_titularidad varchar(25) NOT NULL,
	CONSTRAINT uk_mi_720_dim_declarados UNIQUE (id_mae_no_id_declarado,secuencia,nif_declarado_720,nif_declarado_no_identificado,id_contribuyente_declarado,id_mae_claves_titularidad,otra_titularidad),
	CONSTRAINT FK_tbn1_mi_720_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_720_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_720_dim_declarados_tbn1_mae_claves_titularidad FOREIGN KEY (id_mae_claves_titularidad) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad(id_mae_claves_titularidad),
	CONSTRAINT PK_tbn1_mi_720_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD secuencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='nif_declarado_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD nif_declarado_720 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_mae_claves_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD id_mae_claves_titularidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='otra_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD otra_titularidad varchar(25)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN secuencia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='nif_declarado_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN nif_declarado_720 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='id_mae_claves_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN id_mae_claves_titularidad int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND COLUMN_NAME='otra_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ALTER COLUMN otra_titularidad varchar(25) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD CONSTRAINT PK_tbn1_mi_720_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD CONSTRAINT FK_tbn1_mi_720_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD CONSTRAINT FK_tbn1_mi_720_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_declarados_tbn1_mae_claves_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados ADD CONSTRAINT FK_tbn1_mi_720_dim_declarados_tbn1_mae_claves_titularidad FOREIGN KEY (id_mae_claves_titularidad) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad(id_mae_claves_titularidad)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_declarados'
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
			id_mae_no_id_declarado,
			secuencia,
			nif_declarado_720,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			id_mae_claves_titularidad,
			otra_titularidad
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarado,
			secuencia,
			nif_declarado_720,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			id_mae_claves_titularidad,
			otra_titularidad
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados AS tbn1_mi_720_dim_declarados
	USING query ON query.id_mae_no_id_declarado=tbn1_mi_720_dim_declarados.id_mae_no_id_declarado AND query.secuencia=tbn1_mi_720_dim_declarados.secuencia AND query.nif_declarado_720=tbn1_mi_720_dim_declarados.nif_declarado_720 AND query.nif_declarado_no_identificado=tbn1_mi_720_dim_declarados.nif_declarado_no_identificado AND query.id_contribuyente_declarado=tbn1_mi_720_dim_declarados.id_contribuyente_declarado AND query.id_mae_claves_titularidad=tbn1_mi_720_dim_declarados.id_mae_claves_titularidad AND query.otra_titularidad=tbn1_mi_720_dim_declarados.otra_titularidad
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarado,secuencia,nif_declarado_720,nif_declarado_no_identificado,id_contribuyente_declarado,id_mae_claves_titularidad,otra_titularidad) VALUES (
			query.id_mae_no_id_declarado,
			query.secuencia,
			query.nif_declarado_720,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado,
			query.id_mae_claves_titularidad,
			query.otra_titularidad)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	fecha_alta date NOT NULL,
	mes_alta int NOT NULL,
	anyo_alta int NOT NULL,
	fecha_incorporacion date NOT NULL,
	mes_incorporacion int NOT NULL,
	anyo_incorporacion int NOT NULL,
	fecha_extincion date NOT NULL,
	mes_extincion int NOT NULL,
	anyo_extincion int NOT NULL,
	CONSTRAINT uk_mi_720_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta,fecha_incorporacion,mes_incorporacion,anyo_incorporacion,fecha_extincion,mes_extincion,anyo_extincion),
	CONSTRAINT PK_tbn1_mi_720_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_incorporacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD fecha_incorporacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_incorporacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD mes_incorporacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_incorporacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD anyo_incorporacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_extincion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD fecha_extincion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_extincion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD mes_extincion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_extincion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD anyo_extincion int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_incorporacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN fecha_incorporacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_incorporacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN mes_incorporacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_incorporacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN anyo_incorporacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='fecha_extincion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN fecha_extincion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='mes_extincion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN mes_extincion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND COLUMN_NAME='anyo_extincion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ALTER COLUMN anyo_extincion int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos ADD CONSTRAINT PK_tbn1_mi_720_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_periodos'
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
			anyo_alta,
			fecha_incorporacion,
			mes_incorporacion,
			anyo_incorporacion,
			fecha_extincion,
			mes_extincion,
			anyo_extincion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_alta,
			mes_alta,
			anyo_alta,
			fecha_incorporacion,
			mes_incorporacion,
			anyo_incorporacion,
			fecha_extincion,
			mes_extincion,
			anyo_extincion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos AS tbn1_mi_720_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_720_dim_periodos.ejercicio AND query.fecha_presentacion=tbn1_mi_720_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_720_dim_periodos.mes_presentacion AND query.anyo_presentacion=tbn1_mi_720_dim_periodos.anyo_presentacion AND query.fecha_alta=tbn1_mi_720_dim_periodos.fecha_alta AND query.mes_alta=tbn1_mi_720_dim_periodos.mes_alta AND query.anyo_alta=tbn1_mi_720_dim_periodos.anyo_alta AND query.fecha_incorporacion=tbn1_mi_720_dim_periodos.fecha_incorporacion AND query.mes_incorporacion=tbn1_mi_720_dim_periodos.mes_incorporacion AND query.anyo_incorporacion=tbn1_mi_720_dim_periodos.anyo_incorporacion AND query.fecha_extincion=tbn1_mi_720_dim_periodos.fecha_extincion AND query.mes_extincion=tbn1_mi_720_dim_periodos.mes_extincion AND query.anyo_extincion=tbn1_mi_720_dim_periodos.anyo_extincion
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta,fecha_incorporacion,mes_incorporacion,anyo_incorporacion,fecha_extincion,mes_extincion,anyo_extincion) VALUES (
			query.ejercicio,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.fecha_alta,
			query.mes_alta,
			query.anyo_alta,
			query.fecha_incorporacion,
			query.mes_incorporacion,
			query.anyo_incorporacion,
			query.fecha_extincion,
			query.mes_extincion,
			query.anyo_extincion)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	id_mae_entidades_bancarias int NOT NULL,
	id_tipo_soporte int NOT NULL,
	id_tipo_declaracion int NOT NULL,
	regimen_fiscal_deducciones varchar(1) NOT NULL,
	CONSTRAINT uk_mi_720_dim_datos_caratula UNIQUE (modelo,administracion_declarante,id_mae_entidades_bancarias,id_tipo_soporte,id_tipo_declaracion,regimen_fiscal_deducciones),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_caratula_tbn1_mae_entidades_bancarias FOREIGN KEY (id_mae_entidades_bancarias) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(id_mae_entidades_bancarias),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_caratula_tbn1_dim_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(id_tipo_soporte),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT PK_tbn1_mi_720_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_mae_entidades_bancarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD id_mae_entidades_bancarias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD regimen_fiscal_deducciones varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN modelo varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_mae_entidades_bancarias' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN id_mae_entidades_bancarias int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_720_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_caratula_tbn1_mae_entidades_bancarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_caratula_tbn1_mae_entidades_bancarias FOREIGN KEY (id_mae_entidades_bancarias) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias(id_mae_entidades_bancarias)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_caratula_tbn1_dim_mi_tipos_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_caratula_tbn1_dim_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(id_tipo_soporte)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_caratula'
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
			administracion_declarante,
			id_mae_entidades_bancarias,
			id_tipo_soporte,
			id_tipo_declaracion,
			regimen_fiscal_deducciones
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo,
			administracion_declarante,
			id_mae_entidades_bancarias,
			id_tipo_soporte,
			id_tipo_declaracion,
			regimen_fiscal_deducciones
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula AS tbn1_mi_720_dim_datos_caratula
	USING query ON query.modelo=tbn1_mi_720_dim_datos_caratula.modelo AND query.administracion_declarante=tbn1_mi_720_dim_datos_caratula.administracion_declarante AND query.id_mae_entidades_bancarias=tbn1_mi_720_dim_datos_caratula.id_mae_entidades_bancarias AND query.id_tipo_soporte=tbn1_mi_720_dim_datos_caratula.id_tipo_soporte AND query.id_tipo_declaracion=tbn1_mi_720_dim_datos_caratula.id_tipo_declaracion AND query.regimen_fiscal_deducciones=tbn1_mi_720_dim_datos_caratula.regimen_fiscal_deducciones
	WHEN NOT MATCHED THEN
		INSERT (modelo,administracion_declarante,id_mae_entidades_bancarias,id_tipo_soporte,id_tipo_declaracion,regimen_fiscal_deducciones) VALUES (
			query.modelo,
			query.administracion_declarante,
			query.id_mae_entidades_bancarias,
			query.id_tipo_soporte,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_externo_declarante bit NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	es_externo_declarado bit NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	CONSTRAINT uk_mi_720_dim_marcas UNIQUE (es_externo_declarante,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado),
	CONSTRAINT PK_tbn1_mi_720_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD sw_identificado_declarado varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas ADD CONSTRAINT PK_tbn1_mi_720_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_marcas'
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
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_externo_declarante,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas AS tbn1_mi_720_dim_marcas
	USING query ON query.es_externo_declarante=tbn1_mi_720_dim_marcas.es_externo_declarante AND query.es_contribuyente_declarante=tbn1_mi_720_dim_marcas.es_contribuyente_declarante AND query.es_identificado_declarante=tbn1_mi_720_dim_marcas.es_identificado_declarante AND query.sw_identificado_declarante=tbn1_mi_720_dim_marcas.sw_identificado_declarante AND query.es_externo_declarado=tbn1_mi_720_dim_marcas.es_externo_declarado AND query.es_contribuyente_declarado=tbn1_mi_720_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_720_dim_marcas.es_identificado_declarado AND query.sw_identificado_declarado=tbn1_mi_720_dim_marcas.sw_identificado_declarado
	WHEN NOT MATCHED THEN
		INSERT (es_externo_declarante,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado) VALUES (
			query.es_externo_declarante,
			query.es_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.es_externo_declarado,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1(
	id_dim_datos_detalle_1 int IDENTITY(1,1),
	administracion_declarado varchar(1) NOT NULL,
	id_mae_claves_bienes_720 int NOT NULL,
	id_mae_subclaves_bienes_720 int NOT NULL,
	id_pais int NOT NULL,
	nombre_entidad varchar(41) NOT NULL,
	nif_entidad varchar(20) NOT NULL,
	id_mae_origenes_bienes_720 int NOT NULL,
	CONSTRAINT uk_mi_720_dim_datos_detalle_1 UNIQUE (administracion_declarado,id_mae_claves_bienes_720,id_mae_subclaves_bienes_720,id_pais,nombre_entidad,nif_entidad,id_mae_origenes_bienes_720),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_claves_bienes_720 FOREIGN KEY (id_mae_claves_bienes_720) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720(id_mae_claves_bienes_720),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_subclaves_bienes_720 FOREIGN KEY (id_mae_subclaves_bienes_720) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_bienes_720(id_mae_subclaves_bienes_720),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_origenes_bienes_720 FOREIGN KEY (id_mae_origenes_bienes_720) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720(id_mae_origenes_bienes_720),
	CONSTRAINT PK_tbn1_mi_720_dim_datos_detalle_1 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_1)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD id_dim_datos_detalle_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_claves_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD id_mae_claves_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_subclaves_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD id_mae_subclaves_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='nombre_entidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD nombre_entidad varchar(41)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='nif_entidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD nif_entidad varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_origenes_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD id_mae_origenes_bienes_720 int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_dim_datos_detalle_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN id_dim_datos_detalle_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_claves_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN id_mae_claves_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_subclaves_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN id_mae_subclaves_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='nombre_entidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN nombre_entidad varchar(41) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='nif_entidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN nif_entidad varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND COLUMN_NAME='id_mae_origenes_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ALTER COLUMN id_mae_origenes_bienes_720 int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD CONSTRAINT PK_tbn1_mi_720_dim_datos_detalle_1 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_claves_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_claves_bienes_720 FOREIGN KEY (id_mae_claves_bienes_720) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720(id_mae_claves_bienes_720)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_subclaves_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_subclaves_bienes_720 FOREIGN KEY (id_mae_subclaves_bienes_720) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_bienes_720(id_mae_subclaves_bienes_720)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_1' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_origenes_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_1_tbn1_mae_origenes_bienes_720 FOREIGN KEY (id_mae_origenes_bienes_720) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720(id_mae_origenes_bienes_720)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_datos_detalle_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_datos_detalle_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_datos_detalle_1(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_detalle_1'
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
			administracion_declarado,
			id_mae_claves_bienes_720,
			id_mae_subclaves_bienes_720,
			id_pais,
			nombre_entidad,
			nif_entidad,
			id_mae_origenes_bienes_720
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			administracion_declarado,
			id_mae_claves_bienes_720,
			id_mae_subclaves_bienes_720,
			id_pais,
			nombre_entidad,
			nif_entidad,
			id_mae_origenes_bienes_720
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 AS tbn1_mi_720_dim_datos_detalle_1
	USING query ON query.administracion_declarado=tbn1_mi_720_dim_datos_detalle_1.administracion_declarado AND query.id_mae_claves_bienes_720=tbn1_mi_720_dim_datos_detalle_1.id_mae_claves_bienes_720 AND query.id_mae_subclaves_bienes_720=tbn1_mi_720_dim_datos_detalle_1.id_mae_subclaves_bienes_720 AND query.id_pais=tbn1_mi_720_dim_datos_detalle_1.id_pais AND query.nombre_entidad=tbn1_mi_720_dim_datos_detalle_1.nombre_entidad AND query.nif_entidad=tbn1_mi_720_dim_datos_detalle_1.nif_entidad AND query.id_mae_origenes_bienes_720=tbn1_mi_720_dim_datos_detalle_1.id_mae_origenes_bienes_720
	WHEN NOT MATCHED THEN
		INSERT (administracion_declarado,id_mae_claves_bienes_720,id_mae_subclaves_bienes_720,id_pais,nombre_entidad,nif_entidad,id_mae_origenes_bienes_720) VALUES (
			query.administracion_declarado,
			query.id_mae_claves_bienes_720,
			query.id_mae_subclaves_bienes_720,
			query.id_pais,
			query.nombre_entidad,
			query.nif_entidad,
			query.id_mae_origenes_bienes_720)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2(
	id_dim_datos_detalle_2 int IDENTITY(1,1),
	desc_bien varchar(25) NOT NULL,
	id_mae_claves_tipos_bienes_muebles_inmuebles int NOT NULL,
	id_pais_registro_bien int NOT NULL,
	registro_matricula varchar(18) NOT NULL,
	id_mae_claves_cuenta int NOT NULL,
	cod_intenacional_bancario varchar(11) NOT NULL,
	cuenta varchar(34) NOT NULL,
	id_mae_claves_identificacion_valor_accion int NOT NULL,
	identificacion_valor_accion varchar(12) NOT NULL,
	id_clave_representacion int NOT NULL,
	CONSTRAINT uk_mi_720_dim_datos_detalle_2 UNIQUE (desc_bien,id_mae_claves_tipos_bienes_muebles_inmuebles,id_pais_registro_bien,registro_matricula,id_mae_claves_cuenta,cod_intenacional_bancario,cuenta,id_mae_claves_identificacion_valor_accion,identificacion_valor_accion,id_clave_representacion),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_tipos_bienes_muebles_inmuebles FOREIGN KEY (id_mae_claves_tipos_bienes_muebles_inmuebles) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles(id_mae_claves_tipos_bienes_muebles_inmuebles),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_dim_paises FOREIGN KEY (id_pais_registro_bien) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_cuenta FOREIGN KEY (id_mae_claves_cuenta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta(id_mae_claves_cuenta),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_identificacion_valor_accion FOREIGN KEY (id_mae_claves_identificacion_valor_accion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion(id_mae_claves_identificacion_valor_accion),
	CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_dim_mi_claves_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion(id_clave_representacion),
	CONSTRAINT PK_tbn1_mi_720_dim_datos_detalle_2 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_2)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD id_dim_datos_detalle_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='desc_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD desc_bien varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_mae_claves_tipos_bienes_muebles_inmuebles')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD id_mae_claves_tipos_bienes_muebles_inmuebles int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_pais_registro_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD id_pais_registro_bien int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='registro_matricula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD registro_matricula varchar(18)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_mae_claves_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD id_mae_claves_cuenta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='cod_intenacional_bancario')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD cod_intenacional_bancario varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD cuenta varchar(34)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_mae_claves_identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD id_mae_claves_identificacion_valor_accion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD identificacion_valor_accion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD id_clave_representacion int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_dim_datos_detalle_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN id_dim_datos_detalle_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='desc_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN desc_bien varchar(25) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_mae_claves_tipos_bienes_muebles_inmuebles' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN id_mae_claves_tipos_bienes_muebles_inmuebles int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_pais_registro_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN id_pais_registro_bien int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='registro_matricula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN registro_matricula varchar(18) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_mae_claves_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN id_mae_claves_cuenta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='cod_intenacional_bancario' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN cod_intenacional_bancario varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN cuenta varchar(34) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_mae_claves_identificacion_valor_accion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN id_mae_claves_identificacion_valor_accion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='identificacion_valor_accion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN identificacion_valor_accion varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND COLUMN_NAME='id_clave_representacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ALTER COLUMN id_clave_representacion int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND CONSTRAINT_NAME='PK_tbn1_mi_720_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD CONSTRAINT PK_tbn1_mi_720_dim_datos_detalle_2 PRIMARY KEY CLUSTERED (id_dim_datos_detalle_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_tipos_bienes_muebles_inmuebles')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_tipos_bienes_muebles_inmuebles FOREIGN KEY (id_mae_claves_tipos_bienes_muebles_inmuebles) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles(id_mae_claves_tipos_bienes_muebles_inmuebles)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_dim_paises')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_dim_paises FOREIGN KEY (id_pais_registro_bien) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_cuenta FOREIGN KEY (id_mae_claves_cuenta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta(id_mae_claves_cuenta)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_mae_claves_identificacion_valor_accion FOREIGN KEY (id_mae_claves_identificacion_valor_accion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion(id_mae_claves_identificacion_valor_accion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_dim_datos_detalle_2' AND CONSTRAINT_NAME='FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_dim_mi_claves_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 ADD CONSTRAINT FK_tbn1_mi_720_dim_datos_detalle_2_tbn1_dim_mi_claves_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion(id_clave_representacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_dim_datos_detalle_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_dim_datos_detalle_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_dim_datos_detalle_2(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_detalle_2'
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
			desc_bien,
			id_mae_claves_tipos_bienes_muebles_inmuebles,
			id_pais_registro_bien,
			registro_matricula,
			id_mae_claves_cuenta,
			cod_intenacional_bancario,
			cuenta,
			id_mae_claves_identificacion_valor_accion,
			identificacion_valor_accion,
			id_clave_representacion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			desc_bien,
			id_mae_claves_tipos_bienes_muebles_inmuebles,
			id_pais_registro_bien,
			registro_matricula,
			id_mae_claves_cuenta,
			cod_intenacional_bancario,
			cuenta,
			id_mae_claves_identificacion_valor_accion,
			identificacion_valor_accion,
			id_clave_representacion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 AS tbn1_mi_720_dim_datos_detalle_2
	USING query ON query.desc_bien=tbn1_mi_720_dim_datos_detalle_2.desc_bien AND query.id_mae_claves_tipos_bienes_muebles_inmuebles=tbn1_mi_720_dim_datos_detalle_2.id_mae_claves_tipos_bienes_muebles_inmuebles AND query.id_pais_registro_bien=tbn1_mi_720_dim_datos_detalle_2.id_pais_registro_bien AND query.registro_matricula=tbn1_mi_720_dim_datos_detalle_2.registro_matricula AND query.id_mae_claves_cuenta=tbn1_mi_720_dim_datos_detalle_2.id_mae_claves_cuenta AND query.cod_intenacional_bancario=tbn1_mi_720_dim_datos_detalle_2.cod_intenacional_bancario AND query.cuenta=tbn1_mi_720_dim_datos_detalle_2.cuenta AND query.id_mae_claves_identificacion_valor_accion=tbn1_mi_720_dim_datos_detalle_2.id_mae_claves_identificacion_valor_accion AND query.identificacion_valor_accion=tbn1_mi_720_dim_datos_detalle_2.identificacion_valor_accion AND query.id_clave_representacion=tbn1_mi_720_dim_datos_detalle_2.id_clave_representacion
	WHEN NOT MATCHED THEN
		INSERT (desc_bien,id_mae_claves_tipos_bienes_muebles_inmuebles,id_pais_registro_bien,registro_matricula,id_mae_claves_cuenta,cod_intenacional_bancario,cuenta,id_mae_claves_identificacion_valor_accion,identificacion_valor_accion,id_clave_representacion) VALUES (
			query.desc_bien,
			query.id_mae_claves_tipos_bienes_muebles_inmuebles,
			query.id_pais_registro_bien,
			query.registro_matricula,
			query.id_mae_claves_cuenta,
			query.cod_intenacional_bancario,
			query.cuenta,
			query.id_mae_claves_identificacion_valor_accion,
			query.identificacion_valor_accion,
			query.id_clave_representacion)
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

