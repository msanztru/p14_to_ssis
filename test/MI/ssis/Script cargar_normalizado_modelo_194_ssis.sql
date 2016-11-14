PRINT 'cargar_normalizado_modelo_194.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  nif_declarante varchar(11),
  fec_alta_af date,
  razon_social varchar(25),
  es_contribuyente bit,
  id_contribuyente int,
  delegacion_hacienda varchar(2),
  administracion_hacienda varchar(3),
  telefono varchar(10),
  cod_presentador_colectivo int,
  cod_entidad_gestora varchar(4),
  id_tipo_presentacion int NOT NULL,
  fec_presentacion date,
  num_caja varchar(8),
  es_erroneo bit,
  num_declarados_erroneos int,
  hay_observaciones bit,
  es_historico bit,
  volumen_operaciones numeric(18,2),
  num_justificante numeric(13),
  tipo_declaracion varchar(1),
  contador_revisiones int,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  --CONSTRAINT uk_doc_mod194 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD hay_observaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD es_historico bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='hay_observaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_HAY_OBSERVACIONES DEFAULT 0 FOR hay_observaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_historico' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_HISTORICO DEFAULT 0 FOR es_historico

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN razon_social varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN delegacion_hacienda varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN administracion_hacienda varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_entidad_gestora varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN hay_observaciones bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_historico bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT PK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_194_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_194_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_194_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_194_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  ;WITH
  query AS (
    SELECT
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      cabe.cacifdecl AS nif_declarante,
      cabe.capersona AS razon_social,
      cabe.cafecalta AS fec_alta_af,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      cabe.cadh AS delegacion_hacienda,
      'B' AS administracion_hacienda, --cabe.caadmonhaci
      cabe.catelefono AS telefono,
      cabe.caenlace AS cod_presentador_colectivo,
      cabe.cacodentg AS cod_entidad_gestora,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      cabe.cafecpres AS fec_presentacion,
      CASE WHEN cabe.caerror='1' THEN 1 ELSE 0 END AS es_erroneo,
      cabe.caconterror AS num_declarados_erroneos,
      cabe.canumcaja AS num_caja,
      CASE WHEN cabe.caobserva<>'0' THEN 1 ELSE 0 END AS hay_observaciones,
      CASE WHEN cabe.cahistorico='1' THEN 1 ELSE 0 END AS es_historico,
      cabe.cavolumen AS volumen_operaciones,
      cabe.cajustif AS num_justificante,
      cabe.catipodecl AS tipo_declaracion,
      cabe.cacrevi AS contador_revisiones
    FROM dbn1_stg_dhyf.dbo.tbn1cabe_af cabe
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.caejercicio AS varchar)+'D5'+CAST(cabe.careferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cacifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.catippres)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.camodelo='194'
	
	UNION ALL
	
	SELECT 		
	    doc.id_documento AS id_documento,
		e.id_expediente AS id_expediente,
		cabe.cxcifdecl AS nif_declarante,
		'' 	AS razon_social,
		cabe.cxfecalta AS fec_alta_af,
		CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
		coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
		'' AS delegacion_hacienda,
		cabe.cxadmon AS administracion_hacienda,
		'' 	AS telefono,
		 0 	AS cod_presentador_colectivo,
		'' 	AS cod_entidad_gestora,
		-1 	AS id_tipo_presentacion,
		'' 	AS fec_presentacion,
		CASE WHEN cabe.cxerror='1' THEN 1 ELSE 0 END AS es_erroneo,
		cabe.cxconterror AS num_declarados_erroneos,
		''  AS num_caja,
		'0' AS hay_observaciones,
		'0' AS es_historico,
		 0  AS volumen_operaciones,
		 0 	AS num_justificante,
		'' 	AS tipo_declaracion,
		 0 	AS contador_revisiones
    FROM dbn1_stg_dhyf.dbo.tbn1i3ca_af cabe
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.cxejercicio AS varchar)+'D5'+CAST(cabe.cxreferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cxcifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.cxmodelo='194'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos AS tbn1_documentos_informativos_194_bonos_y_capitales_ajenos
  USING query ON query.id_documento=tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_documento AND query.administracion_hacienda=tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.administracion_hacienda
  WHEN MATCHED AND ((tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.razon_social<>query.razon_social OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.fec_alta_af<>query.fec_alta_af OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.telefono<>query.telefono OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_erroneo<>query.es_erroneo OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_caja<>query.num_caja OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.hay_observaciones<>query.hay_observaciones OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_historico<>query.es_historico OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.volumen_operaciones<>query.volumen_operaciones OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_justificante<>query.num_justificante OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_declaracion<>query.tipo_declaracion OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_194_bonos_y_capitales_ajenos.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      nif_declarante=query.nif_declarante,
      razon_social=query.razon_social,
      fec_alta_af=query.fec_alta_af,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      delegacion_hacienda=query.delegacion_hacienda,
      telefono=query.telefono,
      cod_presentador_colectivo=query.cod_presentador_colectivo,
      cod_entidad_gestora=query.cod_entidad_gestora,
      id_tipo_presentacion=query.id_tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      es_erroneo=query.es_erroneo,
      num_declarados_erroneos=query.num_declarados_erroneos,
      num_caja=query.num_caja,
      hay_observaciones=query.hay_observaciones,
      es_historico=query.es_historico,
      volumen_operaciones=query.volumen_operaciones,
      num_justificante=query.num_justificante,
      tipo_declaracion=query.tipo_declaracion,
      contador_revisiones=query.contador_revisiones,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,nif_declarante,razon_social,fec_alta_af,es_contribuyente,id_contribuyente,delegacion_hacienda,administracion_hacienda,telefono,cod_presentador_colectivo,cod_entidad_gestora,id_tipo_presentacion,fec_presentacion,es_erroneo,num_declarados_erroneos,num_caja,hay_observaciones,es_historico,volumen_operaciones,num_justificante,tipo_declaracion,contador_revisiones,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.nif_declarante,
      query.razon_social,
      query.fec_alta_af,
      query.es_contribuyente,
      query.id_contribuyente,
      query.delegacion_hacienda,
      query.administracion_hacienda,
      query.telefono,
      query.cod_presentador_colectivo,
      query.cod_entidad_gestora,
      query.id_tipo_presentacion,
      query.fec_presentacion,
      query.es_erroneo,
      query.num_declarados_erroneos,
      query.num_caja,
      query.hay_observaciones,
      query.es_historico,
      query.volumen_operaciones,
      query.num_justificante,
      query.tipo_declaracion,
      query.contador_revisiones,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos(
  id_detalles_194 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  administracion varchar(1),
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_externo bit,
  es_representante bit,
  id_provincia int,
  porcentaje_participacion numeric(18,4),
  tipo_registro varchar(1),
  id_tipo_codigo int NOT NULL,
  banco varchar(4),
  sucursal varchar(4),
  num_cuenta varchar(12),
  es_identificado bit,
  es_erroneo bit,
  num_perceptor int,
  id_clave_codigo int NOT NULL,
  emisor varchar(12),
  percepcion_integra numeric(18,2),
  tipo_retencion numeric(18,4),
  retencion_a_ingresar numeric(18,2),
  indvalptes varchar(1),
  ejerciciocrdto int,
  id_origen_operacion int NOT NULL,
  vinculacion varchar(1),
  transmision numeric(18,2),
  reduccion numeric(18,2),
  gastos numeric(18,2),
  adquisicion numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod194 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_detalles_194),
  CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_codigo(id_tipo_codigo),
  CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_clave_codigo FOREIGN KEY (id_clave_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_codigo(id_clave_codigo),
  CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_origen_operacion FOREIGN KEY (id_origen_operacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_origen_operacion(id_origen_operacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_detalles_194')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_detalles_194 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD porcentaje_participacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_registro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD tipo_registro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD banco varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD sucursal varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD num_cuenta varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD num_perceptor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_clave_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_clave_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='emisor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD emisor varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='percepcion_integra')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD percepcion_integra numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_retencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD tipo_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='retencion_a_ingresar')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD retencion_a_ingresar numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='indvalptes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD indvalptes varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='ejerciciocrdto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD ejerciciocrdto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_origen_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_origen_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='vinculacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD vinculacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='transmision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD transmision numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='reduccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD reduccion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='gastos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD gastos numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='adquisicion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD adquisicion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_detalles_194' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_detalles_194 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN secuencia varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_representante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN porcentaje_participacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_registro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_registro varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='banco' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN banco varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN sucursal varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_cuenta varchar(12) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_perceptor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_perceptor int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_clave_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_clave_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='emisor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN emisor varchar(12) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='percepcion_integra' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN percepcion_integra numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='retencion_a_ingresar' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN retencion_a_ingresar numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='indvalptes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN indvalptes varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='ejerciciocrdto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN ejerciciocrdto int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_origen_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_origen_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='vinculacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN vinculacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='transmision' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN transmision numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='reduccion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN reduccion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='gastos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN gastos numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='adquisicion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN adquisicion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT PK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_detalles_194)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_codigo(id_tipo_codigo)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_clave_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_clave_codigo FOREIGN KEY (id_clave_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_codigo(id_clave_codigo)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_origen_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_MI_origen_operacion FOREIGN KEY (id_origen_operacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_origen_operacion(id_origen_operacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_194_INTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_194_INTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_194_INTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_194_INTERNOS_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  ;WITH
  query AS (
    SELECT
      doc.id_documento AS id_documento,
      CAST(declarado.pe40secuen AS varchar) AS secuencia,
      'B' AS administracion,
      0 AS es_externo,
      declarado.pe40cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN declarado.pe40represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      declarado.pe40porcen/10000 AS porcentaje_participacion,
      declarado.pe40formato AS tipo_registro,
      coalesce(tipo_codigo.id_tipo_codigo,indefinidos.id_tipo_codigo) AS id_tipo_codigo,
      declarado.pe40banco AS banco,
      declarado.pe40sucur AS sucursal,
      declarado.pe40nrocta AS num_cuenta,
      CASE WHEN declarado.pe40identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.pe40error=1 THEN 1 ELSE 0 END AS es_erroneo,
      operacion.op40numperceptor AS num_perceptor,
      coalesce(clave_codigo.id_clave_codigo,indefinidos.id_clave_codigo) AS id_clave_codigo,
      operacion.op40emisor AS emisor,
      operacion.op40perintegra/100 AS percepcion_integra,
      operacion.op40tiporeten/10000 AS tipo_retencion,
      operacion.op40reteningr/100 AS retencion_a_ingresar,
      operacion.op40indvalptes AS indvalptes,
      operacion.op40ejercrdto AS ejerciciocrdto,
      coalesce(origen_operacion.id_origen_operacion,indefinidos.id_origen_operacion) AS id_origen_operacion,
      operacion.op40formato AS vinculacion,
      operacion.op40transmision/100 AS transmision,
      operacion.op40reduccion/100 AS reduccion,
      operacion.op40gastos/100 AS gastos,
      operacion.op40adquisicion/100 AS adquisicion
    FROM dbn1_stg_dhyf.dbo.tbn140op_af operacion
    INNER JOIN dbn1_stg_dhyf.dbo.tbn140pe_af declarado ON (declarado.pe40ejercicio=operacion.op40ejercicio AND declarado.pe40referdoc=operacion.op40referdoc AND declarado.pe40relacion=operacion.op40relacion)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.pe40ejercicio AS varchar)+'D5'+CAST(declarado.pe40referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.pe40cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.pe40provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.cod_tipo_codigo=declarado.pe40tipocodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo clave_codigo ON (clave_codigo.cod_clave_codigo=operacion.op40clavecodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion origen_operacion ON (origen_operacion.cod_origen_operacion=operacion.op40origen)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos AS tbn1_detalles_informativos_194_bonos_y_capitales_ajenos
  USING query ON query.id_documento=tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_documento AND query.secuencia=tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo=0
                    AND (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.administracion<>query.administracion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo<>query.es_externo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante<>query.es_representante OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro<>query.tipo_registro OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.banco<>query.banco OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal<>query.sucursal OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta<>query.num_cuenta OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_perceptor<>query.num_perceptor OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_perceptor IS NULL AND query.num_perceptor IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_perceptor IS NOT NULL AND query.num_perceptor IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_clave_codigo<>query.id_clave_codigo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_clave_codigo IS NULL AND query.id_clave_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_clave_codigo IS NOT NULL AND query.id_clave_codigo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.emisor<>query.emisor OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.emisor IS NULL AND query.emisor IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.emisor IS NOT NULL AND query.emisor IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra<>query.percepcion_integra OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra IS NULL AND query.percepcion_integra IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra IS NOT NULL AND query.percepcion_integra IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar<>query.retencion_a_ingresar OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar IS NULL AND query.retencion_a_ingresar IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar IS NOT NULL AND query.retencion_a_ingresar IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.indvalptes<>query.indvalptes OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.indvalptes IS NULL AND query.indvalptes IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.indvalptes IS NOT NULL AND query.indvalptes IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.ejerciciocrdto<>query.ejerciciocrdto OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.ejerciciocrdto IS NULL AND query.ejerciciocrdto IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.ejerciciocrdto IS NOT NULL AND query.ejerciciocrdto IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_origen_operacion<>query.id_origen_operacion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_origen_operacion IS NULL AND query.id_origen_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_origen_operacion IS NOT NULL AND query.id_origen_operacion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion<>query.vinculacion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion IS NULL AND query.vinculacion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion IS NOT NULL AND query.vinculacion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.transmision<>query.transmision OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.transmision IS NULL AND query.transmision IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.transmision IS NOT NULL AND query.transmision IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion<>query.reduccion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion IS NULL AND query.reduccion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion IS NOT NULL AND query.reduccion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.gastos<>query.gastos OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.gastos IS NULL AND query.gastos IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.gastos IS NOT NULL AND query.gastos IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion<>query.adquisicion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion IS NULL AND query.adquisicion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion IS NOT NULL AND query.adquisicion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      es_externo=query.es_externo,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      porcentaje_participacion=query.porcentaje_participacion,
      tipo_registro=query.tipo_registro,
      id_tipo_codigo=query.id_tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      num_perceptor=query.num_perceptor,
      id_clave_codigo=query.id_clave_codigo,
      emisor=query.emisor,
      percepcion_integra=query.percepcion_integra,
      tipo_retencion=query.tipo_retencion,
      retencion_a_ingresar=query.retencion_a_ingresar,
      indvalptes=query.indvalptes,
      ejerciciocrdto=query.ejerciciocrdto,
      id_origen_operacion=query.id_origen_operacion,
      vinculacion=query.vinculacion,
      transmision=query.transmision,
      reduccion=query.reduccion,
      gastos=query.gastos,
      adquisicion=query.adquisicion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,es_externo,nif_declarado,es_contribuyente,id_contribuyente,es_representante,id_provincia,porcentaje_participacion,tipo_registro,id_tipo_codigo,banco,sucursal,num_cuenta,es_identificado,es_erroneo,num_perceptor,id_clave_codigo,emisor,percepcion_integra,tipo_retencion,retencion_a_ingresar,indvalptes,ejerciciocrdto,id_origen_operacion,vinculacion,transmision,reduccion,gastos,adquisicion,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.es_externo,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.id_provincia,
      query.porcentaje_participacion,
      query.tipo_registro,
      query.id_tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.es_identificado,
      query.es_erroneo,
      query.num_perceptor,
      query.id_clave_codigo,
      query.emisor,
      query.percepcion_integra,
      query.tipo_retencion,
      query.retencion_a_ingresar,
      query.indvalptes,
      query.ejerciciocrdto,
      query.id_origen_operacion,
      query.vinculacion,
      query.transmision,
      query.reduccion,
      query.gastos,
      query.adquisicion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo=0
                                  AND fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_194_EXTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_194_EXTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_194_EXTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_194_EXTERNOS_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  ;WITH
  query AS (
    SELECT
      doc.id_documento AS id_documento,
      declarado.px40nropte AS secuencia,
      declarado.px40cif AS nif_declarado,
      declarado.px40admon AS administracion,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      1 AS es_externo,
      CASE WHEN declarado.px40represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      declarado.px40formato AS tipo_registro,
      coalesce(tipo_codigo.id_tipo_codigo,indefinidos.id_tipo_codigo) AS id_tipo_codigo,
      declarado.px40banco AS banco,
      declarado.px40sucur AS sucursal,
      declarado.px40nrocta AS num_cuenta,
      CASE WHEN declarado.px40identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.px40error=1 THEN 1 ELSE 0 END AS es_erroneo,
      coalesce(clave_codigo.id_clave_codigo,indefinidos.id_clave_codigo) AS id_clave_codigo,
      operacion.ox40emisor AS emisor,
      operacion.ox40perintegra/100 AS percepcion_integra,
      operacion.ox40tiporeten/10000 AS tipo_retencion,
      operacion.ox40reteningr/100 AS retencion_a_ingresar,
      operacion.ox40indvalptes AS indvalptes,
      operacion.ox40ejercrdto AS ejerciciocrdto,
      coalesce(origen_operacion.id_origen_operacion,indefinidos.id_origen_operacion) AS id_origen_operacion,
      operacion.ox40formato AS vinculacion,
      operacion.ox40transmision/100 AS transmision,
      operacion.ox40reduccion/100 AS reduccion,
      operacion.ox40adquisicion/100 AS adquisicion
    FROM dbn1_stg_dhyf.dbo.tbn14xop_af operacion
    INNER JOIN dbn1_stg_dhyf.dbo.tbn14xpe_af declarado ON (declarado.px40ejercicio=operacion.ox40ejercicio AND declarado.px40referdoc=operacion.ox40referdoc AND declarado.px40nropte=operacion.ox40nropte)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.px40ejercicio AS varchar)+'D5'+CAST(declarado.px40referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.px40cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.px40provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.cod_tipo_codigo=declarado.px40tipocodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo clave_codigo ON (clave_codigo.cod_clave_codigo=operacion.ox40clavecodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion origen_operacion ON (origen_operacion.cod_origen_operacion=operacion.ox40origen)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos AS tbn1_detalles_informativos_194_bonos_y_capitales_ajenos
  USING query ON query.id_documento=tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_documento AND query.secuencia=tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo=1
                    AND (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.administracion<>query.administracion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo<>query.es_externo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante<>query.es_representante OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro<>query.tipo_registro OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.banco<>query.banco OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal<>query.sucursal OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta<>query.num_cuenta OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_clave_codigo<>query.id_clave_codigo OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_clave_codigo IS NULL AND query.id_clave_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_clave_codigo IS NOT NULL AND query.id_clave_codigo IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.emisor<>query.emisor OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.emisor IS NULL AND query.emisor IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.emisor IS NOT NULL AND query.emisor IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra<>query.percepcion_integra OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra IS NULL AND query.percepcion_integra IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra IS NOT NULL AND query.percepcion_integra IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar<>query.retencion_a_ingresar OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar IS NULL AND query.retencion_a_ingresar IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar IS NOT NULL AND query.retencion_a_ingresar IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.indvalptes<>query.indvalptes OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.indvalptes IS NULL AND query.indvalptes IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.indvalptes IS NOT NULL AND query.indvalptes IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.ejerciciocrdto<>query.ejerciciocrdto OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.ejerciciocrdto IS NULL AND query.ejerciciocrdto IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.ejerciciocrdto IS NOT NULL AND query.ejerciciocrdto IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_origen_operacion<>query.id_origen_operacion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_origen_operacion IS NULL AND query.id_origen_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.id_origen_operacion IS NOT NULL AND query.id_origen_operacion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion<>query.vinculacion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion IS NULL AND query.vinculacion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion IS NOT NULL AND query.vinculacion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.transmision<>query.transmision OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.transmision IS NULL AND query.transmision IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.transmision IS NOT NULL AND query.transmision IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion<>query.reduccion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion IS NULL AND query.reduccion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion IS NOT NULL AND query.reduccion IS NULL)
                    OR tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion<>query.adquisicion OR (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion IS NULL AND query.adquisicion IS NOT NULL) OR  (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion IS NOT NULL AND query.adquisicion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      nif_declarado=query.nif_declarado,
      administracion=query.administracion,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      tipo_registro=query.tipo_registro,
      id_tipo_codigo=query.id_tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      id_clave_codigo=query.id_clave_codigo,
      emisor=query.emisor,
      percepcion_integra=query.percepcion_integra,
      tipo_retencion=query.tipo_retencion,
      retencion_a_ingresar=query.retencion_a_ingresar,
      indvalptes=query.indvalptes,
      ejerciciocrdto=query.ejerciciocrdto,
      id_origen_operacion=query.id_origen_operacion,
      vinculacion=query.vinculacion,
      transmision=query.transmision,
      reduccion=query.reduccion,
      adquisicion=query.adquisicion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,nif_declarado,administracion,es_contribuyente,id_contribuyente,es_externo,es_representante,id_provincia,tipo_registro,id_tipo_codigo,banco,sucursal,num_cuenta,es_identificado,es_erroneo,id_clave_codigo,emisor,percepcion_integra,tipo_retencion,retencion_a_ingresar,indvalptes,ejerciciocrdto,id_origen_operacion,vinculacion,transmision,reduccion,adquisicion,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.nif_declarado,
      query.administracion,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.id_provincia,
      query.tipo_registro,
      query.id_tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.es_identificado,
      query.es_erroneo,
      query.id_clave_codigo,
      query.emisor,
      query.percepcion_integra,
      query.tipo_retencion,
      query.retencion_a_ingresar,
      query.indvalptes,
      query.ejerciciocrdto,
      query.id_origen_operacion,
      query.vinculacion,
      query.transmision,
      query.reduccion,
      query.adquisicion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo=1
                                  AND fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_194_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_194_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_194_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_modelo_194_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_194_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_194_INTERNOS_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_194_EXTERNOS_ssis @log;

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

