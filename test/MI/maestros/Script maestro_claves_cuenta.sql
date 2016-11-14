PRINT 'Script maestro_claves_cuenta.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta(
	id_mae_claves_cuenta int IDENTITY(1,1),
	cod_clave_cuenta varchar(1) NOT NULL,
	clave_cuenta varchar(80),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_cuenta UNIQUE (cod_clave_cuenta),
	CONSTRAINT PK_tbn1_mae_claves_cuenta PRIMARY KEY CLUSTERED (id_mae_claves_cuenta)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND COLUMN_NAME='id_mae_claves_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ADD id_mae_claves_cuenta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND COLUMN_NAME='cod_clave_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ADD cod_clave_cuenta varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND COLUMN_NAME='clave_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ADD clave_cuenta varchar(80)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND COLUMN_NAME='id_mae_claves_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ALTER COLUMN id_mae_claves_cuenta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND COLUMN_NAME='cod_clave_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ALTER COLUMN cod_clave_cuenta varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND COLUMN_NAME='clave_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ALTER COLUMN clave_cuenta varchar(80) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_cuenta' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta ADD CONSTRAINT PK_tbn1_mae_claves_cuenta PRIMARY KEY CLUSTERED (id_mae_claves_cuenta)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_cuenta' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_cuenta;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_cuenta(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_cuenta'
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
			'I' AS cod_clave_cuenta,
			'Identificación de la cuenta con código IBAN' AS clave_cuenta
		UNION SELECT
			'O' AS cod_clave_cuenta,
			'Otra identificación' AS clave_cuenta
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta AS tbn1_mae_claves_cuenta
	USING query ON query.cod_clave_cuenta=tbn1_mae_claves_cuenta.cod_clave_cuenta
	WHEN MATCHED AND ((tbn1_mae_claves_cuenta.clave_cuenta<>query.clave_cuenta OR (tbn1_mae_claves_cuenta.clave_cuenta IS NULL AND query.clave_cuenta IS NOT NULL) OR (tbn1_mae_claves_cuenta.clave_cuenta IS NOT NULL AND query.clave_cuenta IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_cuenta=query.clave_cuenta
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_cuenta,clave_cuenta) VALUES (
			'MAESTRO',
			query.cod_clave_cuenta,
			query.clave_cuenta
			);
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
