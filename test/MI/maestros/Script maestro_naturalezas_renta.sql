PRINT 'Script maestro_naturalezas_renta.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta(
	id_mae_naturalezas_renta int IDENTITY(1,1),
	cod_naturaleza_renta varchar(1) NOT NULL,
	naturaleza_renta varchar(40),
	origen varchar(10)
	CONSTRAINT uk_mae_naturalezas_renta UNIQUE (cod_naturaleza_renta),
	CONSTRAINT PK_tbn1_mae_naturalezas_renta PRIMARY KEY CLUSTERED (id_mae_naturalezas_renta)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND COLUMN_NAME='id_mae_naturalezas_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ADD id_mae_naturalezas_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND COLUMN_NAME='cod_naturaleza_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ADD cod_naturaleza_renta varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND COLUMN_NAME='naturaleza_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ADD naturaleza_renta varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND COLUMN_NAME='id_mae_naturalezas_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ALTER COLUMN id_mae_naturalezas_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND COLUMN_NAME='cod_naturaleza_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ALTER COLUMN cod_naturaleza_renta varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND COLUMN_NAME='naturaleza_renta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ALTER COLUMN naturaleza_renta varchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_naturalezas_renta' AND CONSTRAINT_NAME='PK_tbn1_mae_naturalezas_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ADD CONSTRAINT PK_tbn1_mae_naturalezas_renta PRIMARY KEY CLUSTERED (id_mae_naturalezas_renta)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_naturalezas_renta' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_naturalezas_renta;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_naturalezas_renta(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_naturalezas_renta'
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
			'D' AS cod_naturaleza_renta,
			'Dineraria' AS naturaleza_renta
		UNION
		SELECT
			'E' AS cod_naturaleza_renta,
			'En especie' AS naturaleza_renta
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta AS tbn1_mae_naturalezas_renta
	USING query ON query.cod_naturaleza_renta=tbn1_mae_naturalezas_renta.cod_naturaleza_renta
	WHEN MATCHED AND ((tbn1_mae_naturalezas_renta.naturaleza_renta<>query.naturaleza_renta OR (tbn1_mae_naturalezas_renta.naturaleza_renta IS NULL AND query.naturaleza_renta IS NOT NULL) OR (tbn1_mae_naturalezas_renta.naturaleza_renta IS NOT NULL AND query.naturaleza_renta IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			naturaleza_renta=query.naturaleza_renta
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_naturaleza_renta,naturaleza_renta) VALUES (
			'MAESTRO',
			query.cod_naturaleza_renta,
			query.naturaleza_renta
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta
		WHERE	id_mae_naturalezas_renta = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta
		(
			id_mae_naturalezas_renta,
			cod_naturaleza_renta,
			naturaleza_renta,
			origen
		)
		VALUES
		(
			-1,
			'',
			'',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta OFF

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
