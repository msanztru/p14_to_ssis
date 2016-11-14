PRINT 'cargar_dimensional_modelo_182.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarante varchar(12) NOT NULL,
  telefono varchar(10) NOT NULL,
  razon_social varchar(40) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  cod_presentador_colectivo int NOT NULL,
  cod_banco_espania varchar(4) NOT NULL,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  fec_presentacion date,
  num_caja varchar(8) NOT NULL,
  fec_alta_mf date,
  num_justificante numeric(13),
  tipo_declaracion varchar(1) NOT NULL,
  contador_revisiones int,
  regimen_fiscal_deducciones varchar(1) NOT NULL,
  num_declarados int,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_182_donaciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD cod_banco_espania varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_alta_mf')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD fec_alta_mf date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD regimen_fiscal_deducciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD num_declarados int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN telefono varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN razon_social varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN cod_presentador_colectivo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN cod_banco_espania varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_alta_mf' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN fec_alta_mf date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN tipo_declaracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_declarados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ALTER COLUMN num_declarados int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_182_donaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_182_donaciones_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_182_donaciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_182' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_182;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_182(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_182'
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

  -- Materialized query: query
  SELECT
    doc_182.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    doc_182.administracion AS administracion,
    coalesce(left(doc_182.nif_declarante,9)+' '+right(doc_182.nif_declarante,2),'') AS nif_declarante,
    coalesce(doc_182.telefono,'') AS telefono,
    coalesce(doc_182.razon_social,'') AS razon_social,
    CASE WHEN doc_182.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_182.id_contribuyente AS id_contribuyente,
    coalesce(doc_182.cod_presentador_colectivo,'') AS cod_presentador_colectivo,
    coalesce(doc_182.cod_banco_espania,'') AS cod_banco_espania,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_182.fec_presentacion AS fec_presentacion,
    coalesce(doc_182.num_caja,'') AS num_caja,
    doc_182.fec_alta_mf AS fec_alta_mf,
    doc_182.num_justificante AS num_justificante,
    coalesce(doc_182.tipo_declaracion,'') AS tipo_declaracion,
    doc_182.contador_revisiones AS contador_revisiones,
    coalesce(doc_182.regimen_fiscal_deducciones,'') AS regimen_fiscal_deducciones,
    doc_182.num_declarados AS num_declarados,
    doc_182.fec_baja AS fec_baja
  INTO #query__DE0B1
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones doc_182
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_182.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_182.id_tipo_presentacion)
  WHERE doc_182.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__B5243 ON #query__DE0B1 (id_documento)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones AS tbn1_dim_documentos_informativos_182_donaciones
  USING #query__DE0B1 AS query ON query.id_documento=tbn1_dim_documentos_informativos_182_donaciones.id_documento
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_182_donaciones AS tbn1_dim_documentos_informativos_182_donaciones
  USING #query__DE0B1 AS query ON query.id_documento=tbn1_dim_documentos_informativos_182_donaciones.id_documento
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_182_donaciones.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_182_donaciones.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_182_donaciones.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.administracion<>query.administracion OR (tbn1_dim_documentos_informativos_182_donaciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_182_donaciones.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.telefono<>query.telefono OR (tbn1_dim_documentos_informativos_182_donaciones.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_182_donaciones.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_182_donaciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_182_donaciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_dim_documentos_informativos_182_donaciones.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.cod_banco_espania<>query.cod_banco_espania OR (tbn1_dim_documentos_informativos_182_donaciones.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_182_donaciones.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_182_donaciones.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_182_donaciones.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_182_donaciones.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.fec_alta_mf<>query.fec_alta_mf OR (tbn1_dim_documentos_informativos_182_donaciones.fec_alta_mf IS NULL AND query.fec_alta_mf IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.fec_alta_mf IS NOT NULL AND query.fec_alta_mf IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.num_justificante<>query.num_justificante OR (tbn1_dim_documentos_informativos_182_donaciones.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_documentos_informativos_182_donaciones.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_182_donaciones.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_dim_documentos_informativos_182_donaciones.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
                    OR tbn1_dim_documentos_informativos_182_donaciones.num_declarados<>query.num_declarados OR (tbn1_dim_documentos_informativos_182_donaciones.num_declarados IS NULL AND query.num_declarados IS NOT NULL) OR  (tbn1_dim_documentos_informativos_182_donaciones.num_declarados IS NOT NULL AND query.num_declarados IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      administracion=query.administracion,
      nif_declarante=query.nif_declarante,
      telefono=query.telefono,
      razon_social=query.razon_social,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      cod_presentador_colectivo=query.cod_presentador_colectivo,
      cod_banco_espania=query.cod_banco_espania,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      num_caja=query.num_caja,
      fec_alta_mf=query.fec_alta_mf,
      num_justificante=query.num_justificante,
      tipo_declaracion=query.tipo_declaracion,
      contador_revisiones=query.contador_revisiones,
      regimen_fiscal_deducciones=query.regimen_fiscal_deducciones,
      num_declarados=query.num_declarados
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,administracion,nif_declarante,telefono,razon_social,es_contribuyente,id_contribuyente,cod_presentador_colectivo,cod_banco_espania,cod_tipo_presentacion,tipo_presentacion,fec_presentacion,num_caja,fec_alta_mf,num_justificante,tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,num_declarados) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.administracion,
      query.nif_declarante,
      query.telefono,
      query.razon_social,
      query.es_contribuyente,
      query.id_contribuyente,
      query.cod_presentador_colectivo,
      query.cod_banco_espania,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.fec_presentacion,
      query.num_caja,
      query.fec_alta_mf,
      query.num_justificante,
      query.tipo_declaracion,
      query.contador_revisiones,
      query.regimen_fiscal_deducciones,
      query.num_declarados);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones(
  id_detalles_182 int NOT NULL,
  id_documento int NOT NULL,
  administracion varchar(1) NOT NULL,
  secuencia varchar(9) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_representante varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_clave_donacion varchar(1) NOT NULL,
  clave_donacion varchar(50) NOT NULL,
  deduccion numeric(6,4),
  es_especie varchar(1) NOT NULL,
  deduccion_comunidad_autonoma numeric(2),
  porcentaje_comunidad_autonoma numeric(6,4),
  es_identificado varchar(1) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  cod_naturaleza varchar(1) NOT NULL,
  naturaleza varchar(50) NOT NULL,
  es_revocacion varchar(1) NOT NULL,
  ejercicio_revocacion smallint,
  cod_tipo_importe varchar(2) NOT NULL,
  tipo_importe varchar(50) NOT NULL,
  importe numeric(15,2),
  nif_titular_bien varchar(9) NOT NULL,
  nombre_titular_bien varchar(40) NOT NULL,
  cod_tipo_bien varchar(1) NOT NULL,
  tipo_bien varchar(50) NOT NULL,
  identificacion_bien varchar(20) NOT NULL,
  documentacion_bien varchar(1) NOT NULL,
  CONSTRAINT PK_tbn1_fact_detalles_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_detalles_182),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_182_donaciones_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_182_donaciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_detalles_182')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD id_detalles_182 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD secuencia varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_clave_donacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD cod_clave_donacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='clave_donacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD clave_donacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD deduccion numeric(6,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_especie')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD es_especie varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion_comunidad_autonoma')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD deduccion_comunidad_autonoma numeric(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='porcentaje_comunidad_autonoma')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD porcentaje_comunidad_autonoma numeric(6,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_naturaleza')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD cod_naturaleza varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='naturaleza')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD naturaleza varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_revocacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD es_revocacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='ejercicio_revocacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD ejercicio_revocacion smallint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD cod_tipo_importe varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD tipo_importe varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD importe numeric(15,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_titular_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD nif_titular_bien varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='nombre_titular_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD nombre_titular_bien varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD cod_tipo_bien varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD tipo_bien varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='identificacion_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD identificacion_bien varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='documentacion_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD documentacion_bien varchar(1)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_detalles_182' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN id_detalles_182 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN secuencia varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_clave_donacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN cod_clave_donacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='clave_donacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN clave_donacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN deduccion numeric(6,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_especie' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN es_especie varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion_comunidad_autonoma' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN deduccion_comunidad_autonoma numeric(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='porcentaje_comunidad_autonoma' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN porcentaje_comunidad_autonoma numeric(6,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN cod_naturaleza varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN naturaleza varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_revocacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN es_revocacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='ejercicio_revocacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN ejercicio_revocacion smallint NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN cod_tipo_importe varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN tipo_importe varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN importe numeric(15,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_titular_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN nif_titular_bien varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='nombre_titular_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN nombre_titular_bien varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='cod_tipo_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN cod_tipo_bien varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='tipo_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN tipo_bien varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='identificacion_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN identificacion_bien varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND COLUMN_NAME='documentacion_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ALTER COLUMN documentacion_bien varchar(1) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_182_donaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_detalles_182)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_182_donaciones_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_182_donaciones_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_182_donaciones_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_182_donaciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_182' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_182;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_182(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_182'
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

  -- Materialized query: query
  SELECT
    det_182.id_detalles_182 AS id_detalles_182,
    det_182.id_documento AS id_documento,
    det_182.administracion AS administracion,
    det_182.secuencia AS secuencia,
    coalesce(left(det_182.nif_declarado,9)+' '+right(det_182.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_182.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_182.id_contribuyente AS id_contribuyente,
    CASE WHEN det_182.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    provincia.provincia AS provincia,
    clave_donacion.cod_clave_donacion AS cod_clave_donacion,
    clave_donacion.clave_donacion AS clave_donacion,
    det_182.deduccion AS deduccion,
    CASE WHEN det_182.es_especie=1 THEN 'S' ELSE 'N' END AS es_especie,
    det_182.deduccion_comunidad_autonoma AS deduccion_comunidad_autonoma,
    det_182.porcentaje_comunidad_autonoma AS porcentaje_comunidad_autonoma,
    CASE WHEN det_182.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_182.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    naturaleza.cod_naturaleza AS cod_naturaleza,
    naturaleza.naturaleza AS naturaleza,
    CASE WHEN det_182.es_revocacion=1 THEN 'S' ELSE 'N' END AS es_revocacion,
    det_182.ejercicio_revocacion AS ejercicio_revocacion,
    tipo_importe.cod_tipo_importe AS cod_tipo_importe,
    tipo_importe.tipo_importe AS tipo_importe,
    det_182.importe AS importe,
    coalesce(det_182.nif_titular_bien,'') AS nif_titular_bien,
    coalesce(det_182.nombre_titular_bien,'') AS nombre_titular_bien,
    tipo_bien.cod_tipo_bien AS cod_tipo_bien,
    tipo_bien.tipo_bien AS tipo_bien,
    coalesce(det_182.identificacion_bien,'') AS identificacion_bien,
    CASE WHEN det_182.documentacion_bien=1 THEN 'S' ELSE 'N' END AS documentacion_bien,
    det_182.fec_baja AS fec_baja
  INTO #query__5A56F
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones det_182
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_182 ON (doc_182.id_documento=det_182.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_182.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_182.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion clave_donacion ON (clave_donacion.id_clave_donacion=det_182.id_clave_donacion)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza naturaleza ON (naturaleza.id_naturaleza=det_182.id_naturaleza)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.id_tipo_importe=det_182.id_tipo_importe)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien tipo_bien ON (tipo_bien.id_tipo_bien=det_182.id_tipo_bien)
  WHERE det_182.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__1C403 ON #query__5A56F (id_detalles_182)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones AS tbn1_fact_detalles_informativos_182_donaciones
  USING #query__5A56F AS query ON query.id_detalles_182=tbn1_fact_detalles_informativos_182_donaciones.id_detalles_182
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_182_donaciones AS tbn1_fact_detalles_informativos_182_donaciones
  USING #query__5A56F AS query ON query.id_detalles_182=tbn1_fact_detalles_informativos_182_donaciones.id_detalles_182
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_182_donaciones.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_182_donaciones.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_182_donaciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_182_donaciones.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_182_donaciones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_182_donaciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_182_donaciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_182_donaciones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_182_donaciones.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.cod_clave_donacion<>query.cod_clave_donacion OR (tbn1_fact_detalles_informativos_182_donaciones.cod_clave_donacion IS NULL AND query.cod_clave_donacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.cod_clave_donacion IS NOT NULL AND query.cod_clave_donacion IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.clave_donacion<>query.clave_donacion OR (tbn1_fact_detalles_informativos_182_donaciones.clave_donacion IS NULL AND query.clave_donacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.clave_donacion IS NOT NULL AND query.clave_donacion IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.deduccion<>query.deduccion OR (tbn1_fact_detalles_informativos_182_donaciones.deduccion IS NULL AND query.deduccion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.deduccion IS NOT NULL AND query.deduccion IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.es_especie<>query.es_especie OR (tbn1_fact_detalles_informativos_182_donaciones.es_especie IS NULL AND query.es_especie IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.es_especie IS NOT NULL AND query.es_especie IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.deduccion_comunidad_autonoma<>query.deduccion_comunidad_autonoma OR (tbn1_fact_detalles_informativos_182_donaciones.deduccion_comunidad_autonoma IS NULL AND query.deduccion_comunidad_autonoma IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.deduccion_comunidad_autonoma IS NOT NULL AND query.deduccion_comunidad_autonoma IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.porcentaje_comunidad_autonoma<>query.porcentaje_comunidad_autonoma OR (tbn1_fact_detalles_informativos_182_donaciones.porcentaje_comunidad_autonoma IS NULL AND query.porcentaje_comunidad_autonoma IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.porcentaje_comunidad_autonoma IS NOT NULL AND query.porcentaje_comunidad_autonoma IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_182_donaciones.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.es_erroneo<>query.es_erroneo OR (tbn1_fact_detalles_informativos_182_donaciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.cod_naturaleza<>query.cod_naturaleza OR (tbn1_fact_detalles_informativos_182_donaciones.cod_naturaleza IS NULL AND query.cod_naturaleza IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.cod_naturaleza IS NOT NULL AND query.cod_naturaleza IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.naturaleza<>query.naturaleza OR (tbn1_fact_detalles_informativos_182_donaciones.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.naturaleza IS NOT NULL AND query.naturaleza IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.es_revocacion<>query.es_revocacion OR (tbn1_fact_detalles_informativos_182_donaciones.es_revocacion IS NULL AND query.es_revocacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.es_revocacion IS NOT NULL AND query.es_revocacion IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.ejercicio_revocacion<>query.ejercicio_revocacion OR (tbn1_fact_detalles_informativos_182_donaciones.ejercicio_revocacion IS NULL AND query.ejercicio_revocacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.ejercicio_revocacion IS NOT NULL AND query.ejercicio_revocacion IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.cod_tipo_importe<>query.cod_tipo_importe OR (tbn1_fact_detalles_informativos_182_donaciones.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.tipo_importe<>query.tipo_importe OR (tbn1_fact_detalles_informativos_182_donaciones.tipo_importe IS NULL AND query.tipo_importe IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.tipo_importe IS NOT NULL AND query.tipo_importe IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.importe<>query.importe OR (tbn1_fact_detalles_informativos_182_donaciones.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.nif_titular_bien<>query.nif_titular_bien OR (tbn1_fact_detalles_informativos_182_donaciones.nif_titular_bien IS NULL AND query.nif_titular_bien IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.nif_titular_bien IS NOT NULL AND query.nif_titular_bien IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.nombre_titular_bien<>query.nombre_titular_bien OR (tbn1_fact_detalles_informativos_182_donaciones.nombre_titular_bien IS NULL AND query.nombre_titular_bien IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.nombre_titular_bien IS NOT NULL AND query.nombre_titular_bien IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.cod_tipo_bien<>query.cod_tipo_bien OR (tbn1_fact_detalles_informativos_182_donaciones.cod_tipo_bien IS NULL AND query.cod_tipo_bien IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.cod_tipo_bien IS NOT NULL AND query.cod_tipo_bien IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.tipo_bien<>query.tipo_bien OR (tbn1_fact_detalles_informativos_182_donaciones.tipo_bien IS NULL AND query.tipo_bien IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.tipo_bien IS NOT NULL AND query.tipo_bien IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.identificacion_bien<>query.identificacion_bien OR (tbn1_fact_detalles_informativos_182_donaciones.identificacion_bien IS NULL AND query.identificacion_bien IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.identificacion_bien IS NOT NULL AND query.identificacion_bien IS NULL)
                    OR tbn1_fact_detalles_informativos_182_donaciones.documentacion_bien<>query.documentacion_bien OR (tbn1_fact_detalles_informativos_182_donaciones.documentacion_bien IS NULL AND query.documentacion_bien IS NOT NULL) OR  (tbn1_fact_detalles_informativos_182_donaciones.documentacion_bien IS NOT NULL AND query.documentacion_bien IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      administracion=query.administracion,
      secuencia=query.secuencia,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      provincia=query.provincia,
      cod_clave_donacion=query.cod_clave_donacion,
      clave_donacion=query.clave_donacion,
      deduccion=query.deduccion,
      es_especie=query.es_especie,
      deduccion_comunidad_autonoma=query.deduccion_comunidad_autonoma,
      porcentaje_comunidad_autonoma=query.porcentaje_comunidad_autonoma,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      cod_naturaleza=query.cod_naturaleza,
      naturaleza=query.naturaleza,
      es_revocacion=query.es_revocacion,
      ejercicio_revocacion=query.ejercicio_revocacion,
      cod_tipo_importe=query.cod_tipo_importe,
      tipo_importe=query.tipo_importe,
      importe=query.importe,
      nif_titular_bien=query.nif_titular_bien,
      nombre_titular_bien=query.nombre_titular_bien,
      cod_tipo_bien=query.cod_tipo_bien,
      tipo_bien=query.tipo_bien,
      identificacion_bien=query.identificacion_bien,
      documentacion_bien=query.documentacion_bien
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_182,id_documento,administracion,secuencia,nif_declarado,es_contribuyente,id_contribuyente,es_representante,provincia,cod_clave_donacion,clave_donacion,deduccion,es_especie,deduccion_comunidad_autonoma,porcentaje_comunidad_autonoma,es_identificado,es_erroneo,cod_naturaleza,naturaleza,es_revocacion,ejercicio_revocacion,cod_tipo_importe,tipo_importe,importe,nif_titular_bien,nombre_titular_bien,cod_tipo_bien,tipo_bien,identificacion_bien,documentacion_bien) VALUES (
      query.id_detalles_182,
      query.id_documento,
      query.administracion,
      query.secuencia,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.provincia,
      query.cod_clave_donacion,
      query.clave_donacion,
      query.deduccion,
      query.es_especie,
      query.deduccion_comunidad_autonoma,
      query.porcentaje_comunidad_autonoma,
      query.es_identificado,
      query.es_erroneo,
      query.cod_naturaleza,
      query.naturaleza,
      query.es_revocacion,
      query.ejercicio_revocacion,
      query.cod_tipo_importe,
      query.tipo_importe,
      query.importe,
      query.nif_titular_bien,
      query.nombre_titular_bien,
      query.cod_tipo_bien,
      query.tipo_bien,
      query.identificacion_bien,
      query.documentacion_bien);

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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_182' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_182;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_182(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_182'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_182 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_182 @log;

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

