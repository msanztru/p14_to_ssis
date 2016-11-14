PRINT 'dimensional_mi_270_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_datos_detalle int NOT NULL,
	volumen_operaciones decimal(18,2),
	importe_premio decimal(18,2),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle(id_dim_datos_detalle),
	CONSTRAINT PK_tbn1_mi_270_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD volumen_operaciones decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='importe_premio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD importe_premio decimal(18,2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN volumen_operaciones decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND COLUMN_NAME='importe_premio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ALTER COLUMN importe_premio decimal(18,2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_270_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT PK_tbn1_mi_270_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_270_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_270_fact_tbn1_mi_270_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact ADD CONSTRAINT FK_tbn1_mi_270_fact_tbn1_mi_270_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle(id_dim_datos_detalle)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_270_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_270_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_270_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_fact'
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
			periodos.id_dim_periodos AS id_dim_periodos,
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			declarantes.id_dim_declarantes AS id_dim_declarantes,
			marcas.id_dim_marcas AS id_dim_marcas,
			declarados.id_dim_declarados AS id_dim_declarados,
			datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
			sum(ds_t.volumen_operaciones) AS volumen_operaciones,
			sum(ds_t.importe_premio) AS importe_premio
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion=ds_t.anyo_presentacion AND periodos.fecha_sorteo=ds_t.fecha_sorteo AND periodos.mes_sorteo=ds_t.mes_sorteo AND periodos.anyo_sorteo=ds_t.anyo_sorteo AND periodos.fecha_pago=ds_t.fecha_pago AND periodos.mes_pago=ds_t.mes_pago AND periodos.anyo_pago=ds_t.anyo_pago AND periodos.fecha_nacimiento=ds_t.fecha_nacimiento AND periodos.mes_nacimiento=ds_t.mes_nacimiento AND periodos.anyo_nacimiento=ds_t.anyo_nacimiento)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo=ds_t.modelo AND datos_caratula.delegacion_hacienda=ds_t.delegacion_hacienda AND datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion AND datos_caratula.id_tipo_declaracion=ds_t.id_tipo_declaracion AND datos_caratula.id_administracion=ds_t.id_administracion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarantes AS declarantes ON (declarantes.nif_declarante_270=ds_t.nif_declarante_270 AND declarantes.nif_declarante_no_identificado=ds_t.nif_declarante_no_identificado AND declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante AND declarantes.telefono=ds_t.telefono AND declarantes.razon_social=ds_t.razon_social AND declarantes.cod_presentador_colectivo=ds_t.cod_presentador_colectivo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_marcas AS marcas ON (marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_identificado_declarante=ds_t.es_identificado_declarante AND marcas.sw_identificado_declarante=ds_t.sw_identificado_declarante AND marcas.es_erroneo_declarante=ds_t.es_erroneo_declarante AND marcas.hay_observaciones=ds_t.hay_observaciones AND marcas.es_historico=ds_t.es_historico AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado AND marcas.sw_identificado_declarado=ds_t.sw_identificado_declarado AND marcas.es_erroneo_declarado=ds_t.es_erroneo_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_declarados AS declarados ON (declarados.secuencia=ds_t.secuencia AND declarados.nif_declarado_270=ds_t.nif_declarado_270 AND declarados.nif_declarado_no_identificado=ds_t.nif_declarado_no_identificado AND declarados.id_contribuyente_declarado=ds_t.id_contribuyente_declarado AND declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado AND declarados.gestor_cobro=ds_t.gestor_cobro AND declarados.nif_pais_residencia_fiscal=ds_t.nif_pais_residencia_fiscal)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_270_dim_datos_detalle AS datos_detalle ON (datos_detalle.nif_representante_legal=ds_t.nif_representante_legal AND datos_detalle.nombre_representante_legal=ds_t.nombre_representante_legal AND datos_detalle.id_mae_tipos_perceptor=ds_t.id_mae_tipos_perceptor AND datos_detalle.id_clave_personalidad=ds_t.id_clave_personalidad AND datos_detalle.id_provincia=ds_t.id_provincia AND datos_detalle.lugar_nacimiento=ds_t.lugar_nacimiento AND datos_detalle.id_pais_nacimiento=ds_t.id_pais_nacimiento AND datos_detalle.id_pais_residencia_fiscal=ds_t.id_pais_residencia_fiscal AND datos_detalle.id_tipo_importe=ds_t.id_tipo_importe)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			declarantes.id_dim_declarantes,
			marcas.id_dim_marcas,
			declarados.id_dim_declarados,
			datos_detalle.id_dim_datos_detalle
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_270_fact AS tbn1_mi_270_fact
	USING query ON query.id_dim_documentos=tbn1_mi_270_fact.id_dim_documentos AND query.id_dim_periodos=tbn1_mi_270_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_270_fact.id_dim_datos_caratula AND query.id_dim_declarantes=tbn1_mi_270_fact.id_dim_declarantes AND query.id_dim_marcas=tbn1_mi_270_fact.id_dim_marcas AND query.id_dim_declarados=tbn1_mi_270_fact.id_dim_declarados AND query.id_dim_datos_detalle=tbn1_mi_270_fact.id_dim_datos_detalle
	WHEN MATCHED AND ((tbn1_mi_270_fact.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_270_fact.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_270_fact.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_270_fact.importe_premio<>query.importe_premio OR (tbn1_mi_270_fact.importe_premio IS NULL AND query.importe_premio IS NOT NULL) OR (tbn1_mi_270_fact.importe_premio IS NOT NULL AND query.importe_premio IS NULL))) THEN
		UPDATE SET
			volumen_operaciones=query.volumen_operaciones,
			importe_premio=query.importe_premio
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_periodos,id_dim_datos_caratula,id_dim_declarantes,id_dim_marcas,id_dim_declarados,id_dim_datos_detalle,volumen_operaciones,importe_premio) VALUES (
			query.id_dim_documentos,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_declarantes,
			query.id_dim_marcas,
			query.id_dim_declarados,
			query.id_dim_datos_detalle,
			query.volumen_operaciones,
			query.importe_premio
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_270_gravamen_premios_y_loterias' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_270_gravamen_premios_y_loterias;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_270_gravamen_premios_y_loterias(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_270_gravamen_premios_y_loterias'
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
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_documentos @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_periodos @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_datos_caratula @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_marcas @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_declarantes @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_datos_detalle @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_dim_declarados @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_270_fact @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
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