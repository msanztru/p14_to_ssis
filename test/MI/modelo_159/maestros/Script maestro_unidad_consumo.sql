PRINT 'Script maestro_unidad_consumo.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_consumo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo(
	id_mae_unidad_consumo int IDENTITY(1,1),
	cod_unidad_consumo varchar(1),
	unidad_consumo varchar(20),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_unidad_consumo PRIMARY KEY CLUSTERED (id_mae_unidad_consumo)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_consumo' AND COLUMN_NAME='id_mae_unidad_consumo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo ADD id_mae_unidad_consumo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_consumo' AND COLUMN_NAME='cod_unidad_consumo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo ADD cod_unidad_consumo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_consumo' AND COLUMN_NAME='unidad_consumo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo ADD unidad_consumo varchar(20)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_unidad_consumo_unique')
DROP INDEX IX_tbn1_mae_unidad_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_unidad_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo (cod_unidad_consumo) INCLUDE (id_mae_unidad_consumo)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_unidad_consumo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_unidad_consumo;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_unidad_consumo(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_unidad_consumo'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo WHERE id_mae_unidad_consumo=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo(id_mae_unidad_consumo,cod_unidad_consumo,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo OFF

		IF OBJECT_ID('tempdb..#tmp_mae_unidad_consumo') IS NOT NULL
			DROP TABLE #tmp_mae_unidad_consumo
		CREATE table #tmp_mae_unidad_consumo(
			rr_mode varchar(1),
			id_mae_unidad_consumo int,
			t_cod_unidad_consumo varchar(1),
			cod_unidad_consumo varchar(1),
			unidad_consumo varchar(20)
		);

		;WITH
		query AS (
			SELECT
				cod_unidad_consumo,
				unidad_consumo
			FROM dbo.fnn1_query_carga_maestro_unidad_consumo()
		)
		INSERT INTO #tmp_mae_unidad_consumo (rr_mode,id_mae_unidad_consumo,t_cod_unidad_consumo,cod_unidad_consumo,unidad_consumo)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_unidad_consumo.id_mae_unidad_consumo IS NULL THEN 'I'
					WHEN query.cod_unidad_consumo IS NULL AND id_mae_unidad_consumo<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_unidad_consumo.id_mae_unidad_consumo AS id_mae_unidad_consumo,
			tbn1_mae_unidad_consumo.cod_unidad_consumo AS t_cod_unidad_consumo,
			query.cod_unidad_consumo AS cod_unidad_consumo,
			query.unidad_consumo AS unidad_consumo
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo AS tbn1_mae_unidad_consumo
		FULL JOIN query on ((query.cod_unidad_consumo=tbn1_mae_unidad_consumo.cod_unidad_consumo OR (query.cod_unidad_consumo IS NULL AND tbn1_mae_unidad_consumo.cod_unidad_consumo IS NULL)))
		WHERE 
			id_mae_unidad_consumo IS NULL OR
			(query.cod_unidad_consumo IS NULL AND id_mae_unidad_consumo<>-1) OR
			(tbn1_mae_unidad_consumo.unidad_consumo<>query.unidad_consumo OR (tbn1_mae_unidad_consumo.unidad_consumo IS NULL AND query.unidad_consumo IS NOT NULL) OR (tbn1_mae_unidad_consumo.unidad_consumo IS NOT NULL AND query.unidad_consumo IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_unidad_consumo
		SELECT @count_ins = count(*) from #tmp_mae_unidad_consumo where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo
			SET
				origen='MAESTRO',
				cod_unidad_consumo=s.cod_unidad_consumo,
				unidad_consumo=s.unidad_consumo
		FROM (
			SELECT
				cod_unidad_consumo,
				unidad_consumo
			FROM #tmp_mae_unidad_consumo
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo.cod_unidad_consumo=s.cod_unidad_consumo OR (dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo.cod_unidad_consumo IS NULL AND s.cod_unidad_consumo IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_unidad_consumo_unique')
			ALTER INDEX IX_tbn1_mae_unidad_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo(cod_unidad_consumo,unidad_consumo,origen)
		SELECT
			cod_unidad_consumo,
			unidad_consumo
			,'MAESTRO' as origen
			FROM #tmp_mae_unidad_consumo
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_unidad_consumo_unique')
			ALTER INDEX IX_tbn1_mae_unidad_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_unidad_consumo') IS NOT NULL
			DROP TABLE #tmp_mae_unidad_consumo
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
