PRINT 'Script maestro_origenes_bienes_720.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720(
	id_mae_origenes_bienes_720 int IDENTITY(1,1),
	cod_origen_bien_720 varchar(1) NOT NULL,
	origen_bien_720 varchar(400),
	origen varchar(10)
	CONSTRAINT uk_mae_origenes_bienes_720 UNIQUE (cod_origen_bien_720),
	CONSTRAINT PK_tbn1_mae_origenes_bienes_720 PRIMARY KEY CLUSTERED (id_mae_origenes_bienes_720)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND COLUMN_NAME='id_mae_origenes_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ADD id_mae_origenes_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND COLUMN_NAME='cod_origen_bien_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ADD cod_origen_bien_720 varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND COLUMN_NAME='origen_bien_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ADD origen_bien_720 varchar(400)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND COLUMN_NAME='id_mae_origenes_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ALTER COLUMN id_mae_origenes_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND COLUMN_NAME='cod_origen_bien_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ALTER COLUMN cod_origen_bien_720 varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND COLUMN_NAME='origen_bien_720' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ALTER COLUMN origen_bien_720 varchar(400) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_origenes_bienes_720' AND CONSTRAINT_NAME='PK_tbn1_mae_origenes_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 ADD CONSTRAINT PK_tbn1_mae_origenes_bienes_720 PRIMARY KEY CLUSTERED (id_mae_origenes_bienes_720)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_origenes_bienes_720' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_origenes_bienes_720;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_origenes_bienes_720(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_origenes_bienes_720'
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
			'A' AS cod_origen_bien_720,
			'Bien o derecho que se declara por primera vez o que se incorpora en el ejercicio de la declaración' AS origen_bien_720
		UNION SELECT
			'M' AS cod_origen_bien_720,
			'Bien o derecho que ya ha sido declarado en ejercicios anteriores' AS origen_bien_720
		UNION SELECT
			'C' AS cod_origen_bien_720,
			'Bien o derecho que se declara porque se extingue la titularidad, se revoca la autorización o poder de disposición, o se extingue cualquier otra forma de titularidad real sobre el mismo' AS origen_bien_720
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 AS tbn1_mae_origenes_bienes_720
	USING query ON query.cod_origen_bien_720=tbn1_mae_origenes_bienes_720.cod_origen_bien_720
	WHEN MATCHED AND ((tbn1_mae_origenes_bienes_720.origen_bien_720<>query.origen_bien_720 OR (tbn1_mae_origenes_bienes_720.origen_bien_720 IS NULL AND query.origen_bien_720 IS NOT NULL) OR (tbn1_mae_origenes_bienes_720.origen_bien_720 IS NOT NULL AND query.origen_bien_720 IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			origen_bien_720=query.origen_bien_720
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_origen_bien_720,origen_bien_720) VALUES (
			'MAESTRO',
			query.cod_origen_bien_720,
			query.origen_bien_720
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
