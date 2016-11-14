PRINT 'cargar_normalizado_modelo_190.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  nif_declarante varchar(11),
  fec_identificacion date,
  razon_social varchar(40),
  es_contribuyente bit,
  id_contribuyente int,
  administracion varchar(1),
  es_externo bit,
  fec_ultimo_calculo date,
  fec_carga_declaracion date,
  fec_respuesta_notif date,
  es_cuadrada_desde_carga bit NOT NULL,
  es_cuadrada_posteriormente bit NOT NULL,
  telefono_contacto varchar(9),
  nombre_contacto varchar(40),
  id_iae_principal int NOT NULL,
  es_declaracion_negativa bit NOT NULL,
  id_tipo_presentacion int NOT NULL,
  id_provincia_remitente int,
  nombre_presentador varchar(40),
  nif_presentador varchar(11),
  hay_modificaciones bit NOT NULL,
  numero_caja varchar(8),
  id_origen int NOT NULL,
  fec_presentacion date,
  es_complementaria bit NOT NULL,
  es_sustitutiva bit NOT NULL,
  id_origen_grabacion int NOT NULL,
  internet_hora_presentacion varchar(6),
  referencia_colectiva int,
  internet_referencia int,
  internet_secuencia int,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_documentos_informativos_190 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_actividades_economicas FOREIGN KEY (id_iae_principal) REFERENCES dbn1_norm_dhyf.dbo.tbn1_actividades_economicas(id_iae),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_provincias FOREIGN KEY (id_provincia_remitente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_mi_origen FOREIGN KEY (id_origen) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen(id_origen),
  CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_origenes_grabacion FOREIGN KEY (id_origen_grabacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion(id_origen_grabacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_identificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_ultimo_calculo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_ultimo_calculo date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_carga_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_carga_declaracion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_respuesta_notif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_respuesta_notif date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_desde_carga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_cuadrada_desde_carga bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_posteriormente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_cuadrada_posteriormente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD telefono_contacto varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD nombre_contacto varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_iae_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_iae_principal int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_declaracion_negativa')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_declaracion_negativa bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_provincia_remitente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_provincia_remitente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_presentador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD nombre_presentador varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_presentador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD nif_presentador varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD hay_modificaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='numero_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD numero_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_origen int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_complementaria bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD es_sustitutiva bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_origen_grabacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD id_origen_grabacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_hora_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD internet_hora_presentacion varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='referencia_colectiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD referencia_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_referencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD internet_referencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD internet_secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_desde_carga' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_CUADRADA_DESDE_CARGA DEFAULT 0 FOR es_cuadrada_desde_carga

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_posteriormente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_CUADRADA_POSTERIORMENTE DEFAULT 0 FOR es_cuadrada_posteriormente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_iae_principal' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ID_IAE_PRINCIPAL DEFAULT 1 FOR id_iae_principal

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_declaracion_negativa' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_DECLARACION_NEGATIVA DEFAULT 0 FOR es_declaracion_negativa

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_HAY_MODIFICACIONES DEFAULT 0 FOR hay_modificaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_complementaria' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_COMPLEMENTARIA DEFAULT 0 FOR es_complementaria

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_sustitutiva' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_SUSTITUTIVA DEFAULT 0 FOR es_sustitutiva

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_identificacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN razon_social varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_ultimo_calculo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_ultimo_calculo date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_carga_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_carga_declaracion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_respuesta_notif' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_respuesta_notif date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_desde_carga' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET es_cuadrada_desde_carga=0 WHERE es_cuadrada_desde_carga IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_cuadrada_desde_carga bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_posteriormente' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET es_cuadrada_posteriormente=0 WHERE es_cuadrada_posteriormente IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_cuadrada_posteriormente bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN telefono_contacto varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nombre_contacto varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_iae_principal' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET id_iae_principal=1 WHERE id_iae_principal IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_iae_principal int NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_declaracion_negativa' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET es_declaracion_negativa=0 WHERE es_declaracion_negativa IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_declaracion_negativa bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_provincia_remitente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_provincia_remitente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_presentador' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nombre_presentador varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_presentador' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nif_presentador varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET hay_modificaciones=0 WHERE hay_modificaciones IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN hay_modificaciones bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='numero_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN numero_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_origen int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET es_complementaria=0 WHERE es_complementaria IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_complementaria bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo SET es_sustitutiva=0 WHERE es_sustitutiva IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_sustitutiva bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_origen_grabacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_hora_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN internet_hora_presentacion varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='referencia_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN referencia_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_referencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN internet_referencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN internet_secuencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_190_rendimientos_trabajo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT PK_tbn1_documentos_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_actividades_economicas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_actividades_economicas FOREIGN KEY (id_iae_principal) REFERENCES dbn1_norm_dhyf.dbo.tbn1_actividades_economicas(id_iae)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_provincias FOREIGN KEY (id_provincia_remitente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_mi_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_mi_origen FOREIGN KEY (id_origen) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen(id_origen)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_origenes_grabacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_documentos_informativos_190_rendimientos_trabajo_tbn1_origenes_grabacion FOREIGN KEY (id_origen_grabacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion(id_origen_grabacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_190_INTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_190_INTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_190_INTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_190_INTERNOS_ssis',
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
      ret.rtnifrt AS nif_declarante,
      perc.penomrs AS razon_social,
      'B' AS administracion,
      0 AS es_externo,
      ret.rtfeide AS fec_identificacion,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      ret.rtfeulc AS fec_ultimo_calculo,
      ret.rtfecde AS fec_carga_declaracion,
      ret.rtfernt AS fec_respuesta_notif,
      CASE WHEN ret.rtcuaca='S' THEN 1 ELSE 0 END AS es_cuadrada_desde_carga,
      CASE WHEN ret.rtcuapo='S' THEN 1 ELSE 0 END AS es_cuadrada_posteriormente,
      ret.rttelco AS telefono_contacto,
      ret.rtnomco AS nombre_contacto,
      coalesce(a.id_iae,indefinidos.id_iae) AS id_iae_principal,
      CASE WHEN ret.rtdecng='S' THEN 1 ELSE 0 END AS es_declaracion_negativa,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      prov.id_provincia AS id_provincia_remitente,
      ret.rtnompr AS nombre_presentador,
      ret.rtnifpr AS nif_presentador,
      CASE WHEN ret.rtmodif='S' THEN 1 ELSE 0 END AS hay_modificaciones,
      ret.rtncaja AS numero_caja,
      coalesce(origen.id_origen,indefinidos.id_origen) AS id_origen,
      ret.rtfecpr AS fec_presentacion,
      CASE WHEN ret.rtcompl='S' THEN 1 ELSE 0 END AS es_complementaria,
      CASE WHEN ret.rtsusti='S' THEN 1 ELSE 0 END AS es_sustitutiva,
      coalesce(origen_grabacion.id_origen_grabacion,indefinidos.id_origen_grabacion) AS id_origen_grabacion,
      ret.rthorpr AS internet_hora_presentacion,
      ret.rtrfcol AS referencia_colectiva,
      ret.rtrfint AS internet_referencia,
      ret.rtscint AS internet_secuencia
    FROM dbn1_stg_dhyf.dbo.tbn190rt_bc ret
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=ret.rtejerc+'AC'+ret.rtrefer+'00K0000')
    INNER JOIN dbn1_stg_dhyf.dbo.tbn190pe_bc perc ON (ret.rtrefer=perc.perefer AND ret.rtejerc=perc.peejerc AND perc.pesecue=0)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (ret.rtnifrt=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_actividades_economicas a ON (ret.rtepiap=a.cod_iae)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov ON (prov.cod_provincia=ret.rtprort)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen origen ON (CAST(origen.cod_origen AS varchar)=ret.rtorige)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=ret.rtclapr)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion origen_grabacion ON (origen_grabacion.cod_origen_grabacion_mi=ret.rtograb)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo AS tbn1_documentos_informativos_190_rendimientos_trabajo
  USING query ON query.id_documento=tbn1_documentos_informativos_190_rendimientos_trabajo.id_documento
  WHEN MATCHED AND (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo=0
                    AND (tbn1_documentos_informativos_190_rendimientos_trabajo.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_190_rendimientos_trabajo.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.razon_social<>query.razon_social OR (tbn1_documentos_informativos_190_rendimientos_trabajo.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.administracion<>query.administracion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo<>query.es_externo OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_identificacion<>query.fec_identificacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_identificacion IS NULL AND query.fec_identificacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_identificacion IS NOT NULL AND query.fec_identificacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_ultimo_calculo<>query.fec_ultimo_calculo OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_ultimo_calculo IS NULL AND query.fec_ultimo_calculo IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_ultimo_calculo IS NOT NULL AND query.fec_ultimo_calculo IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion<>query.fec_carga_declaracion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion IS NULL AND query.fec_carga_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion IS NOT NULL AND query.fec_carga_declaracion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_respuesta_notif<>query.fec_respuesta_notif OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_respuesta_notif IS NULL AND query.fec_respuesta_notif IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_respuesta_notif IS NOT NULL AND query.fec_respuesta_notif IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_desde_carga<>query.es_cuadrada_desde_carga OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_desde_carga IS NULL AND query.es_cuadrada_desde_carga IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_desde_carga IS NOT NULL AND query.es_cuadrada_desde_carga IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_posteriormente<>query.es_cuadrada_posteriormente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_posteriormente IS NULL AND query.es_cuadrada_posteriormente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_posteriormente IS NOT NULL AND query.es_cuadrada_posteriormente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.telefono_contacto<>query.telefono_contacto OR (tbn1_documentos_informativos_190_rendimientos_trabajo.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.nombre_contacto<>query.nombre_contacto OR (tbn1_documentos_informativos_190_rendimientos_trabajo.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_iae_principal<>query.id_iae_principal OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_iae_principal IS NULL AND query.id_iae_principal IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_iae_principal IS NOT NULL AND query.id_iae_principal IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_declaracion_negativa<>query.es_declaracion_negativa OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_declaracion_negativa IS NULL AND query.es_declaracion_negativa IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_declaracion_negativa IS NOT NULL AND query.es_declaracion_negativa IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_provincia_remitente<>query.id_provincia_remitente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_provincia_remitente IS NULL AND query.id_provincia_remitente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_provincia_remitente IS NOT NULL AND query.id_provincia_remitente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.nombre_presentador<>query.nombre_presentador OR (tbn1_documentos_informativos_190_rendimientos_trabajo.nombre_presentador IS NULL AND query.nombre_presentador IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.nombre_presentador IS NOT NULL AND query.nombre_presentador IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.nif_presentador<>query.nif_presentador OR (tbn1_documentos_informativos_190_rendimientos_trabajo.nif_presentador IS NULL AND query.nif_presentador IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.nif_presentador IS NOT NULL AND query.nif_presentador IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.hay_modificaciones<>query.hay_modificaciones OR (tbn1_documentos_informativos_190_rendimientos_trabajo.hay_modificaciones IS NULL AND query.hay_modificaciones IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.hay_modificaciones IS NOT NULL AND query.hay_modificaciones IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.numero_caja<>query.numero_caja OR (tbn1_documentos_informativos_190_rendimientos_trabajo.numero_caja IS NULL AND query.numero_caja IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.numero_caja IS NOT NULL AND query.numero_caja IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen<>query.id_origen OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen IS NULL AND query.id_origen IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen IS NOT NULL AND query.id_origen IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_complementaria<>query.es_complementaria OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_sustitutiva<>query.es_sustitutiva OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen_grabacion<>query.id_origen_grabacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen_grabacion IS NULL AND query.id_origen_grabacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen_grabacion IS NOT NULL AND query.id_origen_grabacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.internet_hora_presentacion<>query.internet_hora_presentacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.internet_hora_presentacion IS NULL AND query.internet_hora_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.internet_hora_presentacion IS NOT NULL AND query.internet_hora_presentacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.referencia_colectiva<>query.referencia_colectiva OR (tbn1_documentos_informativos_190_rendimientos_trabajo.referencia_colectiva IS NULL AND query.referencia_colectiva IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.referencia_colectiva IS NOT NULL AND query.referencia_colectiva IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.internet_referencia<>query.internet_referencia OR (tbn1_documentos_informativos_190_rendimientos_trabajo.internet_referencia IS NULL AND query.internet_referencia IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.internet_referencia IS NOT NULL AND query.internet_referencia IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.internet_secuencia<>query.internet_secuencia OR (tbn1_documentos_informativos_190_rendimientos_trabajo.internet_secuencia IS NULL AND query.internet_secuencia IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.internet_secuencia IS NOT NULL AND query.internet_secuencia IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      nif_declarante=query.nif_declarante,
      razon_social=query.razon_social,
      administracion=query.administracion,
      es_externo=query.es_externo,
      fec_identificacion=query.fec_identificacion,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      fec_ultimo_calculo=query.fec_ultimo_calculo,
      fec_carga_declaracion=query.fec_carga_declaracion,
      fec_respuesta_notif=query.fec_respuesta_notif,
      es_cuadrada_desde_carga=query.es_cuadrada_desde_carga,
      es_cuadrada_posteriormente=query.es_cuadrada_posteriormente,
      telefono_contacto=query.telefono_contacto,
      nombre_contacto=query.nombre_contacto,
      id_iae_principal=query.id_iae_principal,
      es_declaracion_negativa=query.es_declaracion_negativa,
      id_tipo_presentacion=query.id_tipo_presentacion,
      id_provincia_remitente=query.id_provincia_remitente,
      nombre_presentador=query.nombre_presentador,
      nif_presentador=query.nif_presentador,
      hay_modificaciones=query.hay_modificaciones,
      numero_caja=query.numero_caja,
      id_origen=query.id_origen,
      fec_presentacion=query.fec_presentacion,
      es_complementaria=query.es_complementaria,
      es_sustitutiva=query.es_sustitutiva,
      id_origen_grabacion=query.id_origen_grabacion,
      internet_hora_presentacion=query.internet_hora_presentacion,
      referencia_colectiva=query.referencia_colectiva,
      internet_referencia=query.internet_referencia,
      internet_secuencia=query.internet_secuencia,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,nif_declarante,razon_social,administracion,es_externo,fec_identificacion,es_contribuyente,id_contribuyente,fec_ultimo_calculo,fec_carga_declaracion,fec_respuesta_notif,es_cuadrada_desde_carga,es_cuadrada_posteriormente,telefono_contacto,nombre_contacto,id_iae_principal,es_declaracion_negativa,id_tipo_presentacion,id_provincia_remitente,nombre_presentador,nif_presentador,hay_modificaciones,numero_caja,id_origen,fec_presentacion,es_complementaria,es_sustitutiva,id_origen_grabacion,internet_hora_presentacion,referencia_colectiva,internet_referencia,internet_secuencia,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.nif_declarante,
      query.razon_social,
      query.administracion,
      query.es_externo,
      query.fec_identificacion,
      query.es_contribuyente,
      query.id_contribuyente,
      query.fec_ultimo_calculo,
      query.fec_carga_declaracion,
      query.fec_respuesta_notif,
      query.es_cuadrada_desde_carga,
      query.es_cuadrada_posteriormente,
      query.telefono_contacto,
      query.nombre_contacto,
      query.id_iae_principal,
      query.es_declaracion_negativa,
      query.id_tipo_presentacion,
      query.id_provincia_remitente,
      query.nombre_presentador,
      query.nif_presentador,
      query.hay_modificaciones,
      query.numero_caja,
      query.id_origen,
      query.fec_presentacion,
      query.es_complementaria,
      query.es_sustitutiva,
      query.id_origen_grabacion,
      query.internet_hora_presentacion,
      query.referencia_colectiva,
      query.internet_referencia,
      query.internet_secuencia,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_190_EXTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_190_EXTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_190_EXTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_190_EXTERNOS_ssis',
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
      ret.rxnifrt AS nif_declarante,
      perc.pxnomrs AS razon_social,
      ret.rxfeide AS fec_identificacion,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      substring(perc.pxrefer,1,1) AS administracion,
      1 AS es_externo,
      ret.rxfecde AS fec_carga_declaracion,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      prov.id_provincia AS id_provincia_remitente,
      ret.rxncaja AS numero_caja,
      1 AS id_origen,
      1 AS id_origen_grabacion
    FROM dbn1_stg_dhyf.dbo.tbn1i3rt_bc ret
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ret.rxejerc AS varchar)+'AC'+CAST(ret.rxrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1i3pe_bc perc ON (ret.rxrefer=perc.pxrefer AND ret.rxejerc=perc.pxejerc AND perc.pxsecue=0)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (ret.rxnifrt=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov ON (prov.cod_provincia=ret.rxprort)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=ret.rxclapr)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo AS tbn1_documentos_informativos_190_rendimientos_trabajo
  USING query ON query.id_documento=tbn1_documentos_informativos_190_rendimientos_trabajo.id_documento
  WHEN MATCHED AND (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo=1
                    AND (tbn1_documentos_informativos_190_rendimientos_trabajo.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_190_rendimientos_trabajo.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.razon_social<>query.razon_social OR (tbn1_documentos_informativos_190_rendimientos_trabajo.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_identificacion<>query.fec_identificacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_identificacion IS NULL AND query.fec_identificacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_identificacion IS NOT NULL AND query.fec_identificacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.administracion<>query.administracion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo<>query.es_externo OR (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion<>query.fec_carga_declaracion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion IS NULL AND query.fec_carga_declaracion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion IS NOT NULL AND query.fec_carga_declaracion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_provincia_remitente<>query.id_provincia_remitente OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_provincia_remitente IS NULL AND query.id_provincia_remitente IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_provincia_remitente IS NOT NULL AND query.id_provincia_remitente IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.numero_caja<>query.numero_caja OR (tbn1_documentos_informativos_190_rendimientos_trabajo.numero_caja IS NULL AND query.numero_caja IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.numero_caja IS NOT NULL AND query.numero_caja IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen<>query.id_origen OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen IS NULL AND query.id_origen IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen IS NOT NULL AND query.id_origen IS NULL)
                    OR tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen_grabacion<>query.id_origen_grabacion OR (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen_grabacion IS NULL AND query.id_origen_grabacion IS NOT NULL) OR  (tbn1_documentos_informativos_190_rendimientos_trabajo.id_origen_grabacion IS NOT NULL AND query.id_origen_grabacion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      nif_declarante=query.nif_declarante,
      razon_social=query.razon_social,
      fec_identificacion=query.fec_identificacion,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      administracion=query.administracion,
      es_externo=query.es_externo,
      fec_carga_declaracion=query.fec_carga_declaracion,
      id_tipo_presentacion=query.id_tipo_presentacion,
      id_provincia_remitente=query.id_provincia_remitente,
      numero_caja=query.numero_caja,
      id_origen=query.id_origen,
      id_origen_grabacion=query.id_origen_grabacion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,nif_declarante,razon_social,fec_identificacion,es_contribuyente,id_contribuyente,administracion,es_externo,fec_carga_declaracion,id_tipo_presentacion,id_provincia_remitente,numero_caja,id_origen,id_origen_grabacion,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.nif_declarante,
      query.razon_social,
      query.fec_identificacion,
      query.es_contribuyente,
      query.id_contribuyente,
      query.administracion,
      query.es_externo,
      query.fec_carga_declaracion,
      query.id_tipo_presentacion,
      query.id_provincia_remitente,
      query.numero_caja,
      query.id_origen,
      query.id_origen_grabacion,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_documentos_informativos_190_rendimientos_trabajo.es_externo=1
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo(
  id_detalles_190 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia int,
  nif_declarado varchar(11),
  razon_social varchar(40),
  administracion varchar(1),
  fec_identificacion date,
  fec_desintificacion date,
  forma_juridica varchar(1),
  es_contribuyente bit,
  id_contribuyente int,
  es_identificado bit,
  es_externo bit,
  id_provincia int NOT NULL,
  id_clave int NOT NULL,
  id_subclave int NOT NULL,
  num_descendientes int,
  grado_minusvalia int,
  nro_liquidacion varchar(13),
  es_representante_menor_edad bit,
  origen_discrepancia varchar(1),
  id_origen int NOT NULL,
  hay_modificaciones bit,
  ejercicio_devengo int,
  ceuta_melilla bit,
  hay_repercusion bit,
  percepciones_dinerarias numeric(18,2),
  retenciones_practicadas numeric(18,2),
  percepcion_en_especie numeric(18,2),
  ingresos_cuenta_efectuados numeric(18,2),
  ingresos_cuenta_repercutidos numeric(18,2),
  cantidad_no_integrada numeric(18,2),
  pension_compensatoria numeric(18,2),
  gastos_seguridad_social numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_inform_190_rendimientos_trabajo UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_detalles_190),
  CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_claves FOREIGN KEY (id_clave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_claves(id_clave),
  CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_subclaves FOREIGN KEY (id_subclave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_subclaves(id_subclave),
  CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_origen FOREIGN KEY (id_origen) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen(id_origen)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_detalles_190')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_detalles_190 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD fec_identificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_desintificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD fec_desintificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='forma_juridica')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD forma_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD es_identificado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD es_externo bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_clave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_clave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_subclave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_subclave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='num_descendientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD num_descendientes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='grado_minusvalia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD grado_minusvalia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nro_liquidacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD nro_liquidacion varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_representante_menor_edad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD es_representante_menor_edad bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen_discrepancia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD origen_discrepancia varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD id_origen int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD hay_modificaciones bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD ejercicio_devengo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ceuta_melilla')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD ceuta_melilla bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_repercusion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD hay_repercusion bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepciones_dinerarias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD percepciones_dinerarias numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='retenciones_practicadas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD retenciones_practicadas numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepcion_en_especie')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD percepcion_en_especie numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_efectuados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD ingresos_cuenta_efectuados numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_repercutidos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD ingresos_cuenta_repercutidos numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cantidad_no_integrada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD cantidad_no_integrada numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='pension_compensatoria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD pension_compensatoria numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='gastos_seguridad_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD gastos_seguridad_social numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_IDENTIFICADO DEFAULT 0 FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_EXTERNO DEFAULT 0 FOR es_externo

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_provincia' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ID_PROVINCIA DEFAULT 1 FOR id_provincia

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_representante_menor_edad' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_REPRESENTANTE_MENOR_EDAD DEFAULT 0 FOR es_representante_menor_edad

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_HAY_MODIFICACIONES DEFAULT 0 FOR hay_modificaciones

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ceuta_melilla' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_CEUTA_MELILLA DEFAULT 0 FOR ceuta_melilla

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_repercusion' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_HAY_REPERCUSION DEFAULT 0 FOR hay_repercusion

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_detalles_190' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_detalles_190 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN secuencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN razon_social varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_identificacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_desintificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_desintificacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='forma_juridica' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN forma_juridica varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_identificado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_externo bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo SET id_provincia=1 WHERE id_provincia IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_provincia int NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_clave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_clave int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_subclave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_subclave int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='num_descendientes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN num_descendientes int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='grado_minusvalia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN grado_minusvalia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nro_liquidacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN nro_liquidacion varchar(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_representante_menor_edad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_representante_menor_edad bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen_discrepancia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN origen_discrepancia varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_origen int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN hay_modificaciones bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ejercicio_devengo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ceuta_melilla' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ceuta_melilla bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_repercusion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN hay_repercusion bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepciones_dinerarias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN percepciones_dinerarias numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='retenciones_practicadas' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN retenciones_practicadas numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepcion_en_especie' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN percepcion_en_especie numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_efectuados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ingresos_cuenta_efectuados numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_repercutidos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ingresos_cuenta_repercutidos numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cantidad_no_integrada' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN cantidad_no_integrada numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='pension_compensatoria' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN pension_compensatoria numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='gastos_seguridad_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN gastos_seguridad_social numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_190_rendimientos_trabajo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT PK_tbn1_detalles_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_detalles_190)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_claves')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_claves FOREIGN KEY (id_clave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_claves(id_clave)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_subclaves')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_subclaves FOREIGN KEY (id_subclave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_subclaves(id_subclave)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_detalles_informativos_190_rendimientos_trabajo_tbn1_mi_origen FOREIGN KEY (id_origen) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_origen(id_origen)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_190_INTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_190_INTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_190_INTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_190_INTERNOS_ssis',
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
      perc.pesecue AS secuencia,
      perc.penifpr AS nif_declarado,
      perc.penomrs AS razon_social,
      perc.pefeide AS fec_identificacion,
      perc.pefeude AS fec_desintificacion,
      perc.pefjuri AS forma_juridica,
      'B' AS administracion,
      0 AS es_externo,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN perc.peident=1 THEN 1 ELSE 0 END AS es_identificado,
      coalesce(cl.id_clave,indefinidos.id_clave) AS id_clave,
      coalesce(sc.id_subclave,indefinidos.id_subclave) AS id_subclave,
      perc.peminus AS grado_minusvalia,
      perc.pehijos AS num_descendientes,
      perc.peliqui AS nro_liquidacion,
      CASE WHEN perc.perepre='R' THEN 1 ELSE 0 END AS es_representante_menor_edad,
      perc.pediscr AS origen_discrepancia,
      coalesce(origen.id_origen,indefinidos.id_origen) AS id_origen,
      CASE WHEN perc.pemodif='S' THEN 1 ELSE 0 END AS hay_modificaciones,
      perc.peejdev AS ejercicio_devengo,
      perc.peceuta AS ceuta_melilla,
      CASE WHEN perc.perpcus='S' THEN 1 ELSE 0 END AS hay_repercusion,
      perc.peretin/100 AS percepciones_dinerarias,
      perc.pereten/100 AS retenciones_practicadas,
      perc.perbesp/100 AS percepcion_en_especie,
      perc.peincta/100 AS ingresos_cuenta_efectuados,
      perc.peinrpc/100 AS ingresos_cuenta_repercutidos,
      perc.penoint/100 AS cantidad_no_integrada,
      perc.pepensc/100 AS pension_compensatoria,
      perc.pegasto/100 AS gastos_seguridad_social
    FROM dbn1_stg_dhyf.dbo.tbn190pe_bc perc
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=perc.peejerc+'AC'+perc.perefer+'00K0000')
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves cl ON (cl.ejercicio=perc.peejerc AND cl.cod_clave=perc.peclapr)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclaves sc ON (sc.id_clave=cl.id_clave AND sc.cod_subclave=perc.pesubcl)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen origen ON (CAST(origen.cod_origen AS varchar)=perc.peorige)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (perc.penifpr=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=perc.peprort)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE perc.pesecue<>0
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo AS tbn1_detalles_informativos_190_rendimientos_trabajo
  USING query ON query.id_documento=tbn1_detalles_informativos_190_rendimientos_trabajo.id_documento AND query.secuencia=tbn1_detalles_informativos_190_rendimientos_trabajo.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo=0
                    AND (tbn1_detalles_informativos_190_rendimientos_trabajo.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_190_rendimientos_trabajo.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.razon_social<>query.razon_social OR (tbn1_detalles_informativos_190_rendimientos_trabajo.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.fec_identificacion<>query.fec_identificacion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_identificacion IS NULL AND query.fec_identificacion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_identificacion IS NOT NULL AND query.fec_identificacion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion<>query.fec_desintificacion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion IS NULL AND query.fec_desintificacion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion IS NOT NULL AND query.fec_desintificacion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.forma_juridica<>query.forma_juridica OR (tbn1_detalles_informativos_190_rendimientos_trabajo.forma_juridica IS NULL AND query.forma_juridica IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.forma_juridica IS NOT NULL AND query.forma_juridica IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.administracion<>query.administracion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo<>query.es_externo OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_clave<>query.id_clave OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_clave IS NULL AND query.id_clave IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_clave IS NOT NULL AND query.id_clave IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_subclave<>query.id_subclave OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_subclave IS NULL AND query.id_subclave IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_subclave IS NOT NULL AND query.id_subclave IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia<>query.grado_minusvalia OR (tbn1_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia IS NULL AND query.grado_minusvalia IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia IS NOT NULL AND query.grado_minusvalia IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.num_descendientes<>query.num_descendientes OR (tbn1_detalles_informativos_190_rendimientos_trabajo.num_descendientes IS NULL AND query.num_descendientes IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.num_descendientes IS NOT NULL AND query.num_descendientes IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.nro_liquidacion<>query.nro_liquidacion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.nro_liquidacion IS NULL AND query.nro_liquidacion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.nro_liquidacion IS NOT NULL AND query.nro_liquidacion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad<>query.es_representante_menor_edad OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad IS NULL AND query.es_representante_menor_edad IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad IS NOT NULL AND query.es_representante_menor_edad IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.origen_discrepancia<>query.origen_discrepancia OR (tbn1_detalles_informativos_190_rendimientos_trabajo.origen_discrepancia IS NULL AND query.origen_discrepancia IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.origen_discrepancia IS NOT NULL AND query.origen_discrepancia IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_origen<>query.id_origen OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_origen IS NULL AND query.id_origen IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_origen IS NOT NULL AND query.id_origen IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.hay_modificaciones<>query.hay_modificaciones OR (tbn1_detalles_informativos_190_rendimientos_trabajo.hay_modificaciones IS NULL AND query.hay_modificaciones IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.hay_modificaciones IS NOT NULL AND query.hay_modificaciones IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla<>query.ceuta_melilla OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla IS NULL AND query.ceuta_melilla IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla IS NOT NULL AND query.ceuta_melilla IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.hay_repercusion<>query.hay_repercusion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.hay_repercusion IS NULL AND query.hay_repercusion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.hay_repercusion IS NOT NULL AND query.hay_repercusion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias<>query.percepciones_dinerarias OR (tbn1_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias IS NULL AND query.percepciones_dinerarias IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias IS NOT NULL AND query.percepciones_dinerarias IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas<>query.retenciones_practicadas OR (tbn1_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas IS NULL AND query.retenciones_practicadas IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas IS NOT NULL AND query.retenciones_practicadas IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie<>query.percepcion_en_especie OR (tbn1_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie IS NULL AND query.percepcion_en_especie IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie IS NOT NULL AND query.percepcion_en_especie IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados<>query.ingresos_cuenta_efectuados OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados IS NULL AND query.ingresos_cuenta_efectuados IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados IS NOT NULL AND query.ingresos_cuenta_efectuados IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos<>query.ingresos_cuenta_repercutidos OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos IS NULL AND query.ingresos_cuenta_repercutidos IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos IS NOT NULL AND query.ingresos_cuenta_repercutidos IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada<>query.cantidad_no_integrada OR (tbn1_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada IS NULL AND query.cantidad_no_integrada IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada IS NOT NULL AND query.cantidad_no_integrada IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria<>query.pension_compensatoria OR (tbn1_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria IS NULL AND query.pension_compensatoria IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria IS NOT NULL AND query.pension_compensatoria IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social<>query.gastos_seguridad_social OR (tbn1_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social IS NULL AND query.gastos_seguridad_social IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social IS NOT NULL AND query.gastos_seguridad_social IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      nif_declarado=query.nif_declarado,
      razon_social=query.razon_social,
      fec_identificacion=query.fec_identificacion,
      fec_desintificacion=query.fec_desintificacion,
      forma_juridica=query.forma_juridica,
      administracion=query.administracion,
      es_externo=query.es_externo,
      id_provincia=query.id_provincia,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_identificado=query.es_identificado,
      id_clave=query.id_clave,
      id_subclave=query.id_subclave,
      grado_minusvalia=query.grado_minusvalia,
      num_descendientes=query.num_descendientes,
      nro_liquidacion=query.nro_liquidacion,
      es_representante_menor_edad=query.es_representante_menor_edad,
      origen_discrepancia=query.origen_discrepancia,
      id_origen=query.id_origen,
      hay_modificaciones=query.hay_modificaciones,
      ejercicio_devengo=query.ejercicio_devengo,
      ceuta_melilla=query.ceuta_melilla,
      hay_repercusion=query.hay_repercusion,
      percepciones_dinerarias=query.percepciones_dinerarias,
      retenciones_practicadas=query.retenciones_practicadas,
      percepcion_en_especie=query.percepcion_en_especie,
      ingresos_cuenta_efectuados=query.ingresos_cuenta_efectuados,
      ingresos_cuenta_repercutidos=query.ingresos_cuenta_repercutidos,
      cantidad_no_integrada=query.cantidad_no_integrada,
      pension_compensatoria=query.pension_compensatoria,
      gastos_seguridad_social=query.gastos_seguridad_social,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,nif_declarado,razon_social,fec_identificacion,fec_desintificacion,forma_juridica,administracion,es_externo,id_provincia,es_contribuyente,id_contribuyente,es_identificado,id_clave,id_subclave,grado_minusvalia,num_descendientes,nro_liquidacion,es_representante_menor_edad,origen_discrepancia,id_origen,hay_modificaciones,ejercicio_devengo,ceuta_melilla,hay_repercusion,percepciones_dinerarias,retenciones_practicadas,percepcion_en_especie,ingresos_cuenta_efectuados,ingresos_cuenta_repercutidos,cantidad_no_integrada,pension_compensatoria,gastos_seguridad_social,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.nif_declarado,
      query.razon_social,
      query.fec_identificacion,
      query.fec_desintificacion,
      query.forma_juridica,
      query.administracion,
      query.es_externo,
      query.id_provincia,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_identificado,
      query.id_clave,
      query.id_subclave,
      query.grado_minusvalia,
      query.num_descendientes,
      query.nro_liquidacion,
      query.es_representante_menor_edad,
      query.origen_discrepancia,
      query.id_origen,
      query.hay_modificaciones,
      query.ejercicio_devengo,
      query.ceuta_melilla,
      query.hay_repercusion,
      query.percepciones_dinerarias,
      query.retenciones_practicadas,
      query.percepcion_en_especie,
      query.ingresos_cuenta_efectuados,
      query.ingresos_cuenta_repercutidos,
      query.cantidad_no_integrada,
      query.pension_compensatoria,
      query.gastos_seguridad_social,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo=0
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_190_EXTERNOS_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_190_EXTERNOS_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_190_EXTERNOS_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_190_EXTERNOS_ssis',
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
      perc.pxsecue AS secuencia,
      perc.pxnifpr AS nif_declarado,
      perc.pxnomrs AS razon_social,
      perc.pxfeide AS fec_identificacion,
      perc.pxfeude AS fec_desintificacion,
      perc.pxfjuri AS forma_juridica,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_identificado,
      substring(perc.pxrefer,1,1) AS administracion,
      1 AS es_externo,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      coalesce(cl.id_clave,indefinidos.id_clave) AS id_clave,
      coalesce(sc.id_subclave,indefinidos.id_subclave) AS id_subclave,
      perc.pxminus AS grado_minusvalia,
      perc.pxhijos AS num_descendientes,
      CASE WHEN perc.pxrepre='R' THEN 1 ELSE 0 END AS es_representante_menor_edad,
      1 AS id_origen,
      perc.pxejdev AS ejercicio_devengo,
      perc.pxceuta AS ceuta_melilla,
      CASE WHEN perc.pxrpcus='S' THEN 1 ELSE 0 END AS hay_repercusion,
      perc.pxretin/100 AS percepciones_dinerarias,
      perc.pxreten/100 AS retenciones_practicadas,
      perc.pxrbesp/100 AS percepcion_en_especie,
      perc.pxincta/100 AS ingresos_cuenta_efectuados,
      perc.pxinrpc/100 AS ingresos_cuenta_repercutidos,
      perc.pxnoint/100 AS cantidad_no_integrada,
      perc.pxpensc/100 AS pension_compensatoria,
      perc.pxgasto/100 AS gastos_seguridad_social
    FROM dbn1_stg_dhyf.dbo.tbn1i3pe_bc perc
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(perc.pxejerc AS varchar)+'AC'+CAST(perc.pxrefer AS varchar)+'00K0000')
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves cl ON (cl.ejercicio=CAST(perc.pxejerc AS varchar) AND cl.cod_clave=perc.pxclapr)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclaves sc ON (sc.id_clave=cl.id_clave AND sc.cod_subclave=perc.pxsubcl)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (perc.pxnifpr=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=perc.pxprort)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE perc.pxsecue<>0
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo AS tbn1_detalles_informativos_190_rendimientos_trabajo
  USING query ON query.id_documento=tbn1_detalles_informativos_190_rendimientos_trabajo.id_documento AND query.secuencia=tbn1_detalles_informativos_190_rendimientos_trabajo.secuencia
  WHEN MATCHED AND (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo=1
                    AND (tbn1_detalles_informativos_190_rendimientos_trabajo.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_190_rendimientos_trabajo.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.razon_social<>query.razon_social OR (tbn1_detalles_informativos_190_rendimientos_trabajo.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.fec_identificacion<>query.fec_identificacion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_identificacion IS NULL AND query.fec_identificacion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_identificacion IS NOT NULL AND query.fec_identificacion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion<>query.fec_desintificacion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion IS NULL AND query.fec_desintificacion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion IS NOT NULL AND query.fec_desintificacion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.forma_juridica<>query.forma_juridica OR (tbn1_detalles_informativos_190_rendimientos_trabajo.forma_juridica IS NULL AND query.forma_juridica IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.forma_juridica IS NOT NULL AND query.forma_juridica IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_identificado<>query.es_identificado OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.administracion<>query.administracion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo<>query.es_externo OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_clave<>query.id_clave OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_clave IS NULL AND query.id_clave IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_clave IS NOT NULL AND query.id_clave IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_subclave<>query.id_subclave OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_subclave IS NULL AND query.id_subclave IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_subclave IS NOT NULL AND query.id_subclave IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia<>query.grado_minusvalia OR (tbn1_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia IS NULL AND query.grado_minusvalia IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia IS NOT NULL AND query.grado_minusvalia IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.num_descendientes<>query.num_descendientes OR (tbn1_detalles_informativos_190_rendimientos_trabajo.num_descendientes IS NULL AND query.num_descendientes IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.num_descendientes IS NOT NULL AND query.num_descendientes IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad<>query.es_representante_menor_edad OR (tbn1_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad IS NULL AND query.es_representante_menor_edad IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad IS NOT NULL AND query.es_representante_menor_edad IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.id_origen<>query.id_origen OR (tbn1_detalles_informativos_190_rendimientos_trabajo.id_origen IS NULL AND query.id_origen IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.id_origen IS NOT NULL AND query.id_origen IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla<>query.ceuta_melilla OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla IS NULL AND query.ceuta_melilla IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla IS NOT NULL AND query.ceuta_melilla IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.hay_repercusion<>query.hay_repercusion OR (tbn1_detalles_informativos_190_rendimientos_trabajo.hay_repercusion IS NULL AND query.hay_repercusion IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.hay_repercusion IS NOT NULL AND query.hay_repercusion IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias<>query.percepciones_dinerarias OR (tbn1_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias IS NULL AND query.percepciones_dinerarias IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias IS NOT NULL AND query.percepciones_dinerarias IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas<>query.retenciones_practicadas OR (tbn1_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas IS NULL AND query.retenciones_practicadas IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas IS NOT NULL AND query.retenciones_practicadas IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie<>query.percepcion_en_especie OR (tbn1_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie IS NULL AND query.percepcion_en_especie IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie IS NOT NULL AND query.percepcion_en_especie IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados<>query.ingresos_cuenta_efectuados OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados IS NULL AND query.ingresos_cuenta_efectuados IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados IS NOT NULL AND query.ingresos_cuenta_efectuados IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos<>query.ingresos_cuenta_repercutidos OR (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos IS NULL AND query.ingresos_cuenta_repercutidos IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos IS NOT NULL AND query.ingresos_cuenta_repercutidos IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada<>query.cantidad_no_integrada OR (tbn1_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada IS NULL AND query.cantidad_no_integrada IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada IS NOT NULL AND query.cantidad_no_integrada IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria<>query.pension_compensatoria OR (tbn1_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria IS NULL AND query.pension_compensatoria IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria IS NOT NULL AND query.pension_compensatoria IS NULL)
                    OR tbn1_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social<>query.gastos_seguridad_social OR (tbn1_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social IS NULL AND query.gastos_seguridad_social IS NOT NULL) OR  (tbn1_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social IS NOT NULL AND query.gastos_seguridad_social IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      nif_declarado=query.nif_declarado,
      razon_social=query.razon_social,
      fec_identificacion=query.fec_identificacion,
      fec_desintificacion=query.fec_desintificacion,
      forma_juridica=query.forma_juridica,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_identificado=query.es_identificado,
      administracion=query.administracion,
      es_externo=query.es_externo,
      id_provincia=query.id_provincia,
      id_clave=query.id_clave,
      id_subclave=query.id_subclave,
      grado_minusvalia=query.grado_minusvalia,
      num_descendientes=query.num_descendientes,
      es_representante_menor_edad=query.es_representante_menor_edad,
      id_origen=query.id_origen,
      ejercicio_devengo=query.ejercicio_devengo,
      ceuta_melilla=query.ceuta_melilla,
      hay_repercusion=query.hay_repercusion,
      percepciones_dinerarias=query.percepciones_dinerarias,
      retenciones_practicadas=query.retenciones_practicadas,
      percepcion_en_especie=query.percepcion_en_especie,
      ingresos_cuenta_efectuados=query.ingresos_cuenta_efectuados,
      ingresos_cuenta_repercutidos=query.ingresos_cuenta_repercutidos,
      cantidad_no_integrada=query.cantidad_no_integrada,
      pension_compensatoria=query.pension_compensatoria,
      gastos_seguridad_social=query.gastos_seguridad_social,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,nif_declarado,razon_social,fec_identificacion,fec_desintificacion,forma_juridica,es_contribuyente,id_contribuyente,es_identificado,administracion,es_externo,id_provincia,id_clave,id_subclave,grado_minusvalia,num_descendientes,es_representante_menor_edad,id_origen,ejercicio_devengo,ceuta_melilla,hay_repercusion,percepciones_dinerarias,retenciones_practicadas,percepcion_en_especie,ingresos_cuenta_efectuados,ingresos_cuenta_repercutidos,cantidad_no_integrada,pension_compensatoria,gastos_seguridad_social,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.nif_declarado,
      query.razon_social,
      query.fec_identificacion,
      query.fec_desintificacion,
      query.forma_juridica,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_identificado,
      query.administracion,
      query.es_externo,
      query.id_provincia,
      query.id_clave,
      query.id_subclave,
      query.grado_minusvalia,
      query.num_descendientes,
      query.es_representante_menor_edad,
      query.id_origen,
      query.ejercicio_devengo,
      query.ceuta_melilla,
      query.hay_repercusion,
      query.percepciones_dinerarias,
      query.retenciones_practicadas,
      query.percepcion_en_especie,
      query.ingresos_cuenta_efectuados,
      query.ingresos_cuenta_repercutidos,
      query.cantidad_no_integrada,
      query.pension_compensatoria,
      query.gastos_seguridad_social,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_detalles_informativos_190_rendimientos_trabajo.es_externo=1
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_190_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_190_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_190_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_modelo_190_ssis',
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_190_INTERNOS_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_190_EXTERNOS_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_190_INTERNOS_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_190_EXTERNOS_ssis @log;

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

