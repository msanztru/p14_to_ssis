PRINT 'cargar_normalizado_modelo_182.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  administracion varchar(1),
  nif_declarante varchar(11),
  telefono varchar(10),
  razon_social varchar(40),
  es_contribuyente bit,
  id_contribuyente int,
  cod_presentador_colectivo int,
  cod_banco_espania varchar(4),
  id_tipo_presentacion int NOT NULL,
  fec_presentacion date,
  num_caja varchar(8),
  fec_alta_mf date,
  num_justificante numeric(13),
  tipo_declaracion varchar(1),
  contador_revisiones int,
  regimen_fiscal_deducciones varchar(1),
  num_declarados int,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_doc_mod182 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD cod_banco_espania varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_alta_mf')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD fec_alta_mf date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD regimen_fiscal_deducciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_declarados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD num_declarados int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_182_DONACIONES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN razon_social varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN cod_banco_espania varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_alta_mf' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN fec_alta_mf date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN regimen_fiscal_deducciones varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='num_declarados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN num_declarados int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_182_donaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD CONSTRAINT PK_tbn1_documentos_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_182_donaciones_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_182_donaciones_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_182_donaciones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_182_donaciones_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_documentos_informativos_182_donaciones_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_182' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_182;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_182(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_182'
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
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      cabe.cabe_admon AS administracion,
      cabe.cabe_cifdecl AS nif_declarante,
      cabe.cabe_telefono AS telefono,
      cabe.cabe_persona AS razon_social,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      cabe.cabe_refpres AS cod_presentador_colectivo,
      cabe.cabe_banco AS cod_banco_espania,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      cabe.cabe_fecpres AS fec_presentacion,
      cabe.cabe_numcaja AS num_caja,
      cabe.cabe_fecalta AS fec_alta_mf,
      cabe.cabe_justif AS num_justificante,
      cabe.cabe_tipodecl AS tipo_declaracion,
      cabe.cabe_crevi AS contador_revisiones,
      cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
      cabe.cabe_nroreg AS num_declarados
    FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf cabe
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.cabe_ejercicio AS varchar)+'ZK'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cabe_cifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.cabe_modelo='182'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_182_donaciones AS tbn1_documentos_informativos_182_donaciones
  USING query ON query.id_documento=tbn1_documentos_informativos_182_donaciones.id_documento
  WHEN MATCHED AND ((tbn1_documentos_informativos_182_donaciones.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_182_donaciones.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.administracion<>query.administracion OR (tbn1_documentos_informativos_182_donaciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_182_donaciones.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.telefono<>query.telefono OR (tbn1_documentos_informativos_182_donaciones.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.razon_social<>query.razon_social OR (tbn1_documentos_informativos_182_donaciones.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_182_donaciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_182_donaciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_documentos_informativos_182_donaciones.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.cod_banco_espania<>query.cod_banco_espania OR (tbn1_documentos_informativos_182_donaciones.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_182_donaciones.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_182_donaciones.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.num_caja<>query.num_caja OR (tbn1_documentos_informativos_182_donaciones.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.fec_alta_mf<>query.fec_alta_mf OR (tbn1_documentos_informativos_182_donaciones.fec_alta_mf IS NULL AND query.fec_alta_mf IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.fec_alta_mf IS NOT NULL AND query.fec_alta_mf IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.num_justificante<>query.num_justificante OR (tbn1_documentos_informativos_182_donaciones.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.tipo_declaracion<>query.tipo_declaracion OR (tbn1_documentos_informativos_182_donaciones.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_182_donaciones.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_documentos_informativos_182_donaciones.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
                    OR tbn1_documentos_informativos_182_donaciones.num_declarados<>query.num_declarados OR (tbn1_documentos_informativos_182_donaciones.num_declarados IS NULL AND query.num_declarados IS NOT NULL) OR  (tbn1_documentos_informativos_182_donaciones.num_declarados IS NOT NULL AND query.num_declarados IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      administracion=query.administracion,
      nif_declarante=query.nif_declarante,
      telefono=query.telefono,
      razon_social=query.razon_social,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      cod_presentador_colectivo=query.cod_presentador_colectivo,
      cod_banco_espania=query.cod_banco_espania,
      id_tipo_presentacion=query.id_tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      num_caja=query.num_caja,
      fec_alta_mf=query.fec_alta_mf,
      num_justificante=query.num_justificante,
      tipo_declaracion=query.tipo_declaracion,
      contador_revisiones=query.contador_revisiones,
      regimen_fiscal_deducciones=query.regimen_fiscal_deducciones,
      num_declarados=query.num_declarados,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,administracion,nif_declarante,telefono,razon_social,es_contribuyente,id_contribuyente,cod_presentador_colectivo,cod_banco_espania,id_tipo_presentacion,fec_presentacion,num_caja,fec_alta_mf,num_justificante,tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,num_declarados,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.administracion,
      query.nif_declarante,
      query.telefono,
      query.razon_social,
      query.es_contribuyente,
      query.id_contribuyente,
      query.cod_presentador_colectivo,
      query.cod_banco_espania,
      query.id_tipo_presentacion,
      query.fec_presentacion,
      query.num_caja,
      query.fec_alta_mf,
      query.num_justificante,
      query.tipo_declaracion,
      query.contador_revisiones,
      query.regimen_fiscal_deducciones,
      query.num_declarados,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones(
  id_detalles_182 int IDENTITY(1,1),
  id_documento int NOT NULL,
  administracion varchar(1),
  secuencia varchar(9),
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_representante bit,
  id_provincia int,
  id_clave_donacion int NOT NULL,
  deduccion numeric(6,4),
  es_especie bit,
  deduccion_comunidad_autonoma numeric(2),
  porcentaje_comunidad_autonoma numeric(6,4),
  es_identificado bit,
  es_erroneo bit,
  id_naturaleza int NOT NULL,
  es_revocacion bit,
  ejercicio_revocacion smallint,
  id_tipo_importe int NOT NULL,
  importe numeric(15,2),
  nif_titular_bien varchar(9),
  nombre_titular_bien varchar(40),
  id_tipo_bien int NOT NULL,
  identificacion_bien varchar(20),
  documentacion_bien bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod182 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_detalles_182),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_clave_donacion FOREIGN KEY (id_clave_donacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_donacion(id_clave_donacion),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_naturaleza FOREIGN KEY (id_naturaleza) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_naturaleza(id_naturaleza),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_importe(id_tipo_importe),
  CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_tipo_bien FOREIGN KEY (id_tipo_bien) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_bien(id_tipo_bien)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_detalles_182')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_detalles_182 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD secuencia varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_clave_donacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_clave_donacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD deduccion numeric(6,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_especie')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD es_especie bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion_comunidad_autonoma')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD deduccion_comunidad_autonoma numeric(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='porcentaje_comunidad_autonoma')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD porcentaje_comunidad_autonoma numeric(6,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_naturaleza int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_revocacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD es_revocacion bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='ejercicio_revocacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD ejercicio_revocacion smallint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_tipo_importe int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD importe numeric(15,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_titular_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD nif_titular_bien varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='nombre_titular_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD nombre_titular_bien varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD id_tipo_bien int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='identificacion_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD identificacion_bien varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='documentacion_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD documentacion_bien bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_especie' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_ES_ESPECIE DEFAULT 0 FOR es_especie

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_revocacion' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_ES_REVOCACION DEFAULT 0 FOR es_revocacion

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='documentacion_bien' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_182_DONACIONES_DOCUMENTACION_BIEN DEFAULT 0 FOR documentacion_bien

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_detalles_182' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_detalles_182 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN secuencia varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN es_representante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_clave_donacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_clave_donacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN deduccion numeric(6,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_especie' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN es_especie bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='deduccion_comunidad_autonoma' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN deduccion_comunidad_autonoma numeric(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='porcentaje_comunidad_autonoma' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN porcentaje_comunidad_autonoma numeric(6,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_naturaleza int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='es_revocacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN es_revocacion bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='ejercicio_revocacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN ejercicio_revocacion smallint NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_tipo_importe int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN importe numeric(15,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='nif_titular_bien' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN nif_titular_bien varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='nombre_titular_bien' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN nombre_titular_bien varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='id_tipo_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN id_tipo_bien int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='identificacion_bien' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN identificacion_bien varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='documentacion_bien' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN documentacion_bien bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_182_donaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT PK_tbn1_detalles_informativos_182_donaciones PRIMARY KEY CLUSTERED (id_detalles_182)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_clave_donacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_clave_donacion FOREIGN KEY (id_clave_donacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_donacion(id_clave_donacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_naturaleza FOREIGN KEY (id_naturaleza) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_naturaleza(id_naturaleza)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_importe(id_tipo_importe)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_182_donaciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones ADD CONSTRAINT FK_tbn1_detalles_informativos_182_donaciones_tbn1_MI_tipo_bien FOREIGN KEY (id_tipo_bien) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_bien(id_tipo_bien)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_182' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_182;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_182(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_182'
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
      doc.id_documento AS id_documento,
      declarado.pe82_admon AS administracion,
      CAST(declarado.pe82_secuen AS varchar) AS secuencia,
      declarado.pe82_cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN declarado.pe82_represen='R' THEN 1 ELSE 0 END AS es_representante,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      coalesce(clave_donacion.id_clave_donacion,indefinidos.id_clave_donacion) AS id_clave_donacion,
      declarado.pe82_deduccion/10000 AS deduccion,
      CASE WHEN declarado.pe82_especie='X' THEN 1 ELSE 0 END AS es_especie,
      declarado.pe82_dca AS deduccion_comunidad_autonoma,
      declarado.pe82_porcendca/10000 AS porcentaje_comunidad_autonoma,
      CASE WHEN declarado.pe82_identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.pe82_error=1 THEN 1 ELSE 0 END AS es_erroneo,
      coalesce(naturaleza.id_naturaleza,indefinidos.id_naturaleza) AS id_naturaleza,
      CASE WHEN declarado.pe82_revocacion='X' THEN 1 ELSE 0 END AS es_revocacion,
      declarado.pe82_ejer_revoca AS ejercicio_revocacion,
      coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) AS id_tipo_importe,
      importes.im82_importe/100 AS importe,
      patrimonio.mfpp82_tit_nif AS nif_titular_bien,
      patrimonio.mfpp82_tit_nom AS nombre_titular_bien,
      coalesce(tipo_bien.id_tipo_bien,indefinidos.id_tipo_bien) AS id_tipo_bien,
      patrimonio.mfpp82_iden_bien AS identificacion_bien,
      CASE WHEN patrimonio.mfpp82_docu='SI' THEN 1 ELSE 0 END AS documentacion_bien
    FROM dbn1_stg_dhyf.dbo.tbn1pe82_mf declarado
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1im82_mf importes ON (declarado.pe82_ejercicio=importes.im82_ejercicio AND declarado.pe82_admon=importes.im82_admon AND declarado.pe82_referdoc=importes.im82_referdoc AND declarado.pe82_secuen=importes.im82_secuen)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1pp82_mf patrimonio ON (declarado.pe82_ejercicio=patrimonio.mfpp82_ejercicio AND declarado.pe82_admon=patrimonio.mfpp82_admon AND declarado.pe82_referdoc=patrimonio.mfpp82_referdoc AND declarado.pe82_secuen=patrimonio.mfpp82_secuen)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.pe82_ejercicio AS varchar)+'ZK'+CAST(declarado.pe82_referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.pe82_cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.pe82_provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion clave_donacion ON (clave_donacion.cod_clave_donacion=declarado.pe82_clave)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza naturaleza ON (naturaleza.cod_naturaleza=declarado.pe82_naturaleza)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.im82_tipo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien tipo_bien ON (tipo_bien.cod_tipo_bien=patrimonio.mfpp82_tipo_bien)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      declarado.pe82_admon,
      CAST(declarado.pe82_secuen AS varchar),
      declarado.pe82_cif,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN declarado.pe82_represen='R' THEN 1 ELSE 0 END,
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      coalesce(clave_donacion.id_clave_donacion,indefinidos.id_clave_donacion),
      declarado.pe82_deduccion/10000,
      CASE WHEN declarado.pe82_especie='X' THEN 1 ELSE 0 END,
      declarado.pe82_dca,
      declarado.pe82_porcendca/10000,
      CASE WHEN declarado.pe82_identif=1 THEN 1 ELSE 0 END,
      CASE WHEN declarado.pe82_error=1 THEN 1 ELSE 0 END,
      coalesce(naturaleza.id_naturaleza,indefinidos.id_naturaleza),
      CASE WHEN declarado.pe82_revocacion='X' THEN 1 ELSE 0 END,
      declarado.pe82_ejer_revoca,
      coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe),
      importes.im82_importe/100,
      patrimonio.mfpp82_tit_nif,
      patrimonio.mfpp82_tit_nom,
      coalesce(tipo_bien.id_tipo_bien,indefinidos.id_tipo_bien),
      patrimonio.mfpp82_iden_bien,
      CASE WHEN patrimonio.mfpp82_docu='SI' THEN 1 ELSE 0 END
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_182_donaciones AS tbn1_detalles_informativos_182_donaciones
  USING query ON query.id_documento=tbn1_detalles_informativos_182_donaciones.id_documento AND query.secuencia=tbn1_detalles_informativos_182_donaciones.secuencia
  WHEN MATCHED AND ((tbn1_detalles_informativos_182_donaciones.administracion<>query.administracion OR (tbn1_detalles_informativos_182_donaciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_182_donaciones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_182_donaciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_182_donaciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.es_representante<>query.es_representante OR (tbn1_detalles_informativos_182_donaciones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_182_donaciones.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.id_clave_donacion<>query.id_clave_donacion OR (tbn1_detalles_informativos_182_donaciones.id_clave_donacion IS NULL AND query.id_clave_donacion IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.id_clave_donacion IS NOT NULL AND query.id_clave_donacion IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.deduccion<>query.deduccion OR (tbn1_detalles_informativos_182_donaciones.deduccion IS NULL AND query.deduccion IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.deduccion IS NOT NULL AND query.deduccion IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.es_especie<>query.es_especie OR (tbn1_detalles_informativos_182_donaciones.es_especie IS NULL AND query.es_especie IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.es_especie IS NOT NULL AND query.es_especie IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.deduccion_comunidad_autonoma<>query.deduccion_comunidad_autonoma OR (tbn1_detalles_informativos_182_donaciones.deduccion_comunidad_autonoma IS NULL AND query.deduccion_comunidad_autonoma IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.deduccion_comunidad_autonoma IS NOT NULL AND query.deduccion_comunidad_autonoma IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.porcentaje_comunidad_autonoma<>query.porcentaje_comunidad_autonoma OR (tbn1_detalles_informativos_182_donaciones.porcentaje_comunidad_autonoma IS NULL AND query.porcentaje_comunidad_autonoma IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.porcentaje_comunidad_autonoma IS NOT NULL AND query.porcentaje_comunidad_autonoma IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_182_donaciones.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_182_donaciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.id_naturaleza<>query.id_naturaleza OR (tbn1_detalles_informativos_182_donaciones.id_naturaleza IS NULL AND query.id_naturaleza IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.id_naturaleza IS NOT NULL AND query.id_naturaleza IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.es_revocacion<>query.es_revocacion OR (tbn1_detalles_informativos_182_donaciones.es_revocacion IS NULL AND query.es_revocacion IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.es_revocacion IS NOT NULL AND query.es_revocacion IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.ejercicio_revocacion<>query.ejercicio_revocacion OR (tbn1_detalles_informativos_182_donaciones.ejercicio_revocacion IS NULL AND query.ejercicio_revocacion IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.ejercicio_revocacion IS NOT NULL AND query.ejercicio_revocacion IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.id_tipo_importe<>query.id_tipo_importe OR (tbn1_detalles_informativos_182_donaciones.id_tipo_importe IS NULL AND query.id_tipo_importe IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.id_tipo_importe IS NOT NULL AND query.id_tipo_importe IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.importe<>query.importe OR (tbn1_detalles_informativos_182_donaciones.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.nif_titular_bien<>query.nif_titular_bien OR (tbn1_detalles_informativos_182_donaciones.nif_titular_bien IS NULL AND query.nif_titular_bien IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.nif_titular_bien IS NOT NULL AND query.nif_titular_bien IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.nombre_titular_bien<>query.nombre_titular_bien OR (tbn1_detalles_informativos_182_donaciones.nombre_titular_bien IS NULL AND query.nombre_titular_bien IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.nombre_titular_bien IS NOT NULL AND query.nombre_titular_bien IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.id_tipo_bien<>query.id_tipo_bien OR (tbn1_detalles_informativos_182_donaciones.id_tipo_bien IS NULL AND query.id_tipo_bien IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.id_tipo_bien IS NOT NULL AND query.id_tipo_bien IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.identificacion_bien<>query.identificacion_bien OR (tbn1_detalles_informativos_182_donaciones.identificacion_bien IS NULL AND query.identificacion_bien IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.identificacion_bien IS NOT NULL AND query.identificacion_bien IS NULL)
                    OR tbn1_detalles_informativos_182_donaciones.documentacion_bien<>query.documentacion_bien OR (tbn1_detalles_informativos_182_donaciones.documentacion_bien IS NULL AND query.documentacion_bien IS NOT NULL) OR  (tbn1_detalles_informativos_182_donaciones.documentacion_bien IS NOT NULL AND query.documentacion_bien IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      id_clave_donacion=query.id_clave_donacion,
      deduccion=query.deduccion,
      es_especie=query.es_especie,
      deduccion_comunidad_autonoma=query.deduccion_comunidad_autonoma,
      porcentaje_comunidad_autonoma=query.porcentaje_comunidad_autonoma,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      id_naturaleza=query.id_naturaleza,
      es_revocacion=query.es_revocacion,
      ejercicio_revocacion=query.ejercicio_revocacion,
      id_tipo_importe=query.id_tipo_importe,
      importe=query.importe,
      nif_titular_bien=query.nif_titular_bien,
      nombre_titular_bien=query.nombre_titular_bien,
      id_tipo_bien=query.id_tipo_bien,
      identificacion_bien=query.identificacion_bien,
      documentacion_bien=query.documentacion_bien,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,administracion,secuencia,nif_declarado,es_contribuyente,id_contribuyente,es_representante,id_provincia,id_clave_donacion,deduccion,es_especie,deduccion_comunidad_autonoma,porcentaje_comunidad_autonoma,es_identificado,es_erroneo,id_naturaleza,es_revocacion,ejercicio_revocacion,id_tipo_importe,importe,nif_titular_bien,nombre_titular_bien,id_tipo_bien,identificacion_bien,documentacion_bien,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.administracion,
      query.secuencia,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.id_provincia,
      query.id_clave_donacion,
      query.deduccion,
      query.es_especie,
      query.deduccion_comunidad_autonoma,
      query.porcentaje_comunidad_autonoma,
      query.es_identificado,
      query.es_erroneo,
      query.id_naturaleza,
      query.es_revocacion,
      query.ejercicio_revocacion,
      query.id_tipo_importe,
      query.importe,
      query.nif_titular_bien,
      query.nombre_titular_bien,
      query.id_tipo_bien,
      query.identificacion_bien,
      query.documentacion_bien,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_182' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_182;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_182(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_modelo_182'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_182 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_182 @log;

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

