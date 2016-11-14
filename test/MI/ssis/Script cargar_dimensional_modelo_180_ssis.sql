PRINT 'cargar_dimensional_modelo_180.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  administracion varchar(1) NOT NULL,
  es_externo varchar(1) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_complementaria varchar(1) NOT NULL,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  es_soporte_colectivo varchar(1) NOT NULL,
  telefono_contacto varchar(9) NOT NULL,
  nombre_contacto varchar(40),
  nif_presentador varchar(12) NOT NULL,
  nombre_presentador varchar(40) NOT NULL,
  num_caja varchar(8) NOT NULL,
  contador_revisiones int,
  cod_origen_180 varchar(2) NOT NULL,
  origen_180 varchar(65) NOT NULL,
  es_sustitutiva varchar(1) NOT NULL,
  ref_presentacion_colectiva int NOT NULL,
  cod_origen_grabacion varchar(1) NOT NULL,
  origen_grabacion varchar(50) NOT NULL,
  fec_presentacion date,
  internet_hora_presentacion varchar(6) NULL,
  referencia_colectiva int NULL,
  internet_referencia int NULL,
  internet_secuencia int NULL,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_complementaria varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_soporte_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_soporte_colectivo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD telefono_contacto varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD nombre_contacto varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_presentador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD nif_presentador varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_presentador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD nombre_presentador varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_origen_180')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD cod_origen_180 varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='origen_180')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD origen_180 varchar(65)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_sustitutiva varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ref_presentacion_colectiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD ref_presentacion_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_origen_grabacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD cod_origen_grabacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='origen_grabacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD origen_grabacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_hora_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD internet_hora_presentacion varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='referencia_colectiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD referencia_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_referencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD internet_referencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD internet_secuencia int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DIM_DOCUMENTOS_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_EXTERNO DEFAULT 'N' FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos SET es_externo='N' WHERE es_externo IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_externo varchar(1) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_complementaria varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_soporte_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_soporte_colectivo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN telefono_contacto varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nombre_contacto varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nif_presentador varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nombre_presentador varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN cod_origen_180 varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN origen_180 varchar(65) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_sustitutiva varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ref_presentacion_colectiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN ref_presentacion_colectiva int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN cod_origen_grabacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN origen_grabacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_hora_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN internet_hora_presentacion varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='referencia_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN referencia_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_referencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN internet_referencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN internet_secuencia int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_180_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_180_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_180_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_documentos_informativos_180_ssis',
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
    doc_180.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(doc_180.administracion,'') AS administracion,
    CASE WHEN doc_180.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN doc_180.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    c.id_contribuyente AS id_contribuyente,
    CASE WHEN doc_180.es_complementaria=1 THEN 'S' ELSE 'N' END AS es_complementaria,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    coalesce(doc_180.es_soporte_colectivo,'') AS es_soporte_colectivo,
    coalesce(doc_180.telefono_contacto,'') AS telefono_contacto,
    coalesce(doc_180.nombre_contacto,'') AS nombre_contacto,
    coalesce(left(doc_180.nif_presentador,9)+' '+right(doc_180.nif_presentador,2),'') AS nif_presentador,
    coalesce(doc_180.nombre_presentador,'') AS nombre_presentador,
    coalesce(doc_180.num_caja,'') AS num_caja,
    doc_180.contador_revisiones AS contador_revisiones,
    origen_180.cod_origen_180 AS cod_origen_180,
    origen_180.origen_180 AS origen_180,
    CASE WHEN doc_180.es_sustitutiva=1 THEN 'S' ELSE 'N' END AS es_sustitutiva,
    coalesce(doc_180.ref_presentacion_colectiva,'') AS ref_presentacion_colectiva,
    origen_grabacion.cod_origen_grabacion_mi AS cod_origen_grabacion,
    origen_grabacion.origen_grabacion AS origen_grabacion,
    doc_180.fec_presentacion AS fec_presentacion,
    doc_180.internet_hora_presentacion AS internet_hora_presentacion,
    doc_180.internet_referencia AS internet_referencia,
    doc_180.internet_secuencia AS internet_secuencia,
    doc_180.fec_baja AS fec_baja
  INTO #query__13FC0
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos doc_180
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_180.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.id_contribuyente=doc_180.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 origen_180 ON (origen_180.id_origen_180=doc_180.id_origen_180)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_180.id_tipo_presentacion)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion origen_grabacion ON (origen_grabacion.id_origen_grabacion=doc_180.id_origen_grabacion)
  WHERE doc_180.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__8CFFF ON #query__13FC0 (id_documento)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos AS tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos
  USING #query__13FC0 AS query ON query.id_documento=tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_documento
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos AS tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos
  USING #query__13FC0 AS query ON query.id_documento=tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_documento
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.administracion<>query.administracion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_externo<>query.es_externo OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_complementaria<>query.es_complementaria OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_soporte_colectivo<>query.es_soporte_colectivo OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_soporte_colectivo IS NULL AND query.es_soporte_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_soporte_colectivo IS NOT NULL AND query.es_soporte_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.telefono_contacto<>query.telefono_contacto OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_contacto<>query.nombre_contacto OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nif_presentador<>query.nif_presentador OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nif_presentador IS NULL AND query.nif_presentador IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nif_presentador IS NOT NULL AND query.nif_presentador IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_presentador<>query.nombre_presentador OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_presentador IS NULL AND query.nombre_presentador IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_presentador IS NOT NULL AND query.nombre_presentador IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_180<>query.cod_origen_180 OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_180 IS NULL AND query.cod_origen_180 IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_180 IS NOT NULL AND query.cod_origen_180 IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.origen_180<>query.origen_180 OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.origen_180 IS NULL AND query.origen_180 IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.origen_180 IS NOT NULL AND query.origen_180 IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_sustitutiva<>query.es_sustitutiva OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.ref_presentacion_colectiva<>query.ref_presentacion_colectiva OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.ref_presentacion_colectiva IS NULL AND query.ref_presentacion_colectiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.ref_presentacion_colectiva IS NOT NULL AND query.ref_presentacion_colectiva IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_grabacion<>query.cod_origen_grabacion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_grabacion IS NULL AND query.cod_origen_grabacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_grabacion IS NOT NULL AND query.cod_origen_grabacion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.origen_grabacion<>query.origen_grabacion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.origen_grabacion IS NULL AND query.origen_grabacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.origen_grabacion IS NOT NULL AND query.origen_grabacion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_hora_presentacion<>query.internet_hora_presentacion OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_hora_presentacion IS NULL AND query.internet_hora_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_hora_presentacion IS NOT NULL AND query.internet_hora_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_referencia<>query.internet_referencia OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_referencia IS NULL AND query.internet_referencia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_referencia IS NOT NULL AND query.internet_referencia IS NULL)
                    OR tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_secuencia<>query.internet_secuencia OR (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_secuencia IS NULL AND query.internet_secuencia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_secuencia IS NOT NULL AND query.internet_secuencia IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      administracion=query.administracion,
      es_externo=query.es_externo,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_complementaria=query.es_complementaria,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      es_soporte_colectivo=query.es_soporte_colectivo,
      telefono_contacto=query.telefono_contacto,
      nombre_contacto=query.nombre_contacto,
      nif_presentador=query.nif_presentador,
      nombre_presentador=query.nombre_presentador,
      num_caja=query.num_caja,
      contador_revisiones=query.contador_revisiones,
      cod_origen_180=query.cod_origen_180,
      origen_180=query.origen_180,
      es_sustitutiva=query.es_sustitutiva,
      ref_presentacion_colectiva=query.ref_presentacion_colectiva,
      cod_origen_grabacion=query.cod_origen_grabacion,
      origen_grabacion=query.origen_grabacion,
      fec_presentacion=query.fec_presentacion,
      internet_hora_presentacion=query.internet_hora_presentacion,
      internet_referencia=query.internet_referencia,
      internet_secuencia=query.internet_secuencia
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,administracion,es_externo,es_contribuyente,id_contribuyente,es_complementaria,cod_tipo_presentacion,tipo_presentacion,es_soporte_colectivo,telefono_contacto,nombre_contacto,nif_presentador,nombre_presentador,num_caja,contador_revisiones,cod_origen_180,origen_180,es_sustitutiva,ref_presentacion_colectiva,cod_origen_grabacion,origen_grabacion,fec_presentacion,internet_hora_presentacion,internet_referencia,internet_secuencia) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.administracion,
      query.es_externo,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_complementaria,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.es_soporte_colectivo,
      query.telefono_contacto,
      query.nombre_contacto,
      query.nif_presentador,
      query.nombre_presentador,
      query.num_caja,
      query.contador_revisiones,
      query.cod_origen_180,
      query.origen_180,
      query.es_sustitutiva,
      query.ref_presentacion_colectiva,
      query.cod_origen_grabacion,
      query.origen_grabacion,
      query.fec_presentacion,
      query.internet_hora_presentacion,
      query.internet_referencia,
      query.internet_secuencia);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos(
  id_detalles_180 int NOT NULL,
  id_documento int NOT NULL,
  administracion varchar(1) NOT NULL,
  secuencia int NOT NULL,
  es_externo varchar(1) NOT NULL,
  nif_retenedor varchar(12) NOT NULL,
  nif_arrendador varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_identificado varchar(1) NOT NULL,
  cod_modalidad varchar(1) NOT NULL,
  modalidad varchar(50) NOT NULL,
  rendimientos_satisfechos numeric(13,2),
  retencion_ingreso_a_cuenta numeric(13,2),
  provincia varchar(50) NOT NULL,
  ejercicio_devengo smallint NOT NULL,
  es_representante varchar(1) NOT NULL,
  cod_origen_180 varchar(2) NOT NULL,
  origen_180 varchar(65) NOT NULL,
  num_liquidacion varchar(13),
  porcentaje_retencion numeric(6,4),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_detalles_180),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_detalles_180')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_detalles_180 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_retenedor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD nif_retenedor varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_arrendador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD nif_arrendador varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_modalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD cod_modalidad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='modalidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD modalidad varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='rendimientos_satisfechos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD rendimientos_satisfechos numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='retencion_ingreso_a_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD retencion_ingreso_a_cuenta numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD ejercicio_devengo smallint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_origen_180')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD cod_origen_180 varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='origen_180')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD origen_180 varchar(65)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_liquidacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD num_liquidacion varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='porcentaje_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD porcentaje_retencion numeric(6,4)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_EXTERNO DEFAULT 'N' FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_IDENTIFICADO DEFAULT 'S' FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_detalles_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_detalles_180 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN secuencia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos SET es_externo='N' WHERE es_externo IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_externo varchar(1) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_retenedor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nif_retenedor varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_arrendador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nif_arrendador varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos SET es_identificado='S' WHERE es_identificado IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_identificado varchar(1) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN cod_modalidad varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN modalidad varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='rendimientos_satisfechos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN rendimientos_satisfechos numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='retencion_ingreso_a_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN retencion_ingreso_a_cuenta numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN ejercicio_devengo smallint NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='cod_origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN cod_origen_180 varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN origen_180 varchar(65) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_liquidacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN num_liquidacion varchar(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='porcentaje_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN porcentaje_retencion numeric(6,4) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_detalles_180)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_180_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_180_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_180_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_detalles_informativos_180_ssis',
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
    det_180.id_detalles_180 AS id_detalles_180,
    det_180.id_documento AS id_documento,
    coalesce(det_180.administracion,'') AS administracion,
    det_180.secuencia AS secuencia,
    CASE WHEN det_180.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    coalesce(left(det_180.nif_retenedor,9)+' '+right(det_180.nif_retenedor,2),'') AS nif_retenedor,
    coalesce(left(det_180.nif_arrendador,9)+' '+right(det_180.nif_arrendador,2),'') AS nif_arrendador,
    CASE WHEN det_180.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_180.id_contribuyente AS id_contribuyente,
    CASE WHEN det_180.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    coalesce(modalidad.cod_modalidad,'') AS cod_modalidad,
    coalesce(modalidad.modalidad,'') AS modalidad,
    det_180.rendimientos_satisfechos AS rendimientos_satisfechos,
    det_180.retencion_ingreso_a_cuenta AS retencion_ingreso_a_cuenta,
    provincia.provincia AS provincia,
    det_180.ejercicio_devengo AS ejercicio_devengo,
    CASE WHEN det_180.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    origen_180.cod_origen_180 AS cod_origen_180,
    origen_180.origen_180 AS origen_180,
    det_180.num_liquidacion AS num_liquidacion,
    det_180.porcentaje_retencion AS porcentaje_retencion,
    det_180.fec_baja AS fec_baja
  INTO #query__50042
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos det_180
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_180 ON (doc_180.id_documento=det_180.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_180.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_180.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 origen_180 ON (origen_180.id_origen_180=det_180.id_origen_180)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad modalidad ON (modalidad.cod_modalidad=det_180.id_modalidad)
  WHERE det_180.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__702B8 ON #query__50042 (id_detalles_180)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos AS tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos
  USING #query__50042 AS query ON query.id_detalles_180=tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_detalles_180
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos AS tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos
  USING #query__50042 AS query ON query.id_detalles_180=tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_detalles_180
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_retenedor<>query.nif_retenedor OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_retenedor IS NULL AND query.nif_retenedor IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_retenedor IS NOT NULL AND query.nif_retenedor IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_arrendador<>query.nif_arrendador OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_arrendador IS NULL AND query.nif_arrendador IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_arrendador IS NOT NULL AND query.nif_arrendador IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.cod_modalidad<>query.cod_modalidad OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.cod_modalidad IS NULL AND query.cod_modalidad IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.cod_modalidad IS NOT NULL AND query.cod_modalidad IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.modalidad<>query.modalidad OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.modalidad IS NULL AND query.modalidad IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.modalidad IS NOT NULL AND query.modalidad IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.rendimientos_satisfechos<>query.rendimientos_satisfechos OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.rendimientos_satisfechos IS NULL AND query.rendimientos_satisfechos IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.rendimientos_satisfechos IS NOT NULL AND query.rendimientos_satisfechos IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.retencion_ingreso_a_cuenta<>query.retencion_ingreso_a_cuenta OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.retencion_ingreso_a_cuenta IS NULL AND query.retencion_ingreso_a_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.retencion_ingreso_a_cuenta IS NOT NULL AND query.retencion_ingreso_a_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_180<>query.cod_origen_180 OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_180 IS NULL AND query.cod_origen_180 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.cod_origen_180 IS NOT NULL AND query.cod_origen_180 IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.origen_180<>query.origen_180 OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.origen_180 IS NULL AND query.origen_180 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.origen_180 IS NOT NULL AND query.origen_180 IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.num_liquidacion<>query.num_liquidacion OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.num_liquidacion IS NULL AND query.num_liquidacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.num_liquidacion IS NOT NULL AND query.num_liquidacion IS NULL)
                    OR tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.porcentaje_retencion<>query.porcentaje_retencion OR (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.porcentaje_retencion IS NULL AND query.porcentaje_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_180_arrendamientos_inmuebles_urbanos.porcentaje_retencion IS NOT NULL AND query.porcentaje_retencion IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      administracion=query.administracion,
      secuencia=query.secuencia,
      es_externo=query.es_externo,
      nif_retenedor=query.nif_retenedor,
      nif_arrendador=query.nif_arrendador,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_identificado=query.es_identificado,
      cod_modalidad=query.cod_modalidad,
      modalidad=query.modalidad,
      rendimientos_satisfechos=query.rendimientos_satisfechos,
      retencion_ingreso_a_cuenta=query.retencion_ingreso_a_cuenta,
      provincia=query.provincia,
      ejercicio_devengo=query.ejercicio_devengo,
      es_representante=query.es_representante,
      cod_origen_180=query.cod_origen_180,
      origen_180=query.origen_180,
      num_liquidacion=query.num_liquidacion,
      porcentaje_retencion=query.porcentaje_retencion
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_180,id_documento,administracion,secuencia,es_externo,nif_retenedor,nif_arrendador,es_contribuyente,id_contribuyente,es_identificado,cod_modalidad,modalidad,rendimientos_satisfechos,retencion_ingreso_a_cuenta,provincia,ejercicio_devengo,es_representante,cod_origen_180,origen_180,num_liquidacion,porcentaje_retencion) VALUES (
      query.id_detalles_180,
      query.id_documento,
      query.administracion,
      query.secuencia,
      query.es_externo,
      query.nif_retenedor,
      query.nif_arrendador,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_identificado,
      query.cod_modalidad,
      query.modalidad,
      query.rendimientos_satisfechos,
      query.retencion_ingreso_a_cuenta,
      query.provincia,
      query.ejercicio_devengo,
      query.es_representante,
      query.cod_origen_180,
      query.origen_180,
      query.num_liquidacion,
      query.porcentaje_retencion);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_180_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_180_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_180_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_modelo_180_ssis',
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_180_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_180_ssis @log;

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

