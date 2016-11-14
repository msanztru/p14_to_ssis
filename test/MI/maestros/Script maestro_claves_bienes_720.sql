PRINT 'Script maestro_claves_bienes_720.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720(
	id_mae_claves_bienes_720 int IDENTITY(1,1),
	cod_clave_bien_720 varchar(1) NOT NULL,
	clave_bien_720 varchar(500),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_bienes_720 UNIQUE (cod_clave_bien_720),
	CONSTRAINT PK_tbn1_mae_claves_bienes_720 PRIMARY KEY CLUSTERED (id_mae_claves_bienes_720)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND COLUMN_NAME='id_mae_claves_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ADD id_mae_claves_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND COLUMN_NAME='cod_clave_bien_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ADD cod_clave_bien_720 varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND COLUMN_NAME='clave_bien_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ADD clave_bien_720 varchar(500)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND COLUMN_NAME='id_mae_claves_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ALTER COLUMN id_mae_claves_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND COLUMN_NAME='cod_clave_bien_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ALTER COLUMN cod_clave_bien_720 varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND COLUMN_NAME='clave_bien_720' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ALTER COLUMN clave_bien_720 varchar(500) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_bienes_720' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_bienes_720')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 ADD CONSTRAINT PK_tbn1_mae_claves_bienes_720 PRIMARY KEY CLUSTERED (id_mae_claves_bienes_720)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_bienes_720' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_bienes_720;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_bienes_720(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_bienes_720'
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
		'C' AS cod_clave_bien_720,
		'Cuentas abiertas en entidades que se dediquen al tráfico bancario o crediticio y se encuentren situadas en el extranjero' AS clave_bien_720
		UNION SELECT
		'V' AS cod_clave_bien_720,
		'Valores o derechos situados en el extranjero representativos de la participación en cualquier tipo de entidad jurídica, valores situados en el extranjero representativos de la cesión de capitales propios a terceros o aportados para su gestión o administración a cualquier instrumento jurídico, incluyendo fideicomisos y «trusts» o masas patrimoniales que, no obstante carecer de personalidad jurídica, puedan actuar en el tráfico económico' AS clave_bien_720
		UNION SELECT
		'I' AS cod_clave_bien_720,
		'Acciones y participaciones en el capital social o fondo patrimonial de Instituciones de Inversión Colectiva situadas en el extranjero' AS clave_bien_720
		UNION SELECT
		'S' AS cod_clave_bien_720,
		'Seguros de vida o invalidez y rentas temporales o vitalicias, cuyas entidades aseguradoras se encuentren situadas en el extranjero' AS clave_bien_720
		UNION SELECT
		'B' AS cod_clave_bien_720,
		'Titularidad y derechos reales sobre inmuebles ubicados en el extranjero' AS clave_bien_720
		UNION SELECT
		'M' AS cod_clave_bien_720,
		'Titularidad y derechos sobre bienes muebles situados o se hayan encontrado situados en el extranjero' AS clave_bien_720
		UNION SELECT
		'R' AS cod_clave_bien_720,
		'Titularidad y derechos sobre bienes muebles matriculados o inscritos en registros situados en el extranjero' AS clave_bien_720
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 AS tbn1_mae_claves_bienes_720
	USING query ON query.cod_clave_bien_720=tbn1_mae_claves_bienes_720.cod_clave_bien_720
	WHEN MATCHED AND ((tbn1_mae_claves_bienes_720.clave_bien_720<>query.clave_bien_720 OR (tbn1_mae_claves_bienes_720.clave_bien_720 IS NULL AND query.clave_bien_720 IS NOT NULL) OR (tbn1_mae_claves_bienes_720.clave_bien_720 IS NOT NULL AND query.clave_bien_720 IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_bien_720=query.clave_bien_720
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_bien_720,clave_bien_720) VALUES (
			'MAESTRO',
			query.cod_clave_bien_720,
			query.clave_bien_720
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
