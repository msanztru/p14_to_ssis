PRINT 'cargar_normalizado_modelo_187.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones(
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
  --CONSTRAINT uk_doc_mod187 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD hay_observaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD es_historico bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='hay_observaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_HAY_OBSERVACIONES DEFAULT 0 FOR hay_observaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_historico' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_HISTORICO DEFAULT 0 FOR es_historico

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN razon_social varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN delegacion_hacienda varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN administracion_hacienda varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN cod_entidad_gestora varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN hay_observaciones bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN es_historico bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_187_operaciones_con_acciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT PK_tbn1_documentos_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_documentos_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_187_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_187_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_187_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_187_ssis',
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.caejercicio AS varchar)+'M0'+CAST(cabe.careferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cacifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.catippres)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.camodelo='187'
	
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.cxejercicio AS varchar)+'M0'+CAST(cabe.cxreferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cxcifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.cxmodelo='187'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones AS tbn1_documentos_informativos_187_operaciones_con_acciones
  USING query ON query.id_documento=tbn1_documentos_informativos_187_operaciones_con_acciones.id_documento AND query.administracion_hacienda=tbn1_documentos_informativos_187_operaciones_con_acciones.administracion_hacienda
  WHEN MATCHED AND ((tbn1_documentos_informativos_187_operaciones_con_acciones.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_187_operaciones_con_acciones.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_187_operaciones_con_acciones.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.razon_social<>query.razon_social OR (tbn1_documentos_informativos_187_operaciones_con_acciones.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.fec_alta_af<>query.fec_alta_af OR (tbn1_documentos_informativos_187_operaciones_con_acciones.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_187_operaciones_con_acciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_187_operaciones_con_acciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_documentos_informativos_187_operaciones_con_acciones.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.telefono<>query.telefono OR (tbn1_documentos_informativos_187_operaciones_con_acciones.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_documentos_informativos_187_operaciones_con_acciones.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_documentos_informativos_187_operaciones_con_acciones.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_187_operaciones_con_acciones.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_187_operaciones_con_acciones.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.es_erroneo<>query.es_erroneo OR (tbn1_documentos_informativos_187_operaciones_con_acciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_documentos_informativos_187_operaciones_con_acciones.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.num_caja<>query.num_caja OR (tbn1_documentos_informativos_187_operaciones_con_acciones.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.hay_observaciones<>query.hay_observaciones OR (tbn1_documentos_informativos_187_operaciones_con_acciones.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.es_historico<>query.es_historico OR (tbn1_documentos_informativos_187_operaciones_con_acciones.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.volumen_operaciones<>query.volumen_operaciones OR (tbn1_documentos_informativos_187_operaciones_con_acciones.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.num_justificante<>query.num_justificante OR (tbn1_documentos_informativos_187_operaciones_con_acciones.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.tipo_declaracion<>query.tipo_declaracion OR (tbn1_documentos_informativos_187_operaciones_con_acciones.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_documentos_informativos_187_operaciones_con_acciones.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_187_operaciones_con_acciones.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_187_operaciones_con_acciones.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones(
  id_detalles_187 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  administracion varchar(1),
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_externo bit,
  es_representante bit,
  id_provincia int NOT NULL,
  cod_pais varchar(3),
  id_tipo_socio int NOT NULL,
  id_naturaleza int NOT NULL,
  id_clave_identificacion_fondo int NOT NULL,
  id_tipo_operacion int NOT NULL,
  fec_operacion date,
  num_acciones decimal(16,0),
  clave_origen varchar(1),
  tipo_retencion numeric(18,4),
  es_identificado bit,
  es_erroneo bit,
  importe_adquisicion numeric(18,2),
  ganancia_antiguo numeric(18,2),
  ganancia numeric(18,2),
  retencion numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod187 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_detalles_187),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_socio FOREIGN KEY (id_tipo_socio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio(id_tipo_socio),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_naturaleza FOREIGN KEY (id_naturaleza) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza(id_naturaleza),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo(id_clave_identificacion_fondo),
  CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_operacion FOREIGN KEY (id_tipo_operacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion(id_tipo_operacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_detalles_187')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_detalles_187 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD cod_pais varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_tipo_socio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_tipo_socio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_naturaleza int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_clave_identificacion_fondo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_tipo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD id_tipo_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD fec_operacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_acciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD num_acciones decimal(16,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD clave_origen varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_retencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD tipo_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='importe_adquisicion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD importe_adquisicion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia_antiguo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD ganancia_antiguo numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD ganancia numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='retencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD retencion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_provincia' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ID_PROVINCIA DEFAULT 1 FOR id_provincia

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_187_OPERACIONES_CON_ACCIONES_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_detalles_187' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_detalles_187 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN secuencia varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_representante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones SET id_provincia=1 WHERE id_provincia IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_provincia int NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_pais' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN cod_pais varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_tipo_socio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_tipo_socio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_naturaleza int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_clave_identificacion_fondo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_tipo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_tipo_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN fec_operacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_acciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN num_acciones decimal(16,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='clave_origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN clave_origen varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='importe_adquisicion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN importe_adquisicion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia_antiguo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN ganancia_antiguo numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN ganancia numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN retencion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_187_operaciones_con_acciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT PK_tbn1_detalles_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_detalles_187)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_socio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_socio FOREIGN KEY (id_tipo_socio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio(id_tipo_socio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_naturaleza FOREIGN KEY (id_naturaleza) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza(id_naturaleza)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo(id_clave_identificacion_fondo)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_detalles_informativos_187_operaciones_con_acciones_tbn1_mi_tipo_operacion FOREIGN KEY (id_tipo_operacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion(id_tipo_operacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_#87im_af') DROP VIEW dbo.tbn1_tmp_#87im_af
GO

CREATE VIEW dbo.tbn1_tmp_#87im_af AS
SELECT
  i.im87ejercicio AS im87ejercicio,
  i.im87referdoc AS im87referdoc,
  i.im87secuen AS im87secuen,
  sum(CASE WHEN im87tipo='01' THEN i.im87importe/100 END) AS im87importe01,
  sum(CASE WHEN im87tipo='02' THEN i.im87importe/100 END) AS im87importe02,
  sum(CASE WHEN im87tipo='03' THEN i.im87importe/100 END) AS im87importe03,
  sum(CASE WHEN im87tipo='04' THEN i.im87importe/100 END) AS im87importe04
FROM dbo.tbn187im_af i
WHERE im87importe<>0
GROUP BY
  i.im87ejercicio,
  i.im87referdoc,
  i.im87secuen


GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_187_INTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_187_INTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_187_INTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_187_INTERNOS_ssis',
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
      CAST(doc_187.pe87secuen AS varchar) AS secuencia,
      'B' AS administracion,
      0 AS es_externo,
      doc_187.pe87cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN doc_187.pe87represen='R' THEN 1 ELSE 0 END AS es_representante,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      doc_187.pe87pais AS cod_pais,
      coalesce(tipo_socio.id_tipo_socio,indefinidos.id_tipo_socio) AS id_tipo_socio,
      coalesce(naturaleza.id_naturaleza,indefinidos.id_naturaleza) AS id_naturaleza,
      coalesce(clave_identificacion.id_clave_identificacion_fondo,indefinidos.id_clave_identificacion_fondo) AS id_clave_identificacion_fondo,
      coalesce(tipo_operacion.id_tipo_operacion,indefinidos.id_tipo_operacion) AS id_tipo_operacion,
      doc_187.pe87fechaoper AS fec_operacion,
      doc_187.pe87nroacciones AS num_acciones,
      doc_187.pe87claveorig AS clave_origen,
      doc_187.pe87tiporeten/10000 AS tipo_retencion,
      CASE WHEN doc_187.pe87identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN doc_187.pe87error=1 THEN 1 ELSE 0 END AS es_erroneo,
      importes.im87importe01 AS importe_adquisicion,
      importes.im87importe02 AS ganancia_antiguo,
      importes.im87importe03 AS ganancia,
      importes.im87importe04 AS retencion
    FROM dbn1_stg_dhyf.dbo.tbn1_tmp_#87im_af importes
    INNER JOIN dbn1_stg_dhyf.dbo.tbn187pe_af doc_187 ON (importes.im87referdoc=doc_187.pe87referdoc AND importes.im87ejercicio=doc_187.pe87ejercicio AND importes.im87secuen=CAST(doc_187.pe87secuen AS varchar))
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(doc_187.pe87ejercicio AS varchar)+'M0'+CAST(doc_187.pe87referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (doc_187.pe87cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=doc_187.pe87provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio tipo_socio ON (tipo_socio.cod_tipo_socio=doc_187.pe87tiposocio)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza naturaleza ON (naturaleza.cod_naturaleza=doc_187.pe87natursocio)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo clave_identificacion ON (clave_identificacion.cod_clave_identificacion_fondo=doc_187.pe87clavefondo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion tipo_operacion ON (tipo_operacion.cod_tipo_operacion=doc_187.pe87tipooper)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones AS tbn1_detalles_informativos_187_operaciones_con_acciones
  USING query ON query.id_documento=tbn1_detalles_informativos_187_operaciones_con_acciones.id_documento AND query.secuencia=tbn1_detalles_informativos_187_operaciones_con_acciones.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo=0
                    AND (tbn1_detalles_informativos_187_operaciones_con_acciones.administracion<>query.administracion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo<>query.es_externo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_187_operaciones_con_acciones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_representante<>query.es_representante OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.cod_pais<>query.cod_pais OR (tbn1_detalles_informativos_187_operaciones_con_acciones.cod_pais IS NULL AND query.cod_pais IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_socio<>query.id_tipo_socio OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_socio IS NULL AND query.id_tipo_socio IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_socio IS NOT NULL AND query.id_tipo_socio IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_naturaleza<>query.id_naturaleza OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_naturaleza IS NULL AND query.id_naturaleza IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_naturaleza IS NOT NULL AND query.id_naturaleza IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_clave_identificacion_fondo<>query.id_clave_identificacion_fondo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_clave_identificacion_fondo IS NULL AND query.id_clave_identificacion_fondo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_clave_identificacion_fondo IS NOT NULL AND query.id_clave_identificacion_fondo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_operacion<>query.id_tipo_operacion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_operacion IS NULL AND query.id_tipo_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_operacion IS NOT NULL AND query.id_tipo_operacion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.fec_operacion<>query.fec_operacion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.fec_operacion IS NULL AND query.fec_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.fec_operacion IS NOT NULL AND query.fec_operacion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.num_acciones<>query.num_acciones OR (tbn1_detalles_informativos_187_operaciones_con_acciones.num_acciones IS NULL AND query.num_acciones IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.num_acciones IS NOT NULL AND query.num_acciones IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.clave_origen<>query.clave_origen OR (tbn1_detalles_informativos_187_operaciones_con_acciones.clave_origen IS NULL AND query.clave_origen IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.clave_origen IS NOT NULL AND query.clave_origen IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion<>query.importe_adquisicion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion IS NULL AND query.importe_adquisicion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion IS NOT NULL AND query.importe_adquisicion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo<>query.ganancia_antiguo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo IS NULL AND query.ganancia_antiguo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo IS NOT NULL AND query.ganancia_antiguo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia<>query.ganancia OR (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia IS NULL AND query.ganancia IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia IS NOT NULL AND query.ganancia IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.retencion<>query.retencion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      es_externo=query.es_externo,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      cod_pais=query.cod_pais,
      id_tipo_socio=query.id_tipo_socio,
      id_naturaleza=query.id_naturaleza,
      id_clave_identificacion_fondo=query.id_clave_identificacion_fondo,
      id_tipo_operacion=query.id_tipo_operacion,
      fec_operacion=query.fec_operacion,
      num_acciones=query.num_acciones,
      clave_origen=query.clave_origen,
      tipo_retencion=query.tipo_retencion,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      importe_adquisicion=query.importe_adquisicion,
      ganancia_antiguo=query.ganancia_antiguo,
      ganancia=query.ganancia,
      retencion=query.retencion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,es_externo,nif_declarado,es_contribuyente,id_contribuyente,es_representante,id_provincia,cod_pais,id_tipo_socio,id_naturaleza,id_clave_identificacion_fondo,id_tipo_operacion,fec_operacion,num_acciones,clave_origen,tipo_retencion,es_identificado,es_erroneo,importe_adquisicion,ganancia_antiguo,ganancia,retencion,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.es_externo,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.id_provincia,
      query.cod_pais,
      query.id_tipo_socio,
      query.id_naturaleza,
      query.id_clave_identificacion_fondo,
      query.id_tipo_operacion,
      query.fec_operacion,
      query.num_acciones,
      query.clave_origen,
      query.tipo_retencion,
      query.es_identificado,
      query.es_erroneo,
      query.importe_adquisicion,
      query.ganancia_antiguo,
      query.ganancia,
      query.retencion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo=0
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

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_#87xi_af') DROP VIEW dbo.tbn1_tmp_#87xi_af
GO

CREATE VIEW dbo.tbn1_tmp_#87xi_af AS
SELECT
  i.ix87ejercicio AS ix87ejercicio,
  i.ix87referdoc AS ix87referdoc,
  i.ix87nropte AS ix87nropte,
  i.ix87admon AS ix87admon,
  sum(CASE WHEN ix87tipo='01' THEN i.ix87importe/100 END) AS ix87importe01,
  sum(CASE WHEN ix87tipo='02' THEN i.ix87importe/100 END) AS ix87importe02,
  sum(CASE WHEN ix87tipo='03' THEN i.ix87importe/100 END) AS ix87importe03,
  sum(CASE WHEN ix87tipo='04' THEN i.ix87importe/100 END) AS ix87importe04
FROM dbo.tbn187xi_af i
WHERE ix87importe<>0
GROUP BY
  i.ix87ejercicio,
  i.ix87referdoc,
  i.ix87nropte,
  i.ix87admon


GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_187_EXTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_187_EXTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_187_EXTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_187_EXTERNOS_ssis',
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
      doc_187.px87nropte AS secuencia,
      doc_187.px87admon AS administracion,
      doc_187.px87cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      1 AS es_externo,
      CASE WHEN doc_187.px87represen='R' THEN 1 ELSE 0 END AS es_representante,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      doc_187.px87pais AS cod_pais,
      coalesce(tipo_socio.id_tipo_socio,indefinidos.id_tipo_socio) AS id_tipo_socio,
      coalesce(naturaleza.id_naturaleza,indefinidos.id_naturaleza) AS id_naturaleza,
      coalesce(clave_identificacion.id_clave_identificacion_fondo,indefinidos.id_clave_identificacion_fondo) AS id_clave_identificacion_fondo,
      coalesce(tipo_operacion.id_tipo_operacion,indefinidos.id_tipo_operacion) AS id_tipo_operacion,
      doc_187.px87fechaoper AS fec_operacion,
      doc_187.px87nroacciones AS num_acciones,
      doc_187.px87claveorig AS clave_origen,
      doc_187.px87tiporeten/10000 AS tipo_retencion,
      CASE WHEN doc_187.px87identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN doc_187.px87error=1 THEN 1 ELSE 0 END AS es_erroneo,
      importes.ix87importe01 AS importe_adquisicion,
      importes.ix87importe02 AS ganancia_antiguo,
      importes.ix87importe03 AS ganancia,
      importes.ix87importe04 AS retencion
    FROM dbn1_stg_dhyf.dbo.tbn1_tmp_#87xi_af importes
    INNER JOIN dbn1_stg_dhyf.dbo.tbn187xp_af doc_187 ON (importes.ix87referdoc=doc_187.px87referdoc AND importes.ix87ejercicio=doc_187.px87ejercicio AND importes.ix87nropte=doc_187.px87nropte)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(doc_187.px87ejercicio AS varchar)+'M0'+CAST(doc_187.px87referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (doc_187.px87cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=doc_187.px87provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio tipo_socio ON (tipo_socio.cod_tipo_socio=doc_187.px87tiposocio)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza naturaleza ON (naturaleza.cod_naturaleza=doc_187.px87natursocio)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo clave_identificacion ON (clave_identificacion.cod_clave_identificacion_fondo=doc_187.px87clavefondo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion tipo_operacion ON (tipo_operacion.cod_tipo_operacion=doc_187.px87tipooper)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones AS tbn1_detalles_informativos_187_operaciones_con_acciones
  USING query ON query.id_documento=tbn1_detalles_informativos_187_operaciones_con_acciones.id_documento AND query.secuencia=tbn1_detalles_informativos_187_operaciones_con_acciones.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo=1
                    AND (tbn1_detalles_informativos_187_operaciones_con_acciones.administracion<>query.administracion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_187_operaciones_con_acciones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo<>query.es_externo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_representante<>query.es_representante OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.cod_pais<>query.cod_pais OR (tbn1_detalles_informativos_187_operaciones_con_acciones.cod_pais IS NULL AND query.cod_pais IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_socio<>query.id_tipo_socio OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_socio IS NULL AND query.id_tipo_socio IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_socio IS NOT NULL AND query.id_tipo_socio IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_naturaleza<>query.id_naturaleza OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_naturaleza IS NULL AND query.id_naturaleza IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_naturaleza IS NOT NULL AND query.id_naturaleza IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_clave_identificacion_fondo<>query.id_clave_identificacion_fondo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_clave_identificacion_fondo IS NULL AND query.id_clave_identificacion_fondo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_clave_identificacion_fondo IS NOT NULL AND query.id_clave_identificacion_fondo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_operacion<>query.id_tipo_operacion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_operacion IS NULL AND query.id_tipo_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.id_tipo_operacion IS NOT NULL AND query.id_tipo_operacion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.fec_operacion<>query.fec_operacion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.fec_operacion IS NULL AND query.fec_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.fec_operacion IS NOT NULL AND query.fec_operacion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.num_acciones<>query.num_acciones OR (tbn1_detalles_informativos_187_operaciones_con_acciones.num_acciones IS NULL AND query.num_acciones IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.num_acciones IS NOT NULL AND query.num_acciones IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.clave_origen<>query.clave_origen OR (tbn1_detalles_informativos_187_operaciones_con_acciones.clave_origen IS NULL AND query.clave_origen IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.clave_origen IS NOT NULL AND query.clave_origen IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.tipo_retencion<>query.tipo_retencion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion<>query.importe_adquisicion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion IS NULL AND query.importe_adquisicion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion IS NOT NULL AND query.importe_adquisicion IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo<>query.ganancia_antiguo OR (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo IS NULL AND query.ganancia_antiguo IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo IS NOT NULL AND query.ganancia_antiguo IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia<>query.ganancia OR (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia IS NULL AND query.ganancia IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.ganancia IS NOT NULL AND query.ganancia IS NULL)
                    OR tbn1_detalles_informativos_187_operaciones_con_acciones.retencion<>query.retencion OR (tbn1_detalles_informativos_187_operaciones_con_acciones.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_detalles_informativos_187_operaciones_con_acciones.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      cod_pais=query.cod_pais,
      id_tipo_socio=query.id_tipo_socio,
      id_naturaleza=query.id_naturaleza,
      id_clave_identificacion_fondo=query.id_clave_identificacion_fondo,
      id_tipo_operacion=query.id_tipo_operacion,
      fec_operacion=query.fec_operacion,
      num_acciones=query.num_acciones,
      clave_origen=query.clave_origen,
      tipo_retencion=query.tipo_retencion,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      importe_adquisicion=query.importe_adquisicion,
      ganancia_antiguo=query.ganancia_antiguo,
      ganancia=query.ganancia,
      retencion=query.retencion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,id_provincia,cod_pais,id_tipo_socio,id_naturaleza,id_clave_identificacion_fondo,id_tipo_operacion,fec_operacion,num_acciones,clave_origen,tipo_retencion,es_identificado,es_erroneo,importe_adquisicion,ganancia_antiguo,ganancia,retencion,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.id_provincia,
      query.cod_pais,
      query.id_tipo_socio,
      query.id_naturaleza,
      query.id_clave_identificacion_fondo,
      query.id_tipo_operacion,
      query.fec_operacion,
      query.num_acciones,
      query.clave_origen,
      query.tipo_retencion,
      query.es_identificado,
      query.es_erroneo,
      query.importe_adquisicion,
      query.ganancia_antiguo,
      query.ganancia,
      query.retencion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_187_operaciones_con_acciones.es_externo=1
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_187_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_187_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_187_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_modelo_187_ssis',
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
  FROM dbo.tbn187pe_af
  WHERE pe87fechacar>@fecha_ultima_carga
  ) BEGIN
  
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_187_ssis @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_187_INTERNOS_ssis @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_187_EXTERNOS_ssis @log;
    
    
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

