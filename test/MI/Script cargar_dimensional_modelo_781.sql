PRINT 'dimensional_mi_781_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	CONSTRAINT uk_mi_781_dim_documentos UNIQUE (id_documento,id_expediente),
	CONSTRAINT FK_tbn1_mi_781_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_781_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente),
	CONSTRAINT PK_tbn1_mi_781_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ADD id_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ADD CONSTRAINT PK_tbn1_mi_781_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_documentos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ADD CONSTRAINT FK_tbn1_mi_781_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_documentos' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_documentos_tbn1_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos ADD CONSTRAINT FK_tbn1_mi_781_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_documentos'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_documento,
			id_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos AS tbn1_mi_781_dim_documentos
	USING query ON query.id_documento=tbn1_mi_781_dim_documentos.id_documento AND query.id_expediente=tbn1_mi_781_dim_documentos.id_expediente
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	id_mae_no_id_declarante int NOT NULL,
	nif_declarante_781 varchar(12) NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	telefono_contacto varchar(9) NOT NULL,
	nombre_contacto varchar(40) NOT NULL,
	CONSTRAINT uk_mi_781_dim_declarantes UNIQUE (id_mae_no_id_declarante,nif_declarante_781,id_contribuyente_declarante,telefono_contacto,nombre_contacto),
	CONSTRAINT FK_tbn1_mi_781_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_781_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_781_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='nif_declarante_781')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD nif_declarante_781 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD telefono_contacto varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD nombre_contacto varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='nif_declarante_781' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ALTER COLUMN nif_declarante_781 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ALTER COLUMN telefono_contacto varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ALTER COLUMN nombre_contacto varchar(40) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD CONSTRAINT PK_tbn1_mi_781_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_declarantes_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_781_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarantes' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_declarantes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_781_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_declarantes'
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
			nif_declarante_781,
			id_contribuyente_declarante,
			telefono_contacto,
			nombre_contacto
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarante,
			nif_declarante_781,
			id_contribuyente_declarante,
			telefono_contacto,
			nombre_contacto
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes AS tbn1_mi_781_dim_declarantes
	USING query ON query.id_mae_no_id_declarante=tbn1_mi_781_dim_declarantes.id_mae_no_id_declarante AND query.nif_declarante_781=tbn1_mi_781_dim_declarantes.nif_declarante_781 AND query.id_contribuyente_declarante=tbn1_mi_781_dim_declarantes.id_contribuyente_declarante AND query.telefono_contacto=tbn1_mi_781_dim_declarantes.telefono_contacto AND query.nombre_contacto=tbn1_mi_781_dim_declarantes.nombre_contacto
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarante,nif_declarante_781,id_contribuyente_declarante,telefono_contacto,nombre_contacto) VALUES (
			query.id_mae_no_id_declarante,
			query.nif_declarante_781,
			query.id_contribuyente_declarante,
			query.telefono_contacto,
			query.nombre_contacto)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	id_mae_no_id_declarado int NOT NULL,
	secuencia varchar(9) NOT NULL,
	nif_declarado_781 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	nivel_identificacion_nif_declarado varchar(1) NOT NULL,
	CONSTRAINT uk_mi_781_dim_declarados UNIQUE (id_mae_no_id_declarado,secuencia,nif_declarado_781,nif_declarado_no_identificado,id_contribuyente_declarado  ,nivel_identificacion_nif_declarado),
	CONSTRAINT FK_tbn1_mi_781_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados),
	CONSTRAINT FK_tbn1_mi_781_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_781_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='nif_declarado_781')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD nif_declarado_781 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='nivel_identificacion_nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD nivel_identificacion_nif_declarado varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN secuencia varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='nif_declarado_781' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN nif_declarado_781 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND COLUMN_NAME='nivel_identificacion_nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ALTER COLUMN nivel_identificacion_nif_declarado varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD CONSTRAINT PK_tbn1_mi_781_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_declarados_tbn1_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD CONSTRAINT FK_tbn1_mi_781_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_declarados' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_declarados_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados ADD CONSTRAINT FK_tbn1_mi_781_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_declarados'
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
			nif_declarado_781,
			nif_declarado_no_identificado,
			id_contribuyente_declarado  ,
			nivel_identificacion_nif_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_mae_no_id_declarado,
			secuencia,
			nif_declarado_781,
			nif_declarado_no_identificado,
			id_contribuyente_declarado  ,
			nivel_identificacion_nif_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados AS tbn1_mi_781_dim_declarados
	USING query ON query.id_mae_no_id_declarado=tbn1_mi_781_dim_declarados.id_mae_no_id_declarado AND query.secuencia=tbn1_mi_781_dim_declarados.secuencia AND query.nif_declarado_781=tbn1_mi_781_dim_declarados.nif_declarado_781 AND query.nif_declarado_no_identificado=tbn1_mi_781_dim_declarados.nif_declarado_no_identificado AND query.id_contribuyente_declarado  =tbn1_mi_781_dim_declarados.id_contribuyente_declarado   AND query.nivel_identificacion_nif_declarado=tbn1_mi_781_dim_declarados.nivel_identificacion_nif_declarado
	WHEN NOT MATCHED THEN
		INSERT (id_mae_no_id_declarado,secuencia,nif_declarado_781,nif_declarado_no_identificado,id_contribuyente_declarado  ,nivel_identificacion_nif_declarado) VALUES (
			query.id_mae_no_id_declarado,
			query.secuencia,
			query.nif_declarado_781,
			query.nif_declarado_no_identificado,
			query.id_contribuyente_declarado  ,
			query.nivel_identificacion_nif_declarado)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion  int NOT NULL,
	fecha_apertura_cuenta_vivienda date NOT NULL,
	mes_apertura_cuenta_vivienda int NOT NULL,
	anyo_apertura_cuenta_vivienda int NOT NULL,
	fecha_formalizacion_prestamo date NOT NULL,
	mes_formalizacion_prestamo int NOT NULL,
	anyo_formalizacion_prestamo int NOT NULL,
	CONSTRAINT uk_mi_781_dim_periodos UNIQUE (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion ,fecha_apertura_cuenta_vivienda,mes_apertura_cuenta_vivienda,anyo_apertura_cuenta_vivienda,fecha_formalizacion_prestamo,mes_formalizacion_prestamo,anyo_formalizacion_prestamo),
	CONSTRAINT PK_tbn1_mi_781_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='fecha_apertura_cuenta_vivienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD fecha_apertura_cuenta_vivienda date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='mes_apertura_cuenta_vivienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD mes_apertura_cuenta_vivienda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='anyo_apertura_cuenta_vivienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD anyo_apertura_cuenta_vivienda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='fecha_formalizacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD fecha_formalizacion_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='mes_formalizacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD mes_formalizacion_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='anyo_formalizacion_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD anyo_formalizacion_prestamo int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='fecha_apertura_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN fecha_apertura_cuenta_vivienda date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='mes_apertura_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN mes_apertura_cuenta_vivienda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='anyo_apertura_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN anyo_apertura_cuenta_vivienda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='fecha_formalizacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN fecha_formalizacion_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='mes_formalizacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN mes_formalizacion_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND COLUMN_NAME='anyo_formalizacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ALTER COLUMN anyo_formalizacion_prestamo int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_periodos' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos ADD CONSTRAINT PK_tbn1_mi_781_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_periodos'
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
			anyo_presentacion ,
			fecha_apertura_cuenta_vivienda,
			mes_apertura_cuenta_vivienda,
			anyo_apertura_cuenta_vivienda,
			fecha_formalizacion_prestamo,
			mes_formalizacion_prestamo,
			anyo_formalizacion_prestamo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion ,
			fecha_apertura_cuenta_vivienda,
			mes_apertura_cuenta_vivienda,
			anyo_apertura_cuenta_vivienda,
			fecha_formalizacion_prestamo,
			mes_formalizacion_prestamo,
			anyo_formalizacion_prestamo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos AS tbn1_mi_781_dim_periodos
	USING query ON query.ejercicio=tbn1_mi_781_dim_periodos.ejercicio AND query.fecha_presentacion=tbn1_mi_781_dim_periodos.fecha_presentacion AND query.mes_presentacion=tbn1_mi_781_dim_periodos.mes_presentacion AND query.anyo_presentacion =tbn1_mi_781_dim_periodos.anyo_presentacion  AND query.fecha_apertura_cuenta_vivienda=tbn1_mi_781_dim_periodos.fecha_apertura_cuenta_vivienda AND query.mes_apertura_cuenta_vivienda=tbn1_mi_781_dim_periodos.mes_apertura_cuenta_vivienda AND query.anyo_apertura_cuenta_vivienda=tbn1_mi_781_dim_periodos.anyo_apertura_cuenta_vivienda AND query.fecha_formalizacion_prestamo=tbn1_mi_781_dim_periodos.fecha_formalizacion_prestamo AND query.mes_formalizacion_prestamo=tbn1_mi_781_dim_periodos.mes_formalizacion_prestamo AND query.anyo_formalizacion_prestamo=tbn1_mi_781_dim_periodos.anyo_formalizacion_prestamo
	WHEN NOT MATCHED THEN
		INSERT (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion ,fecha_apertura_cuenta_vivienda,mes_apertura_cuenta_vivienda,anyo_apertura_cuenta_vivienda,fecha_formalizacion_prestamo,mes_formalizacion_prestamo,anyo_formalizacion_prestamo) VALUES (
			query.ejercicio,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion ,
			query.fecha_apertura_cuenta_vivienda,
			query.mes_apertura_cuenta_vivienda,
			query.anyo_apertura_cuenta_vivienda,
			query.fecha_formalizacion_prestamo,
			query.mes_formalizacion_prestamo,
			query.anyo_formalizacion_prestamo)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo  varchar(3) NOT NULL,
	id_administracion_declarante int NOT NULL,
	id_tipo_presentacion int NOT NULL,
	codigo_entidad  varchar(4) NOT NULL,
	codigo_sucursal  varchar(4) NOT NULL,
	codigo_control  varchar(2) NOT NULL,
	numero_cuenta  varchar(10) NOT NULL,
	CONSTRAINT uk_mi_781_dim_datos_caratula UNIQUE (modelo ,id_administracion_declarante,id_tipo_presentacion,codigo_entidad ,codigo_sucursal ,codigo_control ,numero_cuenta ),
	CONSTRAINT FK_tbn1_mi_781_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_781_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT PK_tbn1_mi_781_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='codigo_entidad ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD codigo_entidad  varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='codigo_sucursal ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD codigo_sucursal  varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='codigo_control ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD codigo_control  varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='numero_cuenta ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD numero_cuenta  varchar(10)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='codigo_entidad ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN codigo_entidad  varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='codigo_sucursal ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN codigo_sucursal  varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='codigo_control ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN codigo_control  varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND COLUMN_NAME='numero_cuenta ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ALTER COLUMN numero_cuenta  varchar(10) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD CONSTRAINT PK_tbn1_mi_781_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_781_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_caratula' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_781_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_datos_caratula'
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
			id_administracion_declarante,
			id_tipo_presentacion,
			codigo_entidad ,
			codigo_sucursal ,
			codigo_control ,
			numero_cuenta 
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			modelo ,
			id_administracion_declarante,
			id_tipo_presentacion,
			codigo_entidad ,
			codigo_sucursal ,
			codigo_control ,
			numero_cuenta 
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula AS tbn1_mi_781_dim_datos_caratula
	USING query ON query.modelo =tbn1_mi_781_dim_datos_caratula.modelo  AND query.id_administracion_declarante=tbn1_mi_781_dim_datos_caratula.id_administracion_declarante AND query.id_tipo_presentacion=tbn1_mi_781_dim_datos_caratula.id_tipo_presentacion AND query.codigo_entidad =tbn1_mi_781_dim_datos_caratula.codigo_entidad  AND query.codigo_sucursal =tbn1_mi_781_dim_datos_caratula.codigo_sucursal  AND query.codigo_control =tbn1_mi_781_dim_datos_caratula.codigo_control  AND query.numero_cuenta =tbn1_mi_781_dim_datos_caratula.numero_cuenta 
	WHEN NOT MATCHED THEN
		INSERT (modelo ,id_administracion_declarante,id_tipo_presentacion,codigo_entidad ,codigo_sucursal ,codigo_control ,numero_cuenta ) VALUES (
			query.modelo ,
			query.id_administracion_declarante,
			query.id_tipo_presentacion,
			query.codigo_entidad ,
			query.codigo_sucursal ,
			query.codigo_control ,
			query.numero_cuenta )
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas(
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
	es_identificado_titular bit NOT NULL,
	sw_identificado_titular    varchar(1) NOT NULL,
	CONSTRAINT uk_mi_781_dim_marcas UNIQUE (es_externo_declarante,es_contribuyente_declarante,es_complementaria,es_sustitutiva,es_rehabilitacion,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado   ,sw_representante ,es_identificado_titular,sw_identificado_titular   ),
	CONSTRAINT PK_tbn1_mi_781_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_complementaria varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_sustitutiva varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_rehabilitacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='sw_representante ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD sw_representante  varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_identificado_titular')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD es_identificado_titular bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='sw_identificado_titular   ')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD sw_identificado_titular    varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_complementaria varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_sustitutiva varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_rehabilitacion varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='sw_representante ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN sw_representante  varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='es_identificado_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN es_identificado_titular bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND COLUMN_NAME='sw_identificado_titular   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ALTER COLUMN sw_identificado_titular    varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas ADD CONSTRAINT PK_tbn1_mi_781_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_marcas'
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
			es_complementaria,
			es_sustitutiva,
			es_rehabilitacion,
			es_externo_declarado,
			es_contribuyente_declarado,
			es_identificado_declarado,
			sw_identificado_declarado   ,
			sw_representante ,
			es_identificado_titular,
			sw_identificado_titular   
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
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
			sw_representante ,
			es_identificado_titular,
			sw_identificado_titular   
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas AS tbn1_mi_781_dim_marcas
	USING query ON query.es_externo_declarante=tbn1_mi_781_dim_marcas.es_externo_declarante AND query.es_contribuyente_declarante=tbn1_mi_781_dim_marcas.es_contribuyente_declarante AND query.es_complementaria=tbn1_mi_781_dim_marcas.es_complementaria AND query.es_sustitutiva=tbn1_mi_781_dim_marcas.es_sustitutiva AND query.es_rehabilitacion=tbn1_mi_781_dim_marcas.es_rehabilitacion AND query.es_externo_declarado=tbn1_mi_781_dim_marcas.es_externo_declarado AND query.es_contribuyente_declarado=tbn1_mi_781_dim_marcas.es_contribuyente_declarado AND query.es_identificado_declarado=tbn1_mi_781_dim_marcas.es_identificado_declarado AND query.sw_identificado_declarado   =tbn1_mi_781_dim_marcas.sw_identificado_declarado    AND query.sw_representante =tbn1_mi_781_dim_marcas.sw_representante  AND query.es_identificado_titular=tbn1_mi_781_dim_marcas.es_identificado_titular AND query.sw_identificado_titular   =tbn1_mi_781_dim_marcas.sw_identificado_titular   
	WHEN NOT MATCHED THEN
		INSERT (es_externo_declarante,es_contribuyente_declarante,es_complementaria,es_sustitutiva,es_rehabilitacion,es_externo_declarado,es_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado   ,sw_representante ,es_identificado_titular,sw_identificado_titular   ) VALUES (
			query.es_externo_declarante,
			query.es_contribuyente_declarante,
			query.es_complementaria,
			query.es_sustitutiva,
			query.es_rehabilitacion,
			query.es_externo_declarado,
			query.es_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.sw_representante ,
			query.es_identificado_titular,
			query.sw_identificado_titular   )
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	id_administracion_declarado int NOT NULL,
	id_provincia int NOT NULL,
	numero_identificacion_cuenta_vivienda varchar(20) NOT NULL,
	CONSTRAINT uk_mi_781_dim_datos_detalle UNIQUE (id_administracion_declarado,id_provincia,numero_identificacion_cuenta_vivienda),
	CONSTRAINT FK_tbn1_mi_781_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_781_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia),
	CONSTRAINT PK_tbn1_mi_781_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='numero_identificacion_cuenta_vivienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD numero_identificacion_cuenta_vivienda varchar(20)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ALTER COLUMN id_administracion_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND COLUMN_NAME='numero_identificacion_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ALTER COLUMN numero_identificacion_cuenta_vivienda varchar(20) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD CONSTRAINT PK_tbn1_mi_781_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_781_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_detalle' AND CONSTRAINT_NAME='FK_tbn1_mi_781_dim_datos_detalle_tbn1_dim_provincias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_781_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_datos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_datos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_datos_detalle(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_datos_detalle'
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
			numero_identificacion_cuenta_vivienda
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_administracion_declarado,
			id_provincia,
			numero_identificacion_cuenta_vivienda
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle AS tbn1_mi_781_dim_datos_detalle
	USING query ON query.id_administracion_declarado=tbn1_mi_781_dim_datos_detalle.id_administracion_declarado AND query.id_provincia=tbn1_mi_781_dim_datos_detalle.id_provincia AND query.numero_identificacion_cuenta_vivienda=tbn1_mi_781_dim_datos_detalle.numero_identificacion_cuenta_vivienda
	WHEN NOT MATCHED THEN
		INSERT (id_administracion_declarado,id_provincia,numero_identificacion_cuenta_vivienda) VALUES (
			query.id_administracion_declarado,
			query.id_provincia,
			query.numero_identificacion_cuenta_vivienda)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion(
	id_dim_datos_rehabilitacion int IDENTITY(1,1),
	nif_titular_inmueble_rehabilitacion varchar(12) NOT NULL,
	expediente_rehabilitacion varchar(19) NOT NULL,
	CONSTRAINT uk_mi_781_dim_datos_rehabilitacion UNIQUE (nif_titular_inmueble_rehabilitacion,expediente_rehabilitacion),
	CONSTRAINT PK_tbn1_mi_781_dim_datos_rehabilitacion PRIMARY KEY CLUSTERED (id_dim_datos_rehabilitacion)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND COLUMN_NAME='id_dim_datos_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ADD id_dim_datos_rehabilitacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND COLUMN_NAME='nif_titular_inmueble_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ADD nif_titular_inmueble_rehabilitacion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND COLUMN_NAME='expediente_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ADD expediente_rehabilitacion varchar(19)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND COLUMN_NAME='id_dim_datos_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ALTER COLUMN id_dim_datos_rehabilitacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND COLUMN_NAME='nif_titular_inmueble_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ALTER COLUMN nif_titular_inmueble_rehabilitacion varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND COLUMN_NAME='expediente_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ALTER COLUMN expediente_rehabilitacion varchar(19) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_dim_datos_rehabilitacion' AND CONSTRAINT_NAME='PK_tbn1_mi_781_dim_datos_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion ADD CONSTRAINT PK_tbn1_mi_781_dim_datos_rehabilitacion PRIMARY KEY CLUSTERED (id_dim_datos_rehabilitacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_dim_datos_rehabilitacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_dim_datos_rehabilitacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_dim_datos_rehabilitacion(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_datos_rehabilitacion'
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
			nif_titular_inmueble_rehabilitacion,
			expediente_rehabilitacion
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			nif_titular_inmueble_rehabilitacion,
			expediente_rehabilitacion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion AS tbn1_mi_781_dim_datos_rehabilitacion
	USING query ON query.nif_titular_inmueble_rehabilitacion=tbn1_mi_781_dim_datos_rehabilitacion.nif_titular_inmueble_rehabilitacion AND query.expediente_rehabilitacion=tbn1_mi_781_dim_datos_rehabilitacion.expediente_rehabilitacion
	WHEN NOT MATCHED THEN
		INSERT (nif_titular_inmueble_rehabilitacion,expediente_rehabilitacion) VALUES (
			query.nif_titular_inmueble_rehabilitacion,
			query.expediente_rehabilitacion)
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




PRINT 'dimensional_mi_781_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_datos_detalle int NOT NULL,
	id_dim_datos_rehabilitacion int NOT NULL,
	saldo_inicial_ejercicio decimal(18, 2),
	saldo_final_ejercicio decimal(18, 2),
	porcentaje_participacion decimal(6, 3),
	importe_parcial_obra decimal(18, 2),
	importe_final_obra decimal(18, 2) ,
	importe_prestamo decimal(18, 2) ,
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle(id_dim_datos_detalle),
	CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_rehabilitacion FOREIGN KEY (id_dim_datos_rehabilitacion) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion(id_dim_datos_rehabilitacion),
	CONSTRAINT PK_tbn1_mi_781_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_datos_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD id_dim_datos_rehabilitacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='saldo_inicial_ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD saldo_inicial_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='saldo_final_ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD saldo_final_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD porcentaje_participacion decimal(6, 3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='importe_parcial_obra')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD importe_parcial_obra decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='importe_final_obra')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD importe_final_obra decimal(18, 2) 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='importe_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD importe_prestamo decimal(18, 2) 
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='id_dim_datos_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN id_dim_datos_rehabilitacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='saldo_inicial_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN saldo_inicial_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='saldo_final_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN saldo_final_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN porcentaje_participacion decimal(6, 3) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='importe_parcial_obra' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN importe_parcial_obra decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='importe_final_obra' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN importe_final_obra decimal(18, 2)  NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND COLUMN_NAME='importe_prestamo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ALTER COLUMN importe_prestamo decimal(18, 2)  NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_781_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT PK_tbn1_mi_781_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle(id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_781_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_rehabilitacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact ADD CONSTRAINT FK_tbn1_mi_781_fact_tbn1_mi_781_dim_datos_rehabilitacion FOREIGN KEY (id_dim_datos_rehabilitacion) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion(id_dim_datos_rehabilitacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_781_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_781_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_781_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_fact'
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
			declarantes.id_dim_declarantes AS id_dim_declarantes,
			declarados.id_dim_declarados AS id_dim_declarados,
			periodos.id_dim_periodos AS id_dim_periodos,
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			marcas.id_dim_marcas AS id_dim_marcas,
			datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
			datos_rehabilitacion.id_dim_datos_rehabilitacion AS id_dim_datos_rehabilitacion,
			sum(ds_t.saldo_inicial_ejercicio) AS saldo_inicial_ejercicio,
			sum(ds_t.saldo_final_ejercicio) AS saldo_final_ejercicio,
			sum(ds_t.porcentaje_participacion) AS porcentaje_participacion,
			sum(ds_t.importe_parcial_obra) AS importe_parcial_obra,
			sum(ds_t.importe_final_obra) AS importe_final_obra,
			sum(ds_t.importe_prestamo) AS importe_prestamo
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarantes AS declarantes ON (declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante AND declarantes.nif_declarante_781=ds_t.nif_declarante_781 AND declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes.telefono_contacto=ds_t.telefono_contacto AND declarantes.nombre_contacto=ds_t.nombre_contacto)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_declarados AS declarados ON (declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado AND declarados.secuencia=ds_t.secuencia AND declarados.nif_declarado_781=ds_t.nif_declarado_781 AND declarados.nif_declarado_no_identificado=ds_t.nif_declarado_no_identificado AND declarados.id_contribuyente_declarado  =ds_t.id_contribuyente_declarado   AND declarados.nivel_identificacion_nif_declarado=ds_t.nivel_identificacion_nif_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion =ds_t.anyo_presentacion  AND periodos.fecha_apertura_cuenta_vivienda=ds_t.fecha_apertura_cuenta_vivienda AND periodos.mes_apertura_cuenta_vivienda=ds_t.mes_apertura_cuenta_vivienda AND periodos.anyo_apertura_cuenta_vivienda=ds_t.anyo_apertura_cuenta_vivienda AND periodos.fecha_formalizacion_prestamo=ds_t.fecha_formalizacion_prestamo AND periodos.mes_formalizacion_prestamo=ds_t.mes_formalizacion_prestamo AND periodos.anyo_formalizacion_prestamo=ds_t.anyo_formalizacion_prestamo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo =ds_t.modelo  AND datos_caratula.id_administracion_declarante=ds_t.id_administracion_declarante AND datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion AND datos_caratula.codigo_entidad =ds_t.codigo_entidad  AND datos_caratula.codigo_sucursal =ds_t.codigo_sucursal  AND datos_caratula.codigo_control =ds_t.codigo_control  AND datos_caratula.numero_cuenta =ds_t.numero_cuenta )
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_marcas AS marcas ON (marcas.es_externo_declarante=ds_t.es_externo_declarante AND marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_complementaria=ds_t.es_complementaria AND marcas.es_sustitutiva=ds_t.es_sustitutiva AND marcas.es_rehabilitacion=ds_t.es_rehabilitacion AND marcas.es_externo_declarado=ds_t.es_externo_declarado AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado AND marcas.sw_identificado_declarado   =ds_t.sw_identificado_declarado    AND marcas.sw_representante =ds_t.sw_representante  AND marcas.es_identificado_titular=ds_t.es_identificado_titular AND marcas.sw_identificado_titular   =ds_t.sw_identificado_titular   )
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_detalle AS datos_detalle ON (datos_detalle.id_administracion_declarado=ds_t.id_administracion_declarado AND datos_detalle.id_provincia=ds_t.id_provincia AND datos_detalle.numero_identificacion_cuenta_vivienda=ds_t.numero_identificacion_cuenta_vivienda)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_781_dim_datos_rehabilitacion AS datos_rehabilitacion ON (datos_rehabilitacion.nif_titular_inmueble_rehabilitacion=ds_t.nif_titular_inmueble_rehabilitacion AND datos_rehabilitacion.expediente_rehabilitacion=ds_t.expediente_rehabilitacion)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			declarantes.id_dim_declarantes,
			declarados.id_dim_declarados,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			marcas.id_dim_marcas,
			datos_detalle.id_dim_datos_detalle,
			datos_rehabilitacion.id_dim_datos_rehabilitacion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_781_fact AS tbn1_mi_781_fact
	USING query ON query.id_dim_documentos=tbn1_mi_781_fact.id_dim_documentos AND query.id_dim_declarantes=tbn1_mi_781_fact.id_dim_declarantes AND query.id_dim_declarados=tbn1_mi_781_fact.id_dim_declarados AND query.id_dim_periodos=tbn1_mi_781_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_781_fact.id_dim_datos_caratula AND query.id_dim_marcas=tbn1_mi_781_fact.id_dim_marcas AND query.id_dim_datos_detalle=tbn1_mi_781_fact.id_dim_datos_detalle AND query.id_dim_datos_rehabilitacion=tbn1_mi_781_fact.id_dim_datos_rehabilitacion
	WHEN MATCHED AND ((tbn1_mi_781_fact.saldo_inicial_ejercicio<>query.saldo_inicial_ejercicio OR (tbn1_mi_781_fact.saldo_inicial_ejercicio IS NULL AND query.saldo_inicial_ejercicio IS NOT NULL) OR (tbn1_mi_781_fact.saldo_inicial_ejercicio IS NOT NULL AND query.saldo_inicial_ejercicio IS NULL)
			OR tbn1_mi_781_fact.saldo_final_ejercicio<>query.saldo_final_ejercicio OR (tbn1_mi_781_fact.saldo_final_ejercicio IS NULL AND query.saldo_final_ejercicio IS NOT NULL) OR (tbn1_mi_781_fact.saldo_final_ejercicio IS NOT NULL AND query.saldo_final_ejercicio IS NULL)
			OR tbn1_mi_781_fact.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_781_fact.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_781_fact.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
			OR tbn1_mi_781_fact.importe_parcial_obra<>query.importe_parcial_obra OR (tbn1_mi_781_fact.importe_parcial_obra IS NULL AND query.importe_parcial_obra IS NOT NULL) OR (tbn1_mi_781_fact.importe_parcial_obra IS NOT NULL AND query.importe_parcial_obra IS NULL)
			OR tbn1_mi_781_fact.importe_final_obra<>query.importe_final_obra OR (tbn1_mi_781_fact.importe_final_obra IS NULL AND query.importe_final_obra IS NOT NULL) OR (tbn1_mi_781_fact.importe_final_obra IS NOT NULL AND query.importe_final_obra IS NULL)
			OR tbn1_mi_781_fact.importe_prestamo<>query.importe_prestamo OR (tbn1_mi_781_fact.importe_prestamo IS NULL AND query.importe_prestamo IS NOT NULL) OR (tbn1_mi_781_fact.importe_prestamo IS NOT NULL AND query.importe_prestamo IS NULL))) THEN
		UPDATE SET
			saldo_inicial_ejercicio=query.saldo_inicial_ejercicio,
			saldo_final_ejercicio=query.saldo_final_ejercicio,
			porcentaje_participacion=query.porcentaje_participacion,
			importe_parcial_obra=query.importe_parcial_obra,
			importe_final_obra=query.importe_final_obra,
			importe_prestamo=query.importe_prestamo
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,id_dim_datos_rehabilitacion,saldo_inicial_ejercicio,saldo_final_ejercicio,porcentaje_participacion,importe_parcial_obra,importe_final_obra,importe_prestamo) VALUES (
			query.id_dim_documentos,
			query.id_dim_declarantes,
			query.id_dim_declarados,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_marcas,
			query.id_dim_datos_detalle,
			query.id_dim_datos_rehabilitacion,
			query.saldo_inicial_ejercicio,
			query.saldo_final_ejercicio,
			query.porcentaje_participacion,
			query.importe_parcial_obra,
			query.importe_final_obra,
			query.importe_prestamo
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_781_cuentas_vivienda' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_781_cuentas_vivienda;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_781_cuentas_vivienda(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_781_cuentas_vivienda'
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

		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_documentos	 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_periodos  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_datos_caratula  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_marcas  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_declarantes  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_declarados  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_datos_detalle  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_dim_datos_rehabilitacion  @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_781_fact  @log
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

/***********************/
/*FIN - SP CON LOS EXEC*/
/***********************/

