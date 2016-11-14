PRINT 'Script maestro_situacion_inmueble.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_situacion_inmueble')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble(
	id_mae_situacion_inmueble int IDENTITY(1,1),
	cod_situacion_inmueble varchar(1),
	situacion_inmueble varchar(150),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_situacion_inmueble PRIMARY KEY CLUSTERED (id_mae_situacion_inmueble)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_situacion_inmueble' AND COLUMN_NAME='id_mae_situacion_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble ADD id_mae_situacion_inmueble int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_situacion_inmueble' AND COLUMN_NAME='cod_situacion_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble ADD cod_situacion_inmueble varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_situacion_inmueble' AND COLUMN_NAME='situacion_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble ADD situacion_inmueble varchar(150)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_situacion_inmueble_unique')
DROP INDEX IX_tbn1_mae_situacion_inmueble_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_situacion_inmueble_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble (cod_situacion_inmueble) INCLUDE (id_mae_situacion_inmueble)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_situacion_inmueble' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_situacion_inmueble;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_situacion_inmueble(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_situacion_inmueble'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble WHERE id_mae_situacion_inmueble=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble(id_mae_situacion_inmueble,cod_situacion_inmueble,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble OFF

		IF OBJECT_ID('tempdb..#tmp_mae_situacion_inmueble') IS NOT NULL
			DROP TABLE #tmp_mae_situacion_inmueble
		CREATE table #tmp_mae_situacion_inmueble(
			rr_mode varchar(1),
			id_mae_situacion_inmueble int,
			t_cod_situacion_inmueble varchar(1),
			cod_situacion_inmueble varchar(1),
			situacion_inmueble varchar(150)
		);

		;WITH
		query AS (
			SELECT
				cod_situacion_inmueble,
				situacion_inmueble
			FROM dbo.fnn1_query_carga_maestro_situacion_inmueble()
		)
		INSERT INTO #tmp_mae_situacion_inmueble (rr_mode,id_mae_situacion_inmueble,t_cod_situacion_inmueble,cod_situacion_inmueble,situacion_inmueble)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_situacion_inmueble.id_mae_situacion_inmueble IS NULL THEN 'I'
					WHEN query.cod_situacion_inmueble IS NULL AND id_mae_situacion_inmueble<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_situacion_inmueble.id_mae_situacion_inmueble AS id_mae_situacion_inmueble,
			tbn1_mae_situacion_inmueble.cod_situacion_inmueble AS t_cod_situacion_inmueble,
			query.cod_situacion_inmueble AS cod_situacion_inmueble,
			query.situacion_inmueble AS situacion_inmueble
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble AS tbn1_mae_situacion_inmueble
		FULL JOIN query on ((query.cod_situacion_inmueble=tbn1_mae_situacion_inmueble.cod_situacion_inmueble OR (query.cod_situacion_inmueble IS NULL AND tbn1_mae_situacion_inmueble.cod_situacion_inmueble IS NULL)))
		WHERE 
			id_mae_situacion_inmueble IS NULL OR
			(query.cod_situacion_inmueble IS NULL AND id_mae_situacion_inmueble<>-1) OR
			(tbn1_mae_situacion_inmueble.situacion_inmueble<>query.situacion_inmueble OR (tbn1_mae_situacion_inmueble.situacion_inmueble IS NULL AND query.situacion_inmueble IS NOT NULL) OR (tbn1_mae_situacion_inmueble.situacion_inmueble IS NOT NULL AND query.situacion_inmueble IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_situacion_inmueble
		SELECT @count_ins = count(*) from #tmp_mae_situacion_inmueble where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble
			SET
				origen='MAESTRO',
				cod_situacion_inmueble=s.cod_situacion_inmueble,
				situacion_inmueble=s.situacion_inmueble
		FROM (
			SELECT
				cod_situacion_inmueble,
				situacion_inmueble
			FROM #tmp_mae_situacion_inmueble
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble.cod_situacion_inmueble=s.cod_situacion_inmueble OR (dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble.cod_situacion_inmueble IS NULL AND s.cod_situacion_inmueble IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_situacion_inmueble_unique')
			ALTER INDEX IX_tbn1_mae_situacion_inmueble_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble(cod_situacion_inmueble,situacion_inmueble,origen)
		SELECT
			cod_situacion_inmueble,
			situacion_inmueble
			,'MAESTRO' as origen
			FROM #tmp_mae_situacion_inmueble
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_situacion_inmueble_unique')
			ALTER INDEX IX_tbn1_mae_situacion_inmueble_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_situacion_inmueble') IS NOT NULL
			DROP TABLE #tmp_mae_situacion_inmueble
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
