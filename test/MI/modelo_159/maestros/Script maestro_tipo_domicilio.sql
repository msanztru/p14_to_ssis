PRINT 'Script maestro_tipo_domicilio.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_domicilio')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio(
	id_mae_tipo_domicilio int IDENTITY(1,1),
	cod_tipo_domicilio varchar(1),
	tipo_domicilio varchar(50),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_tipo_domicilio PRIMARY KEY CLUSTERED (id_mae_tipo_domicilio)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_domicilio' AND COLUMN_NAME='id_mae_tipo_domicilio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio ADD id_mae_tipo_domicilio int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_domicilio' AND COLUMN_NAME='cod_tipo_domicilio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio ADD cod_tipo_domicilio varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_tipo_domicilio' AND COLUMN_NAME='tipo_domicilio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio ADD tipo_domicilio varchar(50)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_domicilio_unique')
DROP INDEX IX_tbn1_mae_tipo_domicilio_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_tipo_domicilio_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio (cod_tipo_domicilio) INCLUDE (id_mae_tipo_domicilio)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_tipo_domicilio' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_tipo_domicilio;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_tipo_domicilio(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_tipo_domicilio'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio WHERE id_mae_tipo_domicilio=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio(id_mae_tipo_domicilio,cod_tipo_domicilio,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio OFF

		IF OBJECT_ID('tempdb..#tmp_mae_tipo_domicilio') IS NOT NULL
			DROP TABLE #tmp_mae_tipo_domicilio
		CREATE table #tmp_mae_tipo_domicilio(
			rr_mode varchar(1),
			id_mae_tipo_domicilio int,
			t_cod_tipo_domicilio varchar(1),
			cod_tipo_domicilio varchar(1),
			tipo_domicilio varchar(50)
		);

		;WITH
		query AS (
			SELECT
				cod_tipo_domicilio,
				tipo_domicilio
			FROM dbo.fnn1_query_carga_maestro_tipo_domicilio()
		)
		INSERT INTO #tmp_mae_tipo_domicilio (rr_mode,id_mae_tipo_domicilio,t_cod_tipo_domicilio,cod_tipo_domicilio,tipo_domicilio)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_tipo_domicilio.id_mae_tipo_domicilio IS NULL THEN 'I'
					WHEN query.cod_tipo_domicilio IS NULL AND id_mae_tipo_domicilio<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_tipo_domicilio.id_mae_tipo_domicilio AS id_mae_tipo_domicilio,
			tbn1_mae_tipo_domicilio.cod_tipo_domicilio AS t_cod_tipo_domicilio,
			query.cod_tipo_domicilio AS cod_tipo_domicilio,
			query.tipo_domicilio AS tipo_domicilio
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio AS tbn1_mae_tipo_domicilio
		FULL JOIN query on ((query.cod_tipo_domicilio=tbn1_mae_tipo_domicilio.cod_tipo_domicilio OR (query.cod_tipo_domicilio IS NULL AND tbn1_mae_tipo_domicilio.cod_tipo_domicilio IS NULL)))
		WHERE 
			id_mae_tipo_domicilio IS NULL OR
			(query.cod_tipo_domicilio IS NULL AND id_mae_tipo_domicilio<>-1) OR
			(tbn1_mae_tipo_domicilio.tipo_domicilio<>query.tipo_domicilio OR (tbn1_mae_tipo_domicilio.tipo_domicilio IS NULL AND query.tipo_domicilio IS NOT NULL) OR (tbn1_mae_tipo_domicilio.tipo_domicilio IS NOT NULL AND query.tipo_domicilio IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_tipo_domicilio
		SELECT @count_ins = count(*) from #tmp_mae_tipo_domicilio where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio
			SET
				origen='MAESTRO',
				cod_tipo_domicilio=s.cod_tipo_domicilio,
				tipo_domicilio=s.tipo_domicilio
		FROM (
			SELECT
				cod_tipo_domicilio,
				tipo_domicilio
			FROM #tmp_mae_tipo_domicilio
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio.cod_tipo_domicilio=s.cod_tipo_domicilio OR (dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio.cod_tipo_domicilio IS NULL AND s.cod_tipo_domicilio IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_domicilio_unique')
			ALTER INDEX IX_tbn1_mae_tipo_domicilio_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio(cod_tipo_domicilio,tipo_domicilio,origen)
		SELECT
			cod_tipo_domicilio,
			tipo_domicilio
			,'MAESTRO' as origen
			FROM #tmp_mae_tipo_domicilio
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_tipo_domicilio_unique')
			ALTER INDEX IX_tbn1_mae_tipo_domicilio_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_domicilio REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_tipo_domicilio') IS NOT NULL
			DROP TABLE #tmp_mae_tipo_domicilio
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
