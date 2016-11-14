PRINT 'Script maestro_claves_personalidad.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad(
	id_mae_claves_personalidad int IDENTITY(1,1),
	cod_clave_personalidad varchar(1) NOT NULL,
	clave_personalidad varchar(40),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_personalidad UNIQUE (cod_clave_personalidad),
	CONSTRAINT PK_tbn1_mae_claves_personalidad PRIMARY KEY CLUSTERED (id_mae_claves_personalidad)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND COLUMN_NAME='id_mae_claves_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ADD id_mae_claves_personalidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND COLUMN_NAME='cod_clave_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ADD cod_clave_personalidad varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND COLUMN_NAME='clave_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ADD clave_personalidad varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND COLUMN_NAME='id_mae_claves_personalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ALTER COLUMN id_mae_claves_personalidad int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND COLUMN_NAME='cod_clave_personalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ALTER COLUMN cod_clave_personalidad varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND COLUMN_NAME='clave_personalidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ALTER COLUMN clave_personalidad varchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_personalidad' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_personalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ADD CONSTRAINT PK_tbn1_mae_claves_personalidad PRIMARY KEY CLUSTERED (id_mae_claves_personalidad)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_personalidad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_personalidad;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_personalidad(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_personalidad'
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
			'F' AS cod_clave_personalidad,
			'Persona física' AS clave_personalidad
		UNION
		SELECT
			'J' AS cod_clave_personalidad,
			'Persona jurídica o entidad' AS clave_personalidad
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad AS tbn1_mae_claves_personalidad
	USING query ON query.cod_clave_personalidad=tbn1_mae_claves_personalidad.cod_clave_personalidad
	WHEN MATCHED AND ((tbn1_mae_claves_personalidad.clave_personalidad<>query.clave_personalidad OR (tbn1_mae_claves_personalidad.clave_personalidad IS NULL AND query.clave_personalidad IS NOT NULL) OR (tbn1_mae_claves_personalidad.clave_personalidad IS NOT NULL AND query.clave_personalidad IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_personalidad=query.clave_personalidad
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_personalidad,clave_personalidad) VALUES (
			'MAESTRO',
			query.cod_clave_personalidad,
			query.clave_personalidad
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad
		WHERE	id_mae_claves_personalidad = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad
		(
			id_mae_claves_personalidad,
			cod_clave_personalidad,
			clave_personalidad,
			origen
		)
		VALUES
		(
			-1,
			'',
			'N/A',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad OFF

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
