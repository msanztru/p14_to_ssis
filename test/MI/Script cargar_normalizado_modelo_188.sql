PRINT 'cargar_normalizado_modelo_188.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida(
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
  --CONSTRAINT uk_doc_mod188 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD hay_observaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD es_historico bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_188_SEGUROS_VIDA_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_188_SEGUROS_VIDA_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='hay_observaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_188_SEGUROS_VIDA_HAY_OBSERVACIONES DEFAULT 0 FOR hay_observaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_historico' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_188_SEGUROS_VIDA_ES_HISTORICO DEFAULT 0 FOR es_historico

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN razon_social varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN delegacion_hacienda varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN administracion_hacienda varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN cod_entidad_gestora varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN hay_observaciones bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN es_historico bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_188_seguros_vida')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT PK_tbn1_documentos_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_documentos_informativos_188_seguros_vida_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_188' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_188;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_188(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_188'
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.caejercicio AS varchar)+'RG'+CAST(cabe.careferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cacifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.catippres)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.camodelo='188'
	
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.cxejercicio AS varchar)+'RG'+CAST(cabe.cxreferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cxcifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.cxmodelo='188'
	
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_188_seguros_vida AS tbn1_documentos_informativos_188_seguros_vida
  USING query ON query.id_documento=tbn1_documentos_informativos_188_seguros_vida.id_documento AND query.administracion_hacienda=tbn1_documentos_informativos_188_seguros_vida.administracion_hacienda
  WHEN MATCHED AND ((tbn1_documentos_informativos_188_seguros_vida.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_188_seguros_vida.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_188_seguros_vida.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.razon_social<>query.razon_social OR (tbn1_documentos_informativos_188_seguros_vida.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.fec_alta_af<>query.fec_alta_af OR (tbn1_documentos_informativos_188_seguros_vida.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_188_seguros_vida.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_188_seguros_vida.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_documentos_informativos_188_seguros_vida.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.telefono<>query.telefono OR (tbn1_documentos_informativos_188_seguros_vida.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_documentos_informativos_188_seguros_vida.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_documentos_informativos_188_seguros_vida.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_188_seguros_vida.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_188_seguros_vida.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.es_erroneo<>query.es_erroneo OR (tbn1_documentos_informativos_188_seguros_vida.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_documentos_informativos_188_seguros_vida.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.num_caja<>query.num_caja OR (tbn1_documentos_informativos_188_seguros_vida.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.hay_observaciones<>query.hay_observaciones OR (tbn1_documentos_informativos_188_seguros_vida.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.es_historico<>query.es_historico OR (tbn1_documentos_informativos_188_seguros_vida.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.volumen_operaciones<>query.volumen_operaciones OR (tbn1_documentos_informativos_188_seguros_vida.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.num_justificante<>query.num_justificante OR (tbn1_documentos_informativos_188_seguros_vida.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.tipo_declaracion<>query.tipo_declaracion OR (tbn1_documentos_informativos_188_seguros_vida.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_documentos_informativos_188_seguros_vida.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_188_seguros_vida.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_188_seguros_vida.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida(
  id_detalles_188 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  administracion varchar(1),
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_externo bit,
  es_representante bit,
  id_provincia int,
  ejercicio_devengo int,
  tipo_retencion numeric(18,4),
  id_modalidad int NOT NULL,
  es_identificado bit,
  es_erroneo bit,
  renta numeric(18,2),
  reduccion_1 numeric(18,2),
  reduccion_2 numeric(18,2),
  base_retencion numeric(18,2),
  retencion numeric(18,2),
  importe_11 numeric(18,2),
  importe_12 numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod188 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_detalles_188),
  CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_MI_modalidad FOREIGN KEY (id_modalidad) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_modalidad(id_modalidad)
)

GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_detalles_188')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD id_detalles_188 int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD id_documento int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='secuencia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD secuencia varchar(11)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='administracion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD administracion varchar(1)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD nif_declarado varchar(11)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD es_contribuyente bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD id_contribuyente int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_externo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD es_externo bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_representante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD es_representante bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_provincia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD id_provincia int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='ejercicio_devengo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD ejercicio_devengo int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_retencion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD tipo_retencion numeric(18,4)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_modalidad')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD id_modalidad int

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_identificado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD es_identificado bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD es_erroneo bit

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='renta')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD renta numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_1')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD reduccion_1 numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_2')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD reduccion_2 numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='base_retencion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD base_retencion numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='retencion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD retencion numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_11')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD importe_11 numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_12')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD importe_12 numeric(18,2)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD fec_alta datetime

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='fec_modificacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD fec_modificacion datetime

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='fec_baja')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD fec_baja datetime

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_188_SEGUROS_VIDA_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_188_SEGUROS_VIDA_ES_EXTERNO DEFAULT 0 FOR es_externo

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_188_SEGUROS_VIDA_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_188_SEGUROS_VIDA_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_188_SEGUROS_VIDA_ES_ERRONEO DEFAULT 0 FOR es_erroneo

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_detalles_188' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN id_detalles_188 int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN id_documento int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN secuencia varchar(11) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN administracion varchar(1) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN nif_declarado varchar(11) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN es_contribuyente bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN id_contribuyente int NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN es_externo bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN es_representante bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN id_provincia int NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN ejercicio_devengo int NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN tipo_retencion numeric(18,4) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='id_modalidad' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN id_modalidad int NOT NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN es_identificado bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN es_erroneo bit NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='renta' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN renta numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_1' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN reduccion_1 numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='reduccion_2' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN reduccion_2 numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='base_retencion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN base_retencion numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='retencion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN retencion numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_11' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN importe_11 numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='importe_12' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN importe_12 numeric(18,2) NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN fec_alta datetime NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN fec_modificacion datetime NULL

--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ALTER COLUMN fec_baja datetime NULL

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_188_seguros_vida')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT PK_tbn1_detalles_informativos_188_seguros_vida PRIMARY KEY CLUSTERED (id_detalles_188)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_documentos')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_contribuyentes')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_provincias')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_188_seguros_vida' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_MI_modalidad')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida ADD CONSTRAINT FK_tbn1_detalles_informativos_188_seguros_vida_tbn1_MI_modalidad FOREIGN KEY (id_modalidad) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_modalidad(id_modalidad)

--GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_188_INTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_188_INTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_188_INTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_188_INTERNOS'
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
      CAST(doc_188.pe88secuen AS varchar) AS secuencia,
      'B' AS administracion,
      0 AS es_externo,
      doc_188.pe88cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN doc_188.pe88represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      doc_188.pe88ejerdvgo AS ejercicio_devengo,
      doc_188.pe88tiporeten/10000 AS tipo_retencion,
      coalesce(modalidad.id_modalidad,indefinidos.id_modalidad) AS id_modalidad,
      CASE WHEN doc_188.pe88identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN doc_188.pe88error=1 THEN 1 ELSE 0 END AS es_erroneo,
      max(CASE WHEN importes.im88tipo='01' THEN importes.im88importe/100 END) AS renta,
      max(CASE WHEN importes.im88tipo='02' THEN importes.im88importe/100 END) AS reduccion_1,
      max(CASE WHEN importes.im88tipo='03' THEN importes.im88importe/100 END) AS reduccion_2,
      max(CASE WHEN importes.im88tipo='04' THEN importes.im88importe/100 END) AS base_retencion,
      max(CASE WHEN importes.im88tipo='05' THEN importes.im88importe/100 END) AS retencion,
      max(CASE WHEN importes.im88tipo='11' THEN importes.im88importe/100 END) AS importe_11,
      max(CASE WHEN importes.im88tipo='12' THEN importes.im88importe/100 END) AS importe_12
    FROM dbn1_stg_dhyf.dbo.tbn188im_af importes
    INNER JOIN dbn1_stg_dhyf.dbo.tbn188pe_af doc_188 ON (importes.im88referdoc=doc_188.pe88referdoc AND importes.im88ejercicio=doc_188.pe88ejercicio AND importes.im88secuen=doc_188.pe88secuen)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(doc_188.pe88ejercicio AS varchar)+'RG'+CAST(doc_188.pe88referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (doc_188.pe88cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=doc_188.pe88provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad modalidad ON (modalidad.cod_modalidad=doc_188.pe88modalidad)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      CAST(doc_188.pe88secuen AS varchar),
      doc_188.pe88cif,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN doc_188.pe88represen='R' THEN 1 ELSE 0 END,
      provincia.id_provincia,
      doc_188.pe88ejerdvgo,
      doc_188.pe88tiporeten/10000,
      coalesce(modalidad.id_modalidad,indefinidos.id_modalidad),
      CASE WHEN doc_188.pe88identif=1 THEN 1 ELSE 0 END,
      CASE WHEN doc_188.pe88error=1 THEN 1 ELSE 0 END
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida AS tbn1_detalles_informativos_188_seguros_vida
  USING query ON query.id_documento=tbn1_detalles_informativos_188_seguros_vida.id_documento AND query.secuencia=tbn1_detalles_informativos_188_seguros_vida.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_188_seguros_vida.es_externo=0
                    AND (tbn1_detalles_informativos_188_seguros_vida.administracion<>query.administracion OR (tbn1_detalles_informativos_188_seguros_vida.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_externo<>query.es_externo OR (tbn1_detalles_informativos_188_seguros_vida.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_188_seguros_vida.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_188_seguros_vida.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_188_seguros_vida.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_representante<>query.es_representante OR (tbn1_detalles_informativos_188_seguros_vida.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_188_seguros_vida.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_188_seguros_vida.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_188_seguros_vida.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.id_modalidad<>query.id_modalidad OR (tbn1_detalles_informativos_188_seguros_vida.id_modalidad IS NULL AND query.id_modalidad IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.id_modalidad IS NOT NULL AND query.id_modalidad IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_188_seguros_vida.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_188_seguros_vida.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.renta<>query.renta OR (tbn1_detalles_informativos_188_seguros_vida.renta IS NULL AND query.renta IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.renta IS NOT NULL AND query.renta IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.reduccion_1<>query.reduccion_1 OR (tbn1_detalles_informativos_188_seguros_vida.reduccion_1 IS NULL AND query.reduccion_1 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.reduccion_1 IS NOT NULL AND query.reduccion_1 IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.reduccion_2<>query.reduccion_2 OR (tbn1_detalles_informativos_188_seguros_vida.reduccion_2 IS NULL AND query.reduccion_2 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.reduccion_2 IS NOT NULL AND query.reduccion_2 IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.base_retencion<>query.base_retencion OR (tbn1_detalles_informativos_188_seguros_vida.base_retencion IS NULL AND query.base_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.base_retencion IS NOT NULL AND query.base_retencion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.retencion<>query.retencion OR (tbn1_detalles_informativos_188_seguros_vida.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.importe_11<>query.importe_11 OR (tbn1_detalles_informativos_188_seguros_vida.importe_11 IS NULL AND query.importe_11 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.importe_11 IS NOT NULL AND query.importe_11 IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.importe_12<>query.importe_12 OR (tbn1_detalles_informativos_188_seguros_vida.importe_12 IS NULL AND query.importe_12 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.importe_12 IS NOT NULL AND query.importe_12 IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      es_externo=query.es_externo,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      ejercicio_devengo=query.ejercicio_devengo,
      tipo_retencion=query.tipo_retencion,
      id_modalidad=query.id_modalidad,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      renta=query.renta,
      reduccion_1=query.reduccion_1,
      reduccion_2=query.reduccion_2,
      base_retencion=query.base_retencion,
      retencion=query.retencion,
      importe_11=query.importe_11,
      importe_12=query.importe_12,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,es_externo,nif_declarado,es_contribuyente,id_contribuyente,es_representante,id_provincia,ejercicio_devengo,tipo_retencion,id_modalidad,es_identificado,es_erroneo,renta,reduccion_1,reduccion_2,base_retencion,retencion,importe_11,importe_12,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.es_externo,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.id_provincia,
      query.ejercicio_devengo,
      query.tipo_retencion,
      query.id_modalidad,
      query.es_identificado,
      query.es_erroneo,
      query.renta,
      query.reduccion_1,
      query.reduccion_2,
      query.base_retencion,
      query.retencion,
      query.importe_11,
      query.importe_12,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_188_seguros_vida.es_externo=0
                                  AND fec_baja IS NULL) THEN
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_188_EXTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_188_EXTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_188_EXTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_188_EXTERNOS'
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
      doc_188.px88nropte AS secuencia,
      doc_188.px88admon AS administracion,
      doc_188.px88cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      1 AS es_externo,
      CASE WHEN doc_188.px88represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      doc_188.px88ejerdvgo AS ejercicio_devengo,
      doc_188.px88tiporeten/10000 AS tipo_retencion,
      coalesce(modalidad.id_modalidad,indefinidos.id_modalidad) AS id_modalidad,
      CASE WHEN doc_188.px88identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN doc_188.px88error=1 THEN 1 ELSE 0 END AS es_erroneo,
      max(CASE WHEN importes.ix88tipo='01' THEN importes.ix88importe/100 END) AS renta,
      max(CASE WHEN importes.ix88tipo='02' THEN importes.ix88importe/100 END) AS reduccion_1,
      max(CASE WHEN importes.ix88tipo='03' THEN importes.ix88importe/100 END) AS reduccion_2,
      max(CASE WHEN importes.ix88tipo='04' THEN importes.ix88importe/100 END) AS base_retencion,
      max(CASE WHEN importes.ix88tipo='05' THEN importes.ix88importe/100 END) AS retencion,
      max(CASE WHEN importes.ix88tipo='11' THEN importes.ix88importe/100 END) AS importe_11,
      max(CASE WHEN importes.ix88tipo='12' THEN importes.ix88importe/100 END) AS importe_12
    FROM dbn1_stg_dhyf.dbo.tbn188xi_af importes
    INNER JOIN dbn1_stg_dhyf.dbo.tbn188xp_af doc_188 ON (importes.ix88referdoc=doc_188.px88referdoc AND importes.ix88ejercicio=doc_188.px88ejercicio AND importes.ix88nropte=doc_188.px88nropte)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(doc_188.px88ejercicio AS varchar)+'RG'+CAST(doc_188.px88referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (doc_188.px88cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=doc_188.px88provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad modalidad ON (modalidad.cod_modalidad=doc_188.px88modalidad)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      doc_188.px88nropte,
      doc_188.px88admon,
      doc_188.px88cif,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN doc_188.px88represen='R' THEN 1 ELSE 0 END,
      provincia.id_provincia,
      doc_188.px88ejerdvgo,
      doc_188.px88tiporeten/10000,
      coalesce(modalidad.id_modalidad,indefinidos.id_modalidad),
      CASE WHEN doc_188.px88identif=1 THEN 1 ELSE 0 END,
      CASE WHEN doc_188.px88error=1 THEN 1 ELSE 0 END
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_188_seguros_vida AS tbn1_detalles_informativos_188_seguros_vida
  USING query ON query.id_documento=tbn1_detalles_informativos_188_seguros_vida.id_documento AND query.secuencia=tbn1_detalles_informativos_188_seguros_vida.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_188_seguros_vida.es_externo=1
                    AND (tbn1_detalles_informativos_188_seguros_vida.administracion<>query.administracion OR (tbn1_detalles_informativos_188_seguros_vida.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_188_seguros_vida.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_188_seguros_vida.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_188_seguros_vida.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_externo<>query.es_externo OR (tbn1_detalles_informativos_188_seguros_vida.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_representante<>query.es_representante OR (tbn1_detalles_informativos_188_seguros_vida.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_188_seguros_vida.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_188_seguros_vida.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_188_seguros_vida.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.id_modalidad<>query.id_modalidad OR (tbn1_detalles_informativos_188_seguros_vida.id_modalidad IS NULL AND query.id_modalidad IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.id_modalidad IS NOT NULL AND query.id_modalidad IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_188_seguros_vida.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_188_seguros_vida.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.renta<>query.renta OR (tbn1_detalles_informativos_188_seguros_vida.renta IS NULL AND query.renta IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.renta IS NOT NULL AND query.renta IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.reduccion_1<>query.reduccion_1 OR (tbn1_detalles_informativos_188_seguros_vida.reduccion_1 IS NULL AND query.reduccion_1 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.reduccion_1 IS NOT NULL AND query.reduccion_1 IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.reduccion_2<>query.reduccion_2 OR (tbn1_detalles_informativos_188_seguros_vida.reduccion_2 IS NULL AND query.reduccion_2 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.reduccion_2 IS NOT NULL AND query.reduccion_2 IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.base_retencion<>query.base_retencion OR (tbn1_detalles_informativos_188_seguros_vida.base_retencion IS NULL AND query.base_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.base_retencion IS NOT NULL AND query.base_retencion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.retencion<>query.retencion OR (tbn1_detalles_informativos_188_seguros_vida.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.importe_11<>query.importe_11 OR (tbn1_detalles_informativos_188_seguros_vida.importe_11 IS NULL AND query.importe_11 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.importe_11 IS NOT NULL AND query.importe_11 IS NULL)
                    OR tbn1_detalles_informativos_188_seguros_vida.importe_12<>query.importe_12 OR (tbn1_detalles_informativos_188_seguros_vida.importe_12 IS NULL AND query.importe_12 IS NOT NULL) OR  (tbn1_detalles_informativos_188_seguros_vida.importe_12 IS NOT NULL AND query.importe_12 IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      ejercicio_devengo=query.ejercicio_devengo,
      tipo_retencion=query.tipo_retencion,
      id_modalidad=query.id_modalidad,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      renta=query.renta,
      reduccion_1=query.reduccion_1,
      reduccion_2=query.reduccion_2,
      base_retencion=query.base_retencion,
      retencion=query.retencion,
      importe_11=query.importe_11,
      importe_12=query.importe_12,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,id_provincia,ejercicio_devengo,tipo_retencion,id_modalidad,es_identificado,es_erroneo,renta,reduccion_1,reduccion_2,base_retencion,retencion,importe_11,importe_12,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.id_provincia,
      query.ejercicio_devengo,
      query.tipo_retencion,
      query.id_modalidad,
      query.es_identificado,
      query.es_erroneo,
      query.renta,
      query.reduccion_1,
      query.reduccion_2,
      query.base_retencion,
      query.retencion,
      query.importe_11,
      query.importe_12,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_188_seguros_vida.es_externo=1
                                  AND fec_baja IS NULL) THEN
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_188' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_188;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_188(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_modelo_188'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_188 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_188_INTERNOS @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_188_EXTERNOS @log;

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

