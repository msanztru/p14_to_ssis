PRINT 'Script maestro_tipo_importe.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_importe')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe(
	id_mae_tipo_importe int IDENTITY(1,1),
	cod_tipo_importe varchar(2),
	tipo_importe varchar(50),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_tipo_importe PRIMARY KEY CLUSTERED (id_mae_tipo_importe)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_importe' AND COLUMN_NAME='id_mae_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe ADD id_mae_tipo_importe int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_importe' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe ADD cod_tipo_importe varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_importe' AND COLUMN_NAME='tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe ADD tipo_importe varchar(50)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_importe_unique')
DROP INDEX IX_tbn1_mae_tipo_importe_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_tipo_importe_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe (cod_tipo_importe) INCLUDE (id_mae_tipo_importe)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_tipo_importe' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_tipo_importe;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_tipo_importe(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_importe'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe WHERE id_mae_tipo_importe=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe(id_mae_tipo_importe,cod_tipo_importe,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe OFF

		IF OBJECT_ID('tempdb..#tmp_mae_tipo_importe') IS NOT NULL
			DROP TABLE #tmp_mae_tipo_importe
		CREATE table #tmp_mae_tipo_importe(
			rr_mode varchar(1),
			id_mae_tipo_importe int,
			t_cod_tipo_importe varchar(2),
			cod_tipo_importe varchar(2),
			tipo_importe varchar(50)
		);

		;WITH
		query AS (
			SELECT
				cod_tipo_importe,
				tipo_importe
			FROM dbo.fnn1_query_carga_maestro_tipo_importe()
		)
		INSERT INTO #tmp_mae_tipo_importe (rr_mode,id_mae_tipo_importe,t_cod_tipo_importe,cod_tipo_importe,tipo_importe)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_tipo_importe.id_mae_tipo_importe IS NULL THEN 'I'
					WHEN query.cod_tipo_importe IS NULL AND id_mae_tipo_importe<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_tipo_importe.id_mae_tipo_importe AS id_mae_tipo_importe,
			tbn1_mae_tipo_importe.cod_tipo_importe AS t_cod_tipo_importe,
			query.cod_tipo_importe AS cod_tipo_importe,
			query.tipo_importe AS tipo_importe
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe AS tbn1_mae_tipo_importe
		FULL JOIN query on ((query.cod_tipo_importe=tbn1_mae_tipo_importe.cod_tipo_importe OR (query.cod_tipo_importe IS NULL AND tbn1_mae_tipo_importe.cod_tipo_importe IS NULL)))
		WHERE 
			id_mae_tipo_importe IS NULL OR
			(query.cod_tipo_importe IS NULL AND id_mae_tipo_importe<>-1) OR
			(tbn1_mae_tipo_importe.tipo_importe<>query.tipo_importe OR (tbn1_mae_tipo_importe.tipo_importe IS NULL AND query.tipo_importe IS NOT NULL) OR (tbn1_mae_tipo_importe.tipo_importe IS NOT NULL AND query.tipo_importe IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_tipo_importe
		SELECT @count_ins = count(*) from #tmp_mae_tipo_importe where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe
			SET
				origen='MAESTRO',
				cod_tipo_importe=s.cod_tipo_importe,
				tipo_importe=s.tipo_importe
		FROM (
			SELECT
				cod_tipo_importe,
				tipo_importe
			FROM #tmp_mae_tipo_importe
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe.cod_tipo_importe=s.cod_tipo_importe OR (dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe.cod_tipo_importe IS NULL AND s.cod_tipo_importe IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_importe_unique')
			ALTER INDEX IX_tbn1_mae_tipo_importe_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe(cod_tipo_importe,tipo_importe,origen)
		SELECT
			cod_tipo_importe,
			tipo_importe
			,'MAESTRO' as origen
			FROM #tmp_mae_tipo_importe
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_importe_unique')
			ALTER INDEX IX_tbn1_mae_tipo_importe_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_tipo_importe') IS NOT NULL
			DROP TABLE #tmp_mae_tipo_importe
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
