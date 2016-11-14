PRINT 'cargar_dimensional_modelo_347.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  cod_administracion varchar(1),
  administracion varchar(50),
  nif_declarante varchar(12) NOT NULL,
  razon_social varchar(25) NOT NULL,
  cod_forma_juridica varchar(1) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int NOT NULL,
  es_externo varchar(1) NOT NULL,
  es_complementaria varchar(1) NOT NULL,
  es_sustitutiva varchar(1) NOT NULL,
  cod_origen_grabacion varchar(1),
  origen_grabacion varchar(50),
  num_nifs_carga int,
  num_nifs_identif_carga int,
  num_nifs_carga_ext int,
  num_nifs_identif_carga_ext int,
  clave_actividad_principal varchar(1) NOT NULL,
  epigrafe_actividad_principal varchar(6) NOT NULL,
  clave_segunda_actividad varchar(1) NOT NULL,
  epigrafe_segunda_actividad varchar(6) NOT NULL,
  ref_presentacion_colectiva int,
  contador_revisiones int,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  fec_presentacion date,
  cod_provincia int,
  provincia varchar(50),
  num_caja varchar(8) NOT NULL,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_347_oper_con_terceros PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_347_oper_con_terceros_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD cod_administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD administracion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_forma_juridica')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD cod_forma_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD es_complementaria varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD es_sustitutiva varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_origen_grabacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD cod_origen_grabacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='origen_grabacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD origen_grabacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_carga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD num_nifs_carga int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD num_nifs_identif_carga int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_carga_ext')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD num_nifs_carga_ext int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga_ext')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD num_nifs_identif_carga_ext int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='clave_actividad_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD clave_actividad_principal varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='epigrafe_actividad_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD epigrafe_actividad_principal varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='clave_segunda_actividad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD clave_segunda_actividad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='epigrafe_segunda_actividad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD epigrafe_segunda_actividad varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='ref_presentacion_colectiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD ref_presentacion_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD cod_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD num_caja varchar(8)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN cod_administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN administracion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN razon_social varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_forma_juridica' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN cod_forma_juridica varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN es_complementaria varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN es_sustitutiva varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_origen_grabacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN cod_origen_grabacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='origen_grabacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN origen_grabacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_carga' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN num_nifs_carga int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN num_nifs_identif_carga int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_carga_ext' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN num_nifs_carga_ext int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_nifs_identif_carga_ext' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN num_nifs_identif_carga_ext int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='clave_actividad_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN clave_actividad_principal varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='epigrafe_actividad_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN epigrafe_actividad_principal varchar(6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='clave_segunda_actividad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN clave_segunda_actividad varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='epigrafe_segunda_actividad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN epigrafe_segunda_actividad varchar(6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='ref_presentacion_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN ref_presentacion_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='cod_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN cod_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN provincia varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_347_oper_con_terceros')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_347_oper_con_terceros PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_347_oper_con_terceros' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_347_oper_con_terceros_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_347_oper_con_terceros_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_347_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_347_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_347_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_documentos_informativos_347_ssis',
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

  -- Materialized query: query
  SELECT
    doc_347.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    administracion.cod_administracion AS cod_administracion,
    administracion.administracion AS administracion,
    coalesce(left(doc_347.nif_declarante,9)+' '+right(doc_347.nif_declarante,2),'') AS nif_declarante,
    coalesce(doc_347.razon_social,'') AS razon_social,
    coalesce(doc_347.cod_forma_juridica,'') AS cod_forma_juridica,
    CASE WHEN doc_347.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_347.id_contribuyente AS id_contribuyente,
    CASE WHEN doc_347.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN doc_347.es_complementaria=1 THEN 'S' ELSE 'N' END AS es_complementaria,
    CASE WHEN doc_347.es_sustitutiva=1 THEN 'S' ELSE 'N' END AS es_sustitutiva,
    tipo_grab.cod_origen_grabacion_mi AS cod_origen_grabacion,
    tipo_grab.origen_grabacion AS origen_grabacion,
    doc_347.num_nifs_carga AS num_nifs_carga,
    doc_347.num_nifs_identif_carga AS num_nifs_identif_carga,
    doc_347.num_nifs_carga_ext AS num_nifs_carga_ext,
    doc_347.num_nifs_identif_carga_ext AS num_nifs_identif_carga_ext,
    coalesce(doc_347.clave_actividad_principal,'') AS clave_actividad_principal,
    coalesce(doc_347.epigrafe_actividad_principal,'') AS epigrafe_actividad_principal,
    coalesce(doc_347.clave_segunda_actividad,'') AS clave_segunda_actividad,
    coalesce(doc_347.epigrafe_segunda_actividad,'') AS epigrafe_segunda_actividad,
    doc_347.ref_presentacion_colectiva AS ref_presentacion_colectiva,
    doc_347.contador_revisiones AS contador_revisiones,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_347.fec_presentacion AS fec_presentacion,
    provincia.cod_provincia AS cod_provincia,
    provincia.provincia AS provincia,
    coalesce(doc_347.num_caja,'') AS num_caja,
    doc_347.fec_baja AS fec_baja
  INTO #query__0F8D1
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_347_operaciones_con_terceros doc_347
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_347.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_347.id_tipo_presentacion)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion tipo_grab ON (tipo_grab.id_origen_grabacion=doc_347.id_origen_grabacion)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=doc_347.id_provincia)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda administracion ON (administracion.id_administracion=doc_347.id_administracion)
  WHERE doc_347.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__B3973 ON #query__0F8D1 (id_documento)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros AS tbn1_dim_documentos_informativos_347_oper_con_terceros
  USING #query__0F8D1 AS query ON query.id_documento=tbn1_dim_documentos_informativos_347_oper_con_terceros.id_documento
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_347_oper_con_terceros AS tbn1_dim_documentos_informativos_347_oper_con_terceros
  USING #query__0F8D1 AS query ON query.id_documento=tbn1_dim_documentos_informativos_347_oper_con_terceros.id_documento
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_347_oper_con_terceros.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_administracion<>query.cod_administracion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_administracion IS NULL AND query.cod_administracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_administracion IS NOT NULL AND query.cod_administracion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.administracion<>query.administracion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_forma_juridica<>query.cod_forma_juridica OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_forma_juridica IS NULL AND query.cod_forma_juridica IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_forma_juridica IS NOT NULL AND query.cod_forma_juridica IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.es_externo<>query.es_externo OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.es_complementaria<>query.es_complementaria OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.es_sustitutiva<>query.es_sustitutiva OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_origen_grabacion<>query.cod_origen_grabacion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_origen_grabacion IS NULL AND query.cod_origen_grabacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_origen_grabacion IS NOT NULL AND query.cod_origen_grabacion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.origen_grabacion<>query.origen_grabacion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.origen_grabacion IS NULL AND query.origen_grabacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.origen_grabacion IS NOT NULL AND query.origen_grabacion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_carga<>query.num_nifs_carga OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_carga IS NULL AND query.num_nifs_carga IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_carga IS NOT NULL AND query.num_nifs_carga IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_identif_carga<>query.num_nifs_identif_carga OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_identif_carga IS NULL AND query.num_nifs_identif_carga IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_identif_carga IS NOT NULL AND query.num_nifs_identif_carga IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_carga_ext<>query.num_nifs_carga_ext OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_carga_ext IS NULL AND query.num_nifs_carga_ext IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_carga_ext IS NOT NULL AND query.num_nifs_carga_ext IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_identif_carga_ext<>query.num_nifs_identif_carga_ext OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_identif_carga_ext IS NULL AND query.num_nifs_identif_carga_ext IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_nifs_identif_carga_ext IS NOT NULL AND query.num_nifs_identif_carga_ext IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.clave_actividad_principal<>query.clave_actividad_principal OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.clave_actividad_principal IS NULL AND query.clave_actividad_principal IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.clave_actividad_principal IS NOT NULL AND query.clave_actividad_principal IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.epigrafe_actividad_principal<>query.epigrafe_actividad_principal OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.epigrafe_actividad_principal IS NULL AND query.epigrafe_actividad_principal IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.epigrafe_actividad_principal IS NOT NULL AND query.epigrafe_actividad_principal IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.clave_segunda_actividad<>query.clave_segunda_actividad OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.clave_segunda_actividad IS NULL AND query.clave_segunda_actividad IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.clave_segunda_actividad IS NOT NULL AND query.clave_segunda_actividad IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.epigrafe_segunda_actividad<>query.epigrafe_segunda_actividad OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.epigrafe_segunda_actividad IS NULL AND query.epigrafe_segunda_actividad IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.epigrafe_segunda_actividad IS NOT NULL AND query.epigrafe_segunda_actividad IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.ref_presentacion_colectiva<>query.ref_presentacion_colectiva OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.ref_presentacion_colectiva IS NULL AND query.ref_presentacion_colectiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.ref_presentacion_colectiva IS NOT NULL AND query.ref_presentacion_colectiva IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_provincia<>query.cod_provincia OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.provincia<>query.provincia OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_dim_documentos_informativos_347_oper_con_terceros.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_347_oper_con_terceros.num_caja IS NOT NULL AND query.num_caja IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      cod_administracion=query.cod_administracion,
      administracion=query.administracion,
      nif_declarante=query.nif_declarante,
      razon_social=query.razon_social,
      cod_forma_juridica=query.cod_forma_juridica,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_complementaria=query.es_complementaria,
      es_sustitutiva=query.es_sustitutiva,
      cod_origen_grabacion=query.cod_origen_grabacion,
      origen_grabacion=query.origen_grabacion,
      num_nifs_carga=query.num_nifs_carga,
      num_nifs_identif_carga=query.num_nifs_identif_carga,
      num_nifs_carga_ext=query.num_nifs_carga_ext,
      num_nifs_identif_carga_ext=query.num_nifs_identif_carga_ext,
      clave_actividad_principal=query.clave_actividad_principal,
      epigrafe_actividad_principal=query.epigrafe_actividad_principal,
      clave_segunda_actividad=query.clave_segunda_actividad,
      epigrafe_segunda_actividad=query.epigrafe_segunda_actividad,
      ref_presentacion_colectiva=query.ref_presentacion_colectiva,
      contador_revisiones=query.contador_revisiones,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      cod_provincia=query.cod_provincia,
      provincia=query.provincia,
      num_caja=query.num_caja
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,cod_administracion,administracion,nif_declarante,razon_social,cod_forma_juridica,es_contribuyente,id_contribuyente,es_externo,es_complementaria,es_sustitutiva,cod_origen_grabacion,origen_grabacion,num_nifs_carga,num_nifs_identif_carga,num_nifs_carga_ext,num_nifs_identif_carga_ext,clave_actividad_principal,epigrafe_actividad_principal,clave_segunda_actividad,epigrafe_segunda_actividad,ref_presentacion_colectiva,contador_revisiones,cod_tipo_presentacion,tipo_presentacion,fec_presentacion,cod_provincia,provincia,num_caja) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.cod_administracion,
      query.administracion,
      query.nif_declarante,
      query.razon_social,
      query.cod_forma_juridica,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_complementaria,
      query.es_sustitutiva,
      query.cod_origen_grabacion,
      query.origen_grabacion,
      query.num_nifs_carga,
      query.num_nifs_identif_carga,
      query.num_nifs_carga_ext,
      query.num_nifs_identif_carga_ext,
      query.clave_actividad_principal,
      query.epigrafe_actividad_principal,
      query.clave_segunda_actividad,
      query.epigrafe_segunda_actividad,
      query.ref_presentacion_colectiva,
      query.contador_revisiones,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.fec_presentacion,
      query.cod_provincia,
      query.provincia,
      query.num_caja);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1(
  id_detalles_347 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  cod_administracion varchar(1),
  administracion varchar(50),
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int NOT NULL,
  es_externo varchar(1) NOT NULL,
  es_representante varchar(1) NOT NULL,
  cod_tipo_operacion_fact varchar(1) NOT NULL,
  tipo_operacion_fact varchar(50) NOT NULL,
  importe_operacion numeric(18,2),
  cod_provincia int NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_pais varchar(3),
  es_identificado varchar(1) NOT NULL,
  cod_origen_identif varchar(1),
  es_seguro varchar(1) NOT NULL,
  es_arrendamiento varchar(1) NOT NULL,
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
  CONSTRAINT PK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 PRIMARY KEY CLUSTERED (id_detalles_347),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='id_detalles_347')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD id_detalles_347 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD cod_administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD administracion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_tipo_operacion_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD cod_tipo_operacion_fact varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='tipo_operacion_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD tipo_operacion_fact varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_operacion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD cod_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD cod_pais varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_origen_identif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD cod_origen_identif varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_seguro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD es_seguro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_arrendamiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD es_arrendamiento varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_anagrama')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ext_anagrama varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_nombre')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ext_nombre varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_domicilio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ext_domicilio varchar(32)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_cod_postal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ext_cod_postal varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_municipio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ext_municipio varchar(21)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_cod_forma_juridica')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ext_cod_forma_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_metalico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_metalico numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_inmuebles numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ejercicio_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD ejercicio_importe smallint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_oper_t1 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_inmuebles_t1 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_oper_t2 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_inmuebles_t2 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_oper_t3 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_inmuebles_t3 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t4')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_oper_t4 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t4')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD importe_inmuebles_t4 numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='id_detalles_347' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN id_detalles_347 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN cod_administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN administracion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_tipo_operacion_fact' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN cod_tipo_operacion_fact varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='tipo_operacion_fact' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN tipo_operacion_fact varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_operacion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN cod_provincia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_pais' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN cod_pais varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='cod_origen_identif' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN cod_origen_identif varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_seguro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN es_seguro varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='es_arrendamiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN es_arrendamiento varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_anagrama' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ext_anagrama varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_nombre' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ext_nombre varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_domicilio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ext_domicilio varchar(32) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_cod_postal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ext_cod_postal varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_municipio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ext_municipio varchar(21) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ext_cod_forma_juridica' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ext_cod_forma_juridica varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_metalico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_metalico numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_inmuebles numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='ejercicio_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN ejercicio_importe smallint NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_oper_t1 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_inmuebles_t1 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_oper_t2 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_inmuebles_t2 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t3' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_oper_t3 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t3' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_inmuebles_t3 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_oper_t4' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_oper_t4 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND COLUMN_NAME='importe_inmuebles_t4' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ALTER COLUMN importe_inmuebles_t4 numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 PRIMARY KEY CLUSTERED (id_detalles_347)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n1' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_347_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_347_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_347_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_detalles_informativos_347_ssis',
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

  -- Materialized query: query
  SELECT
    det_347.id_detalles_347 AS id_detalles_347,
    det_347.id_documento AS id_documento,
    det_347.secuencia AS secuencia,
    administracion.cod_administracion AS cod_administracion,
    administracion.administracion AS administracion,
    coalesce(left(det_347.nif_declarado,9)+' '+right(det_347.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_347.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_347.id_contribuyente AS id_contribuyente,
    CASE WHEN det_347.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN det_347.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    tipo_operacion.cod_tipo_operacion_fact AS cod_tipo_operacion_fact,
    tipo_operacion.tipo_operacion_fact AS tipo_operacion_fact,
    det_347.importe_operacion AS importe_operacion,
    provincia.cod_provincia AS cod_provincia,
    provincia.provincia AS provincia,
    coalesce(det_347.cod_pais,'') AS cod_pais,
    CASE WHEN det_347.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    coalesce(det_347.cod_origen_identif,'') AS cod_origen_identif,
    CASE WHEN det_347.es_seguro=1 THEN 'S' ELSE 'N' END AS es_seguro,
    CASE WHEN det_347.es_arrendamiento=1 THEN 'S' ELSE 'N' END AS es_arrendamiento,
    coalesce(det_347.ext_anagrama,'') AS ext_anagrama,
    coalesce(det_347.ext_nombre,'') AS ext_nombre,
    coalesce(det_347.ext_domicilio,'') AS ext_domicilio,
    coalesce(det_347.ext_cod_postal,'') AS ext_cod_postal,
    coalesce(det_347.ext_municipio,'') AS ext_municipio,
    coalesce(det_347.ext_cod_forma_juridica,'') AS ext_cod_forma_juridica,
    det_347.importe_operaciones AS importe_operaciones,
    det_347.importe_metalico AS importe_metalico,
    det_347.importe_inmuebles AS importe_inmuebles,
    det_347.ejercicio_importe AS ejercicio_importe,
    det_347.importe_oper_t1 AS importe_oper_t1,
    det_347.importe_inmuebles_t1 AS importe_inmuebles_t1,
    det_347.importe_oper_t2 AS importe_oper_t2,
    det_347.importe_inmuebles_t2 AS importe_inmuebles_t2,
    det_347.importe_oper_t3 AS importe_oper_t3,
    det_347.importe_inmuebles_t3 AS importe_inmuebles_t3,
    det_347.importe_oper_t4 AS importe_oper_t4,
    det_347.importe_inmuebles_t4 AS importe_inmuebles_t4,
    det_347.fec_baja AS fec_baja
  INTO #query__8ED28
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_operaciones_con_terceros det_347
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_347 ON (doc_347.id_documento=det_347.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_347.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_347.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura tipo_operacion ON (tipo_operacion.id_tipo_operacion_fact=det_347.id_tipo_operacion_fact)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda administracion ON (administracion.id_administracion=det_347.id_administracion)
  WHERE det_347.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__4675D ON #query__8ED28 (id_detalles_347)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 AS tbn1_fact_detalles_informativos_347_oper_con_terceros_n1
  USING #query__8ED28 AS query ON query.id_detalles_347=tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_detalles_347
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 AS tbn1_fact_detalles_informativos_347_oper_con_terceros_n1
  USING #query__8ED28 AS query ON query.id_detalles_347=tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_detalles_347
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_administracion<>query.cod_administracion OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_administracion IS NULL AND query.cod_administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_administracion IS NOT NULL AND query.cod_administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_tipo_operacion_fact<>query.cod_tipo_operacion_fact OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_tipo_operacion_fact IS NULL AND query.cod_tipo_operacion_fact IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_tipo_operacion_fact IS NOT NULL AND query.cod_tipo_operacion_fact IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.tipo_operacion_fact<>query.tipo_operacion_fact OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.tipo_operacion_fact IS NULL AND query.tipo_operacion_fact IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.tipo_operacion_fact IS NOT NULL AND query.tipo_operacion_fact IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_operacion<>query.importe_operacion OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_operacion IS NULL AND query.importe_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_operacion IS NOT NULL AND query.importe_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_provincia<>query.cod_provincia OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_pais<>query.cod_pais OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_pais IS NULL AND query.cod_pais IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_origen_identif<>query.cod_origen_identif OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_origen_identif IS NULL AND query.cod_origen_identif IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.cod_origen_identif IS NOT NULL AND query.cod_origen_identif IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_seguro<>query.es_seguro OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_seguro IS NULL AND query.es_seguro IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_seguro IS NOT NULL AND query.es_seguro IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_arrendamiento<>query.es_arrendamiento OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_arrendamiento IS NULL AND query.es_arrendamiento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.es_arrendamiento IS NOT NULL AND query.es_arrendamiento IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_anagrama<>query.ext_anagrama OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_anagrama IS NULL AND query.ext_anagrama IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_anagrama IS NOT NULL AND query.ext_anagrama IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_nombre<>query.ext_nombre OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_nombre IS NULL AND query.ext_nombre IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_nombre IS NOT NULL AND query.ext_nombre IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_domicilio<>query.ext_domicilio OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_domicilio IS NULL AND query.ext_domicilio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_domicilio IS NOT NULL AND query.ext_domicilio IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_cod_postal<>query.ext_cod_postal OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_cod_postal IS NULL AND query.ext_cod_postal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_cod_postal IS NOT NULL AND query.ext_cod_postal IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_municipio<>query.ext_municipio OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_municipio IS NULL AND query.ext_municipio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_municipio IS NOT NULL AND query.ext_municipio IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_cod_forma_juridica<>query.ext_cod_forma_juridica OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_cod_forma_juridica IS NULL AND query.ext_cod_forma_juridica IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ext_cod_forma_juridica IS NOT NULL AND query.ext_cod_forma_juridica IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_operaciones<>query.importe_operaciones OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_operaciones IS NULL AND query.importe_operaciones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_operaciones IS NOT NULL AND query.importe_operaciones IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_metalico<>query.importe_metalico OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_metalico IS NULL AND query.importe_metalico IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_metalico IS NOT NULL AND query.importe_metalico IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles<>query.importe_inmuebles OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles IS NULL AND query.importe_inmuebles IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles IS NOT NULL AND query.importe_inmuebles IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ejercicio_importe<>query.ejercicio_importe OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ejercicio_importe IS NULL AND query.ejercicio_importe IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.ejercicio_importe IS NOT NULL AND query.ejercicio_importe IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t1<>query.importe_oper_t1 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t1 IS NULL AND query.importe_oper_t1 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t1 IS NOT NULL AND query.importe_oper_t1 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t1<>query.importe_inmuebles_t1 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t1 IS NULL AND query.importe_inmuebles_t1 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t1 IS NOT NULL AND query.importe_inmuebles_t1 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t2<>query.importe_oper_t2 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t2 IS NULL AND query.importe_oper_t2 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t2 IS NOT NULL AND query.importe_oper_t2 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t2<>query.importe_inmuebles_t2 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t2 IS NULL AND query.importe_inmuebles_t2 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t2 IS NOT NULL AND query.importe_inmuebles_t2 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t3<>query.importe_oper_t3 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t3 IS NULL AND query.importe_oper_t3 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t3 IS NOT NULL AND query.importe_oper_t3 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t3<>query.importe_inmuebles_t3 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t3 IS NULL AND query.importe_inmuebles_t3 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t3 IS NOT NULL AND query.importe_inmuebles_t3 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t4<>query.importe_oper_t4 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t4 IS NULL AND query.importe_oper_t4 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_oper_t4 IS NOT NULL AND query.importe_oper_t4 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t4<>query.importe_inmuebles_t4 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t4 IS NULL AND query.importe_inmuebles_t4 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n1.importe_inmuebles_t4 IS NOT NULL AND query.importe_inmuebles_t4 IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      secuencia=query.secuencia,
      cod_administracion=query.cod_administracion,
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      cod_tipo_operacion_fact=query.cod_tipo_operacion_fact,
      tipo_operacion_fact=query.tipo_operacion_fact,
      importe_operacion=query.importe_operacion,
      cod_provincia=query.cod_provincia,
      provincia=query.provincia,
      cod_pais=query.cod_pais,
      es_identificado=query.es_identificado,
      cod_origen_identif=query.cod_origen_identif,
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
      importe_inmuebles_t4=query.importe_inmuebles_t4
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_347,id_documento,secuencia,cod_administracion,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,cod_tipo_operacion_fact,tipo_operacion_fact,importe_operacion,cod_provincia,provincia,cod_pais,es_identificado,cod_origen_identif,es_seguro,es_arrendamiento,ext_anagrama,ext_nombre,ext_domicilio,ext_cod_postal,ext_municipio,ext_cod_forma_juridica,importe_operaciones,importe_metalico,importe_inmuebles,ejercicio_importe,importe_oper_t1,importe_inmuebles_t1,importe_oper_t2,importe_inmuebles_t2,importe_oper_t3,importe_inmuebles_t3,importe_oper_t4,importe_inmuebles_t4) VALUES (
      query.id_detalles_347,
      query.id_documento,
      query.secuencia,
      query.cod_administracion,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.cod_tipo_operacion_fact,
      query.tipo_operacion_fact,
      query.importe_operacion,
      query.cod_provincia,
      query.provincia,
      query.cod_pais,
      query.es_identificado,
      query.cod_origen_identif,
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
      query.importe_inmuebles_t4);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2(
  id_arrend_oper_347 int NOT NULL,
  id_detalles_347 int NOT NULL,
  orden varchar(5) NOT NULL,
  es_externo varchar(1) NOT NULL,
  importe_arrendamiento numeric(18,2),
  ref_catastral varchar(25),
  tipo_via varchar(2),
  nombre_via varchar(33),
  cod_portal varchar(5),
  cod_portal_bis varchar(1),
  elementos_portal varchar(6),
  cod_municipio int NOT NULL,
  municipio varchar(50) NOT NULL,
  cod_provincia int NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_distrito_postal varchar(3),
  importe_operaciones numeric(18,2),
  cod_situacion varchar(1),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 PRIMARY KEY CLUSTERED (id_arrend_oper_347),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n2_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 FOREIGN KEY (id_detalles_347) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1(id_detalles_347)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='id_arrend_oper_347')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD id_arrend_oper_347 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='id_detalles_347')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD id_detalles_347 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='orden')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD orden varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='importe_arrendamiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD importe_arrendamiento numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='ref_catastral')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD ref_catastral varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='tipo_via')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD tipo_via varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='nombre_via')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD nombre_via varchar(33)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_portal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD cod_portal varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_portal_bis')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD cod_portal_bis varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='elementos_portal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD elementos_portal varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_municipio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD cod_municipio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='municipio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD municipio varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD cod_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_distrito_postal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD cod_distrito_postal varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='importe_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD importe_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_situacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD cod_situacion varchar(1)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='id_arrend_oper_347' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN id_arrend_oper_347 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='id_detalles_347' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN id_detalles_347 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='orden' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN orden varchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='importe_arrendamiento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN importe_arrendamiento numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='ref_catastral' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN ref_catastral varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='tipo_via' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN tipo_via varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='nombre_via' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN nombre_via varchar(33) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_portal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN cod_portal varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_portal_bis' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN cod_portal_bis varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='elementos_portal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN elementos_portal varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_municipio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN cod_municipio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='municipio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN municipio varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN cod_provincia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_distrito_postal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN cod_distrito_postal varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='importe_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN importe_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND COLUMN_NAME='cod_situacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ALTER COLUMN cod_situacion varchar(1) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 PRIMARY KEY CLUSTERED (id_arrend_oper_347)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_347_oper_con_terceros_n2' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n2_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_347_oper_con_terceros_n2_tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 FOREIGN KEY (id_detalles_347) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1(id_detalles_347)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_arrendamientos_347_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_arrendamientos_347_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_arrendamientos_347_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_detalles_informativos_arrendamientos_347_ssis',
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

  -- Materialized query: query
  SELECT
    det_arr_347.id_arrend_oper_347 AS id_arrend_oper_347,
    det_347.id_detalles_347 AS id_detalles_347,
    det_arr_347.orden AS orden,
    CASE WHEN det_arr_347.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    det_arr_347.importe_arrendamiento AS importe_arrendamiento,
    coalesce(det_arr_347.ref_catastral,'') AS ref_catastral,
    coalesce(det_arr_347.tipo_via,'') AS tipo_via,
    coalesce(det_arr_347.nombre_via,'') AS nombre_via,
    coalesce(det_arr_347.cod_portal,'') AS cod_portal,
    coalesce(det_arr_347.cod_portal_bis,'') AS cod_portal_bis,
    coalesce(det_arr_347.elementos_portal,'') AS elementos_portal,
    municipios.cod_municipio AS cod_municipio,
    municipios.des_municipio AS municipio,
    provincia.cod_provincia AS cod_provincia,
    provincia.provincia AS provincia,
    coalesce(det_arr_347.cod_distrito_postal,'') AS cod_distrito_postal,
    det_arr_347.importe_operaciones AS importe_operaciones,
    coalesce(det_arr_347.cod_situacion,'') AS cod_situacion,
    det_arr_347.fec_baja AS fec_baja
  INTO #query__B4457
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_347_arrendamientos_por_operacion det_arr_347
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n1 det_347 ON (det_347.id_detalles_347=det_arr_347.id_detalles_347)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_municipios municipios ON (municipios.id_municipio=det_arr_347.id_municipio)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_arr_347.id_provincia)
  WHERE det_arr_347.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__4AB14 ON #query__B4457 (id_arrend_oper_347)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 AS tbn1_fact_detalles_informativos_347_oper_con_terceros_n2
  USING #query__B4457 AS query ON query.id_arrend_oper_347=tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.id_arrend_oper_347
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_347_oper_con_terceros_n2 AS tbn1_fact_detalles_informativos_347_oper_con_terceros_n2
  USING #query__B4457 AS query ON query.id_arrend_oper_347=tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.id_arrend_oper_347
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.id_detalles_347<>query.id_detalles_347 OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.id_detalles_347 IS NULL AND query.id_detalles_347 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.id_detalles_347 IS NOT NULL AND query.id_detalles_347 IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.orden<>query.orden OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.orden IS NULL AND query.orden IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.orden IS NOT NULL AND query.orden IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.importe_arrendamiento<>query.importe_arrendamiento OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.importe_arrendamiento IS NULL AND query.importe_arrendamiento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.importe_arrendamiento IS NOT NULL AND query.importe_arrendamiento IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.ref_catastral<>query.ref_catastral OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.ref_catastral IS NULL AND query.ref_catastral IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.ref_catastral IS NOT NULL AND query.ref_catastral IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.tipo_via<>query.tipo_via OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.tipo_via IS NULL AND query.tipo_via IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.tipo_via IS NOT NULL AND query.tipo_via IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.nombre_via<>query.nombre_via OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.nombre_via IS NULL AND query.nombre_via IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.nombre_via IS NOT NULL AND query.nombre_via IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_portal<>query.cod_portal OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_portal IS NULL AND query.cod_portal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_portal IS NOT NULL AND query.cod_portal IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_portal_bis<>query.cod_portal_bis OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_portal_bis IS NULL AND query.cod_portal_bis IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_portal_bis IS NOT NULL AND query.cod_portal_bis IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.elementos_portal<>query.elementos_portal OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.elementos_portal IS NULL AND query.elementos_portal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.elementos_portal IS NOT NULL AND query.elementos_portal IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_municipio<>query.cod_municipio OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_municipio IS NULL AND query.cod_municipio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_municipio IS NOT NULL AND query.cod_municipio IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.municipio<>query.municipio OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.municipio IS NULL AND query.municipio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.municipio IS NOT NULL AND query.municipio IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_provincia<>query.cod_provincia OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_distrito_postal<>query.cod_distrito_postal OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_distrito_postal IS NULL AND query.cod_distrito_postal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_distrito_postal IS NOT NULL AND query.cod_distrito_postal IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.importe_operaciones<>query.importe_operaciones OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.importe_operaciones IS NULL AND query.importe_operaciones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.importe_operaciones IS NOT NULL AND query.importe_operaciones IS NULL)
                    OR tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_situacion<>query.cod_situacion OR (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_situacion IS NULL AND query.cod_situacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_347_oper_con_terceros_n2.cod_situacion IS NOT NULL AND query.cod_situacion IS NULL))) THEN
    UPDATE SET
      id_detalles_347=query.id_detalles_347,
      orden=query.orden,
      es_externo=query.es_externo,
      importe_arrendamiento=query.importe_arrendamiento,
      ref_catastral=query.ref_catastral,
      tipo_via=query.tipo_via,
      nombre_via=query.nombre_via,
      cod_portal=query.cod_portal,
      cod_portal_bis=query.cod_portal_bis,
      elementos_portal=query.elementos_portal,
      cod_municipio=query.cod_municipio,
      municipio=query.municipio,
      cod_provincia=query.cod_provincia,
      provincia=query.provincia,
      cod_distrito_postal=query.cod_distrito_postal,
      importe_operaciones=query.importe_operaciones,
      cod_situacion=query.cod_situacion
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_arrend_oper_347,id_detalles_347,orden,es_externo,importe_arrendamiento,ref_catastral,tipo_via,nombre_via,cod_portal,cod_portal_bis,elementos_portal,cod_municipio,municipio,cod_provincia,provincia,cod_distrito_postal,importe_operaciones,cod_situacion) VALUES (
      query.id_arrend_oper_347,
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
      query.cod_municipio,
      query.municipio,
      query.cod_provincia,
      query.provincia,
      query.cod_distrito_postal,
      query.importe_operaciones,
      query.cod_situacion);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_347_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_347_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_347_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_modelo_347_ssis',
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_347_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_347_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_arrendamientos_347_ssis @log;

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

