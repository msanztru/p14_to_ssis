PRINT 'Script maestro_tipo_bien.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_bien')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien(
	id_mae_tipo_bien int IDENTITY(1,1),
	cod_tipo_bien varchar(1),
	tipo_bien varchar(50),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_tipo_bien PRIMARY KEY CLUSTERED (id_mae_tipo_bien)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_bien' AND COLUMN_NAME='id_mae_tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien ADD id_mae_tipo_bien int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_bien' AND COLUMN_NAME='cod_tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien ADD cod_tipo_bien varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_bien' AND COLUMN_NAME='tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien ADD tipo_bien varchar(50)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_bien_unique')
DROP INDEX IX_tbn1_mae_tipo_bien_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_tipo_bien_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien (cod_tipo_bien) INCLUDE (id_mae_tipo_bien)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_tipo_bien' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_tipo_bien;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_tipo_bien(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_bien'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien WHERE id_mae_tipo_bien=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien(id_mae_tipo_bien,cod_tipo_bien,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien OFF

		IF OBJECT_ID('tempdb..#tmp_mae_tipo_bien') IS NOT NULL
			DROP TABLE #tmp_mae_tipo_bien
		CREATE table #tmp_mae_tipo_bien(
			rr_mode varchar(1),
			id_mae_tipo_bien int,
			t_cod_tipo_bien varchar(1),
			cod_tipo_bien varchar(1),
			tipo_bien varchar(50)
		);

		;WITH
		query AS (
			SELECT
				cod_tipo_bien,
				tipo_bien
			FROM dbo.fnn1_query_carga_maestro_tipo_bien()
		)
		INSERT INTO #tmp_mae_tipo_bien (rr_mode,id_mae_tipo_bien,t_cod_tipo_bien,cod_tipo_bien,tipo_bien)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_tipo_bien.id_mae_tipo_bien IS NULL THEN 'I'
					WHEN query.cod_tipo_bien IS NULL AND id_mae_tipo_bien<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_tipo_bien.id_mae_tipo_bien AS id_mae_tipo_bien,
			tbn1_mae_tipo_bien.cod_tipo_bien AS t_cod_tipo_bien,
			query.cod_tipo_bien AS cod_tipo_bien,
			query.tipo_bien AS tipo_bien
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien AS tbn1_mae_tipo_bien
		FULL JOIN query on ((query.cod_tipo_bien=tbn1_mae_tipo_bien.cod_tipo_bien OR (query.cod_tipo_bien IS NULL AND tbn1_mae_tipo_bien.cod_tipo_bien IS NULL)))
		WHERE 
			id_mae_tipo_bien IS NULL OR
			(query.cod_tipo_bien IS NULL AND id_mae_tipo_bien<>-1) OR
			(tbn1_mae_tipo_bien.tipo_bien<>query.tipo_bien OR (tbn1_mae_tipo_bien.tipo_bien IS NULL AND query.tipo_bien IS NOT NULL) OR (tbn1_mae_tipo_bien.tipo_bien IS NOT NULL AND query.tipo_bien IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_tipo_bien
		SELECT @count_ins = count(*) from #tmp_mae_tipo_bien where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien
			SET
				origen='MAESTRO',
				cod_tipo_bien=s.cod_tipo_bien,
				tipo_bien=s.tipo_bien
		FROM (
			SELECT
				cod_tipo_bien,
				tipo_bien
			FROM #tmp_mae_tipo_bien
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien.cod_tipo_bien=s.cod_tipo_bien OR (dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien.cod_tipo_bien IS NULL AND s.cod_tipo_bien IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_bien_unique')
			ALTER INDEX IX_tbn1_mae_tipo_bien_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien(cod_tipo_bien,tipo_bien,origen)
		SELECT
			cod_tipo_bien,
			tipo_bien
			,'MAESTRO' as origen
			FROM #tmp_mae_tipo_bien
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_bien_unique')
			ALTER INDEX IX_tbn1_mae_tipo_bien_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_tipo_bien') IS NOT NULL
			DROP TABLE #tmp_mae_tipo_bien
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
