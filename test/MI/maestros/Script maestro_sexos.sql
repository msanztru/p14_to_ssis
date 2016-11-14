PRINT 'Script maestro_sexos.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos(
	id_mae_sexos int IDENTITY(1,1),
	cod_sexo varchar(1) NOT NULL,
	sexo varchar(40),
	origen varchar(10)
	CONSTRAINT uk_mae_sexos UNIQUE (cod_sexo),
	CONSTRAINT PK_tbn1_mae_sexos PRIMARY KEY CLUSTERED (id_mae_sexos)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND COLUMN_NAME='id_mae_sexos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ADD id_mae_sexos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND COLUMN_NAME='cod_sexo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ADD cod_sexo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND COLUMN_NAME='sexo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ADD sexo varchar(40)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND COLUMN_NAME='id_mae_sexos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ALTER COLUMN id_mae_sexos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND COLUMN_NAME='cod_sexo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ALTER COLUMN cod_sexo varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND COLUMN_NAME='sexo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ALTER COLUMN sexo varchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_sexos' AND CONSTRAINT_NAME='PK_tbn1_mae_sexos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ADD CONSTRAINT PK_tbn1_mae_sexos PRIMARY KEY CLUSTERED (id_mae_sexos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_sexos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_sexos;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_sexos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_sexos'
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
			'H' AS cod_sexo,
			'Hombre' AS sexo
		UNION
		SELECT
			'M' AS cod_sexo,
			'Mujer' AS sexo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_sexos AS tbn1_mae_sexos
	USING query ON query.cod_sexo=tbn1_mae_sexos.cod_sexo
	WHEN MATCHED AND ((tbn1_mae_sexos.sexo<>query.sexo OR (tbn1_mae_sexos.sexo IS NULL AND query.sexo IS NOT NULL) OR (tbn1_mae_sexos.sexo IS NOT NULL AND query.sexo IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			sexo=query.sexo
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_sexo,sexo) VALUES (
			'MAESTRO',
			query.cod_sexo,
			query.sexo
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_sexos ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_sexos
		WHERE	id_mae_sexos = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_sexos
		(
			id_mae_sexos,
			cod_sexo,
			sexo,
			origen
		)
		VALUES
		(
			-1,
			'',
			'',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_sexos OFF

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
