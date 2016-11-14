PRINT 'cargar_normalizado_modelo_196.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes(
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
  --CONSTRAINT uk_doc_mod196 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD hay_observaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD es_historico bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='hay_observaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_196_CUENTAS_CORRIENTES_HAY_OBSERVACIONES DEFAULT 0 FOR hay_observaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_historico' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_HISTORICO DEFAULT 0 FOR es_historico

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN razon_social varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN delegacion_hacienda varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN administracion_hacienda varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN cod_entidad_gestora varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN hay_observaciones bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN es_historico bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_196_cuentas_corrientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT PK_tbn1_documentos_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_documentos_informativos_196_cuentas_corrientes_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_196_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_196_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_196_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_196_ssis',
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.caejercicio AS varchar)+'D6'+CAST(cabe.careferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cacifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.catippres)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.camodelo='196'
	
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
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(cabe.cxejercicio AS varchar)+'D6'+CAST(cabe.cxreferdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cxcifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE cabe.cxmodelo='196'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_196_cuentas_corrientes AS tbn1_documentos_informativos_196_cuentas_corrientes
  USING query ON query.id_documento=tbn1_documentos_informativos_196_cuentas_corrientes.id_documento AND query.administracion_hacienda=tbn1_documentos_informativos_196_cuentas_corrientes.administracion_hacienda
  WHEN MATCHED AND ((tbn1_documentos_informativos_196_cuentas_corrientes.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_196_cuentas_corrientes.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_196_cuentas_corrientes.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.razon_social<>query.razon_social OR (tbn1_documentos_informativos_196_cuentas_corrientes.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.fec_alta_af<>query.fec_alta_af OR (tbn1_documentos_informativos_196_cuentas_corrientes.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_196_cuentas_corrientes.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_196_cuentas_corrientes.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_documentos_informativos_196_cuentas_corrientes.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.telefono<>query.telefono OR (tbn1_documentos_informativos_196_cuentas_corrientes.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_documentos_informativos_196_cuentas_corrientes.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_documentos_informativos_196_cuentas_corrientes.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_196_cuentas_corrientes.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_196_cuentas_corrientes.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.es_erroneo<>query.es_erroneo OR (tbn1_documentos_informativos_196_cuentas_corrientes.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_documentos_informativos_196_cuentas_corrientes.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.num_caja<>query.num_caja OR (tbn1_documentos_informativos_196_cuentas_corrientes.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.hay_observaciones<>query.hay_observaciones OR (tbn1_documentos_informativos_196_cuentas_corrientes.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.es_historico<>query.es_historico OR (tbn1_documentos_informativos_196_cuentas_corrientes.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.volumen_operaciones<>query.volumen_operaciones OR (tbn1_documentos_informativos_196_cuentas_corrientes.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.num_justificante<>query.num_justificante OR (tbn1_documentos_informativos_196_cuentas_corrientes.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.tipo_declaracion<>query.tipo_declaracion OR (tbn1_documentos_informativos_196_cuentas_corrientes.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_documentos_informativos_196_cuentas_corrientes.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_196_cuentas_corrientes.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_196_cuentas_corrientes.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes(
  id_detalles_196 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  administracion varchar(1),
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_externo int,
  es_representante bit,
  id_provincia int,
  id_clave_alta int NOT NULL,
  id_clave_perceptor int NOT NULL,
  num_participes int,
  id_tipo_cuenta int NOT NULL,
  id_tipo_codigo int NOT NULL,
  banco varchar(4),
  sucursal varchar(4),
  num_cuenta varchar(12),
  clave_regularizacion varchar(1),
  porcentaje_participacion numeric(18,4),
  unidad_cuenta_empleada varchar(1),
  es_identificado bit,
  es_erroneo bit,
  percepciones_dinerarias numeric(18,2),
  reduccion numeric(18,2),
  base_retencion numeric(18,2),
  retencion numeric(18,2),
  retribuciones_especie numeric(18,2),
  reduccion_2 numeric(18,2),
  base_ingreso_cuenta numeric(18,2),
  ingreso_cuenta numeric(18,2),
  periodificacion numeric(18,2),
  regularizacion numeric(18,2),
  saldo_medio numeric(18,2),
  saldo_final numeric(18,2),
  fec_apertura_cuenta date,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod196 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_detalles_196),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_clave_alta FOREIGN KEY (id_clave_alta) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_alta(id_clave_alta),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_clave_perceptor FOREIGN KEY (id_clave_perceptor) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_perceptor(id_clave_perceptor),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_tipo_cuenta FOREIGN KEY (id_tipo_cuenta) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_cuenta(id_tipo_cuenta),
  CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_codigo(id_tipo_codigo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_detalles_196')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_detalles_196 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD es_externo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_clave_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_clave_alta int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_clave_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_clave_perceptor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_participes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD num_participes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_tipo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_tipo_cuenta int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD id_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD banco varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD sucursal varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD num_cuenta varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_regularizacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD clave_regularizacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD porcentaje_participacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='unidad_cuenta_empleada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD unidad_cuenta_empleada varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD es_erroneo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='percepciones_dinerarias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD percepciones_dinerarias numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD reduccion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_retencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD base_retencion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD retencion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retribuciones_especie')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD retribuciones_especie numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion_2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD reduccion_2 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_ingreso_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD base_ingreso_cuenta numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='ingreso_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD ingreso_cuenta numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='periodificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD periodificacion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='regularizacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD regularizacion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_medio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD saldo_medio numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_final')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD saldo_final numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_apertura_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD fec_apertura_cuenta date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_196_CUENTAS_CORRIENTES_ES_ERRONEO DEFAULT 0 FOR es_erroneo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_detalles_196' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_detalles_196 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN secuencia varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_externo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_representante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_clave_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_clave_alta int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_clave_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_clave_perceptor int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_participes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN num_participes int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_tipo_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_tipo_cuenta int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN id_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='banco' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN banco varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN sucursal varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN num_cuenta varchar(12) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='clave_regularizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN clave_regularizacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN porcentaje_participacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='unidad_cuenta_empleada' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN unidad_cuenta_empleada varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN es_erroneo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='percepciones_dinerarias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN percepciones_dinerarias numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN reduccion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN base_retencion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN retencion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='retribuciones_especie' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN retribuciones_especie numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='reduccion_2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN reduccion_2 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='base_ingreso_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN base_ingreso_cuenta numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='ingreso_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN ingreso_cuenta numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='periodificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN periodificacion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='regularizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN regularizacion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_medio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN saldo_medio numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='saldo_final' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN saldo_final numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_apertura_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_apertura_cuenta date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_196_cuentas_corrientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT PK_tbn1_detalles_informativos_196_cuentas_corrientes PRIMARY KEY CLUSTERED (id_detalles_196)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_clave_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_clave_alta FOREIGN KEY (id_clave_alta) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_alta(id_clave_alta)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_clave_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_clave_perceptor FOREIGN KEY (id_clave_perceptor) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_clave_perceptor(id_clave_perceptor)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_tipo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_tipo_cuenta FOREIGN KEY (id_tipo_cuenta) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_cuenta(id_tipo_cuenta)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_196_cuentas_corrientes' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes ADD CONSTRAINT FK_tbn1_detalles_informativos_196_cuentas_corrientes_tbn1_MI_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_MI_tipo_codigo(id_tipo_codigo)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_196_INTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_196_INTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_196_INTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_196_INTERNOS_ssis',
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
      CAST(declarado.da60secuen AS varchar) AS secuencia,
      'B' AS administracion,
      0 AS es_externo,
      declarado.da60cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN declarado.da60represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      coalesce(clave_alta.id_clave_alta,indefinidos.id_clave_alta) AS id_clave_alta,
      coalesce(clave_perceptor.id_clave_perceptor,indefinidos.id_clave_perceptor) AS id_clave_perceptor,
      declarado.da60participes AS num_participes,
      coalesce(tipo_cuenta.id_tipo_cuenta,indefinidos.id_tipo_cuenta) AS id_tipo_cuenta,
      coalesce(tipo_codigo.id_tipo_codigo,indefinidos.id_tipo_codigo) AS id_tipo_codigo,
      declarado.da60banco AS banco,
      declarado.da60sucursal AS sucursal,
      declarado.da60nrocuenta AS num_cuenta,
      declarado.da60clregular AS clave_regularizacion,
      declarado.da60porcentaje/10000 AS porcentaje_participacion,
      declarado.da60unidadcta AS unidad_cuenta_empleada,
      CASE WHEN declarado.da60identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.da60error=1 THEN 1 ELSE 0 END AS es_erroneo,
      importes.percepciones_dinerarias AS percepciones_dinerarias,
      importes.reduccion AS reduccion,
      importes.base_retencion AS base_retencion,
      importes.retencion AS retencion,
      importes.retribuciones_especie AS retribuciones_especie,
      importes.reduccion_2 AS reduccion_2,
      importes.base_ingreso_cuenta AS base_ingreso_cuenta,
      importes.ingreso_cuenta AS ingreso_cuenta,
      importes.periodificacion AS periodificacion,
      importes.regularizacion AS regularizacion,
      saldo.af60nd_saldo_medio/100 AS saldo_medio,
      saldo.af60nd_saldo_final/100 AS saldo_final,
      saldo.af60nd_apertura AS fec_apertura_cuenta
    FROM dbn1_stg_dhyf.dbo.tbn160da_af declarado
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.da60ejercicio AS varchar)+'D6'+CAST(declarado.da60referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.da60cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.da60provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta clave_alta ON (clave_alta.cod_clave_alta=declarado.da60clalta)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor clave_perceptor ON (clave_perceptor.cod_clave_perceptor=declarado.da60clperceptor)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta tipo_cuenta ON (tipo_cuenta.cod_tipo_cuenta=declarado.da60tipocuenta)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.cod_tipo_codigo=declarado.da60clcodigo)
    LEFT JOIN (SELECT
                 i.im60ejercicio AS im60ejercicio,
                 i.im60referdoc AS im60referdoc,
                 i.im60secuen AS im60secuen,
                 sum(CASE WHEN i.im60tipo='01' THEN i.im60importe/100 END) AS percepciones_dinerarias,
                 sum(CASE WHEN i.im60tipo='02' THEN i.im60importe/100 END) AS reduccion,
                 sum(CASE WHEN i.im60tipo='03' THEN i.im60importe/100 END) AS base_retencion,
                 sum(CASE WHEN i.im60tipo='04' THEN i.im60importe/100 END) AS retencion,
                 sum(CASE WHEN i.im60tipo='05' THEN i.im60importe/100 END) AS retribuciones_especie,
                 sum(CASE WHEN i.im60tipo='06' THEN i.im60importe/100 END) AS reduccion_2,
                 sum(CASE WHEN i.im60tipo='07' THEN i.im60importe/100 END) AS base_ingreso_cuenta,
                 sum(CASE WHEN i.im60tipo='08' THEN i.im60importe/100 END) AS ingreso_cuenta,
                 sum(CASE WHEN i.im60tipo='09' THEN i.im60importe/100 END) AS periodificacion,
                 sum(CASE WHEN i.im60tipo='10' THEN i.im60importe/100 END) AS regularizacion
               FROM dbn1_stg_dhyf.dbo.tbn160im_af i
               WHERE i.im60importe<>0
               GROUP BY
                 i.im60ejercicio,
                 i.im60referdoc,
                 i.im60secuen) importes ON declarado.da60ejercicio=importes.im60ejercicio AND declarado.da60referdoc=importes.im60referdoc AND declarado.da60secuen=importes.im60secuen
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn160nd_af saldo ON (saldo.af60nd_ejercicio=declarado.da60ejercicio AND saldo.af60nd_referdoc=declarado.da60referdoc AND saldo.af60nd_secuen=declarado.da60secuen)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes AS tbn1_detalles_informativos_196_cuentas_corrientes
  USING query ON query.id_documento=tbn1_detalles_informativos_196_cuentas_corrientes.id_documento AND query.secuencia=tbn1_detalles_informativos_196_cuentas_corrientes.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo=0
                    AND (tbn1_detalles_informativos_196_cuentas_corrientes.administracion<>query.administracion OR (tbn1_detalles_informativos_196_cuentas_corrientes.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_externo<>query.es_externo OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_196_cuentas_corrientes.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_representante<>query.es_representante OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_alta<>query.id_clave_alta OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_alta IS NULL AND query.id_clave_alta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_alta IS NOT NULL AND query.id_clave_alta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_perceptor<>query.id_clave_perceptor OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_perceptor IS NULL AND query.id_clave_perceptor IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_perceptor IS NOT NULL AND query.id_clave_perceptor IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.num_participes<>query.num_participes OR (tbn1_detalles_informativos_196_cuentas_corrientes.num_participes IS NULL AND query.num_participes IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.num_participes IS NOT NULL AND query.num_participes IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_cuenta<>query.id_tipo_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_cuenta IS NULL AND query.id_tipo_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_cuenta IS NOT NULL AND query.id_tipo_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.banco<>query.banco OR (tbn1_detalles_informativos_196_cuentas_corrientes.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.sucursal<>query.sucursal OR (tbn1_detalles_informativos_196_cuentas_corrientes.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.num_cuenta<>query.num_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.clave_regularizacion<>query.clave_regularizacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.clave_regularizacion IS NULL AND query.clave_regularizacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.clave_regularizacion IS NOT NULL AND query.clave_regularizacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada<>query.unidad_cuenta_empleada OR (tbn1_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada IS NULL AND query.unidad_cuenta_empleada IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada IS NOT NULL AND query.unidad_cuenta_empleada IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias<>query.percepciones_dinerarias OR (tbn1_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias IS NULL AND query.percepciones_dinerarias IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias IS NOT NULL AND query.percepciones_dinerarias IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.reduccion<>query.reduccion OR (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion IS NULL AND query.reduccion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion IS NOT NULL AND query.reduccion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.base_retencion<>query.base_retencion OR (tbn1_detalles_informativos_196_cuentas_corrientes.base_retencion IS NULL AND query.base_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.base_retencion IS NOT NULL AND query.base_retencion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.retencion<>query.retencion OR (tbn1_detalles_informativos_196_cuentas_corrientes.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.retribuciones_especie<>query.retribuciones_especie OR (tbn1_detalles_informativos_196_cuentas_corrientes.retribuciones_especie IS NULL AND query.retribuciones_especie IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.retribuciones_especie IS NOT NULL AND query.retribuciones_especie IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.reduccion_2<>query.reduccion_2 OR (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion_2 IS NULL AND query.reduccion_2 IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion_2 IS NOT NULL AND query.reduccion_2 IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta<>query.base_ingreso_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta IS NULL AND query.base_ingreso_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta IS NOT NULL AND query.base_ingreso_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta<>query.ingreso_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta IS NULL AND query.ingreso_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta IS NOT NULL AND query.ingreso_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.periodificacion<>query.periodificacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.periodificacion IS NULL AND query.periodificacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.periodificacion IS NOT NULL AND query.periodificacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.regularizacion<>query.regularizacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.regularizacion IS NULL AND query.regularizacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.regularizacion IS NOT NULL AND query.regularizacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.saldo_medio<>query.saldo_medio OR (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_medio IS NULL AND query.saldo_medio IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_medio IS NOT NULL AND query.saldo_medio IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.saldo_final<>query.saldo_final OR (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_final IS NULL AND query.saldo_final IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_final IS NOT NULL AND query.saldo_final IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta<>query.fec_apertura_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta IS NULL AND query.fec_apertura_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta IS NOT NULL AND query.fec_apertura_cuenta IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      es_externo=query.es_externo,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      id_clave_alta=query.id_clave_alta,
      id_clave_perceptor=query.id_clave_perceptor,
      num_participes=query.num_participes,
      id_tipo_cuenta=query.id_tipo_cuenta,
      id_tipo_codigo=query.id_tipo_codigo,
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
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,es_externo,nif_declarado,es_contribuyente,id_contribuyente,es_representante,id_provincia,id_clave_alta,id_clave_perceptor,num_participes,id_tipo_cuenta,id_tipo_codigo,banco,sucursal,num_cuenta,clave_regularizacion,porcentaje_participacion,unidad_cuenta_empleada,es_identificado,es_erroneo,percepciones_dinerarias,reduccion,base_retencion,retencion,retribuciones_especie,reduccion_2,base_ingreso_cuenta,ingreso_cuenta,periodificacion,regularizacion,saldo_medio,saldo_final,fec_apertura_cuenta,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.es_externo,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_representante,
      query.id_provincia,
      query.id_clave_alta,
      query.id_clave_perceptor,
      query.num_participes,
      query.id_tipo_cuenta,
      query.id_tipo_codigo,
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
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_196_EXTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_196_EXTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_196_EXTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_196_EXTERNOS_ssis',
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
      CAST(declarado.px60nropte AS varchar) AS secuencia,
      declarado.px60admon AS administracion,
      declarado.px60cif AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      1 AS es_externo,
      CASE WHEN declarado.px60represen='R' THEN 1 ELSE 0 END AS es_representante,
      provincia.id_provincia AS id_provincia,
      coalesce(clave_alta.id_clave_alta,indefinidos.id_clave_alta) AS id_clave_alta,
      coalesce(clave_perceptor.id_clave_perceptor,indefinidos.id_clave_perceptor) AS id_clave_perceptor,
      declarado.px60participes AS num_participes,
      coalesce(tipo_cuenta.id_tipo_cuenta,indefinidos.id_tipo_cuenta) AS id_tipo_cuenta,
      coalesce(tipo_codigo.id_tipo_codigo,indefinidos.id_tipo_codigo) AS id_tipo_codigo,
      declarado.px60banco AS banco,
      declarado.px60sucursal AS sucursal,
      declarado.px60nrocuenta AS num_cuenta,
      declarado.px60clregular AS clave_regularizacion,
	  declarado.px60porcentaje/10000 AS porcentaje_participacion,
      declarado.px60unidadcta AS unidad_cuenta_empleada,
      CASE WHEN declarado.px60identif=1 THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN declarado.px60error=1 THEN 1 ELSE 0 END AS es_erroneo,
      importes.percepciones_dinerarias AS percepciones_dinerarias,
      importes.reduccion AS reduccion,
      importes.base_retencion AS base_retencion,
      importes.retencion AS retencion,
      importes.retribuciones_especie AS retribuciones_especie,
      importes.reduccion_2 AS reduccion_2,
      importes.base_ingreso_cuenta AS base_ingreso_cuenta,
      importes.ingreso_cuenta AS ingreso_cuenta,
      importes.periodificacion AS periodificacion,
      importes.regularizacion AS regularizacion,
      saldo.af6xnd_saldo_medio/100 AS saldo_medio,
      saldo.af6xnd_saldo_final/100 AS saldo_final,
      saldo.af6xnd_apertura AS fec_apertura_cuenta
    FROM dbn1_stg_dhyf.dbo.tbn16xpe_af declarado
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.px60ejercicio AS varchar)+'D6'+CAST(declarado.px60referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (declarado.px60cif=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.px60provin)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta clave_alta ON (clave_alta.cod_clave_alta=declarado.px60clalta)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor clave_perceptor ON (clave_perceptor.cod_clave_perceptor=declarado.px60clperceptor)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta tipo_cuenta ON (tipo_cuenta.cod_tipo_cuenta=declarado.px60tipocuenta)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.cod_tipo_codigo=declarado.px60clcodigo)
    LEFT JOIN (SELECT
                 i.ix60ejercicio AS ix60ejercicio,
                 i.ix60referdoc AS ix60referdoc,
                 i.ix60nropte AS ix60nropte,
                 sum(CASE WHEN i.ix60tipo='01' THEN i.ix60importe/100 END) AS percepciones_dinerarias,
                 sum(CASE WHEN i.ix60tipo='02' THEN i.ix60importe/100 END) AS reduccion,
                 sum(CASE WHEN i.ix60tipo='03' THEN i.ix60importe/100 END) AS base_retencion,
                 sum(CASE WHEN i.ix60tipo='04' THEN i.ix60importe/100 END) AS retencion,
                 sum(CASE WHEN i.ix60tipo='05' THEN i.ix60importe/100 END) AS retribuciones_especie,
                 sum(CASE WHEN i.ix60tipo='06' THEN i.ix60importe/100 END) AS reduccion_2,
                 sum(CASE WHEN i.ix60tipo='07' THEN i.ix60importe/100 END) AS base_ingreso_cuenta,
                 sum(CASE WHEN i.ix60tipo='08' THEN i.ix60importe/100 END) AS ingreso_cuenta,
                 sum(CASE WHEN i.ix60tipo='09' THEN i.ix60importe/100 END) AS periodificacion,
                 sum(CASE WHEN i.ix60tipo='10' THEN i.ix60importe/100 END) AS regularizacion
               FROM dbn1_stg_dhyf.dbo.tbn16xim_af i
               WHERE i.ix60importe<>0
               GROUP BY
                 i.ix60ejercicio,
                 i.ix60referdoc,
                 i.ix60nropte) importes ON declarado.px60ejercicio=importes.ix60ejercicio AND declarado.px60referdoc=importes.ix60referdoc AND declarado.px60nropte=importes.ix60nropte
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn16xnd_af saldo ON (saldo.af6xnd_ejercicio=declarado.px60ejercicio AND saldo.af6xnd_referdoc=declarado.px60referdoc AND saldo.af6xnd_nropte=declarado.px60nropte)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_196_cuentas_corrientes AS tbn1_detalles_informativos_196_cuentas_corrientes
  USING query ON query.id_documento=tbn1_detalles_informativos_196_cuentas_corrientes.id_documento AND query.secuencia=tbn1_detalles_informativos_196_cuentas_corrientes.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo=1
                    AND (tbn1_detalles_informativos_196_cuentas_corrientes.administracion<>query.administracion OR (tbn1_detalles_informativos_196_cuentas_corrientes.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_196_cuentas_corrientes.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_externo<>query.es_externo OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_representante<>query.es_representante OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_alta<>query.id_clave_alta OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_alta IS NULL AND query.id_clave_alta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_alta IS NOT NULL AND query.id_clave_alta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_perceptor<>query.id_clave_perceptor OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_perceptor IS NULL AND query.id_clave_perceptor IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_clave_perceptor IS NOT NULL AND query.id_clave_perceptor IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.num_participes<>query.num_participes OR (tbn1_detalles_informativos_196_cuentas_corrientes.num_participes IS NULL AND query.num_participes IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.num_participes IS NOT NULL AND query.num_participes IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_cuenta<>query.id_tipo_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_cuenta IS NULL AND query.id_tipo_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_cuenta IS NOT NULL AND query.id_tipo_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.banco<>query.banco OR (tbn1_detalles_informativos_196_cuentas_corrientes.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.sucursal<>query.sucursal OR (tbn1_detalles_informativos_196_cuentas_corrientes.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.num_cuenta<>query.num_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.clave_regularizacion<>query.clave_regularizacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.clave_regularizacion IS NULL AND query.clave_regularizacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.clave_regularizacion IS NOT NULL AND query.clave_regularizacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
					OR tbn1_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada<>query.unidad_cuenta_empleada OR (tbn1_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada IS NULL AND query.unidad_cuenta_empleada IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.unidad_cuenta_empleada IS NOT NULL AND query.unidad_cuenta_empleada IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.es_erroneo<>query.es_erroneo OR (tbn1_detalles_informativos_196_cuentas_corrientes.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias<>query.percepciones_dinerarias OR (tbn1_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias IS NULL AND query.percepciones_dinerarias IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.percepciones_dinerarias IS NOT NULL AND query.percepciones_dinerarias IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.reduccion<>query.reduccion OR (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion IS NULL AND query.reduccion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion IS NOT NULL AND query.reduccion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.base_retencion<>query.base_retencion OR (tbn1_detalles_informativos_196_cuentas_corrientes.base_retencion IS NULL AND query.base_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.base_retencion IS NOT NULL AND query.base_retencion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.retencion<>query.retencion OR (tbn1_detalles_informativos_196_cuentas_corrientes.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.retencion IS NOT NULL AND query.retencion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.retribuciones_especie<>query.retribuciones_especie OR (tbn1_detalles_informativos_196_cuentas_corrientes.retribuciones_especie IS NULL AND query.retribuciones_especie IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.retribuciones_especie IS NOT NULL AND query.retribuciones_especie IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.reduccion_2<>query.reduccion_2 OR (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion_2 IS NULL AND query.reduccion_2 IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.reduccion_2 IS NOT NULL AND query.reduccion_2 IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta<>query.base_ingreso_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta IS NULL AND query.base_ingreso_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.base_ingreso_cuenta IS NOT NULL AND query.base_ingreso_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta<>query.ingreso_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta IS NULL AND query.ingreso_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.ingreso_cuenta IS NOT NULL AND query.ingreso_cuenta IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.periodificacion<>query.periodificacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.periodificacion IS NULL AND query.periodificacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.periodificacion IS NOT NULL AND query.periodificacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.regularizacion<>query.regularizacion OR (tbn1_detalles_informativos_196_cuentas_corrientes.regularizacion IS NULL AND query.regularizacion IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.regularizacion IS NOT NULL AND query.regularizacion IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.saldo_medio<>query.saldo_medio OR (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_medio IS NULL AND query.saldo_medio IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_medio IS NOT NULL AND query.saldo_medio IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.saldo_final<>query.saldo_final OR (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_final IS NULL AND query.saldo_final IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.saldo_final IS NOT NULL AND query.saldo_final IS NULL)
                    OR tbn1_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta<>query.fec_apertura_cuenta OR (tbn1_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta IS NULL AND query.fec_apertura_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_196_cuentas_corrientes.fec_apertura_cuenta IS NOT NULL AND query.fec_apertura_cuenta IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      id_clave_alta=query.id_clave_alta,
      id_clave_perceptor=query.id_clave_perceptor,
      num_participes=query.num_participes,
      id_tipo_cuenta=query.id_tipo_cuenta,
      id_tipo_codigo=query.id_tipo_codigo,
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
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,id_provincia,id_clave_alta,id_clave_perceptor,num_participes,id_tipo_cuenta,id_tipo_codigo,banco,sucursal,num_cuenta,clave_regularizacion,porcentaje_participacion,unidad_cuenta_empleada,es_identificado,es_erroneo,percepciones_dinerarias,reduccion,base_retencion,retencion,retribuciones_especie,reduccion_2,base_ingreso_cuenta,ingreso_cuenta,periodificacion,regularizacion,saldo_medio,saldo_final,fec_apertura_cuenta,fec_alta,fec_modificacion) VALUES (                                                                                                                                                                                                                                                
	  query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.id_provincia,
      query.id_clave_alta,
      query.id_clave_perceptor,
      query.num_participes,
      query.id_tipo_cuenta,
      query.id_tipo_codigo,
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
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_196_cuentas_corrientes.es_externo=1
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_196_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_196_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_196_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_modelo_196_ssis',
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
  FROM dbo.tbn160da_af
  WHERE da60fecar>@fecha_ultima_carga
  ) BEGIN
  
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_196_ssis @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_196_INTERNOS_ssis @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_196_EXTERNOS_ssis @log;
    
    
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

