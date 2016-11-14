PRINT 'Script maestro_claves_tipos_renta.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta(
	id_mae_claves_tipos_renta int IDENTITY(1,1),
	cod_clave_tipo_renta int NOT NULL,
	clave_tipo_renta varchar(150),
	origen varchar(10)
	CONSTRAINT uk_mae_claves_tipos_renta UNIQUE (cod_clave_tipo_renta),
	CONSTRAINT PK_tbn1_mae_claves_tipos_renta PRIMARY KEY CLUSTERED (id_mae_claves_tipos_renta)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND COLUMN_NAME='id_mae_claves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ADD id_mae_claves_tipos_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND COLUMN_NAME='cod_clave_tipo_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ADD cod_clave_tipo_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND COLUMN_NAME='clave_tipo_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ADD clave_tipo_renta varchar(150)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND COLUMN_NAME='id_mae_claves_tipos_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ALTER COLUMN id_mae_claves_tipos_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND COLUMN_NAME='cod_clave_tipo_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ALTER COLUMN cod_clave_tipo_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND COLUMN_NAME='clave_tipo_renta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ALTER COLUMN clave_tipo_renta varchar(150) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_tipos_renta' AND CONSTRAINT_NAME='PK_tbn1_mae_claves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ADD CONSTRAINT PK_tbn1_mae_claves_tipos_renta PRIMARY KEY CLUSTERED (id_mae_claves_tipos_renta)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_claves_tipos_renta' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_claves_tipos_renta;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_claves_tipos_renta(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_claves_tipos_renta'
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

	;WITH
	query AS (
		SELECT
			1 AS cod_clave_tipo_renta,
			'Dividendos y otras rentas derivadas de participación en fondos propios de entidades' AS clave_tipo_renta
		UNION
		SELECT
			2 AS cod_clave_tipo_renta,
			'Intereses y otras rentas derivadas de la cesión a terceros de capitales propios' AS clave_tipo_renta
		UNION
		SELECT
			3 AS cod_clave_tipo_renta,
			'Cánones derivados de patentes, marcas de fábrica o de comercio, dibujos o modelos, planos, fórmulas o procedimientos secretos' AS clave_tipo_renta
		UNION
		SELECT
			4 AS cod_clave_tipo_renta,
			'Cánones derivados de derechos sobre obras literarias y artísticas' AS clave_tipo_renta
		UNION
		SELECT
			5 AS cod_clave_tipo_renta,
			'Cánones derivados de derechos sobre obras científicas' AS clave_tipo_renta
		UNION
		SELECT
			6 AS cod_clave_tipo_renta,
			'Cánones derivados de derechos sobre películas cinematográficas y obras sonoras o visuales grabadas' AS clave_tipo_renta
		UNION
		SELECT
			7 AS cod_clave_tipo_renta,
			'Cánones derivados de informaciones relativas a experiencias industriales, comerciales o científicas (know-how)' AS clave_tipo_renta
		UNION
		SELECT
			8 AS cod_clave_tipo_renta,
			'Cánones derivados de derechos sobre programas informáticos' AS clave_tipo_renta
		UNION
		SELECT
			9 AS cod_clave_tipo_renta,
			'Cánones derivados de derechos personales susceptibles de cesión, tales como los derechos de imagen' AS clave_tipo_renta
		UNION
		SELECT
			10 AS cod_clave_tipo_renta,
			'Cánones derivados de equipos industriales, comerciales o científicos' AS clave_tipo_renta
		UNION
		SELECT
			11 AS cod_clave_tipo_renta,
			'Otros cánones no relacionados anteriormente' AS clave_tipo_renta
		UNION
		SELECT
			12 AS cod_clave_tipo_renta,
			'Rendimientos de capital mobiliario de operaciones de capitalización y de seguros de vida o invalidez' AS clave_tipo_renta
		UNION
		SELECT
			13 AS cod_clave_tipo_renta,
			'Otros rendimientos de capital mobiliario no citados anteriormente' AS clave_tipo_renta
		UNION
		SELECT
			14 AS cod_clave_tipo_renta,
			'Rendimientos de bienes inmuebles' AS clave_tipo_renta
		UNION
		SELECT
			15 AS cod_clave_tipo_renta,
			'Rentas de actividades empresariales' AS clave_tipo_renta
		UNION
		SELECT
			16 AS cod_clave_tipo_renta,
			'Rentas derivadas de prestaciones de asistencia técnica' AS clave_tipo_renta
		UNION
		SELECT
			17 AS cod_clave_tipo_renta,
			'Rentas de actividades artísticas' AS clave_tipo_renta
		UNION
		SELECT
			18 AS cod_clave_tipo_renta,
			'Rentas de actividades deportivas' AS clave_tipo_renta
		UNION
		SELECT
			19 AS cod_clave_tipo_renta,
			'Rentas de actividades profesionales' AS clave_tipo_renta
		UNION
		SELECT
			20 AS cod_clave_tipo_renta,
			'Rentas del trabajo' AS clave_tipo_renta
		UNION
		SELECT
			21 AS cod_clave_tipo_renta,
			'Pensiones y haberes pasivos' AS clave_tipo_renta
		UNION
		SELECT
			22 AS cod_clave_tipo_renta,
			'Retribuciones de administradores y miembros de consejos de administración' AS clave_tipo_renta
		UNION
		SELECT
			23 AS cod_clave_tipo_renta,
			'Rendimientos derivados de operaciones de reaseguros' AS clave_tipo_renta
		UNION
		SELECT
			24 AS cod_clave_tipo_renta,
			'Entidades de navegación marítima o aérea' AS clave_tipo_renta
		UNION
		SELECT
			25 AS cod_clave_tipo_renta,
			'Otras rentas' AS clave_tipo_renta
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta AS tbn1_mae_claves_tipos_renta
	USING query ON query.cod_clave_tipo_renta=tbn1_mae_claves_tipos_renta.cod_clave_tipo_renta
	WHEN MATCHED AND ((tbn1_mae_claves_tipos_renta.clave_tipo_renta<>query.clave_tipo_renta OR (tbn1_mae_claves_tipos_renta.clave_tipo_renta IS NULL AND query.clave_tipo_renta IS NOT NULL) OR (tbn1_mae_claves_tipos_renta.clave_tipo_renta IS NOT NULL AND query.clave_tipo_renta IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			clave_tipo_renta=query.clave_tipo_renta
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_clave_tipo_renta,clave_tipo_renta) VALUES (
			'MAESTRO',
			query.cod_clave_tipo_renta,
			query.clave_tipo_renta
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta
		WHERE	id_mae_claves_tipos_renta = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta
		(
			id_mae_claves_tipos_renta,
			cod_clave_tipo_renta,
			clave_tipo_renta,
			origen
		)
		VALUES
		(
			-1,
			0,
			'',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta OFF

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
