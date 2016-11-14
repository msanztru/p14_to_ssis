PRINT 'dimensional_mi_720_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_datos_detalle_1 int NOT NULL,
	id_dim_datos_detalle_2 int NOT NULL,
	saldo decimal(18,2),
	saldo_medio_ultimo_trimestre decimal(18,2),
	porc_participacion decimal(5,2),
	num_valores decimal(12,0),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_detalle_1 FOREIGN KEY (id_dim_datos_detalle_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1(id_dim_datos_detalle_1),
	CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_detalle_2 FOREIGN KEY (id_dim_datos_detalle_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2(id_dim_datos_detalle_2),
	CONSTRAINT PK_tbn1_mi_720_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_datos_detalle_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD id_dim_datos_detalle_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='saldo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD saldo decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='saldo_medio_ultimo_trimestre')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD saldo_medio_ultimo_trimestre decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='porc_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD porc_participacion decimal(5,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='num_valores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD num_valores decimal(12,0)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_datos_detalle_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_datos_detalle_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='id_dim_datos_detalle_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN id_dim_datos_detalle_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='saldo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN saldo decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='saldo_medio_ultimo_trimestre' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN saldo_medio_ultimo_trimestre decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='porc_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN porc_participacion decimal(5,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND COLUMN_NAME='num_valores' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ALTER COLUMN num_valores decimal(12,0) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_720_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT PK_tbn1_mi_720_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_detalle_1 FOREIGN KEY (id_dim_datos_detalle_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1(id_dim_datos_detalle_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_720_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact ADD CONSTRAINT FK_tbn1_mi_720_fact_tbn1_mi_720_dim_datos_detalle_2 FOREIGN KEY (id_dim_datos_detalle_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2(id_dim_datos_detalle_2)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_720_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_720_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_720_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_fact'
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
			documentos.id_dim_documentos AS id_dim_documentos,
			declarantes.id_dim_declarantes AS id_dim_declarantes,
			declarados.id_dim_declarados AS id_dim_declarados,
			periodos.id_dim_periodos AS id_dim_periodos,
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			marcas.id_dim_marcas AS id_dim_marcas,
			datos_detalle_1.id_dim_datos_detalle_1 AS id_dim_datos_detalle_1,
			datos_detalle_2.id_dim_datos_detalle_2 AS id_dim_datos_detalle_2,
			sum(ds_t.saldo) AS saldo,
			sum(ds_t.saldo_medio_ultimo_trimestre) AS saldo_medio_ultimo_trimestre,
			sum(ds_t.porc_participacion) AS porc_participacion,
			sum(ds_t.num_valores) AS num_valores
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarantes AS declarantes ON (declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante AND declarantes.nif_declarante_720=ds_t.nif_declarante_720 AND declarantes.nif_declarante_no_identificado=ds_t.nif_declarante_no_identificado AND declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes.telefono=ds_t.telefono AND declarantes.persona_relacionarse=ds_t.persona_relacionarse)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_declarados AS declarados ON (declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado AND declarados.secuencia=ds_t.secuencia AND declarados.nif_declarado_720=ds_t.nif_declarado_720 AND declarados.nif_declarado_no_identificado=ds_t.nif_declarado_no_identificado AND declarados.id_contribuyente_declarado=ds_t.id_contribuyente_declarado AND declarados.id_mae_claves_titularidad=ds_t.id_mae_claves_titularidad AND declarados.otra_titularidad=ds_t.otra_titularidad)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion=ds_t.anyo_presentacion AND periodos.fecha_alta=ds_t.fecha_alta AND periodos.mes_alta=ds_t.mes_alta AND periodos.anyo_alta=ds_t.anyo_alta AND periodos.fecha_incorporacion=ds_t.fecha_incorporacion AND periodos.mes_incorporacion=ds_t.mes_incorporacion AND periodos.anyo_incorporacion=ds_t.anyo_incorporacion AND periodos.fecha_extincion=ds_t.fecha_extincion AND periodos.mes_extincion=ds_t.mes_extincion AND periodos.anyo_extincion=ds_t.anyo_extincion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo=ds_t.modelo AND datos_caratula.administracion_declarante=ds_t.administracion_declarante AND datos_caratula.id_mae_entidades_bancarias=ds_t.id_mae_entidades_bancarias AND datos_caratula.id_tipo_soporte=ds_t.id_tipo_soporte AND datos_caratula.id_tipo_declaracion=ds_t.id_tipo_declaracion AND datos_caratula.regimen_fiscal_deducciones=ds_t.regimen_fiscal_deducciones)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_marcas AS marcas ON (marcas.es_externo_declarante=ds_t.es_externo_declarante AND marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_identificado_declarante=ds_t.es_identificado_declarante AND marcas.sw_identificado_declarante=ds_t.sw_identificado_declarante AND marcas.es_externo_declarado=ds_t.es_externo_declarado AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado AND marcas.sw_identificado_declarado=ds_t.sw_identificado_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_1 AS datos_detalle_1 ON (datos_detalle_1.administracion_declarado=ds_t.administracion_declarado AND datos_detalle_1.id_mae_claves_bienes_720=ds_t.id_mae_claves_bienes_720 AND datos_detalle_1.id_mae_subclaves_bienes_720=ds_t.id_mae_subclaves_bienes_720 AND datos_detalle_1.id_pais=ds_t.id_pais AND datos_detalle_1.nombre_entidad=ds_t.nombre_entidad AND datos_detalle_1.nif_entidad=ds_t.nif_entidad AND datos_detalle_1.id_mae_origenes_bienes_720=ds_t.id_mae_origenes_bienes_720)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_720_dim_datos_detalle_2 AS datos_detalle_2 ON (datos_detalle_2.desc_bien=ds_t.desc_bien AND datos_detalle_2.id_mae_claves_tipos_bienes_muebles_inmuebles=ds_t.id_mae_claves_tipos_bienes_muebles_inmuebles AND datos_detalle_2.id_pais_registro_bien=ds_t.id_pais_registro_bien AND datos_detalle_2.registro_matricula=ds_t.registro_matricula AND datos_detalle_2.id_mae_claves_cuenta=ds_t.id_mae_claves_cuenta AND datos_detalle_2.cod_intenacional_bancario=ds_t.cod_intenacional_bancario AND datos_detalle_2.cuenta=ds_t.cuenta AND datos_detalle_2.id_mae_claves_identificacion_valor_accion=ds_t.id_mae_claves_identificacion_valor_accion AND datos_detalle_2.identificacion_valor_accion=ds_t.identificacion_valor_accion AND datos_detalle_2.id_clave_representacion=ds_t.id_clave_representacion)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			declarantes.id_dim_declarantes,
			declarados.id_dim_declarados,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			marcas.id_dim_marcas,
			datos_detalle_1.id_dim_datos_detalle_1,
			datos_detalle_2.id_dim_datos_detalle_2
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_720_fact AS tbn1_mi_720_fact
	USING query ON query.id_dim_documentos=tbn1_mi_720_fact.id_dim_documentos AND query.id_dim_declarantes=tbn1_mi_720_fact.id_dim_declarantes AND query.id_dim_declarados=tbn1_mi_720_fact.id_dim_declarados AND query.id_dim_periodos=tbn1_mi_720_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_720_fact.id_dim_datos_caratula AND query.id_dim_marcas=tbn1_mi_720_fact.id_dim_marcas AND query.id_dim_datos_detalle_1=tbn1_mi_720_fact.id_dim_datos_detalle_1 AND query.id_dim_datos_detalle_2=tbn1_mi_720_fact.id_dim_datos_detalle_2
	WHEN MATCHED AND ((tbn1_mi_720_fact.saldo<>query.saldo OR (tbn1_mi_720_fact.saldo IS NULL AND query.saldo IS NOT NULL) OR (tbn1_mi_720_fact.saldo IS NOT NULL AND query.saldo IS NULL)
			OR tbn1_mi_720_fact.saldo_medio_ultimo_trimestre<>query.saldo_medio_ultimo_trimestre OR (tbn1_mi_720_fact.saldo_medio_ultimo_trimestre IS NULL AND query.saldo_medio_ultimo_trimestre IS NOT NULL) OR (tbn1_mi_720_fact.saldo_medio_ultimo_trimestre IS NOT NULL AND query.saldo_medio_ultimo_trimestre IS NULL)
			OR tbn1_mi_720_fact.porc_participacion<>query.porc_participacion OR (tbn1_mi_720_fact.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL) OR (tbn1_mi_720_fact.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
			OR tbn1_mi_720_fact.num_valores<>query.num_valores OR (tbn1_mi_720_fact.num_valores IS NULL AND query.num_valores IS NOT NULL) OR (tbn1_mi_720_fact.num_valores IS NOT NULL AND query.num_valores IS NULL))) THEN
		UPDATE SET
			saldo=query.saldo,
			saldo_medio_ultimo_trimestre=query.saldo_medio_ultimo_trimestre,
			porc_participacion=query.porc_participacion,
			num_valores=query.num_valores
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle_1,id_dim_datos_detalle_2,saldo,saldo_medio_ultimo_trimestre,porc_participacion,num_valores) VALUES (
			query.id_dim_documentos,
			query.id_dim_declarantes,
			query.id_dim_declarados,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_marcas,
			query.id_dim_datos_detalle_1,
			query.id_dim_datos_detalle_2,
			query.saldo,
			query.saldo_medio_ultimo_trimestre,
			query.porc_participacion,
			query.num_valores
			)
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

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

/*****************/
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_720_bienes_derechos_extranjero'
  SET NOCOUNT ON
  DECLARE @log int
  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log)
  DECLARE @continuar_en_caso_error bit=0
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log
    RETURN
  END
	
	BEGIN TRY
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_documentos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_periodos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_caratula @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_marcas @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_declarantes @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_detalle_1 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_datos_detalle_2 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_dim_declarados @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_720_fact @log
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT
	END TRY

  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END
GO