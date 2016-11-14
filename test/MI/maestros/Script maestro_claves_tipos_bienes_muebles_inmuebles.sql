PRINT 'Script maestro_claves_tipos_bienes_muebles_inmuebles.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_bienes_muebles_inmuebles')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles(
	id_mae_claves_tipos_bienes_muebles_inmuebles int IDENTITY(1,1),
	cod_clave_tipo_bien_mueble_inmueble varchar(1),
	clave_tipo_bien_mueble_inmueble varchar(50),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_claves_tipos_bienes_muebles_inmuebles PRIMARY KEY CLUSTERED (id_mae_claves_tipos_bienes_muebles_inmuebles)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_bienes_muebles_inmuebles' AND COLUMN_NAME='id_mae_claves_tipos_bienes_muebles_inmuebles')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles ADD id_mae_claves_tipos_bienes_muebles_inmuebles int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_bienes_muebles_inmuebles' AND COLUMN_NAME='cod_clave_tipo_bien_mueble_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles ADD cod_clave_tipo_bien_mueble_inmueble varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_bienes_muebles_inmuebles' AND COLUMN_NAME='clave_tipo_bien_mueble_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles ADD clave_tipo_bien_mueble_inmueble varchar(50)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique')
DROP INDEX IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles (cod_clave_tipo_bien_mueble_inmueble) INCLUDE (id_mae_claves_tipos_bienes_muebles_inmuebles)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_tipos_bienes_muebles_inmuebles' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_tipos_bienes_muebles_inmuebles;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_tipos_bienes_muebles_inmuebles(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_tipos_bienes_muebles_inmuebles'
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles WHERE id_mae_claves_tipos_bienes_muebles_inmuebles=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles(id_mae_claves_tipos_bienes_muebles_inmuebles,cod_clave_tipo_bien_mueble_inmueble,origen)
			VALUES(-1,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles OFF

		IF OBJECT_ID('tempdb..#tmp_mae_claves_tipos_bienes_muebles_inmuebles') IS NOT NULL
			DROP TABLE #tmp_mae_claves_tipos_bienes_muebles_inmuebles
		CREATE table #tmp_mae_claves_tipos_bienes_muebles_inmuebles(
			rr_mode varchar(1),
			id_mae_claves_tipos_bienes_muebles_inmuebles int,
			t_cod_clave_tipo_bien_mueble_inmueble varchar(1),
			cod_clave_tipo_bien_mueble_inmueble varchar(1),
			clave_tipo_bien_mueble_inmueble varchar(50)
		);

		;WITH
		query AS (
			SELECT
				cod_clave_tipo_bien_mueble_inmueble,
				clave_tipo_bien_mueble_inmueble
			FROM dbo.fnn1_query_carga_maestro_claves_tipos_bienes_muebles_inmuebles()
		)
		INSERT INTO #tmp_mae_claves_tipos_bienes_muebles_inmuebles (rr_mode,id_mae_claves_tipos_bienes_muebles_inmuebles,t_cod_clave_tipo_bien_mueble_inmueble,cod_clave_tipo_bien_mueble_inmueble,clave_tipo_bien_mueble_inmueble)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_claves_tipos_bienes_muebles_inmuebles.id_mae_claves_tipos_bienes_muebles_inmuebles IS NULL THEN 'I'
					WHEN query.cod_clave_tipo_bien_mueble_inmueble IS NULL AND id_mae_claves_tipos_bienes_muebles_inmuebles<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_claves_tipos_bienes_muebles_inmuebles.id_mae_claves_tipos_bienes_muebles_inmuebles AS id_mae_claves_tipos_bienes_muebles_inmuebles,
			tbn1_mae_claves_tipos_bienes_muebles_inmuebles.cod_clave_tipo_bien_mueble_inmueble AS t_cod_clave_tipo_bien_mueble_inmueble,
			query.cod_clave_tipo_bien_mueble_inmueble AS cod_clave_tipo_bien_mueble_inmueble,
			query.clave_tipo_bien_mueble_inmueble AS clave_tipo_bien_mueble_inmueble
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles AS tbn1_mae_claves_tipos_bienes_muebles_inmuebles
		FULL JOIN query on ((query.cod_clave_tipo_bien_mueble_inmueble=tbn1_mae_claves_tipos_bienes_muebles_inmuebles.cod_clave_tipo_bien_mueble_inmueble OR (query.cod_clave_tipo_bien_mueble_inmueble IS NULL AND tbn1_mae_claves_tipos_bienes_muebles_inmuebles.cod_clave_tipo_bien_mueble_inmueble IS NULL)))
		WHERE 
			id_mae_claves_tipos_bienes_muebles_inmuebles IS NULL OR
			(query.cod_clave_tipo_bien_mueble_inmueble IS NULL AND id_mae_claves_tipos_bienes_muebles_inmuebles<>-1) OR
			(tbn1_mae_claves_tipos_bienes_muebles_inmuebles.clave_tipo_bien_mueble_inmueble<>query.clave_tipo_bien_mueble_inmueble OR (tbn1_mae_claves_tipos_bienes_muebles_inmuebles.clave_tipo_bien_mueble_inmueble IS NULL AND query.clave_tipo_bien_mueble_inmueble IS NOT NULL) OR (tbn1_mae_claves_tipos_bienes_muebles_inmuebles.clave_tipo_bien_mueble_inmueble IS NOT NULL AND query.clave_tipo_bien_mueble_inmueble IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_claves_tipos_bienes_muebles_inmuebles
		SELECT @count_ins = count(*) from #tmp_mae_claves_tipos_bienes_muebles_inmuebles where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles
			SET
				origen='MAESTRO',
				cod_clave_tipo_bien_mueble_inmueble=s.cod_clave_tipo_bien_mueble_inmueble,
				clave_tipo_bien_mueble_inmueble=s.clave_tipo_bien_mueble_inmueble
		FROM (
			SELECT
				cod_clave_tipo_bien_mueble_inmueble,
				clave_tipo_bien_mueble_inmueble
			FROM #tmp_mae_claves_tipos_bienes_muebles_inmuebles
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles.cod_clave_tipo_bien_mueble_inmueble=s.cod_clave_tipo_bien_mueble_inmueble OR (dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles.cod_clave_tipo_bien_mueble_inmueble IS NULL AND s.cod_clave_tipo_bien_mueble_inmueble IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique')
			ALTER INDEX IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles(cod_clave_tipo_bien_mueble_inmueble,clave_tipo_bien_mueble_inmueble,origen)
		SELECT
			cod_clave_tipo_bien_mueble_inmueble,
			clave_tipo_bien_mueble_inmueble
			,'MAESTRO' as origen
			FROM #tmp_mae_claves_tipos_bienes_muebles_inmuebles
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique')
			ALTER INDEX IX_tbn1_mae_claves_tipos_bienes_muebles_inmuebles_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_claves_tipos_bienes_muebles_inmuebles') IS NOT NULL
			DROP TABLE #tmp_mae_claves_tipos_bienes_muebles_inmuebles
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
