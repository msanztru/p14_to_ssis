PRINT 'cargar_normalizado_modelo_180.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  administracion varchar(1),
  es_externo bit,
  es_contribuyente bit,
  id_contribuyente int,
  es_complementaria bit NOT NULL,
  id_tipo_presentacion int NOT NULL,
  es_soporte_colectivo bit NOT NULL,
  telefono_contacto varchar(9),
  nombre_contacto varchar(40),
  nif_presentador varchar(11),
  nombre_presentador varchar(40),
  num_caja varchar(8),
  contador_revisiones int,
  id_origen_180 int NOT NULL,
  es_sustitutiva bit NOT NULL,
  ref_presentacion_colectiva int,
  id_origen_grabacion int NOT NULL,
  fec_presentacion date,
  internet_hora_presentacion varchar(6),
  internet_referencia int,
  internet_secuencia int,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_doc_mod180 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
  CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_origen_180 FOREIGN KEY (id_origen_180) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen_180(id_origen_180),
  CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_origenes_grabacion FOREIGN KEY (id_origen_grabacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion(id_origen_grabacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_complementaria bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_soporte_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_soporte_colectivo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD telefono_contacto varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD nombre_contacto varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_presentador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD nif_presentador varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_presentador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD nombre_presentador varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_origen_180 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD es_sustitutiva bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ref_presentacion_colectiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD ref_presentacion_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_origen_grabacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD id_origen_grabacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_hora_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD internet_hora_presentacion varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_referencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD internet_referencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD internet_secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_complementaria' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_COMPLEMENTARIA DEFAULT 0 FOR es_complementaria

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_soporte_colectivo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_SOPORTE_COLECTIVO DEFAULT 0 FOR es_soporte_colectivo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_sustitutiva' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_SUSTITUTIVA DEFAULT 0 FOR es_sustitutiva

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos SET es_complementaria=0 WHERE es_complementaria IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_complementaria bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_soporte_colectivo' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos SET es_soporte_colectivo=0 WHERE es_soporte_colectivo IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_soporte_colectivo bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN telefono_contacto varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nombre_contacto varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_presentador' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nif_presentador varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nombre_presentador' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nombre_presentador varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_origen_180 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos SET es_sustitutiva=0 WHERE es_sustitutiva IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_sustitutiva bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ref_presentacion_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN ref_presentacion_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_origen_grabacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_hora_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN internet_hora_presentacion varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_referencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN internet_referencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='internet_secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN internet_secuencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT PK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_origen_180 FOREIGN KEY (id_origen_180) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen_180(id_origen_180)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_origenes_grabacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_origenes_grabacion FOREIGN KEY (id_origen_grabacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion(id_origen_grabacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_180' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_180;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_180(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_180'
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
      decl.deadmon AS administracion,
      CASE WHEN decl.deadmon<>'B' THEN 1 ELSE 0 END AS es_externo,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,c2.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN decl.decompl='S' THEN 1 ELSE 0 END AS es_complementaria,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      CASE WHEN decl.detipos='S' THEN 1 ELSE 0 END AS es_soporte_colectivo,
      decl.detelco AS telefono_contacto,
      decl.denomco AS nombre_contacto,
      declarante.nif AS nif_presentador,
      decl.denompr AS nombre_presentador,
      decl.dencaja AS num_caja,
      decl.decrevi AS contador_revisiones,
      coalesce(origen.id_origen_180,indefinidos.id_origen_180) AS id_origen_180,
      CASE WHEN decl.desusti='S' THEN 1 ELSE 0 END AS es_sustitutiva,
      decl.derfcol AS ref_presentacion_colectiva,
      coalesce(origen_grabacion.id_origen_grabacion,indefinidos.id_origen_grabacion) AS id_origen_grabacion,
      decl.defecpr AS fec_presentacion,
      decl.dehorpr AS internet_hora_presentacion,
      decl.derfint AS internet_referencia,
      decl.descint AS internet_secuencia
    FROM dbn1_stg_dhyf.dbo.tbn1decl_bu decl
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(decl.deejerc AS varchar)+'0S'+CAST(decl.derefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.nif_maestro=decl.denifpr AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN (SELECT
                 arejerc AS ejer,
                 aradmon AS admon,
                 arrefer AS refer,
                 max(ARNIFRT) AS nif
               FROM dbn1_stg_dhyf.dbo.tbn1arre_bu decl
               GROUP BY
                 arejerc,
                 aradmon,
                 arrefer
               HAVING count(DISTINCT ARNIFRT)=1) declarante ON decl.deejerc=declarante.ejer AND decl.derefer=declarante.refer AND decl.deadmon=declarante.admon
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c2 ON (c2.nif_maestro=declarante.nif AND c2.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 origen ON (origen.cod_origen_180=decl.deorige)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipop)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion origen_grabacion ON (origen_grabacion.cod_origen_grabacion_mi=decl.deograb)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos AS tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos
  USING query ON query.id_documento=tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_documento
  WHEN MATCHED AND ((tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.administracion<>query.administracion OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_externo<>query.es_externo OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_complementaria<>query.es_complementaria OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_soporte_colectivo<>query.es_soporte_colectivo OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_soporte_colectivo IS NULL AND query.es_soporte_colectivo IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_soporte_colectivo IS NOT NULL AND query.es_soporte_colectivo IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.telefono_contacto<>query.telefono_contacto OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_contacto<>query.nombre_contacto OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nif_presentador<>query.nif_presentador OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nif_presentador IS NULL AND query.nif_presentador IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nif_presentador IS NOT NULL AND query.nif_presentador IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_presentador<>query.nombre_presentador OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_presentador IS NULL AND query.nombre_presentador IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.nombre_presentador IS NOT NULL AND query.nombre_presentador IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.num_caja<>query.num_caja OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_180<>query.id_origen_180 OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_180 IS NULL AND query.id_origen_180 IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_180 IS NOT NULL AND query.id_origen_180 IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_sustitutiva<>query.es_sustitutiva OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.ref_presentacion_colectiva<>query.ref_presentacion_colectiva OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.ref_presentacion_colectiva IS NULL AND query.ref_presentacion_colectiva IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.ref_presentacion_colectiva IS NOT NULL AND query.ref_presentacion_colectiva IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_grabacion<>query.id_origen_grabacion OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_grabacion IS NULL AND query.id_origen_grabacion IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_grabacion IS NOT NULL AND query.id_origen_grabacion IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_hora_presentacion<>query.internet_hora_presentacion OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_hora_presentacion IS NULL AND query.internet_hora_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_hora_presentacion IS NOT NULL AND query.internet_hora_presentacion IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_referencia<>query.internet_referencia OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_referencia IS NULL AND query.internet_referencia IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_referencia IS NOT NULL AND query.internet_referencia IS NULL)
                    OR tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_secuencia<>query.internet_secuencia OR (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_secuencia IS NULL AND query.internet_secuencia IS NOT NULL) OR  (tbn1_documentos_informativos_180_arrendamientos_inmuebles_urbanos.internet_secuencia IS NOT NULL AND query.internet_secuencia IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      administracion=query.administracion,
      es_externo=query.es_externo,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_complementaria=query.es_complementaria,
      id_tipo_presentacion=query.id_tipo_presentacion,
      es_soporte_colectivo=query.es_soporte_colectivo,
      telefono_contacto=query.telefono_contacto,
      nombre_contacto=query.nombre_contacto,
      nif_presentador=query.nif_presentador,
      nombre_presentador=query.nombre_presentador,
      num_caja=query.num_caja,
      contador_revisiones=query.contador_revisiones,
      id_origen_180=query.id_origen_180,
      es_sustitutiva=query.es_sustitutiva,
      ref_presentacion_colectiva=query.ref_presentacion_colectiva,
      id_origen_grabacion=query.id_origen_grabacion,
      fec_presentacion=query.fec_presentacion,
      internet_hora_presentacion=query.internet_hora_presentacion,
      internet_referencia=query.internet_referencia,
      internet_secuencia=query.internet_secuencia,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,administracion,es_externo,es_contribuyente,id_contribuyente,es_complementaria,id_tipo_presentacion,es_soporte_colectivo,telefono_contacto,nombre_contacto,nif_presentador,nombre_presentador,num_caja,contador_revisiones,id_origen_180,es_sustitutiva,ref_presentacion_colectiva,id_origen_grabacion,fec_presentacion,internet_hora_presentacion,internet_referencia,internet_secuencia,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.administracion,
      query.es_externo,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_complementaria,
      query.id_tipo_presentacion,
      query.es_soporte_colectivo,
      query.telefono_contacto,
      query.nombre_contacto,
      query.nif_presentador,
      query.nombre_presentador,
      query.num_caja,
      query.contador_revisiones,
      query.id_origen_180,
      query.es_sustitutiva,
      query.ref_presentacion_colectiva,
      query.id_origen_grabacion,
      query.fec_presentacion,
      query.internet_hora_presentacion,
      query.internet_referencia,
      query.internet_secuencia,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos(
  id_detalles_180 int IDENTITY(1,1),
  id_documento int NOT NULL,
  administracion varchar(1),
  referencia varchar(9),
  secuencia int,
  es_externo bit,
  nif_retenedor varchar(11),
  nif_arrendador varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_identificado bit,
  id_modalidad int NOT NULL,
  rendimientos_satisfechos numeric(13,2),
  retencion_ingreso_a_cuenta numeric(13,2),
  id_provincia int,
  ejercicio_devengo int,
  es_representante bit,
  id_origen_180 int NOT NULL,
  num_liquidacion varchar(13),
  porcentaje_retencion numeric(6,4),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod180 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_detalles_180),
  CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_modalidad FOREIGN KEY (id_modalidad) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_modalidad(id_modalidad),
  CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_origen_180 FOREIGN KEY (id_origen_180) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen_180(id_origen_180)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_detalles_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_detalles_180 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='referencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD referencia varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_retenedor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD nif_retenedor varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_arrendador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD nif_arrendador varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_modalidad int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='rendimientos_satisfechos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD rendimientos_satisfechos numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='retencion_ingreso_a_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD retencion_ingreso_a_cuenta numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD ejercicio_devengo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD id_origen_180 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_liquidacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD num_liquidacion varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='porcentaje_retencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD porcentaje_retencion numeric(6,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_180_ARRENDAMIENTOS_INMUEBLES_URBANOS_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_detalles_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_detalles_180 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='referencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN referencia varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN secuencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_retenedor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nif_retenedor varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='nif_arrendador' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN nif_arrendador varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_modalidad int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='rendimientos_satisfechos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN rendimientos_satisfechos numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='retencion_ingreso_a_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN retencion_ingreso_a_cuenta numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN ejercicio_devengo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN es_representante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='id_origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN id_origen_180 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='num_liquidacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN num_liquidacion varchar(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='porcentaje_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN porcentaje_retencion numeric(6,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT PK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos PRIMARY KEY CLUSTERED (id_detalles_180)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_modalidad FOREIGN KEY (id_modalidad) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_modalidad(id_modalidad)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos ADD CONSTRAINT FK_tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos_tbn1_mi_origen_180 FOREIGN KEY (id_origen_180) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen_180(id_origen_180)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_180' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_180;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_180(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_180'
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
      CAST(arre.arsecue AS varchar) AS secuencia,
      arre.aradmon AS administracion,
      arre.arrefer AS referencia,
      CASE WHEN arre.aradmon<>'B' THEN 1 ELSE 0 END AS es_externo,
      arre.arnifrt AS nif_retenedor,
      arre.arnifar AS nif_arrendador,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN arre.arident=1 THEN 1 ELSE 0 END AS es_identificado,
      coalesce(modalidad.id_modalidad,indefinidos.id_modalidad) AS id_modalidad,
      arre.arrendi/100 AS rendimientos_satisfechos,
      arre.arreten/100 AS retencion_ingreso_a_cuenta,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      arre.arejdev AS ejercicio_devengo,
      CASE WHEN arre.arrepre='S' THEN 1 ELSE 0 END AS es_representante,
      coalesce(origen.id_origen_180,indefinidos.id_origen_180) AS id_origen_180,
      arre.arliqui AS num_liquidacion,
      arre.artipor/100 AS porcentaje_retencion
    FROM dbn1_stg_dhyf.dbo.tbn1arre_bu arre
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(arre.arejerc AS varchar)+'0S'+CAST(arre.arrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.nif_maestro=arre.arnifar AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=arre.arcodpr)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 origen ON (origen.cod_origen_180=arre.arorige)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad modalidad ON (modalidad.cod_modalidad=arre.arclapr)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE arre.arsecue<>0
    GROUP BY
      doc.id_documento,
      CAST(arre.arsecue AS varchar),
      arre.aradmon,
      arre.arrefer,
      CASE WHEN arre.aradmon<>'B' THEN 1 ELSE 0 END,
      arre.arnifrt,
      arre.arnifar,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN arre.arident=1 THEN 1 ELSE 0 END,
      coalesce(modalidad.id_modalidad,indefinidos.id_modalidad),
      arre.arrendi/100,
      arre.arreten/100,
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      arre.arejdev,
      CASE WHEN arre.arrepre='S' THEN 1 ELSE 0 END,
      coalesce(origen.id_origen_180,indefinidos.id_origen_180),
      arre.arliqui,
      arre.artipor/100
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos AS tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos
  USING query ON query.id_documento=tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_documento AND query.secuencia=tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.secuencia
  WHEN MATCHED AND ((tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.administracion<>query.administracion OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.referencia<>query.referencia OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.referencia IS NULL AND query.referencia IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.referencia IS NOT NULL AND query.referencia IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_externo<>query.es_externo OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_retenedor<>query.nif_retenedor OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_retenedor IS NULL AND query.nif_retenedor IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_retenedor IS NOT NULL AND query.nif_retenedor IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_arrendador<>query.nif_arrendador OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_arrendador IS NULL AND query.nif_arrendador IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.nif_arrendador IS NOT NULL AND query.nif_arrendador IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_modalidad<>query.id_modalidad OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_modalidad IS NULL AND query.id_modalidad IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_modalidad IS NOT NULL AND query.id_modalidad IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.rendimientos_satisfechos<>query.rendimientos_satisfechos OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.rendimientos_satisfechos IS NULL AND query.rendimientos_satisfechos IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.rendimientos_satisfechos IS NOT NULL AND query.rendimientos_satisfechos IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.retencion_ingreso_a_cuenta<>query.retencion_ingreso_a_cuenta OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.retencion_ingreso_a_cuenta IS NULL AND query.retencion_ingreso_a_cuenta IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.retencion_ingreso_a_cuenta IS NOT NULL AND query.retencion_ingreso_a_cuenta IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_representante<>query.es_representante OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_180<>query.id_origen_180 OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_180 IS NULL AND query.id_origen_180 IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.id_origen_180 IS NOT NULL AND query.id_origen_180 IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.num_liquidacion<>query.num_liquidacion OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.num_liquidacion IS NULL AND query.num_liquidacion IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.num_liquidacion IS NOT NULL AND query.num_liquidacion IS NULL)
                    OR tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.porcentaje_retencion<>query.porcentaje_retencion OR (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.porcentaje_retencion IS NULL AND query.porcentaje_retencion IS NOT NULL) OR  (tbn1_detalles_informativos_180_arrendamientos_inmuebles_urbanos.porcentaje_retencion IS NOT NULL AND query.porcentaje_retencion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      referencia=query.referencia,
      es_externo=query.es_externo,
      nif_retenedor=query.nif_retenedor,
      nif_arrendador=query.nif_arrendador,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_identificado=query.es_identificado,
      id_modalidad=query.id_modalidad,
      rendimientos_satisfechos=query.rendimientos_satisfechos,
      retencion_ingreso_a_cuenta=query.retencion_ingreso_a_cuenta,
      id_provincia=query.id_provincia,
      ejercicio_devengo=query.ejercicio_devengo,
      es_representante=query.es_representante,
      id_origen_180=query.id_origen_180,
      num_liquidacion=query.num_liquidacion,
      porcentaje_retencion=query.porcentaje_retencion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,referencia,es_externo,nif_retenedor,nif_arrendador,es_contribuyente,id_contribuyente,es_identificado,id_modalidad,rendimientos_satisfechos,retencion_ingreso_a_cuenta,id_provincia,ejercicio_devengo,es_representante,id_origen_180,num_liquidacion,porcentaje_retencion,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.referencia,
      query.es_externo,
      query.nif_retenedor,
      query.nif_arrendador,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_identificado,
      query.id_modalidad,
      query.rendimientos_satisfechos,
      query.retencion_ingreso_a_cuenta,
      query.id_provincia,
      query.ejercicio_devengo,
      query.es_representante,
      query.id_origen_180,
      query.num_liquidacion,
      query.porcentaje_retencion,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_180' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_180;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_180(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_modelo_180'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_180 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_180 @log;

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

