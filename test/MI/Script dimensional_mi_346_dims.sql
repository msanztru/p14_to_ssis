PRINT 'dimensional_mi_346_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_346_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_346_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_346_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_346_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ADD CONSTRAINT PK_tbn1_mi_346_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ADD CONSTRAINT FK_tbn1_mi_346_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos ADD CONSTRAINT FK_tbn1_mi_346_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_documentos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_documentos AS tbn1_mi_346_dim_documentos
	USING query ON query.id_documento=tbn1_mi_346_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_346_dim_documentos.id_expediente
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	id_mae_no_id_declarante int NOT NULL,
	nif_declarante_346 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	CONSTRAINT uk_mi_346_dim_declarantes UNIQUE (id_mae_no_id_declarante,nif_declarante_346,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo),
	CONSTRAINT FK_tbn1_mi_346_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_346_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_346_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='nif_declarante_346')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD nif_declarante_346 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD cod_presentador_colectivo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='nif_declarante_346' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN nif_declarante_346 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_346_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_346_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_346_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_declarantes'
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
			nif_declarante_346,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarante,
			nif_declarante_346,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarantes AS tbn1_mi_346_dim_declarantes
	USING query ON query.id_mae_no_id_declarante=tbn1_mi_346_dim_declarantes.id_mae_no_id_declarante AND query.nif_declarante_346=tbn1_mi_346_dim_declarantes.nif_declarante_346 AND query.nif_declarante_no_identificado=tbn1_mi_346_dim_declarantes.nif_declarante_no_identificado AND query.id_contribuyente_declarante=tbn1_mi_346_dim_declarantes.id_contribuyente_declarante AND query.telefono=tbn1_mi_346_dim_declarantes.telefono AND query.razon_social=tbn1_mi_346_dim_declarantes.razon_social AND query.cod_presentador_colectivo=tbn1_mi_346_dim_declarantes.cod_presentador_colectivo
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarante,nif_declarante_346,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo) VALUES (
			query.id_mae_no_id_declarante,
			query.nif_declarante_346,
			query.nif_declarante_no_identificado,
			query.id_contribuyente_declarante,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	id_mae_no_id_declarado int NOT NULL,
	secuencia varchar(9) NOT NULL,
	nif_declarado_346 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	CONSTRAINT uk_mi_346_dim_declarados UNIQUE (id_mae_no_id_declarado,secuencia,nif_declarado_346,nif_declarado_no_identificado,id_contribuyente_declarado),
	CONSTRAINT FK_tbn1_mi_346_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_346_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_346_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='nif_declarado_346')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD nif_declarado_346 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD id_contribuyente_declarado int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ALTER COLUMN secuencia varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='nif_declarado_346' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ALTER COLUMN nif_declarado_346 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD CONSTRAINT PK_tbn1_mi_346_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD CONSTRAINT FK_tbn1_mi_346_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados ADD CONSTRAINT FK_tbn1_mi_346_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_declarados'
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
			nif_declarado_346,
			nif_declarado_no_identificado,
			id_contribuyente_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarado,
			secuencia,
			nif_declarado_346,
			nif_declarado_no_identificado,
			id_contribuyente_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_declarados AS tbn1_mi_346_dim_declarados
	USING query ON query.id_mae_no_id_declarado=tbn1_mi_346_dim_declarados.id_mae_no_id_declarado AND query.secuencia=tbn1_mi_346_dim_declarados.secuencia AND query.nif_declarado_346=tbn1_mi_346_dim_declarados.nif_declarado_346 AND query.nif_declarado_no_identificado=tbn1_mi_346_dim_declarados.nif_declarado_no_identificado AND query.id_contribuyente_declarado=tbn1_mi_346_dim_declarados.id_contribuyente_declarado
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarado,secuencia,nif_declarado_346,nif_declarado_no_identificado,id_contribuyente_declarado) VALUES (
			query.id_mae_no_id_declarado,
			query.secuencia,
			query.nif_declarado_346,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	fecha_alta date NOT NULL,
	mes_alta int NOT NULL,
	anyo_alta int NOT NULL,
	CONSTRAINT uk_mi_346_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta),
	CONSTRAINT PK_tbn1_mi_346_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD anyo_alta int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ALTER COLUMN anyo_alta int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos ADD CONSTRAINT PK_tbn1_mi_346_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_periodos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
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
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_periodos AS tbn1_mi_346_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_346_dim_periodos.ejercicio AND query.fecha_presentacion=tbn1_mi_346_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_346_dim_periodos.mes_presentacion AND query.anyo_presentacion=tbn1_mi_346_dim_periodos.anyo_presentacion AND query.fecha_alta=tbn1_mi_346_dim_periodos.fecha_alta AND query.mes_alta=tbn1_mi_346_dim_periodos.mes_alta AND query.anyo_alta=tbn1_mi_346_dim_periodos.anyo_alta
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	cod_banco_espania varchar(4) NOT NULL,
	id_tipo_soporte int NOT NULL,
	id_tipo_declaracion int NOT NULL,
	regimen_fiscal_deducciones varchar(1) NOT NULL,
	CONSTRAINT uk_mi_346_dim_datos_caratula UNIQUE (modelo,administracion_declarante,cod_banco_espania,id_tipo_soporte,id_tipo_declaracion,regimen_fiscal_deducciones),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_caratula_tbn1_dim_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(id_tipo_soporte),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT PK_tbn1_mi_346_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD cod_banco_espania varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD regimen_fiscal_deducciones varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN modelo varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN cod_banco_espania varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_346_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_caratula_tbn1_dim_mi_tipos_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_caratula_tbn1_dim_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(id_tipo_soporte)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_datos_caratula'
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
			cod_banco_espania,
			id_tipo_soporte,
			id_tipo_declaracion,
			regimen_fiscal_deducciones
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo,
			administracion_declarante,
			cod_banco_espania,
			id_tipo_soporte,
			id_tipo_declaracion,
			regimen_fiscal_deducciones
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_caratula AS tbn1_mi_346_dim_datos_caratula
	USING query ON query.modelo=tbn1_mi_346_dim_datos_caratula.modelo AND query.administracion_declarante=tbn1_mi_346_dim_datos_caratula.administracion_declarante AND query.cod_banco_espania=tbn1_mi_346_dim_datos_caratula.cod_banco_espania AND query.id_tipo_soporte=tbn1_mi_346_dim_datos_caratula.id_tipo_soporte AND query.id_tipo_declaracion=tbn1_mi_346_dim_datos_caratula.id_tipo_declaracion AND query.regimen_fiscal_deducciones=tbn1_mi_346_dim_datos_caratula.regimen_fiscal_deducciones
	WHEN NOT MATCHED THEN
		INSERT (modelo,administracion_declarante,cod_banco_espania,id_tipo_soporte,id_tipo_declaracion,regimen_fiscal_deducciones) VALUES (
			query.modelo,
			query.administracion_declarante,
			query.cod_banco_espania,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_externo_declarante bit NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	es_externo_declarado bit NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	es_erroneo bit NOT NULL,
	CONSTRAINT uk_mi_346_dim_marcas UNIQUE (es_externo_declarante,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_erroneo),
	CONSTRAINT PK_tbn1_mi_346_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD es_erroneo bit
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ALTER COLUMN es_erroneo bit NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas ADD CONSTRAINT PK_tbn1_mi_346_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_marcas'
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
			sw_identificado_declarado,
			es_erroneo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			es_externo_declarante,
			es_contribuyente_declarante,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_erroneo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_marcas AS tbn1_mi_346_dim_marcas
	USING query ON query.es_externo_declarante=tbn1_mi_346_dim_marcas.es_externo_declarante AND query.es_contribuyente_declarante=tbn1_mi_346_dim_marcas.es_contribuyente_declarante AND query.es_identificado_declarante=tbn1_mi_346_dim_marcas.es_identificado_declarante AND query.sw_identificado_declarante=tbn1_mi_346_dim_marcas.sw_identificado_declarante AND query.es_externo_declarado=tbn1_mi_346_dim_marcas.es_externo_declarado AND query.es_contribuyente_declarado=tbn1_mi_346_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_346_dim_marcas.es_identificado_declarado AND query.sw_identificado_declarado=tbn1_mi_346_dim_marcas.sw_identificado_declarado AND query.es_erroneo=tbn1_mi_346_dim_marcas.es_erroneo
	WHEN NOT MATCHED THEN
		INSERT (es_externo_declarante,es_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_erroneo) VALUES (
			query.es_externo_declarante,
			query.es_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.es_externo_declarado,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.es_erroneo)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	administracion_declarado varchar(1) NOT NULL,
	id_provincia int NOT NULL,
	id_clave_percepcion int NOT NULL,
	id_tipo_percepcion int NOT NULL,
	ejercicio_devengo varchar(4) NOT NULL,
	concepto varchar(57) NOT NULL,
	id_mae_claves_caracteres_intervencion int NOT NULL,
	id_tipo_importe int NOT NULL,
	CONSTRAINT uk_mi_346_dim_datos_detalle UNIQUE (administracion_declarado,id_provincia,id_clave_percepcion,id_tipo_percepcion,ejercicio_devengo,concepto,id_mae_claves_caracteres_intervencion,id_tipo_importe),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_mi_mae_claves_percepcion FOREIGN KEY (id_clave_percepcion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_percepcion(id_clave_percepcion),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_mi_mae_tipos_percepcion FOREIGN KEY (id_tipo_percepcion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_percepcion(id_tipo_percepcion),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_mae_claves_caracteres_intervencion FOREIGN KEY (id_mae_claves_caracteres_intervencion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion(id_mae_claves_caracteres_intervencion),
	CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_dim_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_346_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_clave_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD id_clave_percepcion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_tipo_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD id_tipo_percepcion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD ejercicio_devengo varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='concepto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD concepto varchar(57)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_mae_claves_caracteres_intervencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD id_mae_claves_caracteres_intervencion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD id_tipo_importe int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_clave_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN id_clave_percepcion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_tipo_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN id_tipo_percepcion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN ejercicio_devengo varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='concepto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN concepto varchar(57) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_mae_claves_caracteres_intervencion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN id_mae_claves_caracteres_intervencion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND CONSTRAINT_NAME='PK_tbn1_mi_346_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD CONSTRAINT PK_tbn1_mi_346_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_detalle_tbn1_dim_provincias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_detalle_tbn1_mi_mae_claves_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_mi_mae_claves_percepcion FOREIGN KEY (id_clave_percepcion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_percepcion(id_clave_percepcion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_detalle_tbn1_mi_mae_tipos_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_mi_mae_tipos_percepcion FOREIGN KEY (id_tipo_percepcion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_percepcion(id_tipo_percepcion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_detalle_tbn1_mae_claves_caracteres_intervencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_mae_claves_caracteres_intervencion FOREIGN KEY (id_mae_claves_caracteres_intervencion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion(id_mae_claves_caracteres_intervencion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_346_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_346_dim_datos_detalle_tbn1_dim_mi_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_346_dim_datos_detalle_tbn1_dim_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_346_dim_datos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_346_dim_datos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_346_dim_datos_detalle(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_346_dim_datos_detalle'
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
			id_provincia,
			id_clave_percepcion,
			id_tipo_percepcion,
			ejercicio_devengo,
			concepto,
			id_mae_claves_caracteres_intervencion,
			id_tipo_importe
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			administracion_declarado,
			id_provincia,
			id_clave_percepcion,
			id_tipo_percepcion,
			ejercicio_devengo,
			concepto,
			id_mae_claves_caracteres_intervencion,
			id_tipo_importe
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_346_dim_datos_detalle AS tbn1_mi_346_dim_datos_detalle
	USING query ON query.administracion_declarado=tbn1_mi_346_dim_datos_detalle.administracion_declarado AND query.id_provincia=tbn1_mi_346_dim_datos_detalle.id_provincia AND query.id_clave_percepcion=tbn1_mi_346_dim_datos_detalle.id_clave_percepcion AND query.id_tipo_percepcion=tbn1_mi_346_dim_datos_detalle.id_tipo_percepcion AND query.ejercicio_devengo=tbn1_mi_346_dim_datos_detalle.ejercicio_devengo AND query.concepto=tbn1_mi_346_dim_datos_detalle.concepto AND query.id_mae_claves_caracteres_intervencion=tbn1_mi_346_dim_datos_detalle.id_mae_claves_caracteres_intervencion AND query.id_tipo_importe=tbn1_mi_346_dim_datos_detalle.id_tipo_importe
	WHEN NOT MATCHED THEN
		INSERT (administracion_declarado,id_provincia,id_clave_percepcion,id_tipo_percepcion,ejercicio_devengo,concepto,id_mae_claves_caracteres_intervencion,id_tipo_importe) VALUES (
			query.administracion_declarado,
			query.id_provincia,
			query.id_clave_percepcion,
			query.id_tipo_percepcion,
			query.ejercicio_devengo,
			query.concepto,
			query.id_mae_claves_caracteres_intervencion,
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

