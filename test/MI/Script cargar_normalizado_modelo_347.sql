PRINT 'cargar_normalizado_modelo_347.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  id_administracion int NOT NULL,
  nif_declarante varchar(11),
  razon_social varchar(25),
  cod_forma_juridica varchar(1),
  es_contribuyente bit,
  id_contribuyente int NOT NULL,
  es_externo bit,
  es_complementaria bit,
  es_sustitutiva bit,
  id_origen_grabacion int NOT NULL,
  num_nifs_carga int,
  num_nifs_identif_carga int,
  num_nifs_carga_ext int,
  num_nifs_identif_carga_ext int,
  clave_actividad_principal varchar(1),
  epigrafe_actividad_principal varchar(6),
  clave_segunda_actividad varchar(1),
  epigrafe_segunda_actividad varchar(6),
  ref_presentacion_colectiva int,
  contador_revisiones int,
  id_tipo_presentacion int NOT NULL,
  fec_presentacion date,
  id_provincia int NOT NULL,
  num_caja varchar(8),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_doc_mod347 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_347_operaciones_con_terceros PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_origenes_grabacion FOREIGN KEY (id_origen_grabacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion(id_origen_grabacion),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
  CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_administracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='cod_forma_juridica')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD cod_forma_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD es_complementaria bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD es_sustitutiva bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_origen_grabacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_origen_grabacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_carga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD num_nifs_carga int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD num_nifs_identif_carga int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_carga_ext')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD num_nifs_carga_ext int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga_ext')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD num_nifs_identif_carga_ext int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='clave_actividad_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD clave_actividad_principal varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='epigrafe_actividad_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD epigrafe_actividad_principal varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='clave_segunda_actividad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD clave_segunda_actividad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='epigrafe_segunda_actividad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD epigrafe_segunda_actividad varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ref_presentacion_colectiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD ref_presentacion_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_complementaria' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_COMPLEMENTARIA DEFAULT 0 FOR es_complementaria

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_sustitutiva' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_SUSTITUTIVA DEFAULT 0 FOR es_sustitutiva

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_administracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN razon_social varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='cod_forma_juridica' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN cod_forma_juridica varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN es_complementaria bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN es_sustitutiva bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_origen_grabacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_carga' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN num_nifs_carga int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN num_nifs_identif_carga int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_carga_ext' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN num_nifs_carga_ext int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga_ext' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN num_nifs_identif_carga_ext int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='clave_actividad_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN clave_actividad_principal varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='epigrafe_actividad_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN epigrafe_actividad_principal varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='clave_segunda_actividad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN clave_segunda_actividad varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='epigrafe_segunda_actividad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN epigrafe_segunda_actividad varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ref_presentacion_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN ref_presentacion_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN id_provincia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_347_operaciones_con_terceros')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT PK_tbn1_documentos_informativos_347_operaciones_con_terceros PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_origenes_grabacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_origenes_grabacion FOREIGN KEY (id_origen_grabacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion(id_origen_grabacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_documentos_informativos_347_operaciones_con_terceros_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_347_INTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_347_INTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_347_INTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_347_INTERNOS'
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
      coalesce(administracion.id_administracion,indefinidos.id_administracion) AS id_administracion,
      nif.nif_declarante AS nif_declarante,
      decl.DENOMPR AS razon_social,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      0 AS es_externo,
      CASE WHEN decl.DECOMPL='S' THEN 1 ELSE 0 END AS es_complementaria,
      CASE WHEN decl.DESUSTI='S' THEN 1 ELSE 0 END AS es_sustitutiva,
      coalesce(tipo_grab.id_origen_grabacion,indefinidos.id_origen_grabacion) AS id_origen_grabacion,
      decl.DENFCAR AS num_nifs_carga,
      decl.DENFIDE AS num_nifs_identif_carga,
      decl.DENFCAX AS num_nifs_carga_ext,
      decl.DENFIDX AS num_nifs_identif_carga_ext,
      decl.DECLACP AS clave_actividad_principal,
      decl.DEEPACP AS epigrafe_actividad_principal,
      decl.DECLSAP AS epigrafe_segunda_actividad,
      decl.DERFCOL AS ref_presentacion_colectiva,
      decl.DECREVI AS contador_revisiones,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      decl.DEFECPR AS fec_presentacion,
      decl.dencaja AS num_caja
    FROM dbn1_stg_dhyf.dbo.tbn1decl_ip decl
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(decl.DEEJERC AS varchar)+'FD'+CAST(decl.DEREFER AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc.id_expediente)
    LEFT JOIN (SELECT
                 CAST(doc_347.OPEJERC AS varchar)+'FD'+CAST(doc_347.OPREFER AS varchar)+'00K0000' AS referencia,
                 OPNIFDT AS nif_declarante
               FROM dbn1_stg_dhyf.dbo.tbn1oper_ip doc_347
               GROUP BY
                 CAST(doc_347.OPEJERC AS varchar)+'FD'+CAST(doc_347.OPREFER AS varchar)+'00K0000',
                 OPNIFDT) nif ON nif.referencia=doc.referencia
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.nif_maestro=nif.nif_declarante AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.DECLPRE)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion tipo_grab ON (tipo_grab.cod_origen_grabacion_mi=decl.DEOGRAB)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda administracion
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE
      decl.demodel='347'
      AND administracion.cod_administracion='B'
      AND provincia.cod_provincia=48
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros AS tbn1_documentos_informativos_347_operaciones_con_terceros
  USING query ON query.id_documento=tbn1_documentos_informativos_347_operaciones_con_terceros.id_documento
  WHEN MATCHED AND (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo=0
                    AND (tbn1_documentos_informativos_347_operaciones_con_terceros.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_administracion<>query.id_administracion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_347_operaciones_con_terceros.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.razon_social<>query.razon_social OR (tbn1_documentos_informativos_347_operaciones_con_terceros.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_provincia<>query.id_provincia OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_347_operaciones_con_terceros.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo<>query.es_externo OR (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.es_complementaria<>query.es_complementaria OR (tbn1_documentos_informativos_347_operaciones_con_terceros.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.es_sustitutiva<>query.es_sustitutiva OR (tbn1_documentos_informativos_347_operaciones_con_terceros.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_origen_grabacion<>query.id_origen_grabacion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_origen_grabacion IS NULL AND query.id_origen_grabacion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_origen_grabacion IS NOT NULL AND query.id_origen_grabacion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga<>query.num_nifs_carga OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga IS NULL AND query.num_nifs_carga IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga IS NOT NULL AND query.num_nifs_carga IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga<>query.num_nifs_identif_carga OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga IS NULL AND query.num_nifs_identif_carga IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga IS NOT NULL AND query.num_nifs_identif_carga IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga_ext<>query.num_nifs_carga_ext OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga_ext IS NULL AND query.num_nifs_carga_ext IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga_ext IS NOT NULL AND query.num_nifs_carga_ext IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga_ext<>query.num_nifs_identif_carga_ext OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga_ext IS NULL AND query.num_nifs_identif_carga_ext IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga_ext IS NOT NULL AND query.num_nifs_identif_carga_ext IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.clave_actividad_principal<>query.clave_actividad_principal OR (tbn1_documentos_informativos_347_operaciones_con_terceros.clave_actividad_principal IS NULL AND query.clave_actividad_principal IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.clave_actividad_principal IS NOT NULL AND query.clave_actividad_principal IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.epigrafe_actividad_principal<>query.epigrafe_actividad_principal OR (tbn1_documentos_informativos_347_operaciones_con_terceros.epigrafe_actividad_principal IS NULL AND query.epigrafe_actividad_principal IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.epigrafe_actividad_principal IS NOT NULL AND query.epigrafe_actividad_principal IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.epigrafe_segunda_actividad<>query.epigrafe_segunda_actividad OR (tbn1_documentos_informativos_347_operaciones_con_terceros.epigrafe_segunda_actividad IS NULL AND query.epigrafe_segunda_actividad IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.epigrafe_segunda_actividad IS NOT NULL AND query.epigrafe_segunda_actividad IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.ref_presentacion_colectiva<>query.ref_presentacion_colectiva OR (tbn1_documentos_informativos_347_operaciones_con_terceros.ref_presentacion_colectiva IS NULL AND query.ref_presentacion_colectiva IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.ref_presentacion_colectiva IS NOT NULL AND query.ref_presentacion_colectiva IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_347_operaciones_con_terceros.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_caja<>query.num_caja OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      id_administracion=query.id_administracion,
      nif_declarante=query.nif_declarante,
      razon_social=query.razon_social,
      id_provincia=query.id_provincia,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_complementaria=query.es_complementaria,
      es_sustitutiva=query.es_sustitutiva,
      id_origen_grabacion=query.id_origen_grabacion,
      num_nifs_carga=query.num_nifs_carga,
      num_nifs_identif_carga=query.num_nifs_identif_carga,
      num_nifs_carga_ext=query.num_nifs_carga_ext,
      num_nifs_identif_carga_ext=query.num_nifs_identif_carga_ext,
      clave_actividad_principal=query.clave_actividad_principal,
      epigrafe_actividad_principal=query.epigrafe_actividad_principal,
      epigrafe_segunda_actividad=query.epigrafe_segunda_actividad,
      ref_presentacion_colectiva=query.ref_presentacion_colectiva,
      contador_revisiones=query.contador_revisiones,
      id_tipo_presentacion=query.id_tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      num_caja=query.num_caja,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,id_administracion,nif_declarante,razon_social,id_provincia,es_contribuyente,id_contribuyente,es_externo,es_complementaria,es_sustitutiva,id_origen_grabacion,num_nifs_carga,num_nifs_identif_carga,num_nifs_carga_ext,num_nifs_identif_carga_ext,clave_actividad_principal,epigrafe_actividad_principal,epigrafe_segunda_actividad,ref_presentacion_colectiva,contador_revisiones,id_tipo_presentacion,fec_presentacion,num_caja,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.id_administracion,
      query.nif_declarante,
      query.razon_social,
      query.id_provincia,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_complementaria,
      query.es_sustitutiva,
      query.id_origen_grabacion,
      query.num_nifs_carga,
      query.num_nifs_identif_carga,
      query.num_nifs_carga_ext,
      query.num_nifs_identif_carga_ext,
      query.clave_actividad_principal,
      query.epigrafe_actividad_principal,
      query.epigrafe_segunda_actividad,
      query.ref_presentacion_colectiva,
      query.contador_revisiones,
      query.id_tipo_presentacion,
      query.fec_presentacion,
      query.num_caja,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_347_EXTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_347_EXTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_347_EXTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_347_EXTERNOS'
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
      administracion.id_administracion AS id_administracion,
      decl.DXNUMIF AS nif_declarante,
      substring(c.nombre,1,25) AS razon_social,
      decl.DXNDPRE AS num_nifs_carga,
      decl.DXNDIDE AS num_nifs_identif_carga,
      decl.DXFJUDE AS cod_forma_juridica,
      1 AS es_externo,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      coalesce(tipo_grab.id_origen_grabacion,indefinidos.id_origen_grabacion) AS id_origen_grabacion,
      decl.DXFECDE AS fec_presentacion,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      decl.DXNCAJA AS num_caja
    FROM dbn1_stg_dhyf.dbo.tbn1i3de_ip decl
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(decl.DXEJERC AS varchar)+'FD'+CAST(decl.DXREFER AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (decl.DXNUMIF=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.DXCLPRE)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=decl.DXPROPR)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda administracion ON (administracion.cod_administracion=substring(decl.DXREFER,1,1))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion tipo_grab
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE
      decl.DXMOD78='347'
      AND tipo_grab.cod_origen_grabacion_mi='1'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros AS tbn1_documentos_informativos_347_operaciones_con_terceros
  USING query ON query.id_documento=tbn1_documentos_informativos_347_operaciones_con_terceros.id_documento
  WHEN MATCHED AND (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo=1
                    AND (tbn1_documentos_informativos_347_operaciones_con_terceros.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_administracion<>query.id_administracion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_347_operaciones_con_terceros.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.razon_social<>query.razon_social OR (tbn1_documentos_informativos_347_operaciones_con_terceros.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga<>query.num_nifs_carga OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga IS NULL AND query.num_nifs_carga IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_carga IS NOT NULL AND query.num_nifs_carga IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga<>query.num_nifs_identif_carga OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga IS NULL AND query.num_nifs_identif_carga IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_nifs_identif_carga IS NOT NULL AND query.num_nifs_identif_carga IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.cod_forma_juridica<>query.cod_forma_juridica OR (tbn1_documentos_informativos_347_operaciones_con_terceros.cod_forma_juridica IS NULL AND query.cod_forma_juridica IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.cod_forma_juridica IS NOT NULL AND query.cod_forma_juridica IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo<>query.es_externo OR (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_347_operaciones_con_terceros.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_origen_grabacion<>query.id_origen_grabacion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_origen_grabacion IS NULL AND query.id_origen_grabacion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_origen_grabacion IS NOT NULL AND query.id_origen_grabacion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_347_operaciones_con_terceros.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.id_provincia<>query.id_provincia OR (tbn1_documentos_informativos_347_operaciones_con_terceros.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_documentos_informativos_347_operaciones_con_terceros.num_caja<>query.num_caja OR (tbn1_documentos_informativos_347_operaciones_con_terceros.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_347_operaciones_con_terceros.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      id_administracion=query.id_administracion,
      nif_declarante=query.nif_declarante,
      razon_social=query.razon_social,
      num_nifs_carga=query.num_nifs_carga,
      num_nifs_identif_carga=query.num_nifs_identif_carga,
      cod_forma_juridica=query.cod_forma_juridica,
      es_externo=query.es_externo,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      id_tipo_presentacion=query.id_tipo_presentacion,
      id_origen_grabacion=query.id_origen_grabacion,
      fec_presentacion=query.fec_presentacion,
      id_provincia=query.id_provincia,
      num_caja=query.num_caja,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,id_administracion,nif_declarante,razon_social,num_nifs_carga,num_nifs_identif_carga,cod_forma_juridica,es_externo,es_contribuyente,id_contribuyente,id_tipo_presentacion,id_origen_grabacion,fec_presentacion,id_provincia,num_caja,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.id_administracion,
      query.nif_declarante,
      query.razon_social,
      query.num_nifs_carga,
      query.num_nifs_identif_carga,
      query.cod_forma_juridica,
      query.es_externo,
      query.es_contribuyente,
      query.id_contribuyente,
      query.id_tipo_presentacion,
      query.id_origen_grabacion,
      query.fec_presentacion,
      query.id_provincia,
      query.num_caja,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_documentos_informativos_347_operaciones_con_terceros.es_externo=1
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros(
  id_detalles_347 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  id_administracion int NOT NULL,
  nif_declarado varchar(11),
  es_contribuyente bit,
  id_contribuyente int NOT NULL,
  es_externo bit,
  es_representante bit,
  id_tipo_operacion_fact int NOT NULL,
  importe_operacion numeric(18,2),
  id_provincia int NOT NULL,
  cod_pais varchar(3),
  es_identificado bit,
  cod_origen_identif varchar(1),
  es_seguro bit,
  es_arrendamiento bit,
  ext_anagrama varchar(8),
  ext_nombre varchar(40),
  ext_domicilio varchar(32),
  ext_cod_postal varchar(5),
  ext_municipio varchar(21),
  ext_cod_forma_juridica varchar(1),
  importe_operaciones numeric(18,2),
  importe_metalico numeric(18,2),
  importe_inmuebles numeric(18,2),
  ejercicio_importe smallint,
  importe_oper_t1 numeric(18,2),
  importe_inmuebles_t1 numeric(18,2),
  importe_oper_t2 numeric(18,2),
  importe_inmuebles_t2 numeric(18,2),
  importe_oper_t3 numeric(18,2),
  importe_inmuebles_t3 numeric(18,2),
  importe_oper_t4 numeric(18,2),
  importe_inmuebles_t4 numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod347 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_347_operaciones_con_terceros PRIMARY KEY CLUSTERED (id_detalles_347),
  CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
  CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_mi_tipo_operacion_factura FOREIGN KEY (id_tipo_operacion_fact) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura(id_tipo_operacion_fact),
  CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_detalles_347')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD id_detalles_347 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD id_administracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_tipo_operacion_fact')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD id_tipo_operacion_fact int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_operacion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='cod_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD cod_pais varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='cod_origen_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD cod_origen_identif varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_seguro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD es_seguro bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_arrendamiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD es_arrendamiento bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_anagrama')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ext_anagrama varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_nombre')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ext_nombre varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_domicilio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ext_domicilio varchar(32)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_cod_postal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ext_cod_postal varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ext_municipio varchar(21)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_cod_forma_juridica')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ext_cod_forma_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_metalico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_metalico numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_inmuebles numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ejercicio_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD ejercicio_importe smallint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_oper_t1 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_inmuebles_t1 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_oper_t2 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_inmuebles_t2 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_oper_t3 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_inmuebles_t3 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t4')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_oper_t4 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t4')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD importe_inmuebles_t4 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_seguro' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_SEGURO DEFAULT 0 FOR es_seguro

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_arrendamiento' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_OPERACIONES_CON_TERCEROS_ES_ARRENDAMIENTO DEFAULT 0 FOR es_arrendamiento

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_detalles_347' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN id_detalles_347 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN secuencia varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN id_administracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN es_representante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_tipo_operacion_fact' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN id_tipo_operacion_fact int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_operacion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN id_provincia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='cod_pais' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN cod_pais varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='cod_origen_identif' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN cod_origen_identif varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_seguro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN es_seguro bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='es_arrendamiento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN es_arrendamiento bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_anagrama' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ext_anagrama varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_nombre' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ext_nombre varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_domicilio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ext_domicilio varchar(32) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_cod_postal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ext_cod_postal varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_municipio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ext_municipio varchar(21) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ext_cod_forma_juridica' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ext_cod_forma_juridica varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_metalico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_metalico numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_inmuebles numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='ejercicio_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN ejercicio_importe smallint NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_oper_t1 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_inmuebles_t1 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_oper_t2 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_inmuebles_t2 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t3' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_oper_t3 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t3' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_inmuebles_t3 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_oper_t4' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_oper_t4 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='importe_inmuebles_t4' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN importe_inmuebles_t4 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_347_operaciones_con_terceros')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT PK_tbn1_detalles_informativos_347_operaciones_con_terceros PRIMARY KEY CLUSTERED (id_detalles_347)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_mi_tipo_operacion_factura')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_mi_tipo_operacion_factura FOREIGN KEY (id_tipo_operacion_fact) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura(id_tipo_operacion_fact)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_operaciones_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros ADD CONSTRAINT FK_tbn1_detalles_informativos_347_operaciones_con_terceros_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_347_INTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_INTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_INTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_INTERNOS'
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
      CAST(doc_347.opsecue AS varchar) AS secuencia,
      coalesce(administracion.id_administracion,indefinidos.id_administracion) AS id_administracion,
      doc_347.opnifdd AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      0 AS es_externo,
      CASE WHEN doc_347.oprepre='S' THEN 1 ELSE 0 END AS es_representante,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      doc_347.OPPAIS AS cod_pais,
      coalesce(tipo_operacion_fact.id_tipo_operacion_fact,indefinidos.id_tipo_operacion_fact) AS id_tipo_operacion_fact,
      doc_347.OPIMOPE/100 AS importe_operacion,
      CASE WHEN doc_347.OPIDENT=1 THEN 1 ELSE 0 END AS es_identificado,
      doc_347.OPORIGE AS cod_origen_identif,
      CASE WHEN doc_347.OPSEGUR='S' THEN 1 ELSE 0 END AS es_seguro,
      CASE WHEN doc_347.OPARREN='S' THEN 1 ELSE 0 END AS es_arrendamiento,
      doc_347.IPOPER_OPIMOPE/100 AS importe_operaciones,
      doc_347.IPOPER_OPIMPER/100 AS importe_metalico,
      doc_347.IPOPER_OPIMIVA/100 AS importe_inmuebles,
      doc_347.IPOPER_EJERDEC AS ejercicio_importe,
      doc_347.IPOPER_OPIMOPE_T1/100 AS importe_oper_t1,
      doc_347.IPOPER_OPIMIVA_T1/100 AS importe_inmuebles_t1,
      doc_347.IPOPER_OPIMOPE_T2/100 AS importe_oper_t2,
      doc_347.IPOPER_OPIMIVA_T2/100 AS importe_inmuebles_t2,
      doc_347.IPOPER_OPIMOPE_T3/100 AS importe_oper_t3,
      doc_347.IPOPER_OPIMIVA_T3/100 AS importe_inmuebles_t3,
      doc_347.IPOPER_OPIMOPE_T4/100 AS importe_oper_t4,
      doc_347.IPOPER_OPIMIVA_T4/100 AS importe_inmuebles_t4
    FROM dbn1_stg_dhyf.dbo.tbn1oper_ip doc_347
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(doc_347.OPEJERC AS varchar)+'FD'+CAST(doc_347.OPREFER AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (doc_347.OPNIFDD=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=doc_347.OPPROPR)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura tipo_operacion_fact ON (tipo_operacion_fact.cod_tipo_operacion_fact=doc_347.OPCLAOP)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda administracion
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE administracion.cod_administracion='B'
    GROUP BY
      doc.id_documento,
      CAST(doc_347.opsecue AS varchar),
      coalesce(administracion.id_administracion,indefinidos.id_administracion),
      doc_347.opnifdd,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN doc_347.oprepre='S' THEN 1 ELSE 0 END,
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      doc_347.OPPAIS,
      coalesce(tipo_operacion_fact.id_tipo_operacion_fact,indefinidos.id_tipo_operacion_fact),
      doc_347.OPIMOPE/100,
      CASE WHEN doc_347.OPIDENT=1 THEN 1 ELSE 0 END,
      doc_347.OPORIGE,
      CASE WHEN doc_347.OPSEGUR='S' THEN 1 ELSE 0 END,
      CASE WHEN doc_347.OPARREN='S' THEN 1 ELSE 0 END,
      doc_347.IPOPER_OPIMOPE/100,
      doc_347.IPOPER_OPIMPER/100,
      doc_347.IPOPER_OPIMIVA/100,
      doc_347.IPOPER_EJERDEC,
      doc_347.IPOPER_OPIMOPE_T1/100,
      doc_347.IPOPER_OPIMIVA_T1/100,
      doc_347.IPOPER_OPIMOPE_T2/100,
      doc_347.IPOPER_OPIMIVA_T2/100,
      doc_347.IPOPER_OPIMOPE_T3/100,
      doc_347.IPOPER_OPIMIVA_T3/100,
      doc_347.IPOPER_OPIMOPE_T4/100,
      doc_347.IPOPER_OPIMIVA_T4/100
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros AS tbn1_detalles_informativos_347_operaciones_con_terceros
  USING query ON query.id_documento=tbn1_detalles_informativos_347_operaciones_con_terceros.id_documento AND query.secuencia=tbn1_detalles_informativos_347_operaciones_con_terceros.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo=0
                    AND (tbn1_detalles_informativos_347_operaciones_con_terceros.id_administracion<>query.id_administracion OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_347_operaciones_con_terceros.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo<>query.es_externo OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_representante<>query.es_representante OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.cod_pais<>query.cod_pais OR (tbn1_detalles_informativos_347_operaciones_con_terceros.cod_pais IS NULL AND query.cod_pais IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.id_tipo_operacion_fact<>query.id_tipo_operacion_fact OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_tipo_operacion_fact IS NULL AND query.id_tipo_operacion_fact IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_tipo_operacion_fact IS NOT NULL AND query.id_tipo_operacion_fact IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operacion<>query.importe_operacion OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operacion IS NULL AND query.importe_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operacion IS NOT NULL AND query.importe_operacion IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.cod_origen_identif<>query.cod_origen_identif OR (tbn1_detalles_informativos_347_operaciones_con_terceros.cod_origen_identif IS NULL AND query.cod_origen_identif IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.cod_origen_identif IS NOT NULL AND query.cod_origen_identif IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_seguro<>query.es_seguro OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_seguro IS NULL AND query.es_seguro IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_seguro IS NOT NULL AND query.es_seguro IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_arrendamiento<>query.es_arrendamiento OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_arrendamiento IS NULL AND query.es_arrendamiento IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_arrendamiento IS NOT NULL AND query.es_arrendamiento IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operaciones<>query.importe_operaciones OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operaciones IS NULL AND query.importe_operaciones IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operaciones IS NOT NULL AND query.importe_operaciones IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_metalico<>query.importe_metalico OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_metalico IS NULL AND query.importe_metalico IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_metalico IS NOT NULL AND query.importe_metalico IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles<>query.importe_inmuebles OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles IS NULL AND query.importe_inmuebles IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles IS NOT NULL AND query.importe_inmuebles IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ejercicio_importe<>query.ejercicio_importe OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ejercicio_importe IS NULL AND query.ejercicio_importe IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ejercicio_importe IS NOT NULL AND query.ejercicio_importe IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t1<>query.importe_oper_t1 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t1 IS NULL AND query.importe_oper_t1 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t1 IS NOT NULL AND query.importe_oper_t1 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t1<>query.importe_inmuebles_t1 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t1 IS NULL AND query.importe_inmuebles_t1 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t1 IS NOT NULL AND query.importe_inmuebles_t1 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t2<>query.importe_oper_t2 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t2 IS NULL AND query.importe_oper_t2 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t2 IS NOT NULL AND query.importe_oper_t2 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t2<>query.importe_inmuebles_t2 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t2 IS NULL AND query.importe_inmuebles_t2 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t2 IS NOT NULL AND query.importe_inmuebles_t2 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t3<>query.importe_oper_t3 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t3 IS NULL AND query.importe_oper_t3 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t3 IS NOT NULL AND query.importe_oper_t3 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t3<>query.importe_inmuebles_t3 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t3 IS NULL AND query.importe_inmuebles_t3 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t3 IS NOT NULL AND query.importe_inmuebles_t3 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t4<>query.importe_oper_t4 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t4 IS NULL AND query.importe_oper_t4 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t4 IS NOT NULL AND query.importe_oper_t4 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t4<>query.importe_inmuebles_t4 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t4 IS NULL AND query.importe_inmuebles_t4 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t4 IS NOT NULL AND query.importe_inmuebles_t4 IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_administracion=query.id_administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      cod_pais=query.cod_pais,
      id_tipo_operacion_fact=query.id_tipo_operacion_fact,
      importe_operacion=query.importe_operacion,
      es_identificado=query.es_identificado,
      cod_origen_identif=query.cod_origen_identif,
      es_seguro=query.es_seguro,
      es_arrendamiento=query.es_arrendamiento,
      importe_operaciones=query.importe_operaciones,
      importe_metalico=query.importe_metalico,
      importe_inmuebles=query.importe_inmuebles,
      ejercicio_importe=query.ejercicio_importe,
      importe_oper_t1=query.importe_oper_t1,
      importe_inmuebles_t1=query.importe_inmuebles_t1,
      importe_oper_t2=query.importe_oper_t2,
      importe_inmuebles_t2=query.importe_inmuebles_t2,
      importe_oper_t3=query.importe_oper_t3,
      importe_inmuebles_t3=query.importe_inmuebles_t3,
      importe_oper_t4=query.importe_oper_t4,
      importe_inmuebles_t4=query.importe_inmuebles_t4,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,id_administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,id_provincia,cod_pais,id_tipo_operacion_fact,importe_operacion,es_identificado,cod_origen_identif,es_seguro,es_arrendamiento,importe_operaciones,importe_metalico,importe_inmuebles,ejercicio_importe,importe_oper_t1,importe_inmuebles_t1,importe_oper_t2,importe_inmuebles_t2,importe_oper_t3,importe_inmuebles_t3,importe_oper_t4,importe_inmuebles_t4,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.id_administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.id_provincia,
      query.cod_pais,
      query.id_tipo_operacion_fact,
      query.importe_operacion,
      query.es_identificado,
      query.cod_origen_identif,
      query.es_seguro,
      query.es_arrendamiento,
      query.importe_operaciones,
      query.importe_metalico,
      query.importe_inmuebles,
      query.ejercicio_importe,
      query.importe_oper_t1,
      query.importe_inmuebles_t1,
      query.importe_oper_t2,
      query.importe_inmuebles_t2,
      query.importe_oper_t3,
      query.importe_inmuebles_t3,
      query.importe_oper_t4,
      query.importe_inmuebles_t4,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_347_EXTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_EXTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_EXTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_EXTERNOS'
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
      CAST(doc_347.OXSECUE AS varchar) AS secuencia,
      coalesce(administracion.id_administracion,indefinidos.id_administracion) AS id_administracion,
      doc_347.OXNIFDD AS nif_declarado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      1 AS es_externo,
      CASE WHEN doc_347.OXREPRE='S' THEN 1 ELSE 0 END AS es_representante,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      doc_347.OXPAIS AS cod_pais,
      coalesce(tipo_operacion_fact.id_tipo_operacion_fact,indefinidos.id_tipo_operacion_fact) AS id_tipo_operacion_fact,
      CASE WHEN doc_347.OXNIFCO='S' THEN 1 ELSE 0 END AS es_identificado,
      CASE WHEN doc_347.OXSEGUR='S' THEN 1 ELSE 0 END AS es_seguro,
      CASE WHEN doc_347.OXARREN='S' THEN 1 ELSE 0 END AS es_arrendamiento,
      doc_347.OXANAGR AS ext_anagrama,
      doc_347.OXNOMRS AS ext_nombre,
      doc_347.OXDOMIC AS ext_domicilio,
      doc_347.OXCODPO AS ext_cod_postal,
      doc_347.OXMUNIC AS ext_municipio,
      doc_347.OXFJURI AS ext_cod_forma_juridica,
      doc_347.IPI3OP_OXIMOPE/100 AS importe_operaciones,
      doc_347.IPI3OP_OXIMPER/100 AS importe_metalico,
      doc_347.IPI3OP_OXIMIVA/100 AS importe_inmuebles,
      doc_347.IPI3OP_EJERDEC AS ejercicio_importe,
      doc_347.IPI3OP_OXIMOPE_T1/100 AS importe_oper_t1,
      doc_347.IPI3OP_OXIMIVA_T1/100 AS importe_inmuebles_t1,
      doc_347.IPI3OP_OXIMOPE_T2/100 AS importe_oper_t2,
      doc_347.IPI3OP_OXIMIVA_T2/100 AS importe_inmuebles_t2,
      doc_347.IPI3OP_OXIMOPE_T3/100 AS importe_oper_t3,
      doc_347.IPI3OP_OXIMIVA_T3/100 AS importe_inmuebles_t3,
      doc_347.IPI3OP_OXIMOPE_T4/100 AS importe_oper_t4,
      doc_347.IPI3OP_OXIMIVA_T4/100 AS importe_inmuebles_t4
    FROM dbn1_stg_dhyf.dbo.tbn1i3op_ip doc_347
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(doc_347.OXEJERC AS varchar)+'FD'+CAST(doc_347.OXREFER AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (doc_347.OXNIFDD=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=doc_347.OXPROPR)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura tipo_operacion_fact ON (tipo_operacion_fact.cod_tipo_operacion_fact=doc_347.OXCLAOP)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda administracion ON (administracion.cod_administracion=substring(doc_347.OXREFER,1,1))
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      CAST(doc_347.OXSECUE AS varchar),
      coalesce(administracion.id_administracion,indefinidos.id_administracion),
      doc_347.OXNIFDD,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN doc_347.OXREPRE='S' THEN 1 ELSE 0 END,
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      doc_347.OXPAIS,
      coalesce(tipo_operacion_fact.id_tipo_operacion_fact,indefinidos.id_tipo_operacion_fact),
      CASE WHEN doc_347.OXNIFCO='S' THEN 1 ELSE 0 END,
      CASE WHEN doc_347.OXSEGUR='S' THEN 1 ELSE 0 END,
      CASE WHEN doc_347.OXARREN='S' THEN 1 ELSE 0 END,
      doc_347.OXANAGR,
      doc_347.OXNOMRS,
      doc_347.OXDOMIC,
      doc_347.OXCODPO,
      doc_347.OXMUNIC,
      doc_347.OXFJURI,
      doc_347.IPI3OP_OXIMOPE/100,
      doc_347.IPI3OP_OXIMPER/100,
      doc_347.IPI3OP_OXIMIVA/100,
      doc_347.IPI3OP_EJERDEC,
      doc_347.IPI3OP_OXIMOPE_T1/100,
      doc_347.IPI3OP_OXIMIVA_T1/100,
      doc_347.IPI3OP_OXIMOPE_T2/100,
      doc_347.IPI3OP_OXIMIVA_T2/100,
      doc_347.IPI3OP_OXIMOPE_T3/100,
      doc_347.IPI3OP_OXIMIVA_T3/100,
      doc_347.IPI3OP_OXIMOPE_T4/100,
      doc_347.IPI3OP_OXIMIVA_T4/100
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros AS tbn1_detalles_informativos_347_operaciones_con_terceros
  USING query ON query.id_documento=tbn1_detalles_informativos_347_operaciones_con_terceros.id_documento AND query.secuencia=tbn1_detalles_informativos_347_operaciones_con_terceros.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo=1
                    AND (tbn1_detalles_informativos_347_operaciones_con_terceros.id_administracion<>query.id_administracion OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_347_operaciones_con_terceros.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo<>query.es_externo OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_representante<>query.es_representante OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.cod_pais<>query.cod_pais OR (tbn1_detalles_informativos_347_operaciones_con_terceros.cod_pais IS NULL AND query.cod_pais IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.id_tipo_operacion_fact<>query.id_tipo_operacion_fact OR (tbn1_detalles_informativos_347_operaciones_con_terceros.id_tipo_operacion_fact IS NULL AND query.id_tipo_operacion_fact IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.id_tipo_operacion_fact IS NOT NULL AND query.id_tipo_operacion_fact IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_seguro<>query.es_seguro OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_seguro IS NULL AND query.es_seguro IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_seguro IS NOT NULL AND query.es_seguro IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.es_arrendamiento<>query.es_arrendamiento OR (tbn1_detalles_informativos_347_operaciones_con_terceros.es_arrendamiento IS NULL AND query.es_arrendamiento IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.es_arrendamiento IS NOT NULL AND query.es_arrendamiento IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ext_anagrama<>query.ext_anagrama OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_anagrama IS NULL AND query.ext_anagrama IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_anagrama IS NOT NULL AND query.ext_anagrama IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ext_nombre<>query.ext_nombre OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_nombre IS NULL AND query.ext_nombre IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_nombre IS NOT NULL AND query.ext_nombre IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ext_domicilio<>query.ext_domicilio OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_domicilio IS NULL AND query.ext_domicilio IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_domicilio IS NOT NULL AND query.ext_domicilio IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ext_cod_postal<>query.ext_cod_postal OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_cod_postal IS NULL AND query.ext_cod_postal IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_cod_postal IS NOT NULL AND query.ext_cod_postal IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ext_municipio<>query.ext_municipio OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_municipio IS NULL AND query.ext_municipio IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_municipio IS NOT NULL AND query.ext_municipio IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ext_cod_forma_juridica<>query.ext_cod_forma_juridica OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_cod_forma_juridica IS NULL AND query.ext_cod_forma_juridica IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ext_cod_forma_juridica IS NOT NULL AND query.ext_cod_forma_juridica IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operaciones<>query.importe_operaciones OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operaciones IS NULL AND query.importe_operaciones IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_operaciones IS NOT NULL AND query.importe_operaciones IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_metalico<>query.importe_metalico OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_metalico IS NULL AND query.importe_metalico IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_metalico IS NOT NULL AND query.importe_metalico IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles<>query.importe_inmuebles OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles IS NULL AND query.importe_inmuebles IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles IS NOT NULL AND query.importe_inmuebles IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.ejercicio_importe<>query.ejercicio_importe OR (tbn1_detalles_informativos_347_operaciones_con_terceros.ejercicio_importe IS NULL AND query.ejercicio_importe IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.ejercicio_importe IS NOT NULL AND query.ejercicio_importe IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t1<>query.importe_oper_t1 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t1 IS NULL AND query.importe_oper_t1 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t1 IS NOT NULL AND query.importe_oper_t1 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t1<>query.importe_inmuebles_t1 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t1 IS NULL AND query.importe_inmuebles_t1 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t1 IS NOT NULL AND query.importe_inmuebles_t1 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t2<>query.importe_oper_t2 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t2 IS NULL AND query.importe_oper_t2 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t2 IS NOT NULL AND query.importe_oper_t2 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t2<>query.importe_inmuebles_t2 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t2 IS NULL AND query.importe_inmuebles_t2 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t2 IS NOT NULL AND query.importe_inmuebles_t2 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t3<>query.importe_oper_t3 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t3 IS NULL AND query.importe_oper_t3 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t3 IS NOT NULL AND query.importe_oper_t3 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t3<>query.importe_inmuebles_t3 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t3 IS NULL AND query.importe_inmuebles_t3 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t3 IS NOT NULL AND query.importe_inmuebles_t3 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t4<>query.importe_oper_t4 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t4 IS NULL AND query.importe_oper_t4 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_oper_t4 IS NOT NULL AND query.importe_oper_t4 IS NULL)
                    OR tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t4<>query.importe_inmuebles_t4 OR (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t4 IS NULL AND query.importe_inmuebles_t4 IS NOT NULL) OR  (tbn1_detalles_informativos_347_operaciones_con_terceros.importe_inmuebles_t4 IS NOT NULL AND query.importe_inmuebles_t4 IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_administracion=query.id_administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      id_provincia=query.id_provincia,
      cod_pais=query.cod_pais,
      id_tipo_operacion_fact=query.id_tipo_operacion_fact,
      es_identificado=query.es_identificado,
      es_seguro=query.es_seguro,
      es_arrendamiento=query.es_arrendamiento,
      ext_anagrama=query.ext_anagrama,
      ext_nombre=query.ext_nombre,
      ext_domicilio=query.ext_domicilio,
      ext_cod_postal=query.ext_cod_postal,
      ext_municipio=query.ext_municipio,
      ext_cod_forma_juridica=query.ext_cod_forma_juridica,
      importe_operaciones=query.importe_operaciones,
      importe_metalico=query.importe_metalico,
      importe_inmuebles=query.importe_inmuebles,
      ejercicio_importe=query.ejercicio_importe,
      importe_oper_t1=query.importe_oper_t1,
      importe_inmuebles_t1=query.importe_inmuebles_t1,
      importe_oper_t2=query.importe_oper_t2,
      importe_inmuebles_t2=query.importe_inmuebles_t2,
      importe_oper_t3=query.importe_oper_t3,
      importe_inmuebles_t3=query.importe_inmuebles_t3,
      importe_oper_t4=query.importe_oper_t4,
      importe_inmuebles_t4=query.importe_inmuebles_t4,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,id_administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,id_provincia,cod_pais,id_tipo_operacion_fact,es_identificado,es_seguro,es_arrendamiento,ext_anagrama,ext_nombre,ext_domicilio,ext_cod_postal,ext_municipio,ext_cod_forma_juridica,importe_operaciones,importe_metalico,importe_inmuebles,ejercicio_importe,importe_oper_t1,importe_inmuebles_t1,importe_oper_t2,importe_inmuebles_t2,importe_oper_t3,importe_inmuebles_t3,importe_oper_t4,importe_inmuebles_t4,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.id_administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.id_provincia,
      query.cod_pais,
      query.id_tipo_operacion_fact,
      query.es_identificado,
      query.es_seguro,
      query.es_arrendamiento,
      query.ext_anagrama,
      query.ext_nombre,
      query.ext_domicilio,
      query.ext_cod_postal,
      query.ext_municipio,
      query.ext_cod_forma_juridica,
      query.importe_operaciones,
      query.importe_metalico,
      query.importe_inmuebles,
      query.ejercicio_importe,
      query.importe_oper_t1,
      query.importe_inmuebles_t1,
      query.importe_oper_t2,
      query.importe_inmuebles_t2,
      query.importe_oper_t3,
      query.importe_inmuebles_t3,
      query.importe_oper_t4,
      query.importe_inmuebles_t4,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_347_operaciones_con_terceros.es_externo=1
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion(
  id_arrend_oper_347 int IDENTITY(1,1),
  id_detalles_347 int NOT NULL,
  orden varchar(5) NOT NULL,
  es_externo bit,
  importe_arrendamiento numeric(18,2),
  ref_catastral varchar(25),
  tipo_via varchar(2),
  nombre_via varchar(33),
  cod_portal varchar(5),
  cod_portal_bis varchar(1),
  elementos_portal varchar(6),
  id_municipio int NOT NULL,
  id_provincia int NOT NULL,
  cod_distrito_postal varchar(3),
  importe_operaciones numeric(18,2),
  cod_situacion varchar(1),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod347_arr_op UNIQUE (id_detalles_347,orden),
  CONSTRAINT PK_tbn1_detalles_informativos_347_arrendamientos_por_operacion PRIMARY KEY CLUSTERED (id_arrend_oper_347),
  CONSTRAINT FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_detalles_informativos_347_operaciones_con_terceros FOREIGN KEY (id_detalles_347) REFERENCES dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros(id_detalles_347),
  CONSTRAINT FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_municipios FOREIGN KEY (id_municipio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_municipios(id_municipio),
  CONSTRAINT FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_arrend_oper_347')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD id_arrend_oper_347 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_detalles_347')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD id_detalles_347 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='orden')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD orden varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='importe_arrendamiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD importe_arrendamiento numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='ref_catastral')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD ref_catastral varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='tipo_via')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD tipo_via varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='nombre_via')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD nombre_via varchar(33)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD cod_portal varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_portal_bis')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD cod_portal_bis varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='elementos_portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD elementos_portal varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD id_municipio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_distrito_postal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD cod_distrito_postal varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='importe_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD importe_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_situacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD cod_situacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_347_ARRENDAMIENTOS_POR_OPERACION_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_arrend_oper_347' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN id_arrend_oper_347 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_detalles_347' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN id_detalles_347 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='orden' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN orden varchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='importe_arrendamiento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN importe_arrendamiento numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='ref_catastral' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN ref_catastral varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='tipo_via' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN tipo_via varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='nombre_via' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN nombre_via varchar(33) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_portal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN cod_portal varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_portal_bis' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN cod_portal_bis varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='elementos_portal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN elementos_portal varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_municipio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN id_municipio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN id_provincia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_distrito_postal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN cod_distrito_postal varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='importe_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN importe_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='cod_situacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN cod_situacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_347_arrendamientos_por_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD CONSTRAINT PK_tbn1_detalles_informativos_347_arrendamientos_por_operacion PRIMARY KEY CLUSTERED (id_arrend_oper_347)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_detalles_informativos_347_operaciones_con_terceros')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD CONSTRAINT FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_detalles_informativos_347_operaciones_con_terceros FOREIGN KEY (id_detalles_347) REFERENCES dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros(id_detalles_347)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_municipios')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD CONSTRAINT FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_municipios FOREIGN KEY (id_municipio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_municipios(id_municipio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_347_arrendamientos_por_operacion' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion ADD CONSTRAINT FK_tbn1_detalles_informativos_347_arrendamientos_por_operacion_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_INTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_INTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_INTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_I'
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
      det_347.id_detalles_347 AS id_detalles_347,
      CAST(arre_347.ARORDEN AS varchar) AS orden,
      0 AS es_externo,
      arre_347.ARIMOPE/100 AS importe_arrendamiento,
      arre_347.ARREFCAT AS ref_catastral,
      arre_347.ARSIGLAS AS tipo_via,
      arre_347.ARVIAPUB AS nombre_via,
      arre_347.ARPORTAL AS cod_portal,
      arre_347.ARPORBIS AS cod_portal_bis,
      arre_347.ARELEMEN AS elementos_portal,
      coalesce(municipio.id_municipio,indefinidos.id_municipio) AS id_municipio,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      CAST(arre_347.ARDISPOS AS varchar) AS cod_distrito_postal,
      arre_347.IPARRE_ARIMOPE/100 AS importe_operaciones,
      arre_347.IPARRE_ARSITUA AS cod_situacion
    FROM dbn1_stg_dhyf.dbo.tbn1arre_ip arre_347
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(arre_347.AREJERC AS varchar)+'FD'+CAST(arre_347.ARREFER AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros det_347 ON (det_347.id_documento=doc.id_documento AND det_347.secuencia=arre_347.ARSECUE)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=arre_347.ARCODPRO)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_municipios municipio ON (municipio.cod_municipio=arre_347.ARCODMUN AND municipio.cod_provincia=arre_347.ARCODPRO)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      det_347.id_detalles_347,
      CAST(arre_347.ARORDEN AS varchar),
      arre_347.ARIMOPE/100,
      arre_347.ARREFCAT,
      arre_347.ARSIGLAS,
      arre_347.ARVIAPUB,
      arre_347.ARPORTAL,
      arre_347.ARPORBIS,
      arre_347.ARELEMEN,
      coalesce(municipio.id_municipio,indefinidos.id_municipio),
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      CAST(arre_347.ARDISPOS AS varchar),
      arre_347.IPARRE_ARIMOPE/100,
      arre_347.IPARRE_ARSITUA
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion AS tbn1_detalles_informativos_347_arrendamientos_por_operacion
  USING query ON query.id_detalles_347=tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_detalles_347 AND query.orden=tbn1_detalles_informativos_347_arrendamientos_por_operacion.orden
  WHEN MATCHED AND (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo=0
                    AND (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo<>query.es_externo OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_arrendamiento<>query.importe_arrendamiento OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_arrendamiento IS NULL AND query.importe_arrendamiento IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_arrendamiento IS NOT NULL AND query.importe_arrendamiento IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.ref_catastral<>query.ref_catastral OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.ref_catastral IS NULL AND query.ref_catastral IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.ref_catastral IS NOT NULL AND query.ref_catastral IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.tipo_via<>query.tipo_via OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.tipo_via IS NULL AND query.tipo_via IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.tipo_via IS NOT NULL AND query.tipo_via IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.nombre_via<>query.nombre_via OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.nombre_via IS NULL AND query.nombre_via IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.nombre_via IS NOT NULL AND query.nombre_via IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal<>query.cod_portal OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal IS NULL AND query.cod_portal IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal IS NOT NULL AND query.cod_portal IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal_bis<>query.cod_portal_bis OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal_bis IS NULL AND query.cod_portal_bis IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal_bis IS NOT NULL AND query.cod_portal_bis IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.elementos_portal<>query.elementos_portal OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.elementos_portal IS NULL AND query.elementos_portal IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.elementos_portal IS NOT NULL AND query.elementos_portal IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_municipio<>query.id_municipio OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_municipio IS NULL AND query.id_municipio IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_municipio IS NOT NULL AND query.id_municipio IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_distrito_postal<>query.cod_distrito_postal OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_distrito_postal IS NULL AND query.cod_distrito_postal IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_distrito_postal IS NOT NULL AND query.cod_distrito_postal IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_operaciones<>query.importe_operaciones OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_operaciones IS NULL AND query.importe_operaciones IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_operaciones IS NOT NULL AND query.importe_operaciones IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_situacion<>query.cod_situacion OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_situacion IS NULL AND query.cod_situacion IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_situacion IS NOT NULL AND query.cod_situacion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      es_externo=query.es_externo,
      importe_arrendamiento=query.importe_arrendamiento,
      ref_catastral=query.ref_catastral,
      tipo_via=query.tipo_via,
      nombre_via=query.nombre_via,
      cod_portal=query.cod_portal,
      cod_portal_bis=query.cod_portal_bis,
      elementos_portal=query.elementos_portal,
      id_municipio=query.id_municipio,
      id_provincia=query.id_provincia,
      cod_distrito_postal=query.cod_distrito_postal,
      importe_operaciones=query.importe_operaciones,
      cod_situacion=query.cod_situacion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_detalles_347,orden,es_externo,importe_arrendamiento,ref_catastral,tipo_via,nombre_via,cod_portal,cod_portal_bis,elementos_portal,id_municipio,id_provincia,cod_distrito_postal,importe_operaciones,cod_situacion,fec_alta,fec_modificacion) VALUES (
      query.id_detalles_347,
      query.orden,
      query.es_externo,
      query.importe_arrendamiento,
      query.ref_catastral,
      query.tipo_via,
      query.nombre_via,
      query.cod_portal,
      query.cod_portal_bis,
      query.elementos_portal,
      query.id_municipio,
      query.id_provincia,
      query.cod_distrito_postal,
      query.importe_operaciones,
      query.cod_situacion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_EXTERNOS' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_EXTERNOS;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_EXTERNOS(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_E'
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
      det_347.id_detalles_347 AS id_detalles_347,
      CAST(arre_347.AXORDEN AS varchar) AS orden,
      1 AS es_externo,
      arre_347.AXIMOPE/100 AS importe_arrendamiento,
      arre_347.AXREFCAT AS ref_catastral,
      arre_347.AXSIGLAS AS tipo_via,
      arre_347.AXVIAPUB AS nombre_via,
      arre_347.AXPORTAL AS cod_portal,
      arre_347.AXPORBIS AS cod_portal_bis,
      arre_347.AXELEMEN AS elementos_portal,
      coalesce(municipio.id_municipio,indefinidos.id_municipio) AS id_municipio,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      CAST(arre_347.AXDISPOS AS varchar) AS cod_distrito_postal,
      arre_347.IPI3AR_AXIMOPE/100 AS importe_operaciones,
      arre_347.IPI3AR_AXSITUA AS cod_situacion
    FROM dbn1_stg_dhyf.dbo.tbn1i3ar_ip arre_347
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(arre_347.AXEJERC AS varchar)+'FD'+CAST(arre_347.AXREFER AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros det_347 ON (det_347.id_documento=doc.id_documento AND det_347.secuencia=arre_347.AXSECUE)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=arre_347.AXCODPRO)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_municipios municipio ON (municipio.cod_municipio=arre_347.AXCODMUN AND municipio.cod_provincia=arre_347.AXCODPRO)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      det_347.id_detalles_347,
      CAST(arre_347.AXORDEN AS varchar),
      arre_347.AXIMOPE/100,
      arre_347.AXREFCAT,
      arre_347.AXSIGLAS,
      arre_347.AXVIAPUB,
      arre_347.AXPORTAL,
      arre_347.AXPORBIS,
      arre_347.AXELEMEN,
      coalesce(municipio.id_municipio,indefinidos.id_municipio),
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      CAST(arre_347.AXDISPOS AS varchar),
      arre_347.IPI3AR_AXIMOPE/100,
      arre_347.IPI3AR_AXSITUA
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion AS tbn1_detalles_informativos_347_arrendamientos_por_operacion
  USING query ON query.id_detalles_347=tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_detalles_347 AND query.orden=tbn1_detalles_informativos_347_arrendamientos_por_operacion.orden
  WHEN MATCHED AND (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo=1
                    AND (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo<>query.es_externo OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_arrendamiento<>query.importe_arrendamiento OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_arrendamiento IS NULL AND query.importe_arrendamiento IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_arrendamiento IS NOT NULL AND query.importe_arrendamiento IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.ref_catastral<>query.ref_catastral OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.ref_catastral IS NULL AND query.ref_catastral IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.ref_catastral IS NOT NULL AND query.ref_catastral IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.tipo_via<>query.tipo_via OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.tipo_via IS NULL AND query.tipo_via IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.tipo_via IS NOT NULL AND query.tipo_via IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.nombre_via<>query.nombre_via OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.nombre_via IS NULL AND query.nombre_via IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.nombre_via IS NOT NULL AND query.nombre_via IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal<>query.cod_portal OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal IS NULL AND query.cod_portal IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal IS NOT NULL AND query.cod_portal IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal_bis<>query.cod_portal_bis OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal_bis IS NULL AND query.cod_portal_bis IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_portal_bis IS NOT NULL AND query.cod_portal_bis IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.elementos_portal<>query.elementos_portal OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.elementos_portal IS NULL AND query.elementos_portal IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.elementos_portal IS NOT NULL AND query.elementos_portal IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_municipio<>query.id_municipio OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_municipio IS NULL AND query.id_municipio IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_municipio IS NOT NULL AND query.id_municipio IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_distrito_postal<>query.cod_distrito_postal OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_distrito_postal IS NULL AND query.cod_distrito_postal IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_distrito_postal IS NOT NULL AND query.cod_distrito_postal IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_operaciones<>query.importe_operaciones OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_operaciones IS NULL AND query.importe_operaciones IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.importe_operaciones IS NOT NULL AND query.importe_operaciones IS NULL)
                    OR tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_situacion<>query.cod_situacion OR (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_situacion IS NULL AND query.cod_situacion IS NOT NULL) OR  (tbn1_detalles_informativos_347_arrendamientos_por_operacion.cod_situacion IS NOT NULL AND query.cod_situacion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      es_externo=query.es_externo,
      importe_arrendamiento=query.importe_arrendamiento,
      ref_catastral=query.ref_catastral,
      tipo_via=query.tipo_via,
      nombre_via=query.nombre_via,
      cod_portal=query.cod_portal,
      cod_portal_bis=query.cod_portal_bis,
      elementos_portal=query.elementos_portal,
      id_municipio=query.id_municipio,
      id_provincia=query.id_provincia,
      cod_distrito_postal=query.cod_distrito_postal,
      importe_operaciones=query.importe_operaciones,
      cod_situacion=query.cod_situacion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_detalles_347,orden,es_externo,importe_arrendamiento,ref_catastral,tipo_via,nombre_via,cod_portal,cod_portal_bis,elementos_portal,id_municipio,id_provincia,cod_distrito_postal,importe_operaciones,cod_situacion,fec_alta,fec_modificacion) VALUES (
      query.id_detalles_347,
      query.orden,
      query.es_externo,
      query.importe_arrendamiento,
      query.ref_catastral,
      query.tipo_via,
      query.nombre_via,
      query.cod_portal,
      query.cod_portal_bis,
      query.elementos_portal,
      query.id_municipio,
      query.id_provincia,
      query.cod_distrito_postal,
      query.importe_operaciones,
      query.cod_situacion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_347_arrendamientos_por_operacion.es_externo=1
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_347' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_347;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_347(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_modelo_347'
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

  IF EXISTS (SELECT *
  FROM dbo.tbn1oper_ip
  WHERE ipoper_fecha_carga>@fecha_ultima_carga
  ) BEGIN
  
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_347_INTERNOS @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_347_EXTERNOS @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_INTERNOS @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_EXTERNOS @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_INTERNOS @log;
    
    EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_347_arrendamientos_por_operacion_EXTERNOS @log;
    
    
  END

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

