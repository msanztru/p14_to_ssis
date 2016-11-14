PRINT 'Script maestro_claves_identificacion_valor_accion.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion(
	id_mae_claves_identificacion_valor_accion int IDENTITY(1,1),
	cod_clave_identificacion_valor_accion varchar(1) NOT NULL,
	clave_identificacion_valor_accion varchar(80),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_identificacion_valor_accion UNIQUE (cod_clave_identificacion_valor_accion),
	CONSTRAINT PK_tbn1_mae_claves_identificacion_valor_accion PRIMARY KEY CLUSTERED (id_mae_claves_identificacion_valor_accion)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND COLUMN_NAME='id_mae_claves_identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ADD id_mae_claves_identificacion_valor_accion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND COLUMN_NAME='cod_clave_identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ADD cod_clave_identificacion_valor_accion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND COLUMN_NAME='clave_identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ADD clave_identificacion_valor_accion varchar(80)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND COLUMN_NAME='id_mae_claves_identificacion_valor_accion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ALTER COLUMN id_mae_claves_identificacion_valor_accion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND COLUMN_NAME='cod_clave_identificacion_valor_accion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ALTER COLUMN cod_clave_identificacion_valor_accion varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND COLUMN_NAME='clave_identificacion_valor_accion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ALTER COLUMN clave_identificacion_valor_accion varchar(80) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_identificacion_valor_accion' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_identificacion_valor_accion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion ADD CONSTRAINT PK_tbn1_mae_claves_identificacion_valor_accion PRIMARY KEY CLUSTERED (id_mae_claves_identificacion_valor_accion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_identificacion_valor_accion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_identificacion_valor_accion;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_identificacion_valor_accion(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_identificacion_valor_accion'
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
			'1' AS cod_clave_identificacion_valor_accion,
			'Identificación por código ISIN' AS clave_identificacion_valor_accion
		UNION SELECT
			'2' AS cod_clave_identificacion_valor_accion,
			'Valores extranjeros sin código ISIN' AS clave_identificacion_valor_accion
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion AS tbn1_mae_claves_identificacion_valor_accion
	USING query ON query.cod_clave_identificacion_valor_accion=tbn1_mae_claves_identificacion_valor_accion.cod_clave_identificacion_valor_accion
	WHEN MATCHED AND ((tbn1_mae_claves_identificacion_valor_accion.clave_identificacion_valor_accion<>query.clave_identificacion_valor_accion OR (tbn1_mae_claves_identificacion_valor_accion.clave_identificacion_valor_accion IS NULL AND query.clave_identificacion_valor_accion IS NOT NULL) OR (tbn1_mae_claves_identificacion_valor_accion.clave_identificacion_valor_accion IS NOT NULL AND query.clave_identificacion_valor_accion IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_identificacion_valor_accion=query.clave_identificacion_valor_accion
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_identificacion_valor_accion,clave_identificacion_valor_accion) VALUES (
			'MAESTRO',
			query.cod_clave_identificacion_valor_accion,
			query.clave_identificacion_valor_accion
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
