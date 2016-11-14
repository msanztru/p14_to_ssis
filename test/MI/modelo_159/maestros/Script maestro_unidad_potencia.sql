PRINT 'Script maestro_unidad_potencia.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_potencia')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia(
	id_mae_unidad_potencia int IDENTITY(1,1),
	cod_unidad_potencia varchar(1),
	unidad_potencia varchar(20),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_unidad_potencia PRIMARY KEY CLUSTERED (id_mae_unidad_potencia)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_potencia' AND COLUMN_NAME='id_mae_unidad_potencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia ADD id_mae_unidad_potencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_potencia' AND COLUMN_NAME='cod_unidad_potencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia ADD cod_unidad_potencia varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_unidad_potencia' AND COLUMN_NAME='unidad_potencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia ADD unidad_potencia varchar(20)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_unidad_potencia_unique')
DROP INDEX IX_tbn1_mae_unidad_potencia_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_unidad_potencia_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia (cod_unidad_potencia) INCLUDE (id_mae_unidad_potencia)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_unidad_potencia' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_unidad_potencia;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_unidad_potencia(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_unidad_potencia'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia WHERE id_mae_unidad_potencia=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia(id_mae_unidad_potencia,cod_unidad_potencia,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia OFF

		IF OBJECT_ID('tempdb..#tmp_mae_unidad_potencia') IS NOT NULL
			DROP TABLE #tmp_mae_unidad_potencia
		CREATE table #tmp_mae_unidad_potencia(
			rr_mode varchar(1),
			id_mae_unidad_potencia int,
			t_cod_unidad_potencia varchar(1),
			cod_unidad_potencia varchar(1),
			unidad_potencia varchar(20)
		);

		;WITH
		query AS (
			SELECT
				cod_unidad_potencia,
				unidad_potencia
			FROM dbo.fnn1_query_carga_maestro_unidad_potencia()
		)
		INSERT INTO #tmp_mae_unidad_potencia (rr_mode,id_mae_unidad_potencia,t_cod_unidad_potencia,cod_unidad_potencia,unidad_potencia)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_unidad_potencia.id_mae_unidad_potencia IS NULL THEN 'I'
					WHEN query.cod_unidad_potencia IS NULL AND id_mae_unidad_potencia<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_unidad_potencia.id_mae_unidad_potencia AS id_mae_unidad_potencia,
			tbn1_mae_unidad_potencia.cod_unidad_potencia AS t_cod_unidad_potencia,
			query.cod_unidad_potencia AS cod_unidad_potencia,
			query.unidad_potencia AS unidad_potencia
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia AS tbn1_mae_unidad_potencia
		FULL JOIN query on ((query.cod_unidad_potencia=tbn1_mae_unidad_potencia.cod_unidad_potencia OR (query.cod_unidad_potencia IS NULL AND tbn1_mae_unidad_potencia.cod_unidad_potencia IS NULL)))
		WHERE 
			id_mae_unidad_potencia IS NULL OR
			(query.cod_unidad_potencia IS NULL AND id_mae_unidad_potencia<>-1) OR
			(tbn1_mae_unidad_potencia.unidad_potencia<>query.unidad_potencia OR (tbn1_mae_unidad_potencia.unidad_potencia IS NULL AND query.unidad_potencia IS NOT NULL) OR (tbn1_mae_unidad_potencia.unidad_potencia IS NOT NULL AND query.unidad_potencia IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_unidad_potencia
		SELECT @count_ins = count(*) from #tmp_mae_unidad_potencia where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia
			SET
				origen='MAESTRO',
				cod_unidad_potencia=s.cod_unidad_potencia,
				unidad_potencia=s.unidad_potencia
		FROM (
			SELECT
				cod_unidad_potencia,
				unidad_potencia
			FROM #tmp_mae_unidad_potencia
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia.cod_unidad_potencia=s.cod_unidad_potencia OR (dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia.cod_unidad_potencia IS NULL AND s.cod_unidad_potencia IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_unidad_potencia_unique')
			ALTER INDEX IX_tbn1_mae_unidad_potencia_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia(cod_unidad_potencia,unidad_potencia,origen)
		SELECT
			cod_unidad_potencia,
			unidad_potencia
			,'MAESTRO' as origen
			FROM #tmp_mae_unidad_potencia
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_unidad_potencia_unique')
			ALTER INDEX IX_tbn1_mae_unidad_potencia_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_unidad_potencia') IS NOT NULL
			DROP TABLE #tmp_mae_unidad_potencia
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
