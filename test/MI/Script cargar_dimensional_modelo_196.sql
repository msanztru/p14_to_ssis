PRINT 'cargar_dimensional_modelo_196.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes(
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
  CONSTRAINT PK_tbn1_dim_documentos_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_196_cuentas_corrientes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD hay_observaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD es_historico varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD contador_revisiones int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN razon_social varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN administracion_hacienda varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN telefono varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN cod_presentador_colectivo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN hay_observaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN es_historico varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN tipo_declaracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ALTER COLUMN contador_revisiones int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_196_cuentas_corrientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_196_cuentas_corrientes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_196_cuentas_corrientes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_196' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_196;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_196(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_196'
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
    doc_196.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(left(doc_196.nif_declarante,9)+' '+right(doc_196.nif_declarante,2),'') AS nif_declarante,
    doc_196.fec_alta_af AS fec_alta_af,
    coalesce(doc_196.razon_social,'') AS razon_social,
    CASE WHEN doc_196.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_196.id_contribuyente AS id_contribuyente,
    coalesce(doc_196.delegacion_hacienda,'') AS delegacion_hacienda,
    coalesce(doc_196.administracion_hacienda,'') AS administracion_hacienda,
    coalesce(doc_196.telefono,'') AS telefono,
    coalesce(doc_196.cod_presentador_colectivo,'') AS cod_presentador_colectivo,
    coalesce(doc_196.cod_entidad_gestora,'') AS cod_entidad_gestora,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_196.fec_presentacion AS fec_presentacion,
    coalesce(doc_196.num_caja,'') AS num_caja,
    CASE WHEN doc_196.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    doc_196.num_declarados_erroneos AS num_declarados_erroneos,
    CASE WHEN doc_196.hay_observaciones=1 THEN 'S' ELSE 'N' END AS hay_observaciones,
    CASE WHEN doc_196.es_historico=1 THEN 'S' ELSE 'N' END AS es_historico,
    doc_196.volumen_operaciones AS volumen_operaciones,
    doc_196.num_justificante AS num_justificante,
    coalesce(doc_196.tipo_declaracion,'') AS tipo_declaracion,
    doc_196.contador_revisiones AS contador_revisiones,
    doc_196.fec_baja AS fec_baja
  INTO #query__301DE
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes doc_196
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_196.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_196.id_tipo_presentacion)
  WHERE doc_196.fec_modificacion>@fecha_ultima_carga
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__2EC4E ON #query__301DE (id_documento,administracion_hacienda)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes AS tbn1_dim_documentos_informativos_196_cuentas_corrientes
  USING #query__301DE AS query ON query.id_documento=tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_196_cuentas_corrientes.administracion_hacienda
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_196_cuentas_corrientes AS tbn1_dim_documentos_informativos_196_cuentas_corrientes
  USING #query__301DE AS query ON query.id_documento=tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_196_cuentas_corrientes.administracion_hacienda
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.fec_alta_af<>query.fec_alta_af OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.telefono<>query.telefono OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_erroneo<>query.es_erroneo OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.hay_observaciones<>query.hay_observaciones OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_historico<>query.es_historico OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.volumen_operaciones<>query.volumen_operaciones OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_justificante<>query.num_justificante OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_196_cuentas_corrientes.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_196_cuentas_corrientes.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_196_cuentas_corrientes.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL))) THEN
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes(
  id_detalles_196 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_externo varchar(1) NOT NULL,
  es_representante varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_clave_alta varchar(1) NOT NULL,
  clave_alta varchar(50) NOT NULL,
  cod_clave_perceptor varchar(1) NOT NULL,
  clave_perceptor varchar(50) NOT NULL,
  num_participes int,
  cod_tipo_cuenta varchar(1) NOT NULL,
  tipo_cuenta varchar(50) NOT NULL,
  cod_tipo_codigo varchar(1) NOT NULL,
  tipo_codigo varchar(50) NOT NULL,
  banco varchar(4) NOT NULL,
  sucursal varchar(4) NOT NULL,
  num_cuenta varchar(12) NOT NULL,
  clave_regularizacion varchar(1) NOT NULL,
  porcentaje_participacion numeric(18,4),
  unidad_cuenta_empleada varchar(1) NOT NULL,
  es_identificado varchar(1) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  percepciones_dinerarias numeric(18,4),
  reduccion numeric(18,4),
  base_retencion numeric(18,4),
  retencion numeric(18,4),
  retribuciones_especie numeric(18,4),
  reduccion_2 numeric(18,4),
  base_ingreso_cuenta numeric(18,4),
  ingreso_cuenta numeric(18,4),
  periodificacion numeric(18,4),
  regularizacion numeric(18,4),
  saldo_medio numeric(18,4),
  saldo_final numeric(18,4),
  fec_apertura_cuenta date,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT PK_tbn1_fact_detalles_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_detalles_196),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_196_cuentas_corrientes_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_196_cuentas_corrientes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_detalles_196')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD id_detalles_196 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_clave_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD cod_clave_alta varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD clave_alta varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_clave_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD cod_clave_perceptor varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD clave_perceptor varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_participes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD num_participes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_tipo_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD cod_tipo_cuenta varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD tipo_cuenta varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD cod_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD tipo_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD banco varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD sucursal varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD num_cuenta varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_regularizacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD clave_regularizacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD porcentaje_participacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='unidad_cuenta_empleada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD unidad_cuenta_empleada varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='percepciones_dinerarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD percepciones_dinerarias numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD reduccion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD base_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retribuciones_especie')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD retribuciones_especie numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD reduccion_2 numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_ingreso_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD base_ingreso_cuenta numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='ingreso_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD ingreso_cuenta numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='periodificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD periodificacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='regularizacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD regularizacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_medio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD saldo_medio numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_final')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD saldo_final numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_apertura_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD fec_apertura_cuenta date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_detalles_196' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_detalles_196 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_clave_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN cod_clave_alta varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN clave_alta varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_clave_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN cod_clave_perceptor varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN clave_perceptor varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_participes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN num_participes int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_tipo_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN cod_tipo_cuenta varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN tipo_cuenta varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN cod_tipo_codigo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN tipo_codigo varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='banco' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN banco varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN sucursal varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN num_cuenta varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_regularizacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN clave_regularizacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN porcentaje_participacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='unidad_cuenta_empleada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN unidad_cuenta_empleada varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='percepciones_dinerarias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN percepciones_dinerarias numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN reduccion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN base_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retribuciones_especie' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN retribuciones_especie numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion_2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN reduccion_2 numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_ingreso_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN base_ingreso_cuenta numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='ingreso_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN ingreso_cuenta numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='periodificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN periodificacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='regularizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN regularizacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_medio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN saldo_medio numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_final' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN saldo_final numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_apertura_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_apertura_cuenta date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_196_cuentas_corrientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_detalles_196)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_196_cuentas_corrientes_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_196_cuentas_corrientes_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_196_cuentas_corrientes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_196_cuentas_corrientes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_196' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_196;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_196(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_196'
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
    det_196.id_detalles_196 AS id_detalles_196,
    det_196.id_documento AS id_documento,
    det_196.secuencia AS secuencia,
    coalesce(det_196.administracion,'') AS administracion,
    coalesce(left(det_196.nif_declarado,9)+' '+right(det_196.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_196.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_196.id_contribuyente AS id_contribuyente,
    CASE WHEN det_196.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN det_196.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    provincia.provincia AS provincia,
    clave_alta.cod_clave_alta AS cod_clave_alta,
    clave_alta.clave_alta AS clave_alta,
    clave_perceptor.cod_clave_perceptor AS cod_clave_perceptor,
    clave_perceptor.clave_perceptor AS clave_perceptor,
    det_196.num_participes AS num_participes,
    tipo_cuenta.cod_tipo_cuenta AS cod_tipo_cuenta,
    tipo_cuenta.tipo_cuenta AS tipo_cuenta,
    tipo_codigo.cod_tipo_codigo AS cod_tipo_codigo,
    tipo_codigo.tipo_codigo AS tipo_codigo,
    coalesce(det_196.banco,'') AS banco,
    coalesce(det_196.sucursal,'') AS sucursal,
    coalesce(det_196.num_cuenta,'') AS num_cuenta,
    coalesce(det_196.clave_regularizacion,'') AS clave_regularizacion,
    det_196.porcentaje_participacion AS porcentaje_participacion,
    coalesce(det_196.unidad_cuenta_empleada,'') AS unidad_cuenta_empleada,
    CASE WHEN det_196.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_196.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    det_196.percepciones_dinerarias AS percepciones_dinerarias,
    det_196.reduccion AS reduccion,
    det_196.base_retencion AS base_retencion,
    det_196.retencion AS retencion,
    det_196.retribuciones_especie AS retribuciones_especie,
    det_196.reduccion_2 AS reduccion_2,
    det_196.base_ingreso_cuenta AS base_ingreso_cuenta,
    det_196.ingreso_cuenta AS ingreso_cuenta,
    det_196.periodificacion AS periodificacion,
    det_196.regularizacion AS regularizacion,
    det_196.saldo_medio AS saldo_medio,
    det_196.saldo_final AS saldo_final,
    det_196.fec_apertura_cuenta AS fec_apertura_cuenta,
    det_196.fec_modificacion AS fec_modificacion,
    det_196.fec_baja AS fec_baja
  INTO #query__3B634
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes det_196
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_196 ON (doc_196.id_documento=det_196.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_196.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_196.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta clave_alta ON (clave_alta.id_clave_alta=det_196.id_clave_alta)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor clave_perceptor ON (clave_perceptor.id_clave_perceptor=det_196.id_clave_perceptor)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta tipo_cuenta ON (tipo_cuenta.id_tipo_cuenta=det_196.id_tipo_cuenta)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.id_tipo_codigo=det_196.id_tipo_codigo)
  WHERE det_196.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__F3F81 ON #query__3B634 (id_detalles_196)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes AS tbn1_fact_detalles_informativos_196_cuentas_corrientes
  USING #query__3B634 AS query ON query.id_detalles_196=tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_detalles_196
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_196_cuentas_corrientes AS tbn1_fact_detalles_informativos_196_cuentas_corrientes
  USING #query__3B634 AS query ON query.id_detalles_196=tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_detalles_196
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_clave_alta<>query.cod_clave_alta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_clave_alta IS NULL AND query.cod_clave_alta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_clave_alta IS NOT NULL AND query.cod_clave_alta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_alta<>query.clave_alta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_alta IS NULL AND query.clave_alta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_alta IS NOT NULL AND query.clave_alta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_clave_perceptor<>query.cod_clave_perceptor OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_clave_perceptor IS NULL AND query.cod_clave_perceptor IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_clave_perceptor IS NOT NULL AND query.cod_clave_perceptor IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_perceptor<>query.clave_perceptor OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_perceptor IS NULL AND query.clave_perceptor IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_perceptor IS NOT NULL AND query.clave_perceptor IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.num_participes<>query.num_participes OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.num_participes IS NULL AND query.num_participes IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.num_participes IS NOT NULL AND query.num_participes IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_tipo_cuenta<>query.cod_tipo_cuenta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_tipo_cuenta IS NULL AND query.cod_tipo_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_tipo_cuenta IS NOT NULL AND query.cod_tipo_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.tipo_cuenta<>query.tipo_cuenta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.tipo_cuenta IS NULL AND query.tipo_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.tipo_cuenta IS NOT NULL AND query.tipo_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_tipo_codigo<>query.cod_tipo_codigo OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.tipo_codigo<>query.tipo_codigo OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.tipo_codigo IS NULL AND query.tipo_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.tipo_codigo IS NOT NULL AND query.tipo_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.banco<>query.banco OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.sucursal<>query.sucursal OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.num_cuenta<>query.num_cuenta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_regularizacion<>query.clave_regularizacion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_regularizacion IS NULL AND query.clave_regularizacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.clave_regularizacion IS NOT NULL AND query.clave_regularizacion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada<>query.unidad_cuenta_empleada OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada IS NULL AND query.unidad_cuenta_empleada IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada IS NOT NULL AND query.unidad_cuenta_empleada IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_erroneo<>query.es_erroneo OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias<>query.percepciones_dinerarias OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias IS NULL AND query.percepciones_dinerarias IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias IS NOT NULL AND query.percepciones_dinerarias IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.reduccion<>query.reduccion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.reduccion IS NULL AND query.reduccion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.reduccion IS NOT NULL AND query.reduccion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.base_retencion<>query.base_retencion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.base_retencion IS NULL AND query.base_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.base_retencion IS NOT NULL AND query.base_retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.retencion<>query.retencion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.retribuciones_especie<>query.retribuciones_especie OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.retribuciones_especie IS NULL AND query.retribuciones_especie IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.retribuciones_especie IS NOT NULL AND query.retribuciones_especie IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.reduccion_2<>query.reduccion_2 OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.reduccion_2 IS NULL AND query.reduccion_2 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.reduccion_2 IS NOT NULL AND query.reduccion_2 IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta<>query.base_ingreso_cuenta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta IS NULL AND query.base_ingreso_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta IS NOT NULL AND query.base_ingreso_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta<>query.ingreso_cuenta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta IS NULL AND query.ingreso_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta IS NOT NULL AND query.ingreso_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.periodificacion<>query.periodificacion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.periodificacion IS NULL AND query.periodificacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.periodificacion IS NOT NULL AND query.periodificacion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.regularizacion<>query.regularizacion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.regularizacion IS NULL AND query.regularizacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.regularizacion IS NOT NULL AND query.regularizacion IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.saldo_medio<>query.saldo_medio OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.saldo_medio IS NULL AND query.saldo_medio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.saldo_medio IS NOT NULL AND query.saldo_medio IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.saldo_final<>query.saldo_final OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.saldo_final IS NULL AND query.saldo_final IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.saldo_final IS NOT NULL AND query.saldo_final IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta<>query.fec_apertura_cuenta OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta IS NULL AND query.fec_apertura_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta IS NOT NULL AND query.fec_apertura_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_196_cuentas_corrientes.fec_modificacion<>query.fec_modificacion OR (tbn1_fact_detalles_informativos_196_cuentas_corrientes.fec_modificacion IS NULL AND query.fec_modificacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_196_cuentas_corrientes.fec_modificacion IS NOT NULL AND query.fec_modificacion IS NULL))) THEN
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
      cod_clave_alta=query.cod_clave_alta,
      clave_alta=query.clave_alta,
      cod_clave_perceptor=query.cod_clave_perceptor,
      clave_perceptor=query.clave_perceptor,
      num_participes=query.num_participes,
      cod_tipo_cuenta=query.cod_tipo_cuenta,
      tipo_cuenta=query.tipo_cuenta,
      cod_tipo_codigo=query.cod_tipo_codigo,
      tipo_codigo=query.tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      clave_regularizacion=query.clave_regularizacion,
      porcentaje_participacion=query.porcentaje_participacion,
      unidad_cuenta_empleada=query.unidad_cuenta_empleada,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      percepciones_dinerarias=query.percepciones_dinerarias,
      reduccion=query.reduccion,
      base_retencion=query.base_retencion,
      retencion=query.retencion,
      retribuciones_especie=query.retribuciones_especie,
      reduccion_2=query.reduccion_2,
      base_ingreso_cuenta=query.base_ingreso_cuenta,
      ingreso_cuenta=query.ingreso_cuenta,
      periodificacion=query.periodificacion,
      regularizacion=query.regularizacion,
      saldo_medio=query.saldo_medio,
      saldo_final=query.saldo_final,
      fec_apertura_cuenta=query.fec_apertura_cuenta,
      fec_modificacion=query.fec_modificacion
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_196,id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,provincia,cod_clave_alta,clave_alta,cod_clave_perceptor,clave_perceptor,num_participes,cod_tipo_cuenta,tipo_cuenta,cod_tipo_codigo,tipo_codigo,banco,sucursal,num_cuenta,clave_regularizacion,porcentaje_participacion,unidad_cuenta_empleada,es_identificado,es_erroneo,percepciones_dinerarias,reduccion,base_retencion,retencion,retribuciones_especie,reduccion_2,base_ingreso_cuenta,ingreso_cuenta,periodificacion,regularizacion,saldo_medio,saldo_final,fec_apertura_cuenta,fec_modificacion) VALUES (
      query.id_detalles_196,
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.provincia,
      query.cod_clave_alta,
      query.clave_alta,
      query.cod_clave_perceptor,
      query.clave_perceptor,
      query.num_participes,
      query.cod_tipo_cuenta,
      query.tipo_cuenta,
      query.cod_tipo_codigo,
      query.tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.clave_regularizacion,
      query.porcentaje_participacion,
      query.unidad_cuenta_empleada,
      query.es_identificado,
      query.es_erroneo,
      query.percepciones_dinerarias,
      query.reduccion,
      query.base_retencion,
      query.retencion,
      query.retribuciones_especie,
      query.reduccion_2,
      query.base_ingreso_cuenta,
      query.ingreso_cuenta,
      query.periodificacion,
      query.regularizacion,
      query.saldo_medio,
      query.saldo_final,
      query.fec_apertura_cuenta,
      query.fec_modificacion);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_196' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_196;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_196(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_196'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_196 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_196 @log;

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

