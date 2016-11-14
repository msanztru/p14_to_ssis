PRINT 'dimensional_mi_199_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_datos_detalle int NOT NULL,
	id_dim_representantes int NOT NULL,
	id_dim_cheques int NOT NULL,
	importe numeric(18,2),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_datos_detalle(id_dim_datos_detalle),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_representantes FOREIGN KEY (id_dim_representantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_representantes(id_dim_representantes),
	CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_cheques FOREIGN KEY (id_dim_cheques) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_cheques(id_dim_cheques),
	CONSTRAINT PK_tbn1_mi_199_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_representantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_representantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_cheques')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD id_dim_cheques int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD importe numeric(18,2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_representantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_representantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='id_dim_cheques' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN id_dim_cheques int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ALTER COLUMN importe numeric(18,2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_199_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT PK_tbn1_mi_199_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_datos_detalle(id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_representantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_representantes FOREIGN KEY (id_dim_representantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_representantes(id_dim_representantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_199_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_199_fact_tbn1_mi_199_dim_cheques')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact ADD CONSTRAINT FK_tbn1_mi_199_fact_tbn1_mi_199_dim_cheques FOREIGN KEY (id_dim_cheques) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_cheques(id_dim_cheques)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_199_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_199_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_199_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_fact'
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
			datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
			representantes.id_dim_representantes AS id_dim_representantes,
			cheques.id_dim_cheques AS id_dim_cheques,
			sum(ds_t.importe) AS importe
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_declarantes AS declarantes ON (declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante AND declarantes.nif_declarante_199=ds_t.nif_declarante_199 AND declarantes.nif_declarante_no_identificado  =ds_t.nif_declarante_no_identificado   AND declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes.telefono=ds_t.telefono AND declarantes.razon_social=ds_t.razon_social AND declarantes.cod_presentador_colectivo=ds_t.cod_presentador_colectivo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_declarados AS declarados ON (declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado AND declarados.nif_declarado_199=ds_t.nif_declarado_199 AND declarados.nif_declarado_no_identificado  =ds_t.nif_declarado_no_identificado   AND declarados.secuencia =ds_t.secuencia  AND declarados.id_contribuyente_declarado  =ds_t.id_contribuyente_declarado   AND declarados.codigo_extranjero=ds_t.codigo_extranjero AND declarados.codigo_sucursal=ds_t.codigo_sucursal)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_periodos AS periodos ON (periodos.ejercicio=ds_t.ejercicio AND periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion =ds_t.anyo_presentacion  AND periodos.fecha_alta=ds_t.fecha_alta AND periodos.mes_alta=ds_t.mes_alta AND periodos.anyo_alta=ds_t.anyo_alta AND periodos.fecha_operacion=ds_t.fecha_operacion AND periodos.anyo_operacion=ds_t.anyo_operacion AND periodos.mes_operacion=ds_t.mes_operacion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_datos_caratula AS datos_caratula ON (datos_caratula.modelo =ds_t.modelo  AND datos_caratula.administracion_declarante=ds_t.administracion_declarante AND datos_caratula.cod_banco_espania=ds_t.cod_banco_espania AND datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion AND datos_caratula.id_tipo_declaracion=ds_t.id_tipo_declaracion AND datos_caratula.regimen_fiscal_deducciones=ds_t.regimen_fiscal_deducciones)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_marcas AS marcas ON (marcas.es_externo_declarante=ds_t.es_externo_declarante AND marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_identificado_declarante=ds_t.es_identificado_declarante AND marcas.sw_identificado_declarante  =ds_t.sw_identificado_declarante   AND marcas.es_externo_declarado=ds_t.es_externo_declarado AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado AND marcas.sw_identificado_declarado   =ds_t.sw_identificado_declarado    AND marcas.es_erroneo_declarado=ds_t.es_erroneo_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_datos_detalle AS datos_detalle ON (datos_detalle.administracion_declarado=ds_t.administracion_declarado AND datos_detalle.id_provincia=ds_t.id_provincia AND datos_detalle.id_pais=ds_t.id_pais AND datos_detalle.id_clave_operacion_cheque=ds_t.id_clave_operacion_cheque AND datos_detalle.id_tipo_importe=ds_t.id_tipo_importe)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_representantes AS representantes ON (representantes.cif_representante=ds_t.cif_representante AND representantes.nombre_representante=ds_t.nombre_representante)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_199_dim_cheques AS cheques ON (cheques.num_cheque=ds_t.num_cheque)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			declarantes.id_dim_declarantes,
			declarados.id_dim_declarados,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			marcas.id_dim_marcas,
			datos_detalle.id_dim_datos_detalle,
			representantes.id_dim_representantes,
			cheques.id_dim_cheques
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_199_fact AS tbn1_mi_199_fact
	USING query ON query.id_dim_documentos=tbn1_mi_199_fact.id_dim_documentos AND query.id_dim_declarantes=tbn1_mi_199_fact.id_dim_declarantes AND query.id_dim_declarados=tbn1_mi_199_fact.id_dim_declarados AND query.id_dim_periodos=tbn1_mi_199_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_199_fact.id_dim_datos_caratula AND query.id_dim_marcas=tbn1_mi_199_fact.id_dim_marcas AND query.id_dim_datos_detalle=tbn1_mi_199_fact.id_dim_datos_detalle AND query.id_dim_representantes=tbn1_mi_199_fact.id_dim_representantes AND query.id_dim_cheques=tbn1_mi_199_fact.id_dim_cheques
	WHEN MATCHED AND ((tbn1_mi_199_fact.importe<>query.importe OR (tbn1_mi_199_fact.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_mi_199_fact.importe IS NOT NULL AND query.importe IS NULL))) THEN
		UPDATE SET
			importe=query.importe
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,id_dim_representantes,id_dim_cheques,importe) VALUES (
			query.id_dim_documentos,
			query.id_dim_declarantes,
			query.id_dim_declarados,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_marcas,
			query.id_dim_datos_detalle,
			query.id_dim_representantes,
			query.id_dim_cheques,
			query.importe
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_199_operaciones_entidades_credito_cheques'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_datos_caratula @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_declarantes @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_datos_detalle @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_declarados @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_documentos @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_cheques @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_representantes @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_periodos @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_dim_marcas @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_199_fact @log

  EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT
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

