PRINT 'Script maestro_claves_actividad_ppal_mf.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf(
	id_mae_claves_actividad_ppal_mf int IDENTITY(1,1),
	cod_clave_actividad_ppal_mf varchar(1) NOT NULL,
	clave_actividad_ppal_mf varchar(100),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_actividad_ppal_mf UNIQUE (cod_clave_actividad_ppal_mf),
	CONSTRAINT PK_tbn1_mae_claves_actividad_ppal_mf PRIMARY KEY CLUSTERED (id_mae_claves_actividad_ppal_mf)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND COLUMN_NAME='id_mae_claves_actividad_ppal_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ADD id_mae_claves_actividad_ppal_mf int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND COLUMN_NAME='cod_clave_actividad_ppal_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ADD cod_clave_actividad_ppal_mf varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND COLUMN_NAME='clave_actividad_ppal_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ADD clave_actividad_ppal_mf varchar(100)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND COLUMN_NAME='id_mae_claves_actividad_ppal_mf' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ALTER COLUMN id_mae_claves_actividad_ppal_mf int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND COLUMN_NAME='cod_clave_actividad_ppal_mf' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ALTER COLUMN cod_clave_actividad_ppal_mf varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND COLUMN_NAME='clave_actividad_ppal_mf' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ALTER COLUMN clave_actividad_ppal_mf varchar(100) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_actividad_ppal_mf' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_actividad_ppal_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ADD CONSTRAINT PK_tbn1_mae_claves_actividad_ppal_mf PRIMARY KEY CLUSTERED (id_mae_claves_actividad_ppal_mf)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_actividad_ppal_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_actividad_ppal_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_actividad_ppal_mf(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_actividad_ppal_mf'
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

	
	;WITH query AS 
	(
		SELECT	'1' AS cod_clave_actividad_ppal_mf,
				'Actividad empresarial' AS clave_actividad_ppal_mf
		UNION
		SELECT	'2' AS cod_clave_actividad_ppal_mf,
				'Actividad profesional' AS clave_actividad_ppal_mf
		UNION
		SELECT	'3' AS cod_clave_actividad_ppal_mf,
				'Tenencia y administración de bienes inmuebles' AS clave_actividad_ppal_mf
		UNION
		SELECT	'4' AS cod_clave_actividad_ppal_mf,
				'Tenencia y administración de valores o activos financieros' AS clave_actividad_ppal_mf
		UNION
		SELECT	'5' AS cod_clave_actividad_ppal_mf,
				'Otras' AS clave_actividad_ppal_mf
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf AS tbn1_mae_claves_actividad_ppal_mf
	USING query ON query.cod_clave_actividad_ppal_mf=tbn1_mae_claves_actividad_ppal_mf.cod_clave_actividad_ppal_mf
	WHEN MATCHED AND ((tbn1_mae_claves_actividad_ppal_mf.clave_actividad_ppal_mf<>query.clave_actividad_ppal_mf OR (tbn1_mae_claves_actividad_ppal_mf.clave_actividad_ppal_mf IS NULL AND query.clave_actividad_ppal_mf IS NOT NULL) OR (tbn1_mae_claves_actividad_ppal_mf.clave_actividad_ppal_mf IS NOT NULL AND query.clave_actividad_ppal_mf IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_actividad_ppal_mf=query.clave_actividad_ppal_mf
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_actividad_ppal_mf,clave_actividad_ppal_mf) VALUES (
			'MAESTRO',
			query.cod_clave_actividad_ppal_mf,
			query.clave_actividad_ppal_mf
			);
	
-----Inicio: incluir registro -1-----
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf
		WHERE	id_mae_claves_actividad_ppal_mf = -1
	)
	INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf
	(
		id_mae_claves_actividad_ppal_mf,
		cod_clave_actividad_ppal_mf,
		clave_actividad_ppal_mf,
		origen
	)
	VALUES
	(	
		-1,
		'', --'-',
		'N/A',
		'MAESTRO' --'MOD. 184'
	)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf OFF
	-----Fin: incluir registro -1-----	
	
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
