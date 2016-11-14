PRINT 'Script maestro_claves_184.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184(
	id_mae_claves_184 int IDENTITY(1,1),
	cod_clave_184 varchar(1) NOT NULL,
	clave_184 varchar(100),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_184 UNIQUE (cod_clave_184),
	CONSTRAINT PK_tbn1_mae_claves_184 PRIMARY KEY CLUSTERED (id_mae_claves_184)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND COLUMN_NAME='id_mae_claves_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ADD id_mae_claves_184 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND COLUMN_NAME='cod_clave_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ADD cod_clave_184 varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND COLUMN_NAME='clave_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ADD clave_184 varchar(100)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND COLUMN_NAME='id_mae_claves_184' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ALTER COLUMN id_mae_claves_184 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND COLUMN_NAME='cod_clave_184' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ALTER COLUMN cod_clave_184 varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND COLUMN_NAME='clave_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ALTER COLUMN clave_184 varchar(100) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_184' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_184')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ADD CONSTRAINT PK_tbn1_mae_claves_184 PRIMARY KEY CLUSTERED (id_mae_claves_184)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_184' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_184;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_184(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_184'
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

	/*
	;WITH
	query AS (
		SELECT
			' ' AS cod_clave_184
,			' ' AS clave_184
		FROM table t
		WHERE
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 AS tbn1_mae_claves_184
	USING query ON query.cod_clave_184=tbn1_mae_claves_184.cod_clave_184
	WHEN MATCHED AND ((tbn1_mae_claves_184.clave_184<>query.clave_184 OR (tbn1_mae_claves_184.clave_184 IS NULL AND query.clave_184 IS NOT NULL) OR (tbn1_mae_claves_184.clave_184 IS NOT NULL AND query.clave_184 IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_184=query.clave_184
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_184,clave_184) VALUES (
			'MAESTRO',
			query.cod_clave_184,
			query.clave_184
			);
    	*/
-----Inicio: incluir registro -1-----
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184
		WHERE	id_mae_claves_184 = -1
	)
	INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184
	(
		id_mae_claves_184,
		cod_clave_184,


		clave_184,
		origen
	)
	VALUES
	(	
		-1,
		'', --'-',

		'N/A',
		'MAESTRO' --'MOD. 184'
	)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 OFF
	-----Fin: incluir registro -1-----	
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
