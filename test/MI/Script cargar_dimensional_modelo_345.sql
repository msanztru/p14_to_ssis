PRINT 'cargar_dimensional_modelo_345.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarante varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_complementaria varchar(1) NOT NULL,
  es_sustitutiva varchar(1) NOT NULL,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  fec_presentacion date,
  telefono_contacto varchar(9) NOT NULL,
  nombre_contacto varchar(40) NOT NULL,
  ref_presentacion_colectiva int NOT NULL,
  num_caja varchar(8) NOT NULL,
  contador_revisiones int,
  fec_baja_declarante date,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_345_planes_pensiones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD es_complementaria varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD es_sustitutiva varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD telefono_contacto varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD nombre_contacto varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='ref_presentacion_colectiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD ref_presentacion_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD fec_baja_declarante date

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN es_complementaria varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN es_sustitutiva varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN telefono_contacto varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN nombre_contacto varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='ref_presentacion_colectiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN ref_presentacion_colectiva int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_baja_declarante date NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_345_planes_pensiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_345_planes_pensiones_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_345_planes_pensiones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_345' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_345;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_345(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_345'
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
    doc_345.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(doc_345.administracion,'') AS administracion,
    coalesce(left(doc_345.nif_declarante,9)+' '+right(doc_345.nif_declarante,2),'') AS nif_declarante,
    CASE WHEN doc_345.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_345.id_contribuyente AS id_contribuyente,
    CASE WHEN doc_345.es_complementaria=1 THEN 'S' ELSE 'N' END AS es_complementaria,
    CASE WHEN doc_345.es_sustitutiva=1 THEN 'S' ELSE 'N' END AS es_sustitutiva,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_345.fec_presentacion AS fec_presentacion,
    coalesce(doc_345.telefono_contacto,'') AS telefono_contacto,
    coalesce(doc_345.nombre_contacto,'') AS nombre_contacto,
    coalesce(doc_345.ref_presentacion_colectiva,'') AS ref_presentacion_colectiva,
    coalesce(doc_345.num_caja,'') AS num_caja,
    doc_345.contador_revisiones AS contador_revisiones,
    doc_345.fec_baja_declarante AS fec_baja_declarante,
    doc_345.fec_baja AS fec_baja
  INTO #query__C7E9A
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones doc_345
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_345.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_345.id_tipo_presentacion)
  WHERE doc_345.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__0FF7D ON #query__C7E9A (id_documento)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones AS tbn1_dim_documentos_informativos_345_planes_pensiones
  USING #query__C7E9A AS query ON query.id_documento=tbn1_dim_documentos_informativos_345_planes_pensiones.id_documento
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_345_planes_pensiones AS tbn1_dim_documentos_informativos_345_planes_pensiones
  USING #query__C7E9A AS query ON query.id_documento=tbn1_dim_documentos_informativos_345_planes_pensiones.id_documento
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_345_planes_pensiones.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_345_planes_pensiones.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_345_planes_pensiones.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.administracion<>query.administracion OR (tbn1_dim_documentos_informativos_345_planes_pensiones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_345_planes_pensiones.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_345_planes_pensiones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_345_planes_pensiones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.es_complementaria<>query.es_complementaria OR (tbn1_dim_documentos_informativos_345_planes_pensiones.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.es_sustitutiva<>query.es_sustitutiva OR (tbn1_dim_documentos_informativos_345_planes_pensiones.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_345_planes_pensiones.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_345_planes_pensiones.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_345_planes_pensiones.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.telefono_contacto<>query.telefono_contacto OR (tbn1_dim_documentos_informativos_345_planes_pensiones.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.nombre_contacto<>query.nombre_contacto OR (tbn1_dim_documentos_informativos_345_planes_pensiones.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.ref_presentacion_colectiva<>query.ref_presentacion_colectiva OR (tbn1_dim_documentos_informativos_345_planes_pensiones.ref_presentacion_colectiva IS NULL AND query.ref_presentacion_colectiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.ref_presentacion_colectiva IS NOT NULL AND query.ref_presentacion_colectiva IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_345_planes_pensiones.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_345_planes_pensiones.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_dim_documentos_informativos_345_planes_pensiones.fec_baja_declarante<>query.fec_baja_declarante OR (tbn1_dim_documentos_informativos_345_planes_pensiones.fec_baja_declarante IS NULL AND query.fec_baja_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_345_planes_pensiones.fec_baja_declarante IS NOT NULL AND query.fec_baja_declarante IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      administracion=query.administracion,
      nif_declarante=query.nif_declarante,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_complementaria=query.es_complementaria,
      es_sustitutiva=query.es_sustitutiva,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      telefono_contacto=query.telefono_contacto,
      nombre_contacto=query.nombre_contacto,
      ref_presentacion_colectiva=query.ref_presentacion_colectiva,
      num_caja=query.num_caja,
      contador_revisiones=query.contador_revisiones,
      fec_baja_declarante=query.fec_baja_declarante
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,administracion,nif_declarante,es_contribuyente,id_contribuyente,es_complementaria,es_sustitutiva,cod_tipo_presentacion,tipo_presentacion,fec_presentacion,telefono_contacto,nombre_contacto,ref_presentacion_colectiva,num_caja,contador_revisiones,fec_baja_declarante) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.administracion,
      query.nif_declarante,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_complementaria,
      query.es_sustitutiva,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.fec_presentacion,
      query.telefono_contacto,
      query.nombre_contacto,
      query.ref_presentacion_colectiva,
      query.num_caja,
      query.contador_revisiones,
      query.fec_baja_declarante);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones(
  id_detalles_345 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_representante varchar(1) NOT NULL,
  [año_nacimiento] numeric(4) NOT NULL,
  provincia varchar(50) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  clave_operacion varchar(1) NOT NULL,
  subclave_operacion numeric(4),
  importe_operacion numeric(13,2) NOT NULL,
  nif_beneficiario_minusvalido varchar(12) NOT NULL,
  denom_plan_pensiones varchar(40) NOT NULL,
  num_registro_fondo_pensiones varchar(5) NOT NULL,
  nif_fondo_pensiones varchar(12) NOT NULL,
  nif_entidad_aseguradora varchar(12) NOT NULL,
  fec_primera_prima date,
  importe_acum_PIAS numeric(13,2),
  base_deduccion_prev_social numeric(13,2),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_detalles_345),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_345_planes_pensiones_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_345_planes_pensiones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_detalles_345')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD id_detalles_345 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='año_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD [año_nacimiento] numeric(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='clave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD clave_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='subclave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD subclave_operacion numeric(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD importe_operacion numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_beneficiario_minusvalido')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD nif_beneficiario_minusvalido varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='denom_plan_pensiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD denom_plan_pensiones varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='num_registro_fondo_pensiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD num_registro_fondo_pensiones varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_fondo_pensiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD nif_fondo_pensiones varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_entidad_aseguradora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD nif_entidad_aseguradora varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_primera_prima')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD fec_primera_prima date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_acum_PIAS')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD importe_acum_PIAS numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='base_deduccion_prev_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD base_deduccion_prev_social numeric(13,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_detalles_345' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN id_detalles_345 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='año_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN [año_nacimiento] numeric(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='clave_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN clave_operacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='subclave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN subclave_operacion numeric(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN importe_operacion numeric(13,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_beneficiario_minusvalido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_beneficiario_minusvalido varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='denom_plan_pensiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN denom_plan_pensiones varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='num_registro_fondo_pensiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN num_registro_fondo_pensiones varchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_fondo_pensiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_fondo_pensiones varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_entidad_aseguradora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_entidad_aseguradora varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_primera_prima' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN fec_primera_prima date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_acum_PIAS' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN importe_acum_PIAS numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='base_deduccion_prev_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ALTER COLUMN base_deduccion_prev_social numeric(13,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_345_planes_pensiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_detalles_345)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_345_planes_pensiones_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_345_planes_pensiones_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_345_planes_pensiones_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_345_planes_pensiones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_345' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_345;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_345(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_345'
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
    det_345.id_detalles_345 AS id_detalles_345,
    det_345.id_documento AS id_documento,
    det_345.secuencia AS secuencia,
    coalesce(det_345.administracion,'') AS administracion,
    coalesce(left(det_345.nif_declarado,9)+' '+right(det_345.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_345.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_345.id_contribuyente AS id_contribuyente,
    CASE WHEN det_345.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    det_345.[año_nacimiento] AS [año_nacimiento],
    provincia.provincia AS provincia,
    det_345.clave_operacion AS clave_operacion,
    det_345.subclave_operacion AS subclave_operacion,
    det_345.importe_operacion AS importe_operacion,
    coalesce(left(det_345.nif_beneficiario_minusvalido,9)+' '+right(det_345.nif_beneficiario_minusvalido,2),'') AS nif_beneficiario_minusvalido,
    coalesce(det_345.denom_plan_pensiones,'') AS denom_plan_pensiones,
    det_345.num_registro_fondo_pensiones AS num_registro_fondo_pensiones,
    coalesce(left(det_345.nif_fondo_pensiones,9)+' '+right(det_345.nif_fondo_pensiones,2),'') AS nif_fondo_pensiones,
    coalesce(left(det_345.nif_entidad_aseguradora,9)+' '+right(det_345.nif_entidad_aseguradora,2),'') AS nif_entidad_aseguradora,
    det_345.fec_primera_prima AS fec_primera_prima,
    det_345.importe_acum_PIAS AS importe_acum_PIAS,
    det_345.base_deduccion_prev_social AS base_deduccion_prev_social,
    det_345.fec_baja AS fec_baja
  INTO #query__9CEFE
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones det_345
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_345 ON (doc_345.id_documento=det_345.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_345.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_345.id_provincia)
  WHERE det_345.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__17F96 ON #query__9CEFE (id_detalles_345)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones AS tbn1_fact_detalles_informativos_345_planes_pensiones
  USING #query__9CEFE AS query ON query.id_detalles_345=tbn1_fact_detalles_informativos_345_planes_pensiones.id_detalles_345
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_345_planes_pensiones AS tbn1_fact_detalles_informativos_345_planes_pensiones
  USING #query__9CEFE AS query ON query.id_detalles_345=tbn1_fact_detalles_informativos_345_planes_pensiones.id_detalles_345
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_345_planes_pensiones.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_345_planes_pensiones.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_345_planes_pensiones.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_345_planes_pensiones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_345_planes_pensiones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_345_planes_pensiones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_345_planes_pensiones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.año_nacimiento<>query.año_nacimiento OR (tbn1_fact_detalles_informativos_345_planes_pensiones.año_nacimiento IS NULL AND query.año_nacimiento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.año_nacimiento IS NOT NULL AND query.año_nacimiento IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_345_planes_pensiones.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.clave_operacion<>query.clave_operacion OR (tbn1_fact_detalles_informativos_345_planes_pensiones.clave_operacion IS NULL AND query.clave_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.clave_operacion IS NOT NULL AND query.clave_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.subclave_operacion<>query.subclave_operacion OR (tbn1_fact_detalles_informativos_345_planes_pensiones.subclave_operacion IS NULL AND query.subclave_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.subclave_operacion IS NOT NULL AND query.subclave_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.importe_operacion<>query.importe_operacion OR (tbn1_fact_detalles_informativos_345_planes_pensiones.importe_operacion IS NULL AND query.importe_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.importe_operacion IS NOT NULL AND query.importe_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.nif_beneficiario_minusvalido<>query.nif_beneficiario_minusvalido OR (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_beneficiario_minusvalido IS NULL AND query.nif_beneficiario_minusvalido IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_beneficiario_minusvalido IS NOT NULL AND query.nif_beneficiario_minusvalido IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.denom_plan_pensiones<>query.denom_plan_pensiones OR (tbn1_fact_detalles_informativos_345_planes_pensiones.denom_plan_pensiones IS NULL AND query.denom_plan_pensiones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.denom_plan_pensiones IS NOT NULL AND query.denom_plan_pensiones IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.num_registro_fondo_pensiones<>query.num_registro_fondo_pensiones OR (tbn1_fact_detalles_informativos_345_planes_pensiones.num_registro_fondo_pensiones IS NULL AND query.num_registro_fondo_pensiones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.num_registro_fondo_pensiones IS NOT NULL AND query.num_registro_fondo_pensiones IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.nif_fondo_pensiones<>query.nif_fondo_pensiones OR (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_fondo_pensiones IS NULL AND query.nif_fondo_pensiones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_fondo_pensiones IS NOT NULL AND query.nif_fondo_pensiones IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.nif_entidad_aseguradora<>query.nif_entidad_aseguradora OR (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_entidad_aseguradora IS NULL AND query.nif_entidad_aseguradora IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.nif_entidad_aseguradora IS NOT NULL AND query.nif_entidad_aseguradora IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.fec_primera_prima<>query.fec_primera_prima OR (tbn1_fact_detalles_informativos_345_planes_pensiones.fec_primera_prima IS NULL AND query.fec_primera_prima IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.fec_primera_prima IS NOT NULL AND query.fec_primera_prima IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.importe_acum_PIAS<>query.importe_acum_PIAS OR (tbn1_fact_detalles_informativos_345_planes_pensiones.importe_acum_PIAS IS NULL AND query.importe_acum_PIAS IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.importe_acum_PIAS IS NOT NULL AND query.importe_acum_PIAS IS NULL)
                    OR tbn1_fact_detalles_informativos_345_planes_pensiones.base_deduccion_prev_social<>query.base_deduccion_prev_social OR (tbn1_fact_detalles_informativos_345_planes_pensiones.base_deduccion_prev_social IS NULL AND query.base_deduccion_prev_social IS NOT NULL) OR  (tbn1_fact_detalles_informativos_345_planes_pensiones.base_deduccion_prev_social IS NOT NULL AND query.base_deduccion_prev_social IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      secuencia=query.secuencia,
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      año_nacimiento=query.año_nacimiento,
      provincia=query.provincia,
      clave_operacion=query.clave_operacion,
      subclave_operacion=query.subclave_operacion,
      importe_operacion=query.importe_operacion,
      nif_beneficiario_minusvalido=query.nif_beneficiario_minusvalido,
      denom_plan_pensiones=query.denom_plan_pensiones,
      num_registro_fondo_pensiones=query.num_registro_fondo_pensiones,
      nif_fondo_pensiones=query.nif_fondo_pensiones,
      nif_entidad_aseguradora=query.nif_entidad_aseguradora,
      fec_primera_prima=query.fec_primera_prima,
      importe_acum_PIAS=query.importe_acum_PIAS,
      base_deduccion_prev_social=query.base_deduccion_prev_social
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_345,id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_representante,año_nacimiento,provincia,clave_operacion,subclave_operacion,importe_operacion,nif_beneficiario_minusvalido,denom_plan_pensiones,num_registro_fondo_pensiones,nif_fondo_pensiones,nif_entidad_aseguradora,fec_primera_prima,importe_acum_PIAS,base_deduccion_prev_social) VALUES (
      query.id_detalles_345,
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.año_nacimiento,
      query.provincia,
      query.clave_operacion,
      query.subclave_operacion,
      query.importe_operacion,
      query.nif_beneficiario_minusvalido,
      query.denom_plan_pensiones,
      query.num_registro_fondo_pensiones,
      query.nif_fondo_pensiones,
      query.nif_entidad_aseguradora,
      query.fec_primera_prima,
      query.importe_acum_PIAS,
      query.base_deduccion_prev_social);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_345' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_345;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_345(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_345'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_345 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_345 @log;

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

