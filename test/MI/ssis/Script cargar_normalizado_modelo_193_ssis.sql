PRINT 'cargar_normalizado_modelo_193.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario(
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
  --CONSTRAINT uk_doc_mod193 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD hay_observaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD es_historico bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='hay_observaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_193_CAPITAL_MOBILIARIO_HAY_OBSERVACIONES DEFAULT 0 FOR hay_observaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_historico' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_HISTORICO DEFAULT 0 FOR es_historico

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN razon_social varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN delegacion_hacienda varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN administracion_hacienda varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN cod_entidad_gestora varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN hay_observaciones bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN es_historico bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_193_capital_mobiliario')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT PK_tbn1_documentos_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_documentos_informativos_193_capital_mobiliario_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_193_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_193_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_193_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_193_ssis',
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.caejercicio AS varchar)+'D4'+CAST(cabe.careferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cacifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.catippres)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.camodelo='193'
		
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.cxejercicio AS varchar)+'D4'+CAST(cabe.cxreferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cxcifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.cxmodelo='193'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario AS tbn1_documentos_informativos_193_capital_mobiliario
  USING query ON query.id_documento=tbn1_documentos_informativos_193_capital_mobiliario.id_documento AND query.administracion_hacienda=tbn1_documentos_informativos_193_capital_mobiliario.administracion_hacienda
  WHEN MATCHED AND ((tbn1_documentos_informativos_193_capital_mobiliario.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_193_capital_mobiliario.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_193_capital_mobiliario.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.razon_social<>query.razon_social OR (tbn1_documentos_informativos_193_capital_mobiliario.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.fec_alta_af<>query.fec_alta_af OR (tbn1_documentos_informativos_193_capital_mobiliario.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_193_capital_mobiliario.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_193_capital_mobiliario.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_documentos_informativos_193_capital_mobiliario.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.telefono<>query.telefono OR (tbn1_documentos_informativos_193_capital_mobiliario.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_documentos_informativos_193_capital_mobiliario.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_documentos_informativos_193_capital_mobiliario.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_193_capital_mobiliario.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_193_capital_mobiliario.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.es_erroneo<>query.es_erroneo OR (tbn1_documentos_informativos_193_capital_mobiliario.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_documentos_informativos_193_capital_mobiliario.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.num_caja<>query.num_caja OR (tbn1_documentos_informativos_193_capital_mobiliario.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.hay_observaciones<>query.hay_observaciones OR (tbn1_documentos_informativos_193_capital_mobiliario.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.es_historico<>query.es_historico OR (tbn1_documentos_informativos_193_capital_mobiliario.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.volumen_operaciones<>query.volumen_operaciones OR (tbn1_documentos_informativos_193_capital_mobiliario.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.num_justificante<>query.num_justificante OR (tbn1_documentos_informativos_193_capital_mobiliario.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.tipo_declaracion<>query.tipo_declaracion OR (tbn1_documentos_informativos_193_capital_mobiliario.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_documentos_informativos_193_capital_mobiliario.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_193_capital_mobiliario.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_193_capital_mobiliario.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario(
  id_detalles_193 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  administracion varchar(1),
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_externo bit,
  es_mediador bit,
  es_representante bit,
  id_provincia int,
  id_tipo_registro int NOT NULL,
  id_tipo_percepcion int NOT NULL,
  porcentaje_participacion numeric(18,4),
  multiplicador varchar(3),
  es_identificado bit,
  es_erroneo bit,
  id_mae_clave_operacion_193 int,-- NOT NULL,   (**) clave_percepcion
  clave_percepcion varchar(1),
  id_naturaleza int NOT NULL,
  num_perceptores int,
  id_pago int NOT NULL,
  id_clave_codigo int NOT NULL,
  emisor varchar(12),
  base_retenciones numeric(18,2),
  tipo_retencion numeric(18,4),
  retenciones_ingresos_cuenta numeric(18,2),
  valores_pendientes_abono varchar(1),
  ejercicio_devengo int,
  periodificacion varchar(1),
  id_operacion_tipo_registro int NOT NULL,
  importe_percepcion numeric(18,2),
  cantidad_no_integrada numeric(18,2),
  ingresos_ejercicios_anteriores numeric(18,2),
  gastos numeric(18,2),
  id_tipo_codigo int NOT NULL,
  banco varchar(4),
  sucursal varchar(4),
  num_cuenta varchar(12),
  fec_inicio_prestamo date,
  fec_vencimiento_prestamo date,
  compensaciones numeric(18,2),
  garantias numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod193 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_detalles_193),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_registro FOREIGN KEY (id_tipo_registro) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_registro(id_tipo_registro),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_modalidad FOREIGN KEY (id_tipo_percepcion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_modalidad(id_modalidad),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_naturaleza_193 FOREIGN KEY (id_naturaleza) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_naturaleza_193(id_naturaleza),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_pago FOREIGN KEY (id_pago) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_pago(id_pago),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_clave_codigo FOREIGN KEY (id_clave_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_codigo(id_clave_codigo),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_registro1 FOREIGN KEY (id_operacion_tipo_registro) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_registro(id_tipo_registro),
  CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_codigo(id_tipo_codigo),
  
)

GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_detalles_193')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_detalles_193 int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_documento int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='secuencia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD secuencia varchar(11)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD administracion varchar(1)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD nif_declarado varchar(11)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD es_contribuyente bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_contribuyente int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_externo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD es_externo bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_mediador')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD es_mediador bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_representante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD es_representante bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_provincia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_provincia int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_registro')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_tipo_registro int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_percepcion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_tipo_percepcion int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='porcentaje_participacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD porcentaje_participacion numeric(18,4)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='multiplicador')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD multiplicador varchar(3)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_identificado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD es_identificado bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD es_erroneo bit

--GO

------(**)
--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_mae_clave_operacion_193')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_mae_clave_operacion_193 int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_percepcion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD clave_percepcion varchar(1)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_naturaleza')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_naturaleza int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_perceptores')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD num_perceptores int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_pago')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_pago int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_clave_codigo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_clave_codigo int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='emisor')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD emisor varchar(12)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='base_retenciones')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD base_retenciones numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_retencion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD tipo_retencion numeric(18,4)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='retenciones_ingresos_cuenta')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD retenciones_ingresos_cuenta numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='valores_pendientes_abono')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD valores_pendientes_abono varchar(1)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ejercicio_devengo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD ejercicio_devengo int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='periodificacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD periodificacion varchar(1)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_operacion_tipo_registro')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_operacion_tipo_registro int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='importe_percepcion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD importe_percepcion numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cantidad_no_integrada')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD cantidad_no_integrada numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ingresos_ejercicios_anteriores')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD ingresos_ejercicios_anteriores numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='gastos')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD gastos numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_codigo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD id_tipo_codigo int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='banco')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD banco varchar(4)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='sucursal')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD sucursal varchar(4)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_cuenta')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD num_cuenta varchar(12)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_inicio_prestamo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD fec_inicio_prestamo date

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_vencimiento_prestamo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD fec_vencimiento_prestamo date

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='compensaciones')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD compensaciones numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='garantias')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD garantias numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD fec_alta datetime

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_modificacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD fec_modificacion datetime

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_baja')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD fec_baja datetime

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_EXTERNO DEFAULT 0 FOR es_externo

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_mediador' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_MEDIADOR DEFAULT 0 FOR es_mediador

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_193_CAPITAL_MOBILIARIO_ES_ERRONEO DEFAULT 0 FOR es_erroneo

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_detalles_193' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_detalles_193 int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_documento int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN secuencia varchar(11) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN administracion varchar(1) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN nif_declarado varchar(11) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_contribuyente bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_contribuyente int NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_externo bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_mediador' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_mediador bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_representante bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_provincia int NULL  

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_registro' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_tipo_registro int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_percepcion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_tipo_percepcion int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN porcentaje_participacion numeric(18,4) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='multiplicador' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN multiplicador varchar(3) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_identificado bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_erroneo bit NULL

--GO

------(**)
--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_mae_clave_operacion_193' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_mae_clave_operacion_193 int NULL  

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_percepcion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN clave_percepcion varchar(1) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_naturaleza' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_naturaleza int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_perceptores' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN num_perceptores int NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_pago' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_pago int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_clave_codigo' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_clave_codigo int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='emisor' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN emisor varchar(12) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='base_retenciones' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN base_retenciones numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN tipo_retencion numeric(18,4) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='retenciones_ingresos_cuenta' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN retenciones_ingresos_cuenta numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='valores_pendientes_abono' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN valores_pendientes_abono varchar(1) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN ejercicio_devengo int NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='periodificacion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN periodificacion varchar(1) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_operacion_tipo_registro' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_operacion_tipo_registro int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='importe_percepcion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN importe_percepcion numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cantidad_no_integrada' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN cantidad_no_integrada numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ingresos_ejercicios_anteriores' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN ingresos_ejercicios_anteriores numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='gastos' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN gastos numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_tipo_codigo int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='banco' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN banco varchar(4) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN sucursal varchar(4) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN num_cuenta varchar(12) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_inicio_prestamo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_inicio_prestamo date NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_vencimiento_prestamo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_vencimiento_prestamo date NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='compensaciones' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN compensaciones numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='garantias' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN garantias numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_alta datetime NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_modificacion datetime NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_baja datetime NULL

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_193_capital_mobiliario')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT PK_tbn1_detalles_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_detalles_193)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_documentos')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_contribuyentes')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_provincias')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_registro')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_registro FOREIGN KEY (id_tipo_registro) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_registro(id_tipo_registro)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_modalidad')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_modalidad FOREIGN KEY (id_tipo_percepcion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_modalidad(id_modalidad)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_naturaleza_193')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_naturaleza_193 FOREIGN KEY (id_naturaleza) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_naturaleza_193(id_naturaleza)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_pago')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_pago FOREIGN KEY (id_pago) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_pago(id_pago)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_clave_codigo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_clave_codigo FOREIGN KEY (id_clave_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_codigo(id_clave_codigo)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_registro1')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_registro1 FOREIGN KEY (id_operacion_tipo_registro) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_registro(id_tipo_registro)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_codigo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_detalles_informativos_193_capital_mobiliario_tbn1_MI_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_codigo(id_tipo_codigo)

--GO



USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_193_INTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_193_INTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_193_INTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_193_INTERNOS_ssis',
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

		update statistics dbn1_stg_dhyf.dbo.tbn1cabe_af with sample 100 percent
		update statistics dbn1_stg_dhyf.dbo.tbn1i3ca_af with sample 100 percent
		update statistics dbn1_stg_dhyf.dbo.tbn130pe_af with sample 10 percent
		update statistics dbn1_stg_dhyf.dbo.tbn130op_af with sample 10 percent
		update statistics dbn1_stg_dhyf.dbo.tbn13xop_af with sample 10 percent
		update statistics dbn1_stg_dhyf.dbo.tbn13xpe_af with sample 10 percent

		update statistics dbn1_norm_dhyf.dbo.tbn1_documentos with sample 10 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_expedientes with sample 10 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_contribuyentes with sample 10 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_indefinidos with sample 100 percent

		update statistics dbn1_norm_dhyf.dbo.tbn1_provincias with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_modalidad with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_pago with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo with sample 100 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro with sample 100 percent
		update statistics dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 with sample 100 percent

		update statistics dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario with sample 10 percent
		update statistics dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario with sample 10 percent
  ;WITH
  query AS (
    SELECT
      doc.id_documento AS id_documento,
      CAST(declarado.pe30secuen AS varchar) AS secuencia,
      'B' AS administracion,
      declarado.pe30cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      0 AS es_externo,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN declarado.pe30codtitu='M' THEN 1 ELSE 0 END AS es_mediador,
      CASE WHEN declarado.pe30represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      coalesce(tipo_registro.id_tipo_registro,indefinidos.id_tipo_registro) AS id_tipo_registro,
      coalesce(tipo_percepcion.id_modalidad,indefinidos.id_modalidad) AS id_tipo_percepcion,
      declarado.pe30porcen/10000 AS porcentaje_participacion,
      declarado.pe30multiplicador AS multiplicador,
      CASE WHEN declarado.pe30identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.pe30error=1 THEN 1 ELSE 0 END AS es_erroneo,
	  coalesce(clave_operacion.id_mae_clave_operacion_193,-1) AS id_mae_clave_operacion_193,
      operacion.op30claveoper AS clave_percepcion,
      coalesce(naturaleza.id_naturaleza,1) AS id_naturaleza,
      operacion.op30numperceptor AS num_perceptores,
      coalesce(pago.id_pago,indefinidos.id_pago) AS id_pago,
      coalesce(clave_codigo.id_clave_codigo,indefinidos.id_clave_codigo) AS id_clave_codigo,
      operacion.op30emisor AS emisor,
      operacion.op30perintegra/100 AS base_retenciones,
      operacion.op30tiporeten/10000 AS tipo_retencion,
      operacion.op30reteningr/100 AS retenciones_ingresos_cuenta,
      operacion.op30indvalptes AS valores_pendientes_abono,
      operacion.op30ejercrdto AS ejercicio_devengo,
      operacion.op30period AS periodificacion,
      coalesce(operacion_tipo_registro.id_tipo_registro,indefinidos.id_tipo_registro) AS id_operacion_tipo_registro,
      operacion.op30percepcion/100 AS importe_percepcion,
      operacion.op30reduccion/100 AS cantidad_no_integrada,
      operacion.op30ingantperiod/100 AS ingresos_ejercicios_anteriores,
      operacion.op30gastos/100 AS gastos,
      coalesce(tipo_codigo.id_tipo_codigo,indefinidos.id_tipo_codigo) AS id_tipo_codigo,
      operacion.op30banco AS banco,
      operacion.op30sucursal AS sucursal,
      operacion.op30numcuenta AS num_cuenta,
      operacion.op30fechainicio AS fec_inicio_prestamo,
      operacion.op30fechavcto AS fec_vencimiento_prestamo,
      operacion.op30compensacion/100 AS compensaciones,
      operacion.op30garantias/100 AS garantias
    FROM dbn1_stg_dhyf.dbo.tbn130pe_af declarado
    INNER JOIN dbn1_stg_dhyf.dbo.tbn130op_af operacion ON (declarado.pe30ejercicio=operacion.op30ejercicio AND declarado.pe30referdoc=operacion.op30referdoc AND declarado.pe30relacion=operacion.op30relacion)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.pe30ejercicio AS varchar)+'D4'+CAST(declarado.pe30referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.pe30cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.pe30provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro tipo_registro ON (tipo_registro.cod_tipo_registro=declarado.pe30formato)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 naturaleza ON (naturaleza.cod_clave=operacion.op30claveoper AND naturaleza.cod_naturaleza=operacion.op30clavenatur)
	--LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 naturaleza ON (naturaleza.cod_clave=operacion.op30claveoper AND  RIGHT('0000'+naturaleza.cod_naturaleza,2)= RIGHT('0000'+operacion.op30clavenatur,2))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad tipo_percepcion ON (tipo_percepcion.cod_modalidad=declarado.pe30tipopercepcion)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_pago pago ON (pago.cod_pago=operacion.op30codpago)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo clave_codigo ON (clave_codigo.cod_clave_codigo=operacion.op30clavecodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.cod_tipo_codigo=operacion.op30tipocodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro operacion_tipo_registro ON (operacion_tipo_registro.cod_tipo_registro=operacion.op30formato)
	INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 clave_operacion ON clave_operacion.cod_clave_operacion_193 = operacion.op30claveoper
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario AS tbn1_detalles_informativos_193_capital_mobiliario
  USING query ON query.id_documento=tbn1_detalles_informativos_193_capital_mobiliario.id_documento AND query.secuencia=tbn1_detalles_informativos_193_capital_mobiliario.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_193_capital_mobiliario.es_externo=0
                    AND (tbn1_detalles_informativos_193_capital_mobiliario.administracion<>query.administracion OR (tbn1_detalles_informativos_193_capital_mobiliario.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_193_capital_mobiliario.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_193_capital_mobiliario.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_externo<>query.es_externo OR (tbn1_detalles_informativos_193_capital_mobiliario.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_193_capital_mobiliario.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_mediador<>query.es_mediador OR (tbn1_detalles_informativos_193_capital_mobiliario.es_mediador IS NULL AND query.es_mediador IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_mediador IS NOT NULL AND query.es_mediador IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_representante<>query.es_representante OR (tbn1_detalles_informativos_193_capital_mobiliario.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_193_capital_mobiliario.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_registro<>query.id_tipo_registro OR (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_registro IS NULL AND query.id_tipo_registro IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_registro IS NOT NULL AND query.id_tipo_registro IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_percepcion<>query.id_tipo_percepcion OR (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_percepcion IS NULL AND query.id_tipo_percepcion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_percepcion IS NOT NULL AND query.id_tipo_percepcion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_detalles_informativos_193_capital_mobiliario.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.multiplicador<>query.multiplicador OR (tbn1_detalles_informativos_193_capital_mobiliario.multiplicador IS NULL AND query.multiplicador IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.multiplicador IS NOT NULL AND query.multiplicador IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_193_capital_mobiliario.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_193_capital_mobiliario.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    ----(**)
					OR tbn1_detalles_informativos_193_capital_mobiliario.id_mae_clave_operacion_193<>query.id_mae_clave_operacion_193 OR (tbn1_detalles_informativos_193_capital_mobiliario.id_mae_clave_operacion_193 IS NULL AND query.id_mae_clave_operacion_193 IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_mae_clave_operacion_193 IS NOT NULL AND query.id_mae_clave_operacion_193 IS NULL)
					OR tbn1_detalles_informativos_193_capital_mobiliario.clave_percepcion<>query.clave_percepcion OR (tbn1_detalles_informativos_193_capital_mobiliario.clave_percepcion IS NULL AND query.clave_percepcion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.clave_percepcion IS NOT NULL AND query.clave_percepcion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_naturaleza<>query.id_naturaleza OR (tbn1_detalles_informativos_193_capital_mobiliario.id_naturaleza IS NULL AND query.id_naturaleza IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_naturaleza IS NOT NULL AND query.id_naturaleza IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.num_perceptores<>query.num_perceptores OR (tbn1_detalles_informativos_193_capital_mobiliario.num_perceptores IS NULL AND query.num_perceptores IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.num_perceptores IS NOT NULL AND query.num_perceptores IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_pago<>query.id_pago OR (tbn1_detalles_informativos_193_capital_mobiliario.id_pago IS NULL AND query.id_pago IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_pago IS NOT NULL AND query.id_pago IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_clave_codigo<>query.id_clave_codigo OR (tbn1_detalles_informativos_193_capital_mobiliario.id_clave_codigo IS NULL AND query.id_clave_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_clave_codigo IS NOT NULL AND query.id_clave_codigo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.emisor<>query.emisor OR (tbn1_detalles_informativos_193_capital_mobiliario.emisor IS NULL AND query.emisor IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.emisor IS NOT NULL AND query.emisor IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.base_retenciones<>query.base_retenciones OR (tbn1_detalles_informativos_193_capital_mobiliario.base_retenciones IS NULL AND query.base_retenciones IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.base_retenciones IS NOT NULL AND query.base_retenciones IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_193_capital_mobiliario.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta<>query.retenciones_ingresos_cuenta OR (tbn1_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta IS NULL AND query.retenciones_ingresos_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta IS NOT NULL AND query.retenciones_ingresos_cuenta IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono<>query.valores_pendientes_abono OR (tbn1_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono IS NULL AND query.valores_pendientes_abono IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono IS NOT NULL AND query.valores_pendientes_abono IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_193_capital_mobiliario.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.periodificacion<>query.periodificacion OR (tbn1_detalles_informativos_193_capital_mobiliario.periodificacion IS NULL AND query.periodificacion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.periodificacion IS NOT NULL AND query.periodificacion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_operacion_tipo_registro<>query.id_operacion_tipo_registro OR (tbn1_detalles_informativos_193_capital_mobiliario.id_operacion_tipo_registro IS NULL AND query.id_operacion_tipo_registro IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_operacion_tipo_registro IS NOT NULL AND query.id_operacion_tipo_registro IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.importe_percepcion<>query.importe_percepcion OR (tbn1_detalles_informativos_193_capital_mobiliario.importe_percepcion IS NULL AND query.importe_percepcion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.importe_percepcion IS NOT NULL AND query.importe_percepcion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada<>query.cantidad_no_integrada OR (tbn1_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada IS NULL AND query.cantidad_no_integrada IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada IS NOT NULL AND query.cantidad_no_integrada IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores<>query.ingresos_ejercicios_anteriores OR (tbn1_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores IS NULL AND query.ingresos_ejercicios_anteriores IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores IS NOT NULL AND query.ingresos_ejercicios_anteriores IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.gastos<>query.gastos OR (tbn1_detalles_informativos_193_capital_mobiliario.gastos IS NULL AND query.gastos IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.gastos IS NOT NULL AND query.gastos IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.banco<>query.banco OR (tbn1_detalles_informativos_193_capital_mobiliario.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.sucursal<>query.sucursal OR (tbn1_detalles_informativos_193_capital_mobiliario.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.num_cuenta<>query.num_cuenta OR (tbn1_detalles_informativos_193_capital_mobiliario.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo<>query.fec_inicio_prestamo OR (tbn1_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo IS NULL AND query.fec_inicio_prestamo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo IS NOT NULL AND query.fec_inicio_prestamo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo<>query.fec_vencimiento_prestamo OR (tbn1_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo IS NULL AND query.fec_vencimiento_prestamo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo IS NOT NULL AND query.fec_vencimiento_prestamo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.compensaciones<>query.compensaciones OR (tbn1_detalles_informativos_193_capital_mobiliario.compensaciones IS NULL AND query.compensaciones IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.compensaciones IS NOT NULL AND query.compensaciones IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.garantias<>query.garantias OR (tbn1_detalles_informativos_193_capital_mobiliario.garantias IS NULL AND query.garantias IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.garantias IS NOT NULL AND query.garantias IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      es_externo=query.es_externo,
      id_contribuyente=query.id_contribuyente,
      es_mediador=query.es_mediador,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      id_tipo_registro=query.id_tipo_registro,
      id_tipo_percepcion=query.id_tipo_percepcion,
      porcentaje_participacion=query.porcentaje_participacion,
      multiplicador=query.multiplicador,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
	  id_mae_clave_operacion_193=query.id_mae_clave_operacion_193,
      clave_percepcion=query.clave_percepcion,
      id_naturaleza=query.id_naturaleza,
      num_perceptores=query.num_perceptores,
      id_pago=query.id_pago,
      id_clave_codigo=query.id_clave_codigo,
      emisor=query.emisor,
      base_retenciones=query.base_retenciones,
      tipo_retencion=query.tipo_retencion,
      retenciones_ingresos_cuenta=query.retenciones_ingresos_cuenta,
      valores_pendientes_abono=query.valores_pendientes_abono,
      ejercicio_devengo=query.ejercicio_devengo,
      periodificacion=query.periodificacion,
      id_operacion_tipo_registro=query.id_operacion_tipo_registro,
      importe_percepcion=query.importe_percepcion,
      cantidad_no_integrada=query.cantidad_no_integrada,
      ingresos_ejercicios_anteriores=query.ingresos_ejercicios_anteriores,
      gastos=query.gastos,
      id_tipo_codigo=query.id_tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      fec_inicio_prestamo=query.fec_inicio_prestamo,
      fec_vencimiento_prestamo=query.fec_vencimiento_prestamo,
      compensaciones=query.compensaciones,
      garantias=query.garantias,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,nif_declarado,es_contribuyente,es_externo,id_contribuyente,es_mediador,es_representante,id_provincia,id_tipo_registro,id_tipo_percepcion,porcentaje_participacion,multiplicador,es_identificado,es_erroneo,id_mae_clave_operacion_193,clave_percepcion,id_naturaleza,num_perceptores,id_pago,id_clave_codigo,emisor,base_retenciones,tipo_retencion,retenciones_ingresos_cuenta,valores_pendientes_abono,ejercicio_devengo,periodificacion,id_operacion_tipo_registro,importe_percepcion,cantidad_no_integrada,ingresos_ejercicios_anteriores,gastos,id_tipo_codigo,banco,sucursal,num_cuenta,fec_inicio_prestamo,fec_vencimiento_prestamo,compensaciones,garantias,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.es_externo,
      query.id_contribuyente,
      query.es_mediador,
      query.es_representante,
      query.id_provincia,
      query.id_tipo_registro,
      query.id_tipo_percepcion,
      query.porcentaje_participacion,
      query.multiplicador,
      query.es_identificado,
      query.es_erroneo,
	  query.id_mae_clave_operacion_193,
      query.clave_percepcion,
      query.id_naturaleza,
      query.num_perceptores,
      query.id_pago,
      query.id_clave_codigo,
      query.emisor,
      query.base_retenciones,
      query.tipo_retencion,
      query.retenciones_ingresos_cuenta,
      query.valores_pendientes_abono,
      query.ejercicio_devengo,
      query.periodificacion,
      query.id_operacion_tipo_registro,
      query.importe_percepcion,
      query.cantidad_no_integrada,
      query.ingresos_ejercicios_anteriores,
      query.gastos,
      query.id_tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.fec_inicio_prestamo,
      query.fec_vencimiento_prestamo,
      query.compensaciones,
      query.garantias,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_193_capital_mobiliario.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_193_EXTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_193_EXTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_193_EXTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_193_EXTERNOS_ssis',
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
      CAST(declarado.px30nropte AS varchar) AS secuencia,
      declarado.px30admon AS administracion,
      declarado.px30cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      1 AS es_externo,
      CASE WHEN declarado.px30codtitu='M' THEN 1 ELSE 0 END AS es_mediador,
      CASE WHEN declarado.px30represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      coalesce(tipo_registro.id_tipo_registro,indefinidos.id_tipo_registro) AS id_tipo_registro,
      coalesce(tipo_percepcion.id_modalidad,indefinidos.id_modalidad) AS id_tipo_percepcion,
      declarado.px30multiplicador AS multiplicador,
      CASE WHEN declarado.px30identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.px30error=1 THEN 1 ELSE 0 END AS es_erroneo,
	  coalesce(clave_operacion.id_mae_clave_operacion_193,-1) AS id_mae_clave_operacion_193,
      operacion.ox30claveoper AS clave_percepcion,
      coalesce(naturaleza.id_naturaleza,indefinidos.id_naturaleza) AS id_naturaleza,
      coalesce(pago.id_pago,indefinidos.id_pago) AS id_pago,
      coalesce(clave_codigo.id_clave_codigo,indefinidos.id_clave_codigo) AS id_clave_codigo,
      operacion.ox30emisor AS emisor,
      operacion.ox30perintegra/100 AS base_retenciones,
      operacion.ox30tiporeten/10000 AS tipo_retencion,
      operacion.ox30reteningr/100 AS retenciones_ingresos_cuenta,
      operacion.ox30indvalptes AS valores_pendientes_abono,
      operacion.ox30ejercrdto AS ejercicio_devengo,
      coalesce(operacion_tipo_registro.id_tipo_registro,indefinidos.id_tipo_registro) AS id_operacion_tipo_registro,
      operacion.ox30percepcion/100 AS importe_percepcion,
      operacion.ox30reduccion/100 AS cantidad_no_integrada,
      operacion.ox30ingantperiod/100 AS ingresos_ejercicios_anteriores,
      operacion.ox30gastos/100 AS gastos,
      coalesce(tipo_codigo.id_tipo_codigo,indefinidos.id_tipo_codigo) AS id_tipo_codigo,
      operacion.ox30banco AS banco,
      operacion.ox30sucursal AS sucursal,
      operacion.ox30nrocuenta AS num_cuenta,
      operacion.ox30fechainicio AS fec_inicio_prestamo,
      operacion.ox30fechavcto AS fec_vencimiento_prestamo,
      operacion.ox30compensacion/100 AS compensaciones,
      operacion.ox30garantias/100 AS garantias
    FROM dbn1_stg_dhyf.dbo.tbn13xop_af operacion
    INNER JOIN dbn1_stg_dhyf.dbo.tbn13xpe_af declarado ON (declarado.px30ejercicio=operacion.ox30ejercicio AND declarado.px30referdoc=operacion.ox30referdoc AND declarado.px30nropte=operacion.ox30nropte)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.px30ejercicio AS varchar)+'D4'+CAST(declarado.px30referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.px30cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.px30provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro tipo_registro ON (tipo_registro.cod_tipo_registro=declarado.px30formato)
	--LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 naturaleza ON (naturaleza.cod_clave=operacion.ox30claveoper AND  RIGHT('0000'+naturaleza.cod_naturaleza,2)= RIGHT('0000'+operacion.ox30clavenatur,2))
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 naturaleza ON (naturaleza.cod_clave=operacion.ox30claveoper AND naturaleza.cod_naturaleza=operacion.ox30clavenatur)
    --LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza naturaleza ON (naturaleza.cod_naturaleza=operacion.ox30clavenatur)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad tipo_percepcion ON (tipo_percepcion.cod_modalidad=declarado.px30tipopercepcion)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_pago pago ON (pago.cod_pago=operacion.ox30codpago)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo clave_codigo ON (clave_codigo.cod_clave_codigo=operacion.ox30clavecodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.cod_tipo_codigo=operacion.ox30tipocodigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro operacion_tipo_registro ON (operacion_tipo_registro.cod_tipo_registro=operacion.ox30formato)
	INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 clave_operacion ON clave_operacion.cod_clave_operacion_193 = operacion.ox30claveoper
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario AS tbn1_detalles_informativos_193_capital_mobiliario
  USING query ON query.id_documento=tbn1_detalles_informativos_193_capital_mobiliario.id_documento AND query.secuencia=tbn1_detalles_informativos_193_capital_mobiliario.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_193_capital_mobiliario.es_externo=1
                    AND (tbn1_detalles_informativos_193_capital_mobiliario.administracion<>query.administracion OR (tbn1_detalles_informativos_193_capital_mobiliario.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_193_capital_mobiliario.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_193_capital_mobiliario.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_193_capital_mobiliario.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_externo<>query.es_externo OR (tbn1_detalles_informativos_193_capital_mobiliario.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_mediador<>query.es_mediador OR (tbn1_detalles_informativos_193_capital_mobiliario.es_mediador IS NULL AND query.es_mediador IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_mediador IS NOT NULL AND query.es_mediador IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_representante<>query.es_representante OR (tbn1_detalles_informativos_193_capital_mobiliario.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_193_capital_mobiliario.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_registro<>query.id_tipo_registro OR (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_registro IS NULL AND query.id_tipo_registro IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_registro IS NOT NULL AND query.id_tipo_registro IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_percepcion<>query.id_tipo_percepcion OR (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_percepcion IS NULL AND query.id_tipo_percepcion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_percepcion IS NOT NULL AND query.id_tipo_percepcion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.multiplicador<>query.multiplicador OR (tbn1_detalles_informativos_193_capital_mobiliario.multiplicador IS NULL AND query.multiplicador IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.multiplicador IS NOT NULL AND query.multiplicador IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_193_capital_mobiliario.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_193_capital_mobiliario.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
					 ----(**)
					OR tbn1_detalles_informativos_193_capital_mobiliario.id_mae_clave_operacion_193<>query.id_mae_clave_operacion_193 OR (tbn1_detalles_informativos_193_capital_mobiliario.id_mae_clave_operacion_193 IS NULL AND query.id_mae_clave_operacion_193 IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_mae_clave_operacion_193 IS NOT NULL AND query.id_mae_clave_operacion_193 IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.clave_percepcion<>query.clave_percepcion OR (tbn1_detalles_informativos_193_capital_mobiliario.clave_percepcion IS NULL AND query.clave_percepcion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.clave_percepcion IS NOT NULL AND query.clave_percepcion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_naturaleza<>query.id_naturaleza OR (tbn1_detalles_informativos_193_capital_mobiliario.id_naturaleza IS NULL AND query.id_naturaleza IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_naturaleza IS NOT NULL AND query.id_naturaleza IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_pago<>query.id_pago OR (tbn1_detalles_informativos_193_capital_mobiliario.id_pago IS NULL AND query.id_pago IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_pago IS NOT NULL AND query.id_pago IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_clave_codigo<>query.id_clave_codigo OR (tbn1_detalles_informativos_193_capital_mobiliario.id_clave_codigo IS NULL AND query.id_clave_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_clave_codigo IS NOT NULL AND query.id_clave_codigo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.emisor<>query.emisor OR (tbn1_detalles_informativos_193_capital_mobiliario.emisor IS NULL AND query.emisor IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.emisor IS NOT NULL AND query.emisor IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.base_retenciones<>query.base_retenciones OR (tbn1_detalles_informativos_193_capital_mobiliario.base_retenciones IS NULL AND query.base_retenciones IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.base_retenciones IS NOT NULL AND query.base_retenciones IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_193_capital_mobiliario.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta<>query.retenciones_ingresos_cuenta OR (tbn1_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta IS NULL AND query.retenciones_ingresos_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta IS NOT NULL AND query.retenciones_ingresos_cuenta IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono<>query.valores_pendientes_abono OR (tbn1_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono IS NULL AND query.valores_pendientes_abono IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono IS NOT NULL AND query.valores_pendientes_abono IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_193_capital_mobiliario.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_operacion_tipo_registro<>query.id_operacion_tipo_registro OR (tbn1_detalles_informativos_193_capital_mobiliario.id_operacion_tipo_registro IS NULL AND query.id_operacion_tipo_registro IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_operacion_tipo_registro IS NOT NULL AND query.id_operacion_tipo_registro IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.importe_percepcion<>query.importe_percepcion OR (tbn1_detalles_informativos_193_capital_mobiliario.importe_percepcion IS NULL AND query.importe_percepcion IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.importe_percepcion IS NOT NULL AND query.importe_percepcion IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada<>query.cantidad_no_integrada OR (tbn1_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada IS NULL AND query.cantidad_no_integrada IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada IS NOT NULL AND query.cantidad_no_integrada IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores<>query.ingresos_ejercicios_anteriores OR (tbn1_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores IS NULL AND query.ingresos_ejercicios_anteriores IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores IS NOT NULL AND query.ingresos_ejercicios_anteriores IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.gastos<>query.gastos OR (tbn1_detalles_informativos_193_capital_mobiliario.gastos IS NULL AND query.gastos IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.gastos IS NOT NULL AND query.gastos IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.banco<>query.banco OR (tbn1_detalles_informativos_193_capital_mobiliario.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.sucursal<>query.sucursal OR (tbn1_detalles_informativos_193_capital_mobiliario.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.num_cuenta<>query.num_cuenta OR (tbn1_detalles_informativos_193_capital_mobiliario.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo<>query.fec_inicio_prestamo OR (tbn1_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo IS NULL AND query.fec_inicio_prestamo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo IS NOT NULL AND query.fec_inicio_prestamo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo<>query.fec_vencimiento_prestamo OR (tbn1_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo IS NULL AND query.fec_vencimiento_prestamo IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo IS NOT NULL AND query.fec_vencimiento_prestamo IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.compensaciones<>query.compensaciones OR (tbn1_detalles_informativos_193_capital_mobiliario.compensaciones IS NULL AND query.compensaciones IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.compensaciones IS NOT NULL AND query.compensaciones IS NULL)
                    OR tbn1_detalles_informativos_193_capital_mobiliario.garantias<>query.garantias OR (tbn1_detalles_informativos_193_capital_mobiliario.garantias IS NULL AND query.garantias IS NOT NULL) OR  (tbn1_detalles_informativos_193_capital_mobiliario.garantias IS NOT NULL AND query.garantias IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_mediador=query.es_mediador,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      id_tipo_registro=query.id_tipo_registro,
      id_tipo_percepcion=query.id_tipo_percepcion,
      multiplicador=query.multiplicador,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
	  id_mae_clave_operacion_193=query.id_mae_clave_operacion_193,
      clave_percepcion=query.clave_percepcion,
      id_naturaleza=query.id_naturaleza,
      id_pago=query.id_pago,
      id_clave_codigo=query.id_clave_codigo,
      emisor=query.emisor,
      base_retenciones=query.base_retenciones,
      tipo_retencion=query.tipo_retencion,
      retenciones_ingresos_cuenta=query.retenciones_ingresos_cuenta,
      valores_pendientes_abono=query.valores_pendientes_abono,
      ejercicio_devengo=query.ejercicio_devengo,
      id_operacion_tipo_registro=query.id_operacion_tipo_registro,
      importe_percepcion=query.importe_percepcion,
      cantidad_no_integrada=query.cantidad_no_integrada,
      ingresos_ejercicios_anteriores=query.ingresos_ejercicios_anteriores,
      gastos=query.gastos,
      id_tipo_codigo=query.id_tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      fec_inicio_prestamo=query.fec_inicio_prestamo,
      fec_vencimiento_prestamo=query.fec_vencimiento_prestamo,
      compensaciones=query.compensaciones,
      garantias=query.garantias,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_mediador,es_representante,id_provincia,id_tipo_registro,id_tipo_percepcion,multiplicador,es_identificado,es_erroneo,id_mae_clave_operacion_193,clave_percepcion,id_naturaleza,id_pago,id_clave_codigo,emisor,base_retenciones,tipo_retencion,retenciones_ingresos_cuenta,valores_pendientes_abono,ejercicio_devengo,id_operacion_tipo_registro,importe_percepcion,cantidad_no_integrada,ingresos_ejercicios_anteriores,gastos,id_tipo_codigo,banco,sucursal,num_cuenta,fec_inicio_prestamo,fec_vencimiento_prestamo,compensaciones,garantias,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_mediador,
      query.es_representante,
      query.id_provincia,
      query.id_tipo_registro,
      query.id_tipo_percepcion,
      query.multiplicador,
      query.es_identificado,
      query.es_erroneo,
	  query.id_mae_clave_operacion_193,
      query.clave_percepcion,
      query.id_naturaleza,
      query.id_pago,
      query.id_clave_codigo,
      query.emisor,
      query.base_retenciones,
      query.tipo_retencion,
      query.retenciones_ingresos_cuenta,
      query.valores_pendientes_abono,
      query.ejercicio_devengo,
      query.id_operacion_tipo_registro,
      query.importe_percepcion,
      query.cantidad_no_integrada,
      query.ingresos_ejercicios_anteriores,
      query.gastos,
      query.id_tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.fec_inicio_prestamo,
      query.fec_vencimiento_prestamo,
      query.compensaciones,
      query.garantias,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_193_capital_mobiliario.es_externo=1
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_193_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_193_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_193_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_modelo_193_ssis',
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

  IF EXISTS (SELECT *
  FROM dbo.tbn130pe_af
  WHERE pe30fechacarga>@fecha_ultima_carga
  ) BEGIN
  
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_193_ssis @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_193_INTERNOS_ssis @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_193_EXTERNOS_ssis @log;
    
    
  END

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

