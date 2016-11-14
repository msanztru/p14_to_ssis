PRINT 'Script maestro_tipos_perceptor.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor(
	id_mae_tipos_perceptor int IDENTITY(1,1),
	cod_tipo_perceptor varchar(1) NOT NULL,
	tipo_perceptor varchar(200),
	origen varchar(10)
	CONSTRAINT uk_mae_tipos_perceptor UNIQUE (cod_tipo_perceptor),
	CONSTRAINT PK_tbn1_mae_tipos_perceptor PRIMARY KEY CLUSTERED (id_mae_tipos_perceptor)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND COLUMN_NAME='id_mae_tipos_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ADD id_mae_tipos_perceptor int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND COLUMN_NAME='cod_tipo_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ADD cod_tipo_perceptor varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND COLUMN_NAME='tipo_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ADD tipo_perceptor varchar(200)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND COLUMN_NAME='id_mae_tipos_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ALTER COLUMN id_mae_tipos_perceptor int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND COLUMN_NAME='cod_tipo_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ALTER COLUMN cod_tipo_perceptor varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND COLUMN_NAME='tipo_perceptor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ALTER COLUMN tipo_perceptor varchar(200) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipos_perceptor' AND CONSTRAINT_NAME='PK_tbn1_mae_tipos_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ADD CONSTRAINT PK_tbn1_mae_tipos_perceptor PRIMARY KEY CLUSTERED (id_mae_tipos_perceptor)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_tipos_perceptor' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_tipos_perceptor;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_tipos_perceptor(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipos_perceptor'
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
			'1' AS cod_tipo_perceptor,
			'Persona física contribuyente del IRPF' AS tipo_perceptor
		UNION
		SELECT
			'2' AS cod_tipo_perceptor,
			'Entidad en régimen de atribución de rentas residente en territorio español' AS tipo_perceptor
		UNION
		SELECT
			'3' AS cod_tipo_perceptor,
			'Persona jurídica o entidad residente en territorio español contribuyente del Impuesto sobre Sociedades' AS tipo_perceptor
		UNION
		SELECT
			'4' AS cod_tipo_perceptor,
			'Establecimiento permanente en territorio español de una persona o entidad no residente en dicho territorio o entidad en régimen de atribución de rentas constituida en el extranjero' AS tipo_perceptor
		UNION
		SELECT
			'5' AS cod_tipo_perceptor,
			'Persona o entidad no residente en territorio español que opera en él sin mediación de establecimiento permanente' AS tipo_perceptor
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor AS tbn1_mae_tipos_perceptor
	USING query ON query.cod_tipo_perceptor=tbn1_mae_tipos_perceptor.cod_tipo_perceptor
	WHEN MATCHED AND ((tbn1_mae_tipos_perceptor.tipo_perceptor<>query.tipo_perceptor OR (tbn1_mae_tipos_perceptor.tipo_perceptor IS NULL AND query.tipo_perceptor IS NOT NULL) OR (tbn1_mae_tipos_perceptor.tipo_perceptor IS NOT NULL AND query.tipo_perceptor IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			tipo_perceptor=query.tipo_perceptor
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_tipo_perceptor,tipo_perceptor) VALUES (
			'MAESTRO',
			query.cod_tipo_perceptor,
			query.tipo_perceptor
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor
		WHERE	id_mae_tipos_perceptor = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor
		(
			id_mae_tipos_perceptor,
			cod_tipo_perceptor,
			tipo_perceptor,
			origen
		)
		VALUES
		(
			-1,
			'',
			'N/A',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor OFF

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
