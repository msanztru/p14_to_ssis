PRINT 'cargar_dimensional_modelo_188.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  nif_declarante varchar(12) NOT NULL,
  fec_alta_af date,
  razon_social varchar(25) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  delegacion_hacienda varchar(2) NOT NULL,
  administracion_hacienda varchar(3) NOT NULL,
  telefono varchar(10) NOT NULL,
  cod_presentador_colectivo int NOT NULL,
  cod_entidad_gestora varchar(4) NOT NULL,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  fec_presentacion date,
  num_caja varchar(8) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  num_declarados_erroneos int,
  hay_observaciones varchar(1) NOT NULL,
  es_historico varchar(1) NOT NULL,
  volumen_operaciones numeric(18,2),
  num_justificante numeric(13),
  tipo_declaracion varchar(1) NOT NULL,
  contador_revisiones int,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_188_seguros_vida_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD hay_observaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD es_historico varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD contador_revisiones int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN razon_social varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN administracion_hacienda varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN telefono varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN cod_presentador_colectivo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN hay_observaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN es_historico varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN tipo_declaracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ALTER COLUMN contador_revisiones int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_188_seguros_vida')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_188_seguros_vida_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_188_seguros_vida_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_188' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_188;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_188(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_188'
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
    doc_188.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(left(doc_188.nif_declarante,9)+' '+right(doc_188.nif_declarante,2),'') AS nif_declarante,
    doc_188.fec_alta_af AS fec_alta_af,
    coalesce(doc_188.razon_social,'') AS razon_social,
    CASE WHEN doc_188.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_188.id_contribuyente AS id_contribuyente,
    coalesce(doc_188.delegacion_hacienda,'') AS delegacion_hacienda,
    coalesce(doc_188.administracion_hacienda,'') AS administracion_hacienda,
    coalesce(doc_188.telefono,'') AS telefono,
    coalesce(doc_188.cod_presentador_colectivo,'') AS cod_presentador_colectivo,
    coalesce(doc_188.cod_entidad_gestora,'') AS cod_entidad_gestora,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_188.fec_presentacion AS fec_presentacion,
    coalesce(doc_188.num_caja,'') AS num_caja,
    CASE WHEN doc_188.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    doc_188.num_declarados_erroneos AS num_declarados_erroneos,
    CASE WHEN doc_188.hay_observaciones=1 THEN 'S' ELSE 'N' END AS hay_observaciones,
    CASE WHEN doc_188.es_historico=1 THEN 'S' ELSE 'N' END AS es_historico,
    doc_188.volumen_operaciones AS volumen_operaciones,
    doc_188.num_justificante AS num_justificante,
    coalesce(doc_188.tipo_declaracion,'') AS tipo_declaracion,
    doc_188.contador_revisiones AS contador_revisiones,
    doc_188.fec_baja AS fec_baja
  INTO #query__88854
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida doc_188
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_188.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_188.id_tipo_presentacion)
  WHERE doc_188.fec_modificacion>@fecha_ultima_carga
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__88B2E ON #query__88854 (id_documento,administracion_hacienda)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida AS tbn1_dim_documentos_informativos_188_seguros_vida
  USING #query__88854 AS query ON query.id_documento=tbn1_dim_documentos_informativos_188_seguros_vida.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_188_seguros_vida.administracion_hacienda

  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_188_seguros_vida AS tbn1_dim_documentos_informativos_188_seguros_vida
  USING #query__88854 AS query ON query.id_documento=tbn1_dim_documentos_informativos_188_seguros_vida.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_188_seguros_vida.administracion_hacienda
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_188_seguros_vida.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_188_seguros_vida.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_188_seguros_vida.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_188_seguros_vida.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.fec_alta_af<>query.fec_alta_af OR (tbn1_dim_documentos_informativos_188_seguros_vida.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_188_seguros_vida.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_188_seguros_vida.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_188_seguros_vida.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_dim_documentos_informativos_188_seguros_vida.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.telefono<>query.telefono OR (tbn1_dim_documentos_informativos_188_seguros_vida.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_dim_documentos_informativos_188_seguros_vida.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_dim_documentos_informativos_188_seguros_vida.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_188_seguros_vida.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_188_seguros_vida.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_188_seguros_vida.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_188_seguros_vida.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.es_erroneo<>query.es_erroneo OR (tbn1_dim_documentos_informativos_188_seguros_vida.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_dim_documentos_informativos_188_seguros_vida.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.hay_observaciones<>query.hay_observaciones OR (tbn1_dim_documentos_informativos_188_seguros_vida.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.es_historico<>query.es_historico OR (tbn1_dim_documentos_informativos_188_seguros_vida.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.volumen_operaciones<>query.volumen_operaciones OR (tbn1_dim_documentos_informativos_188_seguros_vida.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.num_justificante<>query.num_justificante OR (tbn1_dim_documentos_informativos_188_seguros_vida.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_documentos_informativos_188_seguros_vida.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_188_seguros_vida.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_188_seguros_vida.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_188_seguros_vida.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      nif_declarante=query.nif_declarante,
      fec_alta_af=query.fec_alta_af,
      razon_social=query.razon_social,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      delegacion_hacienda=query.delegacion_hacienda,
      telefono=query.telefono,
      cod_presentador_colectivo=query.cod_presentador_colectivo,
      cod_entidad_gestora=query.cod_entidad_gestora,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      num_caja=query.num_caja,
      es_erroneo=query.es_erroneo,
      num_declarados_erroneos=query.num_declarados_erroneos,
      hay_observaciones=query.hay_observaciones,
      es_historico=query.es_historico,
      volumen_operaciones=query.volumen_operaciones,
      num_justificante=query.num_justificante,
      tipo_declaracion=query.tipo_declaracion,
      contador_revisiones=query.contador_revisiones
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,nif_declarante,fec_alta_af,razon_social,es_contribuyente,id_contribuyente,delegacion_hacienda,administracion_hacienda,telefono,cod_presentador_colectivo,cod_entidad_gestora,cod_tipo_presentacion,tipo_presentacion,fec_presentacion,num_caja,es_erroneo,num_declarados_erroneos,hay_observaciones,es_historico,volumen_operaciones,num_justificante,tipo_declaracion,contador_revisiones) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.nif_declarante,
      query.fec_alta_af,
      query.razon_social,
      query.es_contribuyente,
      query.id_contribuyente,
      query.delegacion_hacienda,
      query.administracion_hacienda,
      query.telefono,
      query.cod_presentador_colectivo,
      query.cod_entidad_gestora,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.fec_presentacion,
      query.num_caja,
      query.es_erroneo,
      query.num_declarados_erroneos,
      query.hay_observaciones,
      query.es_historico,
      query.volumen_operaciones,
      query.num_justificante,
      query.tipo_declaracion,
      query.contador_revisiones);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida(
  id_detalles_188 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_externo varchar(1) NOT NULL,
  es_representante varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  ejercicio_devengo int,
  tipo_retencion numeric(18,4),
  cod_modalidad varchar(1) NOT NULL,
  modalidad varchar(50) NOT NULL,
  es_identificado varchar(2) NOT NULL,
  es_erroneo varchar(2) NOT NULL,
  renta numeric(18,2),
  reduccion_1 numeric(18,2),
  reduccion_2 numeric(18,2),
  base_retencion numeric(18,2),
  retencion numeric(18,2),
  importe_11 numeric(18,2),
  importe_12 numeric(18,2),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_detalles_188),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_188_seguros_vida_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_188_seguros_vida_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_detalles_188')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD id_detalles_188 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD ejercicio_devengo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD tipo_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='cod_modalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD cod_modalidad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='modalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD modalidad varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD es_identificado varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD es_erroneo varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='renta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD renta numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD reduccion_1 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD reduccion_2 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='base_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD base_retencion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD retencion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_11')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD importe_11 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_12')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD importe_12 numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_detalles_188' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN id_detalles_188 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN ejercicio_devengo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN tipo_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='cod_modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN cod_modalidad varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN modalidad varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN es_identificado varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN es_erroneo varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='renta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN renta numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN reduccion_1 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN reduccion_2 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='base_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN base_retencion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN retencion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_11' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN importe_11 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_12' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ALTER COLUMN importe_12 numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_188_seguros_vida')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_detalles_188)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_188_seguros_vida_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_188_seguros_vida_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_188_seguros_vida_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_188_seguros_vida_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_188' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_188;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_188(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_188'
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
    det_188.id_detalles_188 AS id_detalles_188,
    det_188.id_documento AS id_documento,
    det_188.secuencia AS secuencia,
    coalesce(det_188.administracion,'') AS administracion,
    coalesce(left(det_188.nif_declarado,9)+' '+right(det_188.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_188.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_188.id_contribuyente AS id_contribuyente,
    CASE WHEN det_188.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN det_188.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    provincia.provincia AS provincia,
    det_188.ejercicio_devengo AS ejercicio_devengo,
    coalesce(det_188.tipo_retencion,'') AS tipo_retencion,
    modalidad.cod_modalidad AS cod_modalidad,
    modalidad.modalidad AS modalidad,
    CASE WHEN det_188.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_188.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    det_188.renta AS renta,
    det_188.reduccion_1 AS reduccion_1,
    det_188.reduccion_2 AS reduccion_2,
    det_188.base_retencion AS base_retencion,
    det_188.retencion AS retencion,
    det_188.importe_11 AS importe_11,
    det_188.importe_12 AS importe_12,
    det_188.fec_baja AS fec_baja
  INTO #query__07840
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida det_188
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_188 ON (doc_188.id_documento=det_188.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_188.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_188.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad modalidad ON (modalidad.id_modalidad=det_188.id_modalidad)
  WHERE det_188.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__BAF48 ON #query__07840 (id_detalles_188)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida AS tbn1_fact_detalles_informativos_188_seguros_vida
  USING #query__07840 AS query ON query.id_detalles_188=tbn1_fact_detalles_informativos_188_seguros_vida.id_detalles_188
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_188_seguros_vida AS tbn1_fact_detalles_informativos_188_seguros_vida
  USING #query__07840 AS query ON query.id_detalles_188=tbn1_fact_detalles_informativos_188_seguros_vida.id_detalles_188
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_188_seguros_vida.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_188_seguros_vida.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_188_seguros_vida.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_188_seguros_vida.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_188_seguros_vida.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_188_seguros_vida.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_188_seguros_vida.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_188_seguros_vida.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_188_seguros_vida.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_188_seguros_vida.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_fact_detalles_informativos_188_seguros_vida.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.tipo_retencion<>query.tipo_retencion OR (tbn1_fact_detalles_informativos_188_seguros_vida.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.cod_modalidad<>query.cod_modalidad OR (tbn1_fact_detalles_informativos_188_seguros_vida.cod_modalidad IS NULL AND query.cod_modalidad IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.cod_modalidad IS NOT NULL AND query.cod_modalidad IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.modalidad<>query.modalidad OR (tbn1_fact_detalles_informativos_188_seguros_vida.modalidad IS NULL AND query.modalidad IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.modalidad IS NOT NULL AND query.modalidad IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_188_seguros_vida.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.es_erroneo<>query.es_erroneo OR (tbn1_fact_detalles_informativos_188_seguros_vida.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.renta<>query.renta OR (tbn1_fact_detalles_informativos_188_seguros_vida.renta IS NULL AND query.renta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.renta IS NOT NULL AND query.renta IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.reduccion_1<>query.reduccion_1 OR (tbn1_fact_detalles_informativos_188_seguros_vida.reduccion_1 IS NULL AND query.reduccion_1 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.reduccion_1 IS NOT NULL AND query.reduccion_1 IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.reduccion_2<>query.reduccion_2 OR (tbn1_fact_detalles_informativos_188_seguros_vida.reduccion_2 IS NULL AND query.reduccion_2 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.reduccion_2 IS NOT NULL AND query.reduccion_2 IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.base_retencion<>query.base_retencion OR (tbn1_fact_detalles_informativos_188_seguros_vida.base_retencion IS NULL AND query.base_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.base_retencion IS NOT NULL AND query.base_retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.retencion<>query.retencion OR (tbn1_fact_detalles_informativos_188_seguros_vida.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.importe_11<>query.importe_11 OR (tbn1_fact_detalles_informativos_188_seguros_vida.importe_11 IS NULL AND query.importe_11 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.importe_11 IS NOT NULL AND query.importe_11 IS NULL)
                    OR tbn1_fact_detalles_informativos_188_seguros_vida.importe_12<>query.importe_12 OR (tbn1_fact_detalles_informativos_188_seguros_vida.importe_12 IS NULL AND query.importe_12 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_188_seguros_vida.importe_12 IS NOT NULL AND query.importe_12 IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      secuencia=query.secuencia,
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      provincia=query.provincia,
      ejercicio_devengo=query.ejercicio_devengo,
      tipo_retencion=query.tipo_retencion,
      cod_modalidad=query.cod_modalidad,
      modalidad=query.modalidad,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      renta=query.renta,
      reduccion_1=query.reduccion_1,
      reduccion_2=query.reduccion_2,
      base_retencion=query.base_retencion,
      retencion=query.retencion,
      importe_11=query.importe_11,
      importe_12=query.importe_12
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_188,id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,provincia,ejercicio_devengo,tipo_retencion,cod_modalidad,modalidad,es_identificado,es_erroneo,renta,reduccion_1,reduccion_2,base_retencion,retencion,importe_11,importe_12) VALUES (
      query.id_detalles_188,
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.provincia,
      query.ejercicio_devengo,
      query.tipo_retencion,
      query.cod_modalidad,
      query.modalidad,
      query.es_identificado,
      query.es_erroneo,
      query.renta,
      query.reduccion_1,
      query.reduccion_2,
      query.base_retencion,
      query.retencion,
      query.importe_11,
      query.importe_12);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_188' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_188;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_188(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_188'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_188 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_188 @log;

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

