PRINT 'normalizado_mi_181_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles(
	id_mi_ds_181_prestamos_bienes_inmuebles int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3) NOT NULL,
	id_administracion_declarante int NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_181_11 varchar(11) NOT NULL,
	nif_declarante_181 varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_complementaria varchar(1) NOT NULL,
	es_sustitutiva varchar(1) NOT NULL,
	id_tipo_presentacion int NOT NULL,
	telefono_contacto varchar(9) NOT NULL,
	nombre_contacto varchar(40) NOT NULL,
	numero_caja varchar(8) NOT NULL,
	contador_revisiones decimal(1, 0) NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion  int NOT NULL,
	es_rehabilitacion varchar(1) NOT NULL,
	secuencia varchar(9) NOT NULL,
	id_administracion_declarado int NOT NULL,
	es_externo_declarado bit NOT NULL,
	nif_declarado_181_11 varchar(11) NOT NULL,
	nif_declarado_181 varchar(12) NOT NULL,
	nif_declarado_no_identificado_11 varchar(11) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	nivel_identificacion_nif_declarado varchar(1) NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	sw_representante  varchar(1) NOT NULL,
	id_provincia int NOT NULL,
	numero_identificacion_prestamo varchar(20) NOT NULL,
	fecha_operacion_prestamo date NOT NULL,
	mes_operacion_prestamo int NOT NULL,
	anyo_operacion_prestamo int NOT NULL,
	duracion_operacion_meses decimal(4, 0) NOT NULL,
	importe_prestamo decimal(18, 2),
	importe_amortizacion decimal(18, 2),
	importe_intereses decimal(18, 2),
	importe_gastos_amortizacion decimal(18, 2),
	porcentaje_participacion numeric(6, 3),
	importe_gastos_financiacion decimal(18, 2),
	saldo_inicial_ejercicio decimal(18, 2),
	saldo_final_ejercicio decimal(18, 2),
	id_origen_operacion_181 int NOT NULL,
	id_clave_operacion_181 int NOT NULL,
	id_subclave_operacion_181 int NOT NULL,
	id_situacion_inmueble_181 int NOT NULL,
	referencia_catastral varchar(20) NOT NULL,
	importe_valor_tasacion_inmueble decimal(18, 2),
	id_tipo_identificacion_181 int NOT NULL,
	codigo_iban varchar(4) NOT NULL,
	id_clave_intervencion_operacion_181 int NOT NULL,
	nif_prestamista_11 varchar(11) NOT NULL,
	nif_prestamista varchar(12) NOT NULL,
	nombre_prestamista  varchar(40) NOT NULL,
	porcentaje_financiacion numeric(5, 2),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_181_prestamos_bienes_inmuebles UNIQUE (id_documento,secuencia),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_origen_operacion_181 FOREIGN KEY (id_origen_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181(id_origen_operacion_181),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_clave_operacion_181 FOREIGN KEY (id_clave_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181(id_clave_operacion_181),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_subclave_operacion_181 FOREIGN KEY (id_subclave_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181(id_subclave_operacion_181),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_situacion_inmueble_181 FOREIGN KEY (id_situacion_inmueble_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181(id_situacion_inmueble_181),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_tipo_identificacion_181 FOREIGN KEY (id_tipo_identificacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181(id_tipo_identificacion_181),
	CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_clave_intervencion_operacion_181 FOREIGN KEY (id_clave_intervencion_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181(id_clave_intervencion_operacion_181),
	CONSTRAINT PK_tbn1_mi_ds_181_prestamos_bienes_inmuebles PRIMARY KEY CLUSTERED (id_mi_ds_181_prestamos_bienes_inmuebles)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_mi_ds_181_prestamos_bienes_inmuebles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_mi_ds_181_prestamos_bienes_inmuebles int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarante_181_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_declarante_181_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarante_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_declarante_181 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_complementaria varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_sustitutiva varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD telefono_contacto varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nombre_contacto varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='numero_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD numero_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD contador_revisiones decimal(1, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_rehabilitacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_rehabilitacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_181_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_declarado_181_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_declarado_181 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_declarado_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nivel_identificacion_nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nivel_identificacion_nif_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='sw_representante ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD sw_representante  varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='numero_identificacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD numero_identificacion_prestamo varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fecha_operacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD fecha_operacion_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='mes_operacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD mes_operacion_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='anyo_operacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD anyo_operacion_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='duracion_operacion_meses')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD duracion_operacion_meses decimal(4, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD importe_prestamo decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_amortizacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD importe_amortizacion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_intereses')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD importe_intereses decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_gastos_amortizacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD importe_gastos_amortizacion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD porcentaje_participacion numeric(6, 3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_gastos_financiacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD importe_gastos_financiacion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='saldo_inicial_ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD saldo_inicial_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='saldo_final_ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD saldo_final_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_origen_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_origen_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_clave_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_clave_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_subclave_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_subclave_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_situacion_inmueble_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_situacion_inmueble_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='referencia_catastral')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD referencia_catastral varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_valor_tasacion_inmueble')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD importe_valor_tasacion_inmueble decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_tipo_identificacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_tipo_identificacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='codigo_iban')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD codigo_iban varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_clave_intervencion_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD id_clave_intervencion_operacion_181 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_prestamista_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_prestamista_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_prestamista')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nif_prestamista varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nombre_prestamista ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD nombre_prestamista  varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='porcentaje_financiacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD porcentaje_financiacion numeric(5, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_mi_ds_181_prestamos_bienes_inmuebles' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_mi_ds_181_prestamos_bienes_inmuebles int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarante_181_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_declarante_181_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarante_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_declarante_181 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_complementaria varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_sustitutiva varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN telefono_contacto varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nombre_contacto varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='numero_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN numero_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN contador_revisiones decimal(1, 0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_rehabilitacion varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN secuencia varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_administracion_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_181_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_declarado_181_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_declarado_181 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_declarado_no_identificado_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nivel_identificacion_nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nivel_identificacion_nif_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='sw_representante ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN sw_representante  varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='numero_identificacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN numero_identificacion_prestamo varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fecha_operacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN fecha_operacion_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='mes_operacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN mes_operacion_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='anyo_operacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN anyo_operacion_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='duracion_operacion_meses' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN duracion_operacion_meses decimal(4, 0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_prestamo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN importe_prestamo decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_amortizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN importe_amortizacion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_intereses' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN importe_intereses decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_gastos_amortizacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN importe_gastos_amortizacion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN porcentaje_participacion numeric(6, 3) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_gastos_financiacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN importe_gastos_financiacion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='saldo_inicial_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN saldo_inicial_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='saldo_final_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN saldo_final_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_origen_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_origen_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_clave_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_clave_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_subclave_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_subclave_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_situacion_inmueble_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_situacion_inmueble_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='referencia_catastral' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN referencia_catastral varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='importe_valor_tasacion_inmueble' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN importe_valor_tasacion_inmueble decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_tipo_identificacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_tipo_identificacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='codigo_iban' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN codigo_iban varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='id_clave_intervencion_operacion_181' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN id_clave_intervencion_operacion_181 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_prestamista_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_prestamista_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nif_prestamista' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nif_prestamista varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='nombre_prestamista ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN nombre_prestamista  varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='porcentaje_financiacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN porcentaje_financiacion numeric(5, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_181_prestamos_bienes_inmuebles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT PK_tbn1_mi_ds_181_prestamos_bienes_inmuebles PRIMARY KEY CLUSTERED (id_mi_ds_181_prestamos_bienes_inmuebles)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_administracion_hacienda1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_origen_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_origen_operacion_181 FOREIGN KEY (id_origen_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181(id_origen_operacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_clave_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_clave_operacion_181 FOREIGN KEY (id_clave_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181(id_clave_operacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_subclave_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_subclave_operacion_181 FOREIGN KEY (id_subclave_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181(id_subclave_operacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_situacion_inmueble_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_situacion_inmueble_181 FOREIGN KEY (id_situacion_inmueble_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181(id_situacion_inmueble_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_tipo_identificacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_tipo_identificacion_181 FOREIGN KEY (id_tipo_identificacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181(id_tipo_identificacion_181)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_181_prestamos_bienes_inmuebles' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_clave_intervencion_operacion_181')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles ADD CONSTRAINT FK_tbn1_mi_ds_181_prestamos_bienes_inmuebles_tbn1_mi_clave_intervencion_operacion_181 FOREIGN KEY (id_clave_intervencion_operacion_181) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181(id_clave_intervencion_operacion_181)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_181_prestamos_bienes_inmuebles' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_181_prestamos_bienes_inmuebles;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_181_prestamos_bienes_inmuebles(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_181_prestamos_bienes_inmuebles'
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
mae_noid AS 
(
        SELECT id_mae_no_identificados,
                    ejercicio,
                    clavagru,
                    clavdeta
        FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
        WHERE  aplicacion = 'BW'
        AND detamodel = '181'
),
query AS (
		
		SELECT --TOP 1000
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.deejerc 		AS ejercicio,
		coalesce(decl.demodel ,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		0	AS es_externo_declarante,
		coalesce(ddos.prnifde ,'') 	AS nif_declarante_181_11,
		coalesce(left(coalesce(ddos.prnifde ,''),9)+' '+right(coalesce(ddos.prnifde ,''),2),'') AS nif_declarante_181,
		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,
		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,
		coalesce(decl.decompl,'') 	AS es_complementaria,
		coalesce(decl.desusti,'') 	AS es_sustitutiva,
		tipo_pres.id_tipo_presentacion	AS id_tipo_presentacion,  --carga por integridad
		coalesce(decl.detelco,'')	AS telefono_contacto,
		coalesce(decl.denomco,'') 	AS nombre_contacto,
		coalesce(decl.dencaja,'') 	AS numero_caja,
		coalesce(decl.decrevi,'') 	AS contador_revisiones,
		CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END AS fecha_presentacion,
		month(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS mes_presentacion,
		year(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS anyo_presentacion ,
		CASE WHEN decl.derhviv <>'S' THEN 'N' ELSE 'S' END	AS es_rehabilitacion,
		CAST(ddos.prsecue  AS varchar)	AS secuencia,
		admini_ddos.id_administracion AS id_administracion_declarado,
		0	AS es_externo_declarado,
		coalesce(ddos.prnifpr ,'') 	AS nif_declarado_181_11,
		coalesce(left(coalesce(ddos.prnifpr ,''),9)+' '+right(coalesce(ddos.prnifpr ,''),2),'') 	AS nif_declarado_181,
		CASE WHEN CASE WHEN ddos.prident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.prnifpr,'') ELSE '' END	AS nif_declarado_no_identificado_11,
		coalesce(left(CASE WHEN CASE WHEN ddos.prident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.prnifpr,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.prident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.prnifpr,'') ELSE '' END,2),'')	AS nif_declarado_no_identificado  ,
		CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarado,
		coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarado,
		ddos.prident  AS nivel_identificacion_nif_declarado,
		CASE WHEN ddos.prident =1 THEN 1 ELSE 0 END	AS es_identificado_declarado,
		CASE
			WHEN CASE WHEN ddos.prident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN ddos.prident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN ddos.prident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_declarado,
		coalesce(ddos.prrepre,'') 	AS sw_representante ,
		provincia.id_provincia	AS id_provincia,
		
		
		coalesce(ddos.prnumer,'') AS numero_identificacion_prestamo,
		CASE WHEN ddos.prfecha <>'0001-01-01' THEN ddos.prfecha ELSE CAST('21000101' AS date) END AS fecha_operacion_prestamo,
		month(CASE WHEN ddos.prfecha <>'0001-01-01' THEN ddos.prfecha ELSE CAST('21000101' AS date) END) AS mes_operacion_prestamo,
		year(CASE WHEN ddos.prfecha <>'0001-01-01' THEN ddos.prfecha ELSE CAST('21000101' AS date) END)	AS anyo_operacion_prestamo,
		ddos.prmeses AS duracion_operacion_meses,
		round(ddos.primpor/100,2) AS importe_prestamo,
		round(ddos.pramort/100,2) AS importe_amortizacion,
		round(ddos.printer/100,2) AS importe_intereses,
		round(ddos.pramt98/100,2) AS importe_gastos_amortizacion,
		ddos.prparti AS porcentaje_participacion,
		round(ddos.prgasto/100,2) AS importe_gastos_financiacion,
		
		
		round(ddos.prsaldi/100,2)	AS saldo_inicial_ejercicio,
		round(ddos.prsaldf/100,2)	AS saldo_final_ejercicio,
		
		--ddos.prorige	AS origen_operacion,
		orop.id_origen_operacion_181,
		
		--ddos.prclave	AS tipo_operacion,
		clop.id_clave_operacion_181,
		
		--ddos.prsubcl	AS subclave_operacion,
		suop.id_subclave_operacion_181,
		
		--ddos.prsitua	AS situacion_inmueble, 
		siim.id_situacion_inmueble_181,
		
		coalesce(ddos.prrfcat,'')	AS referencia_catastral,
		round(ddos.prvtasa/100,2)	AS importe_valor_tasacion_inmueble,
		
--		ddos.prtiden	AS tipo_identificacion, 
		tiid.id_tipo_identificacion_181,
		
		ddos.prpiban	AS codigo_iban,
		
--		ddos.printop	AS clave_intervencion_operacion,
		clin.id_clave_intervencion_operacion_181,
		
		coalesce(ddos.prnifpt ,'') 	AS nif_prestamista_11,
		coalesce(left(coalesce(ddos.prnifpt ,''),9)+' '+right(coalesce(ddos.prnifpt ,''),2),'') 	AS nif_prestamista,
		coalesce(ddos.prnompt,'')	AS nombre_prestamista, 

--		ddos.prparti	AS porcentaje_financiacion
		ddos.prporvh    as porcentaje_financiacion

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1decl_bw WHERE demodel='181') decl
		--no_identificados_declarante
		LEFT JOIN	mae_noid mae_noid_cabe
				ON	decl.deejerc = mae_noid_cabe.ejercicio
				AND cast(decl.derefer as varchar) = mae_noid_cabe.clavagru
				AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
	INNER JOIN  dbn1_stg_dhyf.dbo.tbn1pres_bw ddos ON decl.deejerc=ddos.prejerc AND decl.derefer =ddos.prrefer 
	--no_identificados_declarado
	LEFT JOIN	mae_noid mae_noid_det
			ON	decl.deejerc = mae_noid_det.ejercicio
			AND cast(decl.derefer as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(ddos.prsecue as varchar) , 13)=  mae_noid_det.clavdeta 
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.prejerc AS varchar)+'Z8'+CAST(ddos.prrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (ddos.prnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.prnifpr=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipop)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.prcodpr)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON (admini_ddos.cod_administracion='B')
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_administracion='B')
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181 orop on (orop.cod_origen_operacion_181 = ddos.prorige)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181 clop on (clop.cod_clave_operacion_181 = ddos.prclave)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181 suop on (suop.cod_subclave_operacion_181 = ddos.prsubcl)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181 siim on (siim.cod_situacion_inmueble_181 = ddos.prsitua)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181 tiid on (tiid.cod_tipo_identificacion_181 = ddos.prtiden)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181 clin on (clin.cod_clave_intervencion_operacion_181 = ddos.printop)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos 
		
	UNION ALL

SELECT --TOP 1000
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.dxejerc 		AS ejercicio,
		coalesce(decl.dxmodel ,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		1	AS es_externo_declarante,
		coalesce(ddos.pxnifde ,'') 	AS nif_declarante_181_11,
		coalesce(left(coalesce(ddos.pxnifde ,''),9)+' '+right(coalesce(ddos.pxnifde ,''),2),'') AS nif_declarante_181,
		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,
		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,
		'' 	AS es_complementaria,
		'' 	AS es_sustitutiva,
		-1	AS id_tipo_presentacion,  --a los externos se le mete el indefinido -1
		''	AS telefono_contacto,
		'' 	AS nombre_contacto,
		'' 	AS numero_caja,
		0 	AS contador_revisiones,
		CASE WHEN decl.dxfecca<>'0001-01-01' THEN decl.dxfecca ELSE CAST('21000101' AS date) END AS fecha_presentacion,
		month(CASE WHEN decl.dxfecca<>'0001-01-01' THEN decl.dxfecca ELSE CAST('21000101' AS date) END)	AS mes_presentacion,
		year(CASE WHEN decl.dxfecca<>'0001-01-01' THEN decl.dxfecca ELSE CAST('21000101' AS date) END)	AS anyo_presentacion ,
		CASE WHEN decl.dxrhviv <>'S' THEN 'N' ELSE 'S' END	AS es_rehabilitacion,
		CAST(ddos.pxsecue  AS varchar)	AS secuencia,
		admini_ddos.id_administracion AS id_administracion_declarado,
		1	AS es_externo_declarado,
		coalesce(ddos.pxnifpr ,'') 	AS nif_declarado_181_11,
		coalesce(left(coalesce(ddos.pxnifpr ,''),9)+' '+right(coalesce(ddos.pxnifpr ,''),2),'') 	AS nif_declarado_181,
		CASE WHEN CASE WHEN ddos.pxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.pxnifpr,'') ELSE '' END	AS nif_declarado_no_identificado_11,
		coalesce(left(CASE WHEN CASE WHEN ddos.pxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.pxnifpr,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.pxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.pxnifpr,'') ELSE '' END,2),'')	AS nif_declarado_no_identificado  ,
		CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarado,
		coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarado,
		ddos.pxident  AS nivel_identificacion_nif_declarado,
		CASE WHEN ddos.pxident =1 THEN 1 ELSE 0 END	AS es_identificado_declarado,
		CASE
			WHEN CASE WHEN ddos.pxident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN ddos.pxident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN ddos.pxident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_declarado,
		coalesce(ddos.pxrepre,'') 	AS sw_representante ,
		provincia.id_provincia	AS id_provincia,
		
		
		coalesce(ddos.pxnumer,'') AS numero_identificacion_prestamo,
		CASE WHEN ddos.pxfecha <>'0001-01-01' THEN ddos.pxfecha ELSE CAST('21000101' AS date) END AS fecha_operacion_prestamo,
		month(CASE WHEN ddos.pxfecha <>'0001-01-01' THEN ddos.pxfecha ELSE CAST('21000101' AS date) END) AS mes_operacion_prestamo,
		year(CASE WHEN ddos.pxfecha <>'0001-01-01' THEN ddos.pxfecha ELSE CAST('21000101' AS date) END)	AS anyo_operacion_prestamo,
		ddos.pxmeses AS duracion_operacion_meses,
		round(ddos.pximpor/100,2) AS importe_prestamo,
		round(ddos.pxamort/100,2) AS importe_amortizacion,
		round(ddos.pxinter/100,2) AS importe_intereses,
		round(ddos.pxamt98/100,2) AS importe_gastos_amortizacion,
		ddos.pxparti AS porcentaje_participacion,
		round(ddos.pxgasto/100,2) AS importe_gastos_financiacion,
		
		
		round(ddos.pxsaldi/100,2)	AS saldo_inicial_ejercicio,
		round(ddos.pxsaldf/100,2)	AS saldo_final_ejercicio,
		
		
		--ddos.pxorige	AS origen_operacion,
		orop.id_origen_operacion_181,
		
		--ddos.pxclave	AS tipo_operacion,
		clop.id_clave_operacion_181,
		
		--ddos.pxsubcl	AS subclave_operacion,
		suop.id_subclave_operacion_181,
		
		--ddos.prsitua	AS situacion_inmueble, 
		siim.id_situacion_inmueble_181,
		
		coalesce(ddos.pxrfcat,'')	AS referencia_catastral,
		round(ddos.pxvtasa/100,2)	AS importe_valor_tasacion_inmueble,
		
		--ddos.pxtiden	AS tipo_identificacion, 
		tiid.id_tipo_identificacion_181,
		
		ddos.pxpiban	AS codigo_iban,
		
		--ddos.pxintop	AS clave_intervencion_operacion,
		clin.id_clave_intervencion_operacion_181,
		
		coalesce(ddos.pxnifpt ,'') 	AS nif_prestamista_11,
		coalesce(left(coalesce(ddos.pxnifpt ,''),9)+' '+right(coalesce(ddos.pxnifpt ,''),2),'') 	AS nif_prestamista,
		coalesce(ddos.pxnompt,'')	AS nombre_prestamista, 

--		ddos.pxparti	AS porcentaje_financiacion
        ddos.pxporvh    AS porcentaje_financiacion
	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3de_bw WHERE dxmodel='181') decl 
	--no_identificados_declarante
	LEFT JOIN	mae_noid mae_noid_cabe
			ON	decl.dxejerc = mae_noid_cabe.ejercicio
			AND cast(decl.dxrefer as varchar) =mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1i3pr_bw ddos ON decl.dxejerc=ddos.pxejerc AND decl.dxrefer =ddos.pxrefer 
	--no_identificados_declarado
	LEFT JOIN	mae_noid mae_noid_det
			ON	decl.dxejerc = mae_noid_det.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(ddos.pxsecue as varchar) , 13)=  mae_noid_det.clavdeta 
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.pxejerc AS varchar)+'Z8'+CAST(ddos.pxrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (ddos.pxnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.pxnifpr=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.pxcodpr)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON (admini_ddos.cod_provincia=pxadmon )
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_provincia=dxadmon)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion_181 orop on (orop.cod_origen_operacion_181 = ddos.pxorige)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_181 clop on (clop.cod_clave_operacion_181 = ddos.pxclave)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_subclave_operacion_181 suop on (suop.cod_subclave_operacion_181 = ddos.pxsubcl)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_situacion_inmueble_181 siim on (siim.cod_situacion_inmueble_181 = ddos.pxsitua)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion_181 tiid on (tiid.cod_tipo_identificacion_181 = ddos.pxtiden)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_intervencion_operacion_181 clin on (clin.cod_clave_intervencion_operacion_181 = ddos.pxintop)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos 

	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_181_prestamos_bienes_inmuebles AS tbn1_mi_ds_181_prestamos_bienes_inmuebles
	USING query ON query.id_documento=tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_documento AND query.secuencia=tbn1_mi_ds_181_prestamos_bienes_inmuebles.secuencia
	WHEN MATCHED AND ((tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_expediente<>query.id_expediente OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.ejercicio<>query.ejercicio OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.modelo <>query.modelo  OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_administracion_declarante<>query.id_administracion_declarante OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_administracion_declarante IS NULL AND query.id_administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_administracion_declarante IS NOT NULL AND query.id_administracion_declarante IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarante_181_11<>query.nif_declarante_181_11 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarante_181_11 IS NULL AND query.nif_declarante_181_11 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarante_181_11 IS NOT NULL AND query.nif_declarante_181_11 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarante_181<>query.nif_declarante_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarante_181 IS NULL AND query.nif_declarante_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarante_181 IS NOT NULL AND query.nif_declarante_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_complementaria<>query.es_complementaria OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_sustitutiva<>query.es_sustitutiva OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.telefono_contacto<>query.telefono_contacto OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nombre_contacto<>query.nombre_contacto OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.numero_caja<>query.numero_caja OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.numero_caja IS NULL AND query.numero_caja IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.numero_caja IS NOT NULL AND query.numero_caja IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.anyo_presentacion <>query.anyo_presentacion  OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.anyo_presentacion  IS NULL AND query.anyo_presentacion  IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.anyo_presentacion  IS NOT NULL AND query.anyo_presentacion  IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_rehabilitacion<>query.es_rehabilitacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_rehabilitacion IS NULL AND query.es_rehabilitacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_rehabilitacion IS NOT NULL AND query.es_rehabilitacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_administracion_declarado<>query.id_administracion_declarado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_administracion_declarado IS NULL AND query.id_administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_administracion_declarado IS NOT NULL AND query.id_administracion_declarado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_181_11<>query.nif_declarado_181_11 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_181_11 IS NULL AND query.nif_declarado_181_11 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_181_11 IS NOT NULL AND query.nif_declarado_181_11 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_181<>query.nif_declarado_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_181 IS NULL AND query.nif_declarado_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_181 IS NOT NULL AND query.nif_declarado_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nivel_identificacion_nif_declarado<>query.nivel_identificacion_nif_declarado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nivel_identificacion_nif_declarado IS NULL AND query.nivel_identificacion_nif_declarado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nivel_identificacion_nif_declarado IS NOT NULL AND query.nivel_identificacion_nif_declarado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.sw_representante <>query.sw_representante  OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.sw_representante  IS NULL AND query.sw_representante  IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.sw_representante  IS NOT NULL AND query.sw_representante  IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_provincia<>query.id_provincia OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.numero_identificacion_prestamo<>query.numero_identificacion_prestamo OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.numero_identificacion_prestamo IS NULL AND query.numero_identificacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.numero_identificacion_prestamo IS NOT NULL AND query.numero_identificacion_prestamo IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.fecha_operacion_prestamo<>query.fecha_operacion_prestamo OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.fecha_operacion_prestamo IS NULL AND query.fecha_operacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.fecha_operacion_prestamo IS NOT NULL AND query.fecha_operacion_prestamo IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.mes_operacion_prestamo<>query.mes_operacion_prestamo OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.mes_operacion_prestamo IS NULL AND query.mes_operacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.mes_operacion_prestamo IS NOT NULL AND query.mes_operacion_prestamo IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.anyo_operacion_prestamo<>query.anyo_operacion_prestamo OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.anyo_operacion_prestamo IS NULL AND query.anyo_operacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.anyo_operacion_prestamo IS NOT NULL AND query.anyo_operacion_prestamo IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.duracion_operacion_meses<>query.duracion_operacion_meses OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.duracion_operacion_meses IS NULL AND query.duracion_operacion_meses IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.duracion_operacion_meses IS NOT NULL AND query.duracion_operacion_meses IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_prestamo<>query.importe_prestamo OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_prestamo IS NULL AND query.importe_prestamo IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_prestamo IS NOT NULL AND query.importe_prestamo IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_amortizacion<>query.importe_amortizacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_amortizacion IS NULL AND query.importe_amortizacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_amortizacion IS NOT NULL AND query.importe_amortizacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_intereses<>query.importe_intereses OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_intereses IS NULL AND query.importe_intereses IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_intereses IS NOT NULL AND query.importe_intereses IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_gastos_amortizacion<>query.importe_gastos_amortizacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_gastos_amortizacion IS NULL AND query.importe_gastos_amortizacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_gastos_amortizacion IS NOT NULL AND query.importe_gastos_amortizacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_gastos_financiacion<>query.importe_gastos_financiacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_gastos_financiacion IS NULL AND query.importe_gastos_financiacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_gastos_financiacion IS NOT NULL AND query.importe_gastos_financiacion IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.saldo_inicial_ejercicio<>query.saldo_inicial_ejercicio OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.saldo_inicial_ejercicio IS NULL AND query.saldo_inicial_ejercicio IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.saldo_inicial_ejercicio IS NOT NULL AND query.saldo_inicial_ejercicio IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.saldo_final_ejercicio<>query.saldo_final_ejercicio OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.saldo_final_ejercicio IS NULL AND query.saldo_final_ejercicio IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.saldo_final_ejercicio IS NOT NULL AND query.saldo_final_ejercicio IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_origen_operacion_181<>query.id_origen_operacion_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_origen_operacion_181 IS NULL AND query.id_origen_operacion_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_origen_operacion_181 IS NOT NULL AND query.id_origen_operacion_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_clave_operacion_181<>query.id_clave_operacion_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_clave_operacion_181 IS NULL AND query.id_clave_operacion_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_clave_operacion_181 IS NOT NULL AND query.id_clave_operacion_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_subclave_operacion_181<>query.id_subclave_operacion_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_subclave_operacion_181 IS NULL AND query.id_subclave_operacion_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_subclave_operacion_181 IS NOT NULL AND query.id_subclave_operacion_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_situacion_inmueble_181<>query.id_situacion_inmueble_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_situacion_inmueble_181 IS NULL AND query.id_situacion_inmueble_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_situacion_inmueble_181 IS NOT NULL AND query.id_situacion_inmueble_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.referencia_catastral<>query.referencia_catastral OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.referencia_catastral IS NULL AND query.referencia_catastral IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.referencia_catastral IS NOT NULL AND query.referencia_catastral IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_valor_tasacion_inmueble<>query.importe_valor_tasacion_inmueble OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_valor_tasacion_inmueble IS NULL AND query.importe_valor_tasacion_inmueble IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.importe_valor_tasacion_inmueble IS NOT NULL AND query.importe_valor_tasacion_inmueble IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_tipo_identificacion_181<>query.id_tipo_identificacion_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_tipo_identificacion_181 IS NULL AND query.id_tipo_identificacion_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_tipo_identificacion_181 IS NOT NULL AND query.id_tipo_identificacion_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.codigo_iban<>query.codigo_iban OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.codigo_iban IS NULL AND query.codigo_iban IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.codigo_iban IS NOT NULL AND query.codigo_iban IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_clave_intervencion_operacion_181<>query.id_clave_intervencion_operacion_181 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_clave_intervencion_operacion_181 IS NULL AND query.id_clave_intervencion_operacion_181 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.id_clave_intervencion_operacion_181 IS NOT NULL AND query.id_clave_intervencion_operacion_181 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_prestamista_11<>query.nif_prestamista_11 OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_prestamista_11 IS NULL AND query.nif_prestamista_11 IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_prestamista_11 IS NOT NULL AND query.nif_prestamista_11 IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_prestamista<>query.nif_prestamista OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_prestamista IS NULL AND query.nif_prestamista IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nif_prestamista IS NOT NULL AND query.nif_prestamista IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.nombre_prestamista <>query.nombre_prestamista  OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nombre_prestamista  IS NULL AND query.nombre_prestamista  IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.nombre_prestamista  IS NOT NULL AND query.nombre_prestamista  IS NULL)
			OR tbn1_mi_ds_181_prestamos_bienes_inmuebles.porcentaje_financiacion<>query.porcentaje_financiacion OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.porcentaje_financiacion IS NULL AND query.porcentaje_financiacion IS NOT NULL) OR (tbn1_mi_ds_181_prestamos_bienes_inmuebles.porcentaje_financiacion IS NOT NULL AND query.porcentaje_financiacion IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			ejercicio=query.ejercicio,
			modelo =query.modelo ,
			id_administracion_declarante=query.id_administracion_declarante,
			es_externo_declarante=query.es_externo_declarante,
			nif_declarante_181_11=query.nif_declarante_181_11,
			nif_declarante_181=query.nif_declarante_181,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_complementaria=query.es_complementaria,
			es_sustitutiva=query.es_sustitutiva,
			id_tipo_presentacion=query.id_tipo_presentacion,
			telefono_contacto=query.telefono_contacto,
			nombre_contacto=query.nombre_contacto,
			numero_caja=query.numero_caja,
			contador_revisiones=query.contador_revisiones,
			fecha_presentacion=query.fecha_presentacion,
			mes_presentacion=query.mes_presentacion,
			anyo_presentacion =query.anyo_presentacion ,
			es_rehabilitacion=query.es_rehabilitacion,
			id_administracion_declarado=query.id_administracion_declarado,
			es_externo_declarado=query.es_externo_declarado,
			nif_declarado_181_11=query.nif_declarado_181_11,
			nif_declarado_181=query.nif_declarado_181,
			nif_declarado_no_identificado_11=query.nif_declarado_no_identificado_11,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
			nivel_identificacion_nif_declarado=query.nivel_identificacion_nif_declarado,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado   =query.sw_identificado_declarado   ,
			sw_representante =query.sw_representante ,
			id_provincia=query.id_provincia,
			numero_identificacion_prestamo=query.numero_identificacion_prestamo,
			fecha_operacion_prestamo=query.fecha_operacion_prestamo,
			mes_operacion_prestamo=query.mes_operacion_prestamo,
			anyo_operacion_prestamo=query.anyo_operacion_prestamo,
			duracion_operacion_meses=query.duracion_operacion_meses,
			importe_prestamo=query.importe_prestamo,
			importe_amortizacion=query.importe_amortizacion,
			importe_intereses=query.importe_intereses,
			importe_gastos_amortizacion=query.importe_gastos_amortizacion,
			porcentaje_participacion=query.porcentaje_participacion,
			importe_gastos_financiacion=query.importe_gastos_financiacion,
			saldo_inicial_ejercicio=query.saldo_inicial_ejercicio,
			saldo_final_ejercicio=query.saldo_final_ejercicio,
			id_origen_operacion_181=query.id_origen_operacion_181,
			id_clave_operacion_181=query.id_clave_operacion_181,
			id_subclave_operacion_181=query.id_subclave_operacion_181,
			id_situacion_inmueble_181=query.id_situacion_inmueble_181,
			referencia_catastral=query.referencia_catastral,
			importe_valor_tasacion_inmueble=query.importe_valor_tasacion_inmueble,
			id_tipo_identificacion_181=query.id_tipo_identificacion_181,
			codigo_iban=query.codigo_iban,
			id_clave_intervencion_operacion_181=query.id_clave_intervencion_operacion_181,
			nif_prestamista_11=query.nif_prestamista_11,
			nif_prestamista=query.nif_prestamista,
			nombre_prestamista =query.nombre_prestamista ,
			porcentaje_financiacion=query.porcentaje_financiacion
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,id_administracion_declarante,es_externo_declarante,nif_declarante_181_11,nif_declarante_181,es_contribuyente_declarante,id_contribuyente_declarante,es_complementaria,es_sustitutiva,id_tipo_presentacion,telefono_contacto,nombre_contacto,numero_caja,contador_revisiones,fecha_presentacion,mes_presentacion,anyo_presentacion ,es_rehabilitacion,secuencia,id_administracion_declarado,es_externo_declarado,nif_declarado_181_11,nif_declarado_181,nif_declarado_no_identificado_11,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado  ,nivel_identificacion_nif_declarado,es_identificado_declarado,sw_identificado_declarado   ,sw_representante ,id_provincia,numero_identificacion_prestamo,fecha_operacion_prestamo,mes_operacion_prestamo,anyo_operacion_prestamo,duracion_operacion_meses,importe_prestamo,importe_amortizacion,importe_intereses,importe_gastos_amortizacion,porcentaje_participacion,importe_gastos_financiacion,saldo_inicial_ejercicio,saldo_final_ejercicio,id_origen_operacion_181,id_clave_operacion_181,id_subclave_operacion_181,id_situacion_inmueble_181,referencia_catastral,importe_valor_tasacion_inmueble,id_tipo_identificacion_181,codigo_iban,id_clave_intervencion_operacion_181,nif_prestamista_11,nif_prestamista,nombre_prestamista ,porcentaje_financiacion) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.id_mae_no_id_declarante,
			query.id_mae_no_id_declarado,
			query.ejercicio,
			query.modelo ,
			query.id_administracion_declarante,
			query.es_externo_declarante,
			query.nif_declarante_181_11,
			query.nif_declarante_181,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_complementaria,
			query.es_sustitutiva,
			query.id_tipo_presentacion,
			query.telefono_contacto,
			query.nombre_contacto,
			query.numero_caja,
			query.contador_revisiones,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion ,
			query.es_rehabilitacion,
			query.secuencia,
			query.id_administracion_declarado,
			query.es_externo_declarado,
			query.nif_declarado_181_11,
			query.nif_declarado_181,
			query.nif_declarado_no_identificado_11,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado  ,
			query.nivel_identificacion_nif_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.sw_representante ,
			query.id_provincia,
			query.numero_identificacion_prestamo,
			query.fecha_operacion_prestamo,
			query.mes_operacion_prestamo,
			query.anyo_operacion_prestamo,
			query.duracion_operacion_meses,
			query.importe_prestamo,
			query.importe_amortizacion,
			query.importe_intereses,
			query.importe_gastos_amortizacion,
			query.porcentaje_participacion,
			query.importe_gastos_financiacion,
			query.saldo_inicial_ejercicio,
			query.saldo_final_ejercicio,
			query.id_origen_operacion_181,
			query.id_clave_operacion_181,
			query.id_subclave_operacion_181,
			query.id_situacion_inmueble_181,
			query.referencia_catastral,
			query.importe_valor_tasacion_inmueble,
			query.id_tipo_identificacion_181,
			query.codigo_iban,
			query.id_clave_intervencion_operacion_181,
			query.nif_prestamista_11,
			query.nif_prestamista,
			query.nombre_prestamista ,
			query.porcentaje_financiacion
			)
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
