PRINT 'cargar_dimensional_modelo_190.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  nif_declarante varchar(12) NOT NULL,
  fec_identificacion date,
  razon_social varchar(40) NOT NULL,
  administracion varchar(1),
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_externo varchar(1) NOT NULL,
  fec_ultimo_calculo date,
  fec_carga_declaracion date,
  fec_respuesta_notif date,
  es_cuadrada_desde_carga varchar(1) NOT NULL,
  es_cuadrada_posteriormente varchar(1) NOT NULL,
  telefono_contacto varchar(9) NOT NULL,
  nombre_contacto varchar(40) NOT NULL,
  id_iae_principal int NOT NULL,
  es_declaracion_negativa varchar(1) NOT NULL,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  provincia varchar(50) NOT NULL,
  nombre_presentador varchar(40) NOT NULL,
  nif_presentador varchar(12) NOT NULL,
  hay_modificaciones varchar(1) NOT NULL,
  numero_caja varchar(8) NOT NULL,
  cod_origen varchar(2) NOT NULL,
  origen varchar(50) NOT NULL,
  fec_presentacion date,
  es_complementaria varchar(1) NOT NULL,
  es_sustitutiva varchar(1) NOT NULL,
  cod_origen_grabacion varchar(1) NOT NULL,
  origen_grabacion varchar(50) NOT NULL,
  internet_hora_presentacion varchar(6) NULL,
  referencia_colectiva int NULL,
  internet_referencia int NULL,
  internet_secuencia int NULL,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo_tbn1_dim_actividades_economicas FOREIGN KEY (id_iae_principal) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_actividades_economicas(id_iae)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD fec_identificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_ultimo_calculo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD fec_ultimo_calculo date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_carga_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD fec_carga_declaracion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_respuesta_notif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD fec_respuesta_notif date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_desde_carga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_cuadrada_desde_carga varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_posteriormente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_cuadrada_posteriormente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD telefono_contacto varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD nombre_contacto varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_iae_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD id_iae_principal int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_declaracion_negativa')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_declaracion_negativa varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_presentador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD nombre_presentador varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_presentador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD nif_presentador varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD hay_modificaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='numero_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD numero_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD cod_origen varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD origen varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_complementaria varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD es_sustitutiva varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_origen_grabacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD cod_origen_grabacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen_grabacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD origen_grabacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_hora_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD internet_hora_presentacion varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='referencia_colectiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD referencia_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_referencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD internet_referencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD internet_secuencia int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_identificacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN razon_social varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_ultimo_calculo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_ultimo_calculo date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_carga_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_carga_declaracion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_respuesta_notif' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_respuesta_notif date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_desde_carga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_cuadrada_desde_carga varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_cuadrada_posteriormente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_cuadrada_posteriormente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN telefono_contacto varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nombre_contacto varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_iae_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN id_iae_principal int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_declaracion_negativa' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_declaracion_negativa varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nombre_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nombre_presentador varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN nif_presentador varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN hay_modificaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='numero_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN numero_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN cod_origen varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN origen varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_complementaria varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN es_sustitutiva varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN cod_origen_grabacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen_grabacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN origen_grabacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_hora_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN internet_hora_presentacion varchar(6) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='referencia_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN referencia_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_referencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN internet_referencia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='internet_secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ALTER COLUMN internet_secuencia int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo_tbn1_dim_actividades_economicas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_190_rendimientos_trabajo_tbn1_dim_actividades_economicas FOREIGN KEY (id_iae_principal) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_actividades_economicas(id_iae)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_190_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_190_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_190_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_documentos_informativos_190_ssis',
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
    doc_190.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(left(doc_190.nif_declarante,9)+' '+right(doc_190.nif_declarante,2),'') AS nif_declarante,
    doc_190.fec_identificacion AS fec_identificacion,
    coalesce(doc_190.razon_social,'') AS razon_social,
    coalesce(doc_190.administracion,'') AS administracion,
    CASE WHEN doc_190.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    c.id_contribuyente AS id_contribuyente,
    CASE WHEN doc_190.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    doc_190.fec_ultimo_calculo AS fec_ultimo_calculo,
    doc_190.fec_carga_declaracion AS fec_carga_declaracion,
    doc_190.fec_respuesta_notif AS fec_respuesta_notif,
    CASE WHEN doc_190.es_cuadrada_desde_carga=1 THEN 'S' ELSE 'N' END AS es_cuadrada_desde_carga,
    CASE WHEN doc_190.es_cuadrada_posteriormente=1 THEN 'S' ELSE 'N' END AS es_cuadrada_posteriormente,
    coalesce(doc_190.telefono_contacto,'') AS telefono_contacto,
    coalesce(doc_190.nombre_contacto,'') AS nombre_contacto,
    a.id_iae AS id_iae_principal,
    CASE WHEN doc_190.es_declaracion_negativa=1 THEN 'S' ELSE 'N' END AS es_declaracion_negativa,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    prov.provincia AS provincia,
    coalesce(doc_190.nombre_presentador,'') AS nombre_presentador,
    coalesce(left(doc_190.nif_presentador,9)+' '+right(doc_190.nif_presentador,2),'') AS nif_presentador,
    CASE WHEN doc_190.hay_modificaciones=1 THEN 'S' ELSE 'N' END AS hay_modificaciones,
    coalesce(doc_190.numero_caja,'') AS numero_caja,
    origen.cod_origen AS cod_origen,
    origen.origen AS origen,
    doc_190.fec_presentacion AS fec_presentacion,
    CASE WHEN doc_190.es_complementaria=1 THEN 'S' ELSE 'N' END AS es_complementaria,
    CASE WHEN doc_190.es_sustitutiva=1 THEN 'S' ELSE 'N' END AS es_sustitutiva,
    origen_grabacion.cod_origen_grabacion_mi AS cod_origen_grabacion,
    origen_grabacion.origen_grabacion AS origen_grabacion,
    doc_190.internet_hora_presentacion AS internet_hora_presentacion,
    doc_190.referencia_colectiva AS referencia_colectiva,
    doc_190.internet_referencia AS internet_referencia,
    doc_190.internet_secuencia AS internet_secuencia,
    doc_190.fec_baja AS fec_baja
  INTO #query__AED68
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_190_rendimientos_trabajo doc_190
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_190.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.id_contribuyente=doc_190.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov ON (prov.id_provincia=doc_190.id_provincia_remitente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen origen ON (origen.id_origen=doc_190.id_origen)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_190.id_tipo_presentacion)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_origenes_grabacion origen_grabacion ON (origen_grabacion.id_origen_grabacion=doc_190.id_origen_grabacion)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_actividades_economicas a ON (a.id_iae=doc_190.id_iae_principal)
  WHERE doc_190.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__6BAE5 ON #query__AED68 (id_documento)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo AS tbn1_dim_documentos_informativos_190_rendimientos_trabajo
  USING #query__AED68 AS query ON query.id_documento=tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_documento
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_190_rendimientos_trabajo AS tbn1_dim_documentos_informativos_190_rendimientos_trabajo
  USING #query__AED68 AS query ON query.id_documento=tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_documento
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_identificacion<>query.fec_identificacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_identificacion IS NULL AND query.fec_identificacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_identificacion IS NOT NULL AND query.fec_identificacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.administracion<>query.administracion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_externo<>query.es_externo OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_ultimo_calculo<>query.fec_ultimo_calculo OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_ultimo_calculo IS NULL AND query.fec_ultimo_calculo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_ultimo_calculo IS NOT NULL AND query.fec_ultimo_calculo IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion<>query.fec_carga_declaracion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion IS NULL AND query.fec_carga_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_carga_declaracion IS NOT NULL AND query.fec_carga_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_respuesta_notif<>query.fec_respuesta_notif OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_respuesta_notif IS NULL AND query.fec_respuesta_notif IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_respuesta_notif IS NOT NULL AND query.fec_respuesta_notif IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_desde_carga<>query.es_cuadrada_desde_carga OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_desde_carga IS NULL AND query.es_cuadrada_desde_carga IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_desde_carga IS NOT NULL AND query.es_cuadrada_desde_carga IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_posteriormente<>query.es_cuadrada_posteriormente OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_posteriormente IS NULL AND query.es_cuadrada_posteriormente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_cuadrada_posteriormente IS NOT NULL AND query.es_cuadrada_posteriormente IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.telefono_contacto<>query.telefono_contacto OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nombre_contacto<>query.nombre_contacto OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_iae_principal<>query.id_iae_principal OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_iae_principal IS NULL AND query.id_iae_principal IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.id_iae_principal IS NOT NULL AND query.id_iae_principal IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_declaracion_negativa<>query.es_declaracion_negativa OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_declaracion_negativa IS NULL AND query.es_declaracion_negativa IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_declaracion_negativa IS NOT NULL AND query.es_declaracion_negativa IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.provincia<>query.provincia OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nombre_presentador<>query.nombre_presentador OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nombre_presentador IS NULL AND query.nombre_presentador IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nombre_presentador IS NOT NULL AND query.nombre_presentador IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nif_presentador<>query.nif_presentador OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nif_presentador IS NULL AND query.nif_presentador IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.nif_presentador IS NOT NULL AND query.nif_presentador IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.hay_modificaciones<>query.hay_modificaciones OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.hay_modificaciones IS NULL AND query.hay_modificaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.hay_modificaciones IS NOT NULL AND query.hay_modificaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.numero_caja<>query.numero_caja OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.numero_caja IS NULL AND query.numero_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.numero_caja IS NOT NULL AND query.numero_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_origen<>query.cod_origen OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_origen IS NULL AND query.cod_origen IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_origen IS NOT NULL AND query.cod_origen IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.origen<>query.origen OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.origen IS NOT NULL AND query.origen IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_complementaria<>query.es_complementaria OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_sustitutiva<>query.es_sustitutiva OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_origen_grabacion<>query.cod_origen_grabacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_origen_grabacion IS NULL AND query.cod_origen_grabacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.cod_origen_grabacion IS NOT NULL AND query.cod_origen_grabacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.origen_grabacion<>query.origen_grabacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.origen_grabacion IS NULL AND query.origen_grabacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.origen_grabacion IS NOT NULL AND query.origen_grabacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_hora_presentacion<>query.internet_hora_presentacion OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_hora_presentacion IS NULL AND query.internet_hora_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_hora_presentacion IS NOT NULL AND query.internet_hora_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.referencia_colectiva<>query.referencia_colectiva OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.referencia_colectiva IS NULL AND query.referencia_colectiva IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.referencia_colectiva IS NOT NULL AND query.referencia_colectiva IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_referencia<>query.internet_referencia OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_referencia IS NULL AND query.internet_referencia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_referencia IS NOT NULL AND query.internet_referencia IS NULL)
                    OR tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_secuencia<>query.internet_secuencia OR (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_secuencia IS NULL AND query.internet_secuencia IS NOT NULL) OR  (tbn1_dim_documentos_informativos_190_rendimientos_trabajo.internet_secuencia IS NOT NULL AND query.internet_secuencia IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      nif_declarante=query.nif_declarante,
      fec_identificacion=query.fec_identificacion,
      razon_social=query.razon_social,
      administracion=query.administracion,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      fec_ultimo_calculo=query.fec_ultimo_calculo,
      fec_carga_declaracion=query.fec_carga_declaracion,
      fec_respuesta_notif=query.fec_respuesta_notif,
      es_cuadrada_desde_carga=query.es_cuadrada_desde_carga,
      es_cuadrada_posteriormente=query.es_cuadrada_posteriormente,
      telefono_contacto=query.telefono_contacto,
      nombre_contacto=query.nombre_contacto,
      id_iae_principal=query.id_iae_principal,
      es_declaracion_negativa=query.es_declaracion_negativa,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      provincia=query.provincia,
      nombre_presentador=query.nombre_presentador,
      nif_presentador=query.nif_presentador,
      hay_modificaciones=query.hay_modificaciones,
      numero_caja=query.numero_caja,
      cod_origen=query.cod_origen,
      origen=query.origen,
      fec_presentacion=query.fec_presentacion,
      es_complementaria=query.es_complementaria,
      es_sustitutiva=query.es_sustitutiva,
      cod_origen_grabacion=query.cod_origen_grabacion,
      origen_grabacion=query.origen_grabacion,
      internet_hora_presentacion=query.internet_hora_presentacion,
      referencia_colectiva=query.referencia_colectiva,
      internet_referencia=query.internet_referencia,
      internet_secuencia=query.internet_secuencia
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,nif_declarante,fec_identificacion,razon_social,administracion,es_contribuyente,id_contribuyente,es_externo,fec_ultimo_calculo,fec_carga_declaracion,fec_respuesta_notif,es_cuadrada_desde_carga,es_cuadrada_posteriormente,telefono_contacto,nombre_contacto,id_iae_principal,es_declaracion_negativa,cod_tipo_presentacion,tipo_presentacion,provincia,nombre_presentador,nif_presentador,hay_modificaciones,numero_caja,cod_origen,origen,fec_presentacion,es_complementaria,es_sustitutiva,cod_origen_grabacion,origen_grabacion,internet_hora_presentacion,referencia_colectiva,internet_referencia,internet_secuencia) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.nif_declarante,
      query.fec_identificacion,
      query.razon_social,
      query.administracion,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.fec_ultimo_calculo,
      query.fec_carga_declaracion,
      query.fec_respuesta_notif,
      query.es_cuadrada_desde_carga,
      query.es_cuadrada_posteriormente,
      query.telefono_contacto,
      query.nombre_contacto,
      query.id_iae_principal,
      query.es_declaracion_negativa,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.provincia,
      query.nombre_presentador,
      query.nif_presentador,
      query.hay_modificaciones,
      query.numero_caja,
      query.cod_origen,
      query.origen,
      query.fec_presentacion,
      query.es_complementaria,
      query.es_sustitutiva,
      query.cod_origen_grabacion,
      query.origen_grabacion,
      query.internet_hora_presentacion,
      query.referencia_colectiva,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo(
  id_detalles_190 int NOT NULL,
  id_documento int NOT NULL,
  secuencia int NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  razon_social varchar(40) NOT NULL,
  administracion varchar(1),
  fec_identificacion date,
  fec_desintificacion date,
  forma_juridica varchar(1) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_identificado varchar(1) NOT NULL,
  es_externo varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_clave varchar(15) NOT NULL,
  clave varchar(100) NOT NULL,
  cod_subclave int NOT NULL,
  subclave varchar(150) NOT NULL,
  num_descendientes int,
  grado_minusvalia int,
  nro_liquidacion varchar(13) NOT NULL,
  es_representante_menor_edad varchar(1) NOT NULL,
  origen_discrepancia varchar(1) NOT NULL,
  cod_origen varchar(2) NOT NULL,
  origen varchar(50) NOT NULL,
  hay_modificaciones varchar(1) NOT NULL,
  ejercicio_devengo int,
  ceuta_melilla varchar(1) NOT NULL,
  hay_repercusion varchar(1) NOT NULL,
  percepciones_dinerarias numeric(18,2),
  retenciones_practicadas numeric(18,2),
  percepcion_en_especie numeric(18,2),
  ingresos_cuenta_efectuados numeric(18,2),
  ingresos_cuenta_repercutidos numeric(18,2),
  cantidad_no_integrada numeric(18,2),
  pension_compensatoria numeric(18,2),
  gastos_seguridad_social numeric(18,2),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_detalles_190),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_detalles_190')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD id_detalles_190 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD fec_identificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_desintificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD fec_desintificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='forma_juridica')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD forma_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_clave')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD cod_clave varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='clave')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD clave varchar(100)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_subclave')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD cod_subclave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='subclave')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD subclave varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='num_descendientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD num_descendientes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='grado_minusvalia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD grado_minusvalia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nro_liquidacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD nro_liquidacion varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_representante_menor_edad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD es_representante_menor_edad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen_discrepancia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD origen_discrepancia varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD cod_origen varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD origen varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD hay_modificaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD ejercicio_devengo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ceuta_melilla')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD ceuta_melilla varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_repercusion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD hay_repercusion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepciones_dinerarias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD percepciones_dinerarias numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='retenciones_practicadas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD retenciones_practicadas numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepcion_en_especie')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD percepcion_en_especie numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_efectuados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD ingresos_cuenta_efectuados numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_repercutidos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD ingresos_cuenta_repercutidos numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cantidad_no_integrada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD cantidad_no_integrada numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='pension_compensatoria')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD pension_compensatoria numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='gastos_seguridad_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD gastos_seguridad_social numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_identificado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_IDENTIFICADO DEFAULT 'S' FOR es_identificado

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='provincia' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_PROVINCIA DEFAULT 'Indefinido' FOR provincia

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_representante_menor_edad' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_190_RENDIMIENTOS_TRABAJO_ES_REPRESENTANTE_MENOR_EDAD DEFAULT 'N' FOR es_representante_menor_edad

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_detalles_190' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_detalles_190 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN secuencia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN razon_social varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_identificacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='fec_desintificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN fec_desintificacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='forma_juridica' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN forma_juridica varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo SET es_identificado='S' WHERE es_identificado IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_identificado varchar(1) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo SET provincia='Indefinido' WHERE provincia IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN provincia varchar(50) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_clave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN cod_clave varchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='clave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN clave varchar(100) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_subclave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN cod_subclave int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='subclave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN subclave varchar(150) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='num_descendientes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN num_descendientes int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='grado_minusvalia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN grado_minusvalia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='nro_liquidacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN nro_liquidacion varchar(13) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='es_representante_menor_edad' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo SET es_representante_menor_edad='N' WHERE es_representante_menor_edad IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN es_representante_menor_edad varchar(1) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen_discrepancia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN origen_discrepancia varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cod_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN cod_origen varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN origen varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_modificaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN hay_modificaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ejercicio_devengo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ceuta_melilla' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ceuta_melilla varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='hay_repercusion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN hay_repercusion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepciones_dinerarias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN percepciones_dinerarias numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='retenciones_practicadas' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN retenciones_practicadas numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='percepcion_en_especie' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN percepcion_en_especie numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_efectuados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ingresos_cuenta_efectuados numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='ingresos_cuenta_repercutidos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN ingresos_cuenta_repercutidos numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='cantidad_no_integrada' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN cantidad_no_integrada numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='pension_compensatoria' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN pension_compensatoria numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND COLUMN_NAME='gastos_seguridad_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ALTER COLUMN gastos_seguridad_social numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo PRIMARY KEY CLUSTERED (id_detalles_190)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_190_rendimientos_trabajo' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_190_rendimientos_trabajo_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_190_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_190_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_190_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_detalles_informativos_190_ssis',
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
    det_190.id_detalles_190 AS id_detalles_190,
    det_190.id_documento AS id_documento,
    det_190.secuencia AS secuencia,
    coalesce(left(det_190.nif_declarado,9)+' '+right(det_190.nif_declarado,2),'') AS nif_declarado,
    coalesce(det_190.razon_social,'') AS razon_social,
    coalesce(det_190.administracion,'') AS administracion,
    det_190.fec_identificacion AS fec_identificacion,
    det_190.fec_desintificacion AS fec_desintificacion,
    coalesce(det_190.forma_juridica,'') AS forma_juridica,
    CASE WHEN det_190.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    c.id_contribuyente AS id_contribuyente,
    CASE WHEN det_190.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_190.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    provincia.provincia AS provincia,
    cl.cod_clave AS cod_clave,
    cl.clave AS clave,
    sc.cod_subclave AS cod_subclave,
    sc.subclave AS subclave,
    det_190.num_descendientes AS num_descendientes,
    det_190.grado_minusvalia AS grado_minusvalia,
    coalesce(det_190.nro_liquidacion,'') AS nro_liquidacion,
    CASE WHEN det_190.es_representante_menor_edad=1 THEN 'S' ELSE 'N' END AS es_representante_menor_edad,
    coalesce(det_190.origen_discrepancia,'') AS origen_discrepancia,
    origen.cod_origen AS cod_origen,
    origen.origen AS origen,
    CASE WHEN det_190.hay_modificaciones=1 THEN 'S' ELSE 'N' END AS hay_modificaciones,
    det_190.ejercicio_devengo AS ejercicio_devengo,
    CASE WHEN det_190.ceuta_melilla=1 THEN 'S' ELSE 'N' END AS ceuta_melilla,
    CASE WHEN det_190.hay_repercusion=1 THEN 'S' ELSE 'N' END AS hay_repercusion,
    det_190.percepciones_dinerarias AS percepciones_dinerarias,
    det_190.retenciones_practicadas AS retenciones_practicadas,
    det_190.percepcion_en_especie AS percepcion_en_especie,
    det_190.ingresos_cuenta_efectuados AS ingresos_cuenta_efectuados,
    det_190.ingresos_cuenta_repercutidos AS ingresos_cuenta_repercutidos,
    det_190.cantidad_no_integrada AS cantidad_no_integrada,
    det_190.pension_compensatoria AS pension_compensatoria,
    det_190.gastos_seguridad_social AS gastos_seguridad_social,
    det_190.fec_baja AS fec_baja
  INTO #query__C3B9E
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_190_rendimientos_trabajo det_190
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_190 ON (doc_190.id_documento=det_190.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_190.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves cl ON (cl.id_clave=det_190.id_clave)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclaves sc ON (sc.id_subclave=det_190.id_subclave)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen origen ON (origen.id_origen=det_190.id_origen)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_190.id_provincia)
  WHERE det_190.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__54D87 ON #query__C3B9E (id_detalles_190)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo AS tbn1_fact_detalles_informativos_190_rendimientos_trabajo
  USING #query__C3B9E AS query ON query.id_detalles_190=tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_detalles_190
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_190_rendimientos_trabajo AS tbn1_fact_detalles_informativos_190_rendimientos_trabajo
  USING #query__C3B9E AS query ON query.id_detalles_190=tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_detalles_190
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.razon_social<>query.razon_social OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.fec_identificacion<>query.fec_identificacion OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.fec_identificacion IS NULL AND query.fec_identificacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.fec_identificacion IS NOT NULL AND query.fec_identificacion IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion<>query.fec_desintificacion OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion IS NULL AND query.fec_desintificacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.fec_desintificacion IS NOT NULL AND query.fec_desintificacion IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.forma_juridica<>query.forma_juridica OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.forma_juridica IS NULL AND query.forma_juridica IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.forma_juridica IS NOT NULL AND query.forma_juridica IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_clave<>query.cod_clave OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_clave IS NULL AND query.cod_clave IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_clave IS NOT NULL AND query.cod_clave IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.clave<>query.clave OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.clave IS NULL AND query.clave IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.clave IS NOT NULL AND query.clave IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_subclave<>query.cod_subclave OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_subclave IS NULL AND query.cod_subclave IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_subclave IS NOT NULL AND query.cod_subclave IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.subclave<>query.subclave OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.subclave IS NULL AND query.subclave IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.subclave IS NOT NULL AND query.subclave IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.num_descendientes<>query.num_descendientes OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.num_descendientes IS NULL AND query.num_descendientes IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.num_descendientes IS NOT NULL AND query.num_descendientes IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia<>query.grado_minusvalia OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia IS NULL AND query.grado_minusvalia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.grado_minusvalia IS NOT NULL AND query.grado_minusvalia IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.nro_liquidacion<>query.nro_liquidacion OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.nro_liquidacion IS NULL AND query.nro_liquidacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.nro_liquidacion IS NOT NULL AND query.nro_liquidacion IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad<>query.es_representante_menor_edad OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad IS NULL AND query.es_representante_menor_edad IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.es_representante_menor_edad IS NOT NULL AND query.es_representante_menor_edad IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.origen_discrepancia<>query.origen_discrepancia OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.origen_discrepancia IS NULL AND query.origen_discrepancia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.origen_discrepancia IS NOT NULL AND query.origen_discrepancia IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_origen<>query.cod_origen OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_origen IS NULL AND query.cod_origen IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cod_origen IS NOT NULL AND query.cod_origen IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.origen<>query.origen OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.origen IS NOT NULL AND query.origen IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.hay_modificaciones<>query.hay_modificaciones OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.hay_modificaciones IS NULL AND query.hay_modificaciones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.hay_modificaciones IS NOT NULL AND query.hay_modificaciones IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla<>query.ceuta_melilla OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla IS NULL AND query.ceuta_melilla IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ceuta_melilla IS NOT NULL AND query.ceuta_melilla IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.hay_repercusion<>query.hay_repercusion OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.hay_repercusion IS NULL AND query.hay_repercusion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.hay_repercusion IS NOT NULL AND query.hay_repercusion IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias<>query.percepciones_dinerarias OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias IS NULL AND query.percepciones_dinerarias IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.percepciones_dinerarias IS NOT NULL AND query.percepciones_dinerarias IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas<>query.retenciones_practicadas OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas IS NULL AND query.retenciones_practicadas IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.retenciones_practicadas IS NOT NULL AND query.retenciones_practicadas IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie<>query.percepcion_en_especie OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie IS NULL AND query.percepcion_en_especie IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.percepcion_en_especie IS NOT NULL AND query.percepcion_en_especie IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados<>query.ingresos_cuenta_efectuados OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados IS NULL AND query.ingresos_cuenta_efectuados IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_efectuados IS NOT NULL AND query.ingresos_cuenta_efectuados IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos<>query.ingresos_cuenta_repercutidos OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos IS NULL AND query.ingresos_cuenta_repercutidos IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.ingresos_cuenta_repercutidos IS NOT NULL AND query.ingresos_cuenta_repercutidos IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada<>query.cantidad_no_integrada OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada IS NULL AND query.cantidad_no_integrada IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.cantidad_no_integrada IS NOT NULL AND query.cantidad_no_integrada IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria<>query.pension_compensatoria OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria IS NULL AND query.pension_compensatoria IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.pension_compensatoria IS NOT NULL AND query.pension_compensatoria IS NULL)
                    OR tbn1_fact_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social<>query.gastos_seguridad_social OR (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social IS NULL AND query.gastos_seguridad_social IS NOT NULL) OR  (tbn1_fact_detalles_informativos_190_rendimientos_trabajo.gastos_seguridad_social IS NOT NULL AND query.gastos_seguridad_social IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      secuencia=query.secuencia,
      nif_declarado=query.nif_declarado,
      razon_social=query.razon_social,
      administracion=query.administracion,
      fec_identificacion=query.fec_identificacion,
      fec_desintificacion=query.fec_desintificacion,
      forma_juridica=query.forma_juridica,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_identificado=query.es_identificado,
      es_externo=query.es_externo,
      provincia=query.provincia,
      cod_clave=query.cod_clave,
      clave=query.clave,
      cod_subclave=query.cod_subclave,
      subclave=query.subclave,
      num_descendientes=query.num_descendientes,
      grado_minusvalia=query.grado_minusvalia,
      nro_liquidacion=query.nro_liquidacion,
      es_representante_menor_edad=query.es_representante_menor_edad,
      origen_discrepancia=query.origen_discrepancia,
      cod_origen=query.cod_origen,
      origen=query.origen,
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
      gastos_seguridad_social=query.gastos_seguridad_social
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_190,id_documento,secuencia,nif_declarado,razon_social,administracion,fec_identificacion,fec_desintificacion,forma_juridica,es_contribuyente,id_contribuyente,es_identificado,es_externo,provincia,cod_clave,clave,cod_subclave,subclave,num_descendientes,grado_minusvalia,nro_liquidacion,es_representante_menor_edad,origen_discrepancia,cod_origen,origen,hay_modificaciones,ejercicio_devengo,ceuta_melilla,hay_repercusion,percepciones_dinerarias,retenciones_practicadas,percepcion_en_especie,ingresos_cuenta_efectuados,ingresos_cuenta_repercutidos,cantidad_no_integrada,pension_compensatoria,gastos_seguridad_social) VALUES (
      query.id_detalles_190,
      query.id_documento,
      query.secuencia,
      query.nif_declarado,
      query.razon_social,
      query.administracion,
      query.fec_identificacion,
      query.fec_desintificacion,
      query.forma_juridica,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_identificado,
      query.es_externo,
      query.provincia,
      query.cod_clave,
      query.clave,
      query.cod_subclave,
      query.subclave,
      query.num_descendientes,
      query.grado_minusvalia,
      query.nro_liquidacion,
      query.es_representante_menor_edad,
      query.origen_discrepancia,
      query.cod_origen,
      query.origen,
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
      query.gastos_seguridad_social);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_190_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_190_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_190_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_modelo_190_ssis',
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_190_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_190_ssis @log;

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

