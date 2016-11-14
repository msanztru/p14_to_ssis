PRINT 'Script maestro_claves_caracteres_intervencion.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_caracteres_intervencion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion(
	id_mae_claves_caracteres_intervencion int IDENTITY(1,1),
	cod_clave_caracter_intervencion varchar(1),
	clave_caracter_intervencion varchar(50),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_claves_caracteres_intervencion PRIMARY KEY CLUSTERED (id_mae_claves_caracteres_intervencion)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_caracteres_intervencion' AND COLUMN_NAME='id_mae_claves_caracteres_intervencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion ADD id_mae_claves_caracteres_intervencion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_caracteres_intervencion' AND COLUMN_NAME='cod_clave_caracter_intervencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion ADD cod_clave_caracter_intervencion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_caracteres_intervencion' AND COLUMN_NAME='clave_caracter_intervencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion ADD clave_caracter_intervencion varchar(50)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_claves_caracteres_intervencion_unique')
DROP INDEX IX_tbn1_mae_claves_caracteres_intervencion_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_claves_caracteres_intervencion_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion (cod_clave_caracter_intervencion) INCLUDE (id_mae_claves_caracteres_intervencion)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_caracteres_intervencion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_caracteres_intervencion;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_caracteres_intervencion(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_caracteres_intervencion'
	SET NOCOUNT ON;
	DECLARE @log int;
	DECLARE @rc int;
	DECLARE @count_all int;
	DECLARE @count_ins int;
	DECLARE @idx_reclim int;
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion WHERE id_mae_claves_caracteres_intervencion=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion(id_mae_claves_caracteres_intervencion,cod_clave_caracter_intervencion,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion OFF

		IF OBJECT_ID('tempdb..#tmp_mae_claves_caracteres_intervencion') IS NOT NULL
			DROP TABLE #tmp_mae_claves_caracteres_intervencion
		CREATE table #tmp_mae_claves_caracteres_intervencion(
			rr_mode varchar(1),
			id_mae_claves_caracteres_intervencion int,
			t_cod_clave_caracter_intervencion varchar(1),
			cod_clave_caracter_intervencion varchar(1),
			clave_caracter_intervencion varchar(50)
		);

		;WITH
		query AS (
			SELECT
				cod_clave_caracter_intervencion,
				clave_caracter_intervencion
			FROM dbo.fnn1_query_carga_maestro_claves_caracteres_intervencion()
		)
		INSERT INTO #tmp_mae_claves_caracteres_intervencion (rr_mode,id_mae_claves_caracteres_intervencion,t_cod_clave_caracter_intervencion,cod_clave_caracter_intervencion,clave_caracter_intervencion)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_claves_caracteres_intervencion.id_mae_claves_caracteres_intervencion IS NULL THEN 'I'
					WHEN query.cod_clave_caracter_intervencion IS NULL AND id_mae_claves_caracteres_intervencion<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_claves_caracteres_intervencion.id_mae_claves_caracteres_intervencion AS id_mae_claves_caracteres_intervencion,
			tbn1_mae_claves_caracteres_intervencion.cod_clave_caracter_intervencion AS t_cod_clave_caracter_intervencion,
			query.cod_clave_caracter_intervencion AS cod_clave_caracter_intervencion,
			query.clave_caracter_intervencion AS clave_caracter_intervencion
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion AS tbn1_mae_claves_caracteres_intervencion
		FULL JOIN query on ((query.cod_clave_caracter_intervencion=tbn1_mae_claves_caracteres_intervencion.cod_clave_caracter_intervencion OR (query.cod_clave_caracter_intervencion IS NULL AND tbn1_mae_claves_caracteres_intervencion.cod_clave_caracter_intervencion IS NULL)))
		WHERE 
			id_mae_claves_caracteres_intervencion IS NULL OR
			(query.cod_clave_caracter_intervencion IS NULL AND id_mae_claves_caracteres_intervencion<>-1) OR
			(tbn1_mae_claves_caracteres_intervencion.clave_caracter_intervencion<>query.clave_caracter_intervencion OR (tbn1_mae_claves_caracteres_intervencion.clave_caracter_intervencion IS NULL AND query.clave_caracter_intervencion IS NOT NULL) OR (tbn1_mae_claves_caracteres_intervencion.clave_caracter_intervencion IS NOT NULL AND query.clave_caracter_intervencion IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_claves_caracteres_intervencion
		SELECT @count_ins = count(*) from #tmp_mae_claves_caracteres_intervencion where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion
			SET
				origen='MAESTRO',
				cod_clave_caracter_intervencion=s.cod_clave_caracter_intervencion,
				clave_caracter_intervencion=s.clave_caracter_intervencion
		FROM (
			SELECT
				cod_clave_caracter_intervencion,
				clave_caracter_intervencion
			FROM #tmp_mae_claves_caracteres_intervencion
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion.cod_clave_caracter_intervencion=s.cod_clave_caracter_intervencion OR (dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion.cod_clave_caracter_intervencion IS NULL AND s.cod_clave_caracter_intervencion IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_claves_caracteres_intervencion_unique')
			ALTER INDEX IX_tbn1_mae_claves_caracteres_intervencion_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion(cod_clave_caracter_intervencion,clave_caracter_intervencion,origen)
		SELECT
			cod_clave_caracter_intervencion,
			clave_caracter_intervencion
			,'MAESTRO' as origen
			FROM #tmp_mae_claves_caracteres_intervencion
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_claves_caracteres_intervencion_unique')
			ALTER INDEX IX_tbn1_mae_claves_caracteres_intervencion_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_claves_caracteres_intervencion') IS NOT NULL
			DROP TABLE #tmp_mae_claves_caracteres_intervencion
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@rc;
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
