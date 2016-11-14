PRINT 'Script maestro_subclaves_tipos_renta.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta(
	id_mae_subclaves_tipos_renta int IDENTITY(1,1),
	cod_subclave_tipo_renta varchar(2) NOT NULL,
	subclave_tipo_renta varchar(500),
	origen varchar(10)
	CONSTRAINT uk_mae_subclaves_tipos_renta UNIQUE (cod_subclave_tipo_renta),
	CONSTRAINT PK_tbn1_mae_subclaves_tipos_renta PRIMARY KEY CLUSTERED (id_mae_subclaves_tipos_renta)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND COLUMN_NAME='id_mae_subclaves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ADD id_mae_subclaves_tipos_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND COLUMN_NAME='cod_subclave_tipo_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ADD cod_subclave_tipo_renta varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND COLUMN_NAME='subclave_tipo_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ADD subclave_tipo_renta varchar(500)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND COLUMN_NAME='id_mae_subclaves_tipos_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ALTER COLUMN id_mae_subclaves_tipos_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND COLUMN_NAME='cod_subclave_tipo_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ALTER COLUMN cod_subclave_tipo_renta varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND COLUMN_NAME='subclave_tipo_renta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ALTER COLUMN subclave_tipo_renta varchar(500) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_subclaves_tipos_renta' AND CONSTRAINT_NAME='PK_tbn1_mae_subclaves_tipos_renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ADD CONSTRAINT PK_tbn1_mae_subclaves_tipos_renta PRIMARY KEY CLUSTERED (id_mae_subclaves_tipos_renta)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_subclaves_tipos_renta' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_subclaves_tipos_renta;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_subclaves_tipos_renta(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_subclaves_tipos_renta'
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
			'01' AS cod_subclave_tipo_renta,
			'Retención practicada a los tipos generales o escalas de tributación del art. 24 de la Norma Foral 5/1999' AS subclave_tipo_renta
		UNION
		SELECT
			'02' AS cod_subclave_tipo_renta,
			'Retención practicada aplicando límites de imposición de convenios' AS subclave_tipo_renta
		UNION
		SELECT
			'03' AS cod_subclave_tipo_renta,
			'Exención interna (art. 13 de la Norma Foral 5/1999)' AS subclave_tipo_renta
		UNION
		SELECT
			'04' AS cod_subclave_tipo_renta,
			'Exención por aplicación de un convenio' AS subclave_tipo_renta
		UNION
		SELECT
			'05' AS cod_subclave_tipo_renta,
			'Sin retención por previo pago del impuesto por el contribuyente o su representante' AS subclave_tipo_renta
		UNION
		SELECT
			'06' AS cod_subclave_tipo_renta,
			'El perceptor declarado es una entidad extranjera de gestión colectiva de derechos de la propiedad intelectual, habiéndose practicado retención aplicando el límite de imposición, o la exención, de un Convenio' AS subclave_tipo_renta
		UNION
		SELECT
			'07' AS cod_subclave_tipo_renta,
			'El perceptor es un contribuyente del Impuesto sobre la Renta de las personas fisicas del regimen especial de tributación del Impuesto sobre la Renta de no Residentes, a que se refiere el articulo 4.3 de la Norma Foral del IRPF' AS subclave_tipo_renta
		UNION
		SELECT
			'08' AS cod_subclave_tipo_renta,
			'El perceptor declarado es una entidad residente en el extranjero comercializadora de acciones o participaciones de instituciones de inversión colectiva españolas, habiéndose practicado retención aplicando un límite de imposición fijado en el Convenio inferior al previsto en el artículo 24 de la Norma Foral del Impuesto sobre la Renta de no Residentes, conforme al procedimiento especial previsto en la orden de aprobación de estas instrucciones' AS subclave_tipo_renta
		UNION
		SELECT
			'09' AS cod_subclave_tipo_renta,
			'El perceptor declarado es una entidad residente en el extranjero comercializadora de acciones o participaciones de instituciones de inversión colectiva españolas, habiéndose practicado retención aplicando el tipo de gravamen previsto en el artículo 24 de la Norma Foral del Impuesto sobre la Renta de no Residentes, conforme al procedimiento especial previsto en la orden de aprobación de estas instrucciones' AS subclave_tipo_renta

	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta AS tbn1_mae_subclaves_tipos_renta
	USING query ON query.cod_subclave_tipo_renta=tbn1_mae_subclaves_tipos_renta.cod_subclave_tipo_renta
	WHEN MATCHED AND ((tbn1_mae_subclaves_tipos_renta.subclave_tipo_renta<>query.subclave_tipo_renta OR (tbn1_mae_subclaves_tipos_renta.subclave_tipo_renta IS NULL AND query.subclave_tipo_renta IS NOT NULL) OR (tbn1_mae_subclaves_tipos_renta.subclave_tipo_renta IS NOT NULL AND query.subclave_tipo_renta IS NULL))) THEN
		UPDATE SET
			origen='MAESTRO',
			subclave_tipo_renta=query.subclave_tipo_renta
	WHEN NOT MATCHED THEN
		INSERT (origen,cod_subclave_tipo_renta,subclave_tipo_renta) VALUES (
			'MAESTRO',
			query.cod_subclave_tipo_renta,
			query.subclave_tipo_renta
			);

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta
		WHERE	id_mae_subclaves_tipos_renta = -1
	)

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta
		(
			id_mae_subclaves_tipos_renta,
			cod_subclave_tipo_renta,
			subclave_tipo_renta,
			origen
		)
		VALUES
		(
			-1,
			'',
			'',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta OFF

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
