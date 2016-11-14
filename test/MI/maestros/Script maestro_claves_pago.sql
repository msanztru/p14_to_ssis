PRINT 'Script maestro_claves_pago.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago(
	id_mae_claves_pago int IDENTITY(1,1),
	cod_clave_pago varchar(1) NOT NULL,
	clave_pago varchar(40),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_pago UNIQUE (cod_clave_pago),
	CONSTRAINT PK_tbn1_mae_claves_pago PRIMARY KEY CLUSTERED (id_mae_claves_pago)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND COLUMN_NAME='id_mae_claves_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ADD id_mae_claves_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND COLUMN_NAME='cod_clave_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ADD cod_clave_pago varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND COLUMN_NAME='clave_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ADD clave_pago varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND COLUMN_NAME='id_mae_claves_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ALTER COLUMN id_mae_claves_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND COLUMN_NAME='cod_clave_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ALTER COLUMN cod_clave_pago varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND COLUMN_NAME='clave_pago' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ALTER COLUMN clave_pago varchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_pago' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ADD CONSTRAINT PK_tbn1_mae_claves_pago PRIMARY KEY CLUSTERED (id_mae_claves_pago)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_pago' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_pago;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_pago(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_pago'
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
			'1' AS cod_clave_pago,
			'Emisor' AS clave_pago
		UNION
		SELECT
			'2' AS cod_clave_pago,
			'Mediador' AS clave_pago
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago AS tbn1_mae_claves_pago
	USING query ON query.cod_clave_pago=tbn1_mae_claves_pago.cod_clave_pago
	WHEN MATCHED AND ((tbn1_mae_claves_pago.clave_pago<>query.clave_pago OR (tbn1_mae_claves_pago.clave_pago IS NULL AND query.clave_pago IS NOT NULL) OR (tbn1_mae_claves_pago.clave_pago IS NOT NULL AND query.clave_pago IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_pago=query.clave_pago
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_pago,clave_pago) VALUES (
			'MAESTRO',
			query.cod_clave_pago,
			query.clave_pago
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago
		WHERE	id_mae_claves_pago = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago
		(
			id_mae_claves_pago,
			cod_clave_pago,
			clave_pago,
			origen
		)
		VALUES
		(
			-1,
			'',
			'',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago OFF

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
