PRINT 'Script maestro_claves_titularidad.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad(
	id_mae_claves_titularidad int IDENTITY(1,1),
	cod_clave_titularidad varchar(1) NOT NULL,
	clave_titularidad varchar(80),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_titularidad UNIQUE (cod_clave_titularidad),
	CONSTRAINT PK_tbn1_mae_claves_titularidad PRIMARY KEY CLUSTERED (id_mae_claves_titularidad)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND COLUMN_NAME='id_mae_claves_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ADD id_mae_claves_titularidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND COLUMN_NAME='cod_clave_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ADD cod_clave_titularidad varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND COLUMN_NAME='clave_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ADD clave_titularidad varchar(80)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND COLUMN_NAME='id_mae_claves_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ALTER COLUMN id_mae_claves_titularidad int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND COLUMN_NAME='cod_clave_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ALTER COLUMN cod_clave_titularidad varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND COLUMN_NAME='clave_titularidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ALTER COLUMN clave_titularidad varchar(80) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_titularidad' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad ADD CONSTRAINT PK_tbn1_mae_claves_titularidad PRIMARY KEY CLUSTERED (id_mae_claves_titularidad)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_titularidad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_titularidad;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_titularidad(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_titularidad'
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
			'1' AS cod_clave_titularidad,
			'Titular' AS clave_titularidad
		UNION SELECT
			'2' AS cod_clave_titularidad,
			'Representante' AS clave_titularidad
		UNION SELECT
			'3' AS cod_clave_titularidad,
			'Autorizado/a' AS clave_titularidad
		UNION SELECT
			'4' AS cod_clave_titularidad,
			'Beneficiario/a' AS clave_titularidad
		UNION SELECT
			'5' AS cod_clave_titularidad,
			'Usufructuario/a' AS clave_titularidad
		UNION SELECT
			'6' AS cod_clave_titularidad,
			'Tomador' AS clave_titularidad
		UNION SELECT
			'7' AS cod_clave_titularidad,
			'Con poder de disposición' AS clave_titularidad
		UNION SELECT
			'8' AS cod_clave_titularidad,
			'Otras conforme art. 4.2 Ley 10/2010, de 28 de abril' AS clave_titularidad
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad AS tbn1_mae_claves_titularidad
	USING query ON query.cod_clave_titularidad=tbn1_mae_claves_titularidad.cod_clave_titularidad
	WHEN MATCHED AND ((tbn1_mae_claves_titularidad.clave_titularidad<>query.clave_titularidad OR (tbn1_mae_claves_titularidad.clave_titularidad IS NULL AND query.clave_titularidad IS NOT NULL) OR (tbn1_mae_claves_titularidad.clave_titularidad IS NOT NULL AND query.clave_titularidad IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_titularidad=query.clave_titularidad
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_titularidad,clave_titularidad) VALUES (
			'MAESTRO',
			query.cod_clave_titularidad,
			query.clave_titularidad
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
