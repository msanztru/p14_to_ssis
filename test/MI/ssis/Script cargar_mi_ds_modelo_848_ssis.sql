PRINT 'normalizado_mi_848_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE(
	id_mi_ds_848_volumen_operaciones_IAE int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3) NOT NULL,
	nif_presentador_848_9 varchar(9) NOT NULL,
	discriminante_presentador_848_9 varchar(2) NOT NULL,
	nif_presentador_848 varchar(12) NOT NULL,
	es_contribuyente_presentador bit NOT NULL,
	id_contribuyente_presentador int NOT NULL,
	volumen_operaciones decimal(18,  0),
	casilla_presentacion varchar(2) NOT NULL,
	fecha_alta date NOT NULL,
	mes_alta int NOT NULL,
	anyo_alta int NOT NULL,
	fecha_modificacion date NOT NULL,
	mes_modificacion int NOT NULL,
	anyo_modificacion int NOT NULL,
	fecha_baja date NOT NULL,
	mes_baja int NOT NULL,
	anyo_baja int NOT NULL,
	fecha_envio_IAE date NOT NULL,
	mes_envio_IAE int NOT NULL,
	anyo_envio_IAE int NOT NULL,
	referencia_bizkaibai varchar(13) NOT NULL,
	nif_relacionado_848_9 varchar(9) NOT NULL,
	discriminante_relacionado_848_9 varchar(2) NOT NULL,
	nif_relacionado_848 varchar(12) NOT NULL,
	nif_relacionado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_relacionado bit NOT NULL,
	id_contribuyente_relacionado int NOT NULL,
	es_identificado_relacionado bit NOT NULL,
	sw_identificado_relacionado varchar(1) NOT NULL,
	apellidos_nombre_relacionado_no_identif varchar(40) NOT NULL,
	fecha_alta_rel_no_identif date NOT NULL,
	mes_alta_rel_no_identif int NOT NULL,
	anyo_alta_rel_no_identif int NOT NULL,
	fecha_modificacion_rel_no_identif date NOT NULL,
	mes_modificacion_rel_no_identif int NOT NULL,
	anyo_modificacion_rel_no_identif int NOT NULL,
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_848_volumen_operaciones_IAE UNIQUE (id_documento,nif_relacionado_848_9,discriminante_relacionado_848_9),
	CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_presentador) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_relacionado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_ds_848_volumen_operaciones_IAE PRIMARY KEY CLUSTERED (id_mi_ds_848_volumen_operaciones_IAE)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_mi_ds_848_volumen_operaciones_IAE')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD id_mi_ds_848_volumen_operaciones_IAE int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_presentador_848_9')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD nif_presentador_848_9 varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='discriminante_presentador_848_9')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD discriminante_presentador_848_9 varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_presentador_848')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD nif_presentador_848 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='es_contribuyente_presentador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD es_contribuyente_presentador bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_contribuyente_presentador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD id_contribuyente_presentador int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD volumen_operaciones decimal(18,  0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='casilla_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD casilla_presentacion varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fecha_modificacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD mes_modificacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD anyo_modificacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fecha_baja date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD mes_baja int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD anyo_baja int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_envio_IAE')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fecha_envio_IAE date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_envio_IAE')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD mes_envio_IAE int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_envio_IAE')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD anyo_envio_IAE int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='referencia_bizkaibai')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD referencia_bizkaibai varchar(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_relacionado_848_9')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD nif_relacionado_848_9 varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='discriminante_relacionado_848_9')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD discriminante_relacionado_848_9 varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_relacionado_848')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD nif_relacionado_848 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_relacionado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD nif_relacionado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='es_contribuyente_relacionado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD es_contribuyente_relacionado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_contribuyente_relacionado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD id_contribuyente_relacionado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='es_identificado_relacionado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD es_identificado_relacionado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='sw_identificado_relacionado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD sw_identificado_relacionado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='apellidos_nombre_relacionado_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD apellidos_nombre_relacionado_no_identif varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_alta_rel_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fecha_alta_rel_no_identif date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_alta_rel_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD mes_alta_rel_no_identif int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_alta_rel_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD anyo_alta_rel_no_identif int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_modificacion_rel_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fecha_modificacion_rel_no_identif date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_modificacion_rel_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD mes_modificacion_rel_no_identif int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_modificacion_rel_no_identif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD anyo_modificacion_rel_no_identif int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_mi_ds_848_volumen_operaciones_IAE' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN id_mi_ds_848_volumen_operaciones_IAE int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_presentador_848_9' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN nif_presentador_848_9 varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='discriminante_presentador_848_9' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN discriminante_presentador_848_9 varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_presentador_848' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN nif_presentador_848 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='es_contribuyente_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN es_contribuyente_presentador bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_contribuyente_presentador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN id_contribuyente_presentador int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN volumen_operaciones decimal(18,  0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='casilla_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN casilla_presentacion varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_modificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fecha_modificacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_modificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN mes_modificacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_modificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN anyo_modificacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_baja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fecha_baja date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_baja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN mes_baja int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_baja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN anyo_baja int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_envio_IAE' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fecha_envio_IAE date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_envio_IAE' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN mes_envio_IAE int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_envio_IAE' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN anyo_envio_IAE int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='referencia_bizkaibai' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN referencia_bizkaibai varchar(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_relacionado_848_9' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN nif_relacionado_848_9 varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='discriminante_relacionado_848_9' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN discriminante_relacionado_848_9 varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_relacionado_848' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN nif_relacionado_848 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='nif_relacionado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN nif_relacionado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='es_contribuyente_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN es_contribuyente_relacionado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='id_contribuyente_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN id_contribuyente_relacionado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='es_identificado_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN es_identificado_relacionado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='sw_identificado_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN sw_identificado_relacionado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='apellidos_nombre_relacionado_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN apellidos_nombre_relacionado_no_identif varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_alta_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fecha_alta_rel_no_identif date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_alta_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN mes_alta_rel_no_identif int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_alta_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN anyo_alta_rel_no_identif int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fecha_modificacion_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fecha_modificacion_rel_no_identif date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='mes_modificacion_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN mes_modificacion_rel_no_identif int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='anyo_modificacion_rel_no_identif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN anyo_modificacion_rel_no_identif int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_848_volumen_operaciones_IAE')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD CONSTRAINT PK_tbn1_mi_ds_848_volumen_operaciones_IAE PRIMARY KEY CLUSTERED (id_mi_ds_848_volumen_operaciones_IAE)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_presentador) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_848_volumen_operaciones_IAE' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE ADD CONSTRAINT FK_tbn1_mi_ds_848_volumen_operaciones_IAE_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_relacionado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_848_volumen_operaciones_IAE_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_848_volumen_operaciones_IAE_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_848_volumen_operaciones_IAE_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_mi_ds_848_volumen_operaciones_IAE_ssis',
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
    e.id_expediente  AS id_expediente,
	cabe.iavoca_ejer		 AS 	ejercicio,
	'848'		 AS 	modelo,
	cabe.iavoca_nif_pres	 AS 	nif_presentador_848_9,
	cabe.iavoca_dis_pres	 AS 	discriminante_presentador_848_9,
	concat(cabe.iavoca_nif_pres,' ',coalesce(cabe.iavoca_dis_pres,''))		AS 	nif_presentador_848,

	CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS 	es_contribuyente_presentador,
	coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS 	id_contribuyente_presentador,
	
    CASE
          WHEN row_number() OVER (PARTITION BY doc.id_documento ORDER BY doc.id_documento, coalesce(ddos.iavode_nif_rel,''),coalesce(ddos.iavode_dis_rel,'') )=1 THEN coalesce(cabe.iavoca_volope,0)
          ELSE 0
    END AS volumen_operaciones,  

	coalesce(cabe.iavoca_casilla,'')		AS 	casilla_presentacion,

	CASE WHEN cabe.iavoca_fec8_alta IS NULL THEN '0001-01-01' ELSE cabe.iavoca_fec8_alta END AS fecha_alta,
	CASE WHEN cabe.iavoca_fec8_alta IS NOT NULL THEN month(cabe.iavoca_fec8_alta) ELSE 0 END AS mes_alta,
	CASE WHEN cabe.iavoca_fec8_alta IS NOT NULL THEN year(cabe.iavoca_fec8_alta) ELSE 0 END AS anyo_alta,

	CASE WHEN cabe.iavoca_fec8_modi IS NULL THEN '0001-01-01' ELSE cabe.iavoca_fec8_modi END AS fecha_modificacion,
	CASE WHEN cabe.iavoca_fec8_modi IS NOT NULL THEN month(cabe.iavoca_fec8_modi) ELSE 0 END AS mes_modificacion,
	CASE WHEN cabe.iavoca_fec8_modi IS NOT NULL THEN year(cabe.iavoca_fec8_modi) ELSE 0 END AS anyo_modificacion,

	CASE WHEN cabe.iavoca_fec8_baja IS NULL THEN '0001-01-01' ELSE cabe.iavoca_fec8_baja END AS fecha_baja,
	CASE WHEN cabe.iavoca_fec8_baja IS NOT NULL THEN month(cabe.iavoca_fec8_baja) ELSE 0 END AS mes_baja,
	CASE WHEN cabe.iavoca_fec8_baja IS NOT NULL THEN year(cabe.iavoca_fec8_baja) ELSE 0 END AS anyo_baja,
	
	CASE WHEN cabe.iavoca_fec8_envi IS NULL THEN '0001-01-01' ELSE cabe.iavoca_fec8_envi END AS fecha_envio_IAE,
	CASE WHEN cabe.iavoca_fec8_envi IS NOT NULL THEN month(cabe.iavoca_fec8_envi) ELSE 0 END AS mes_envio_IAE,
	CASE WHEN cabe.iavoca_fec8_envi IS NOT NULL THEN year(cabe.iavoca_fec8_envi) ELSE 0 END AS anyo_envio_IAE,
	
	coalesce(cabe.iavoca_ref_bizkaib,'')	AS	referencia_bizkaibai, 

	coalesce(ddos.iavode_nif_rel,'')	AS	nif_relacionado_848_9,
	coalesce(ddos.iavode_dis_rel,'')	AS	discriminante_relacionado_848_9,
	concat(ddos.iavode_nif_rel,' ',coalesce(ddos.iavode_dis_rel,''))		 AS 	nif_relacionado_848,
	
	CASE
		WHEN ddos.iavode_identif<>1 THEN ddos.iavode_nif_rel+' '+ddos.iavode_dis_rel
		ELSE ''
	END AS	nif_relacionado_no_identificado,
    CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_relacionado,
    coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_relacionado,
	CASE WHEN ddos.iavode_identif=1 THEN 1 ELSE 0 END AS	es_identificado_relacionado,  --0,1
	CASE
          WHEN CASE WHEN ddos.iavode_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN ddos.iavode_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN ddos.iavode_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
    END AS	sw_identificado_relacionado,
	
	coalesce(ident.iavodi_apelnom_rel,'')		AS 	apellidos_nombre_relacionado_no_identif,

	CASE WHEN ident.iavodi_fec8_alta IS NULL THEN '0001-01-01' ELSE ident.iavodi_fec8_alta END AS fecha_alta_rel_no_identif,
	CASE WHEN ident.iavodi_fec8_alta IS NOT NULL THEN month(ident.iavodi_fec8_alta) ELSE 0 END AS mes_alta_rel_no_identif,
	CASE WHEN ident.iavodi_fec8_alta IS NOT NULL THEN year(ident.iavodi_fec8_alta) ELSE 0 END AS anyo_alta_rel_no_identif,

	CASE WHEN ident.iavodi_fec8_modi IS NULL THEN '0001-01-01' ELSE ident.iavodi_fec8_modi END AS 	fecha_modificacion_rel_no_identif,
	CASE WHEN ident.iavodi_fec8_modi IS NOT NULL THEN month(ident.iavodi_fec8_modi) ELSE 0 END AS mes_modificacion_rel_no_identif,
	CASE WHEN ident.iavodi_fec8_modi IS NOT NULL THEN year(ident.iavodi_fec8_modi) ELSE 0 END AS anyo_modificacion_rel_no_identif
	
FROM dbn1_stg_dhyf.dbo.tbn1voca_ia cabe 
LEFT JOIN dbn1_stg_dhyf.dbo.tbn1vode_ia ddos  ON cabe.iavoca_ejer=ddos.iavode_ejer AND cabe.iavoca_ref848=ddos.iavode_ref848 
LEFT JOIN dbn1_stg_dhyf.dbo.tbn1vodi_ia ident ON  ident.iavodi_ref848=ddos.iavode_ref848 AND ident.iavodi_nif_rel=ddos.iavode_nif_rel AND ident.iavodi_dis_rel=ddos.iavode_dis_rel
INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.iavode_ejer AS varchar)+'G5'+CAST(ddos.iavode_ref848 AS varchar)+'00K0000')
INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.iavoca_nif_pres=c_declarante.nif_9 AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime)) 
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.iavode_nif_rel=c_declarado.nif_9 AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime)) 
CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_848_volumen_operaciones_IAE AS tbn1_mi_ds_848_volumen_operaciones_IAE
	USING query ON query.id_documento=tbn1_mi_ds_848_volumen_operaciones_IAE.id_documento AND query.nif_relacionado_848_9=tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_848_9 AND query.discriminante_relacionado_848_9=tbn1_mi_ds_848_volumen_operaciones_IAE.discriminante_relacionado_848_9
	WHEN MATCHED AND ((tbn1_mi_ds_848_volumen_operaciones_IAE.id_expediente<>query.id_expediente OR (tbn1_mi_ds_848_volumen_operaciones_IAE.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.ejercicio<>query.ejercicio OR (tbn1_mi_ds_848_volumen_operaciones_IAE.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.modelo <>query.modelo  OR (tbn1_mi_ds_848_volumen_operaciones_IAE.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.nif_presentador_848_9<>query.nif_presentador_848_9 OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_presentador_848_9 IS NULL AND query.nif_presentador_848_9 IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_presentador_848_9 IS NOT NULL AND query.nif_presentador_848_9 IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.discriminante_presentador_848_9<>query.discriminante_presentador_848_9 OR (tbn1_mi_ds_848_volumen_operaciones_IAE.discriminante_presentador_848_9 IS NULL AND query.discriminante_presentador_848_9 IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.discriminante_presentador_848_9 IS NOT NULL AND query.discriminante_presentador_848_9 IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.nif_presentador_848<>query.nif_presentador_848 OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_presentador_848 IS NULL AND query.nif_presentador_848 IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_presentador_848 IS NOT NULL AND query.nif_presentador_848 IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.es_contribuyente_presentador<>query.es_contribuyente_presentador OR (tbn1_mi_ds_848_volumen_operaciones_IAE.es_contribuyente_presentador IS NULL AND query.es_contribuyente_presentador IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.es_contribuyente_presentador IS NOT NULL AND query.es_contribuyente_presentador IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.id_contribuyente_presentador<>query.id_contribuyente_presentador OR (tbn1_mi_ds_848_volumen_operaciones_IAE.id_contribuyente_presentador IS NULL AND query.id_contribuyente_presentador IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.id_contribuyente_presentador IS NOT NULL AND query.id_contribuyente_presentador IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_ds_848_volumen_operaciones_IAE.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.casilla_presentacion<>query.casilla_presentacion OR (tbn1_mi_ds_848_volumen_operaciones_IAE.casilla_presentacion IS NULL AND query.casilla_presentacion IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.casilla_presentacion IS NOT NULL AND query.casilla_presentacion IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.mes_alta<>query.mes_alta OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_modificacion<>query.fecha_modificacion OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_modificacion IS NULL AND query.fecha_modificacion IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_modificacion IS NOT NULL AND query.fecha_modificacion IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.mes_modificacion<>query.mes_modificacion OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_modificacion IS NULL AND query.mes_modificacion IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_modificacion IS NOT NULL AND query.mes_modificacion IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_modificacion<>query.anyo_modificacion OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_modificacion IS NULL AND query.anyo_modificacion IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_modificacion IS NOT NULL AND query.anyo_modificacion IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_baja<>query.fecha_baja OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_baja IS NULL AND query.fecha_baja IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_baja IS NOT NULL AND query.fecha_baja IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.mes_baja<>query.mes_baja OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_baja IS NULL AND query.mes_baja IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_baja IS NOT NULL AND query.mes_baja IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_baja<>query.anyo_baja OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_baja IS NULL AND query.anyo_baja IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_baja IS NOT NULL AND query.anyo_baja IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_envio_IAE<>query.fecha_envio_IAE OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_envio_IAE IS NULL AND query.fecha_envio_IAE IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_envio_IAE IS NOT NULL AND query.fecha_envio_IAE IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.mes_envio_IAE<>query.mes_envio_IAE OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_envio_IAE IS NULL AND query.mes_envio_IAE IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_envio_IAE IS NOT NULL AND query.mes_envio_IAE IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_envio_IAE<>query.anyo_envio_IAE OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_envio_IAE IS NULL AND query.anyo_envio_IAE IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_envio_IAE IS NOT NULL AND query.anyo_envio_IAE IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.referencia_bizkaibai<>query.referencia_bizkaibai OR (tbn1_mi_ds_848_volumen_operaciones_IAE.referencia_bizkaibai IS NULL AND query.referencia_bizkaibai IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.referencia_bizkaibai IS NOT NULL AND query.referencia_bizkaibai IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_848<>query.nif_relacionado_848 OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_848 IS NULL AND query.nif_relacionado_848 IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_848 IS NOT NULL AND query.nif_relacionado_848 IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_no_identificado<>query.nif_relacionado_no_identificado OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_no_identificado IS NULL AND query.nif_relacionado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.nif_relacionado_no_identificado IS NOT NULL AND query.nif_relacionado_no_identificado IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.es_contribuyente_relacionado<>query.es_contribuyente_relacionado OR (tbn1_mi_ds_848_volumen_operaciones_IAE.es_contribuyente_relacionado IS NULL AND query.es_contribuyente_relacionado IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.es_contribuyente_relacionado IS NOT NULL AND query.es_contribuyente_relacionado IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.id_contribuyente_relacionado<>query.id_contribuyente_relacionado OR (tbn1_mi_ds_848_volumen_operaciones_IAE.id_contribuyente_relacionado IS NULL AND query.id_contribuyente_relacionado IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.id_contribuyente_relacionado IS NOT NULL AND query.id_contribuyente_relacionado IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.es_identificado_relacionado<>query.es_identificado_relacionado OR (tbn1_mi_ds_848_volumen_operaciones_IAE.es_identificado_relacionado IS NULL AND query.es_identificado_relacionado IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.es_identificado_relacionado IS NOT NULL AND query.es_identificado_relacionado IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.sw_identificado_relacionado<>query.sw_identificado_relacionado OR (tbn1_mi_ds_848_volumen_operaciones_IAE.sw_identificado_relacionado IS NULL AND query.sw_identificado_relacionado IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.sw_identificado_relacionado IS NOT NULL AND query.sw_identificado_relacionado IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.apellidos_nombre_relacionado_no_identif<>query.apellidos_nombre_relacionado_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.apellidos_nombre_relacionado_no_identif IS NULL AND query.apellidos_nombre_relacionado_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.apellidos_nombre_relacionado_no_identif IS NOT NULL AND query.apellidos_nombre_relacionado_no_identif IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_alta_rel_no_identif<>query.fecha_alta_rel_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_alta_rel_no_identif IS NULL AND query.fecha_alta_rel_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_alta_rel_no_identif IS NOT NULL AND query.fecha_alta_rel_no_identif IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.mes_alta_rel_no_identif<>query.mes_alta_rel_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_alta_rel_no_identif IS NULL AND query.mes_alta_rel_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_alta_rel_no_identif IS NOT NULL AND query.mes_alta_rel_no_identif IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_alta_rel_no_identif<>query.anyo_alta_rel_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_alta_rel_no_identif IS NULL AND query.anyo_alta_rel_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_alta_rel_no_identif IS NOT NULL AND query.anyo_alta_rel_no_identif IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_modificacion_rel_no_identif<>query.fecha_modificacion_rel_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_modificacion_rel_no_identif IS NULL AND query.fecha_modificacion_rel_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.fecha_modificacion_rel_no_identif IS NOT NULL AND query.fecha_modificacion_rel_no_identif IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.mes_modificacion_rel_no_identif<>query.mes_modificacion_rel_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_modificacion_rel_no_identif IS NULL AND query.mes_modificacion_rel_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.mes_modificacion_rel_no_identif IS NOT NULL AND query.mes_modificacion_rel_no_identif IS NULL)
			OR tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_modificacion_rel_no_identif<>query.anyo_modificacion_rel_no_identif OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_modificacion_rel_no_identif IS NULL AND query.anyo_modificacion_rel_no_identif IS NOT NULL) OR (tbn1_mi_ds_848_volumen_operaciones_IAE.anyo_modificacion_rel_no_identif IS NOT NULL AND query.anyo_modificacion_rel_no_identif IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			ejercicio=query.ejercicio,
			modelo =query.modelo ,
			nif_presentador_848_9=query.nif_presentador_848_9,
			discriminante_presentador_848_9=query.discriminante_presentador_848_9,
			nif_presentador_848=query.nif_presentador_848,
			es_contribuyente_presentador=query.es_contribuyente_presentador,
			id_contribuyente_presentador=query.id_contribuyente_presentador,
			volumen_operaciones=query.volumen_operaciones,
			casilla_presentacion=query.casilla_presentacion,
			fecha_alta=query.fecha_alta,
			mes_alta=query.mes_alta,
			anyo_alta=query.anyo_alta,
			fecha_modificacion=query.fecha_modificacion,
			mes_modificacion=query.mes_modificacion,
			anyo_modificacion=query.anyo_modificacion,
			fecha_baja=query.fecha_baja,
			mes_baja=query.mes_baja,
			anyo_baja=query.anyo_baja,
			fecha_envio_IAE=query.fecha_envio_IAE,
			mes_envio_IAE=query.mes_envio_IAE,
			anyo_envio_IAE=query.anyo_envio_IAE,
			referencia_bizkaibai=query.referencia_bizkaibai,
			nif_relacionado_848=query.nif_relacionado_848,
			nif_relacionado_no_identificado=query.nif_relacionado_no_identificado,
			es_contribuyente_relacionado=query.es_contribuyente_relacionado,
			id_contribuyente_relacionado=query.id_contribuyente_relacionado,
			es_identificado_relacionado=query.es_identificado_relacionado,
			sw_identificado_relacionado=query.sw_identificado_relacionado,
			apellidos_nombre_relacionado_no_identif=query.apellidos_nombre_relacionado_no_identif,
			fecha_alta_rel_no_identif=query.fecha_alta_rel_no_identif,
			mes_alta_rel_no_identif=query.mes_alta_rel_no_identif,
			anyo_alta_rel_no_identif=query.anyo_alta_rel_no_identif,
			fecha_modificacion_rel_no_identif=query.fecha_modificacion_rel_no_identif,
			mes_modificacion_rel_no_identif=query.mes_modificacion_rel_no_identif,
			anyo_modificacion_rel_no_identif=query.anyo_modificacion_rel_no_identif
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,ejercicio,modelo ,nif_presentador_848_9,discriminante_presentador_848_9,nif_presentador_848,es_contribuyente_presentador,id_contribuyente_presentador,volumen_operaciones,casilla_presentacion,fecha_alta,mes_alta,anyo_alta,fecha_modificacion,mes_modificacion,anyo_modificacion,fecha_baja,mes_baja,anyo_baja,fecha_envio_IAE,mes_envio_IAE,anyo_envio_IAE,referencia_bizkaibai,nif_relacionado_848_9,discriminante_relacionado_848_9,nif_relacionado_848,nif_relacionado_no_identificado,es_contribuyente_relacionado,id_contribuyente_relacionado,es_identificado_relacionado,sw_identificado_relacionado,apellidos_nombre_relacionado_no_identif,fecha_alta_rel_no_identif,mes_alta_rel_no_identif,anyo_alta_rel_no_identif,fecha_modificacion_rel_no_identif,mes_modificacion_rel_no_identif,anyo_modificacion_rel_no_identif) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.ejercicio,
			query.modelo ,
			query.nif_presentador_848_9,
			query.discriminante_presentador_848_9,
			query.nif_presentador_848,
			query.es_contribuyente_presentador,
			query.id_contribuyente_presentador,
			query.volumen_operaciones,
			query.casilla_presentacion,
			query.fecha_alta,
			query.mes_alta,
			query.anyo_alta,
			query.fecha_modificacion,
			query.mes_modificacion,
			query.anyo_modificacion,
			query.fecha_baja,
			query.mes_baja,
			query.anyo_baja,
			query.fecha_envio_IAE,
			query.mes_envio_IAE,
			query.anyo_envio_IAE,
			query.referencia_bizkaibai,
			query.nif_relacionado_848_9,
			query.discriminante_relacionado_848_9,
			query.nif_relacionado_848,
			query.nif_relacionado_no_identificado,
			query.es_contribuyente_relacionado,
			query.id_contribuyente_relacionado,
			query.es_identificado_relacionado,
			query.sw_identificado_relacionado,
			query.apellidos_nombre_relacionado_no_identif,
			query.fecha_alta_rel_no_identif,
			query.mes_alta_rel_no_identif,
			query.anyo_alta_rel_no_identif,
			query.fecha_modificacion_rel_no_identif,
			query.mes_modificacion_rel_no_identif,
			query.anyo_modificacion_rel_no_identif
			)
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
