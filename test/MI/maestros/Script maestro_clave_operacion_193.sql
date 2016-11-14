PRINT 'Script maestro_clave_operacion_193.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_clave_operacion_193')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193(
	id_mae_clave_operacion_193 int IDENTITY(1,1),
	cod_clave_operacion_193 varchar(1),
	clave_operacion_193 varchar(200),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_clave_operacion_193 PRIMARY KEY CLUSTERED (id_mae_clave_operacion_193)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_clave_operacion_193' AND COLUMN_NAME='id_mae_clave_operacion_193')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 ADD id_mae_clave_operacion_193 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_clave_operacion_193' AND COLUMN_NAME='cod_clave_operacion_193')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 ADD cod_clave_operacion_193 varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_clave_operacion_193' AND COLUMN_NAME='clave_operacion_193')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 ADD clave_operacion_193 varchar(200)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_clave_operacion_193_unique')
DROP INDEX IX_tbn1_mae_clave_operacion_193_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_clave_operacion_193_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 (cod_clave_operacion_193) INCLUDE (id_mae_clave_operacion_193)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_clave_operacion_193' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_clave_operacion_193;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_clave_operacion_193(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_clave_operacion_193'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 WHERE id_mae_clave_operacion_193=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193(id_mae_clave_operacion_193,cod_clave_operacion_193,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 OFF

		IF OBJECT_ID('tempdb..#tmp_mae_clave_operacion_193') IS NOT NULL
			DROP TABLE #tmp_mae_clave_operacion_193
		CREATE table #tmp_mae_clave_operacion_193(
			rr_mode varchar(1),
			id_mae_clave_operacion_193 int,
			t_cod_clave_operacion_193 varchar(1),
			cod_clave_operacion_193 varchar(1),
			clave_operacion_193 varchar(200)
		);

		;WITH
		query AS (
			SELECT
				cod_clave_operacion_193,
				clave_operacion_193
			FROM dbo.fnn1_query_carga_maestro_clave_operacion_193()
		)
		INSERT INTO #tmp_mae_clave_operacion_193 (rr_mode,id_mae_clave_operacion_193,t_cod_clave_operacion_193,cod_clave_operacion_193,clave_operacion_193)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_clave_operacion_193.id_mae_clave_operacion_193 IS NULL THEN 'I'
					WHEN query.cod_clave_operacion_193 IS NULL AND id_mae_clave_operacion_193<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_clave_operacion_193.id_mae_clave_operacion_193 AS id_mae_clave_operacion_193,
			tbn1_mae_clave_operacion_193.cod_clave_operacion_193 AS t_cod_clave_operacion_193,
			query.cod_clave_operacion_193 AS cod_clave_operacion_193,
			query.clave_operacion_193 AS clave_operacion_193
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 AS tbn1_mae_clave_operacion_193
		FULL JOIN query on ((query.cod_clave_operacion_193=tbn1_mae_clave_operacion_193.cod_clave_operacion_193 OR (query.cod_clave_operacion_193 IS NULL AND tbn1_mae_clave_operacion_193.cod_clave_operacion_193 IS NULL)))
		WHERE 
			id_mae_clave_operacion_193 IS NULL OR
			(query.cod_clave_operacion_193 IS NULL AND id_mae_clave_operacion_193<>-1) OR
			(tbn1_mae_clave_operacion_193.clave_operacion_193<>query.clave_operacion_193 OR (tbn1_mae_clave_operacion_193.clave_operacion_193 IS NULL AND query.clave_operacion_193 IS NOT NULL) OR (tbn1_mae_clave_operacion_193.clave_operacion_193 IS NOT NULL AND query.clave_operacion_193 IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_clave_operacion_193
		SELECT @count_ins = count(*) from #tmp_mae_clave_operacion_193 where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193
			SET
				origen='MAESTRO',
				cod_clave_operacion_193=s.cod_clave_operacion_193,
				clave_operacion_193=s.clave_operacion_193
		FROM (
			SELECT
				cod_clave_operacion_193,
				clave_operacion_193
			FROM #tmp_mae_clave_operacion_193
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193.cod_clave_operacion_193=s.cod_clave_operacion_193 OR (dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193.cod_clave_operacion_193 IS NULL AND s.cod_clave_operacion_193 IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_clave_operacion_193_unique')
			ALTER INDEX IX_tbn1_mae_clave_operacion_193_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193(cod_clave_operacion_193,clave_operacion_193,origen)
		SELECT
			cod_clave_operacion_193,
			clave_operacion_193
			,'MAESTRO' as origen
			FROM #tmp_mae_clave_operacion_193
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_clave_operacion_193_unique')
			ALTER INDEX IX_tbn1_mae_clave_operacion_193_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_clave_operacion_193') IS NOT NULL
			DROP TABLE #tmp_mae_clave_operacion_193
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
