PRINT 'normalizado_mi_781_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda(
	id_mi_ds_781_cuentas_vivienda int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3) NOT NULL,
	id_administracion_declarante int NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_781_11 varchar(11) NOT NULL,
	nif_declarante_781 varchar(12) NOT NULL,
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
	nif_declarado_781_11 varchar(11) NOT NULL,
	nif_declarado_781 varchar(12) NOT NULL,
	nif_declarado_no_identificado_11 varchar(11) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	nivel_identificacion_nif_declarado varchar(1) NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	sw_representante  varchar(1) NOT NULL,
	id_provincia int NOT NULL,
	numero_identificacion_cuenta_vivienda varchar(20) NOT NULL,
	fecha_apertura_cuenta_vivienda date NOT NULL,
	mes_apertura_cuenta_vivienda int NOT NULL,
	anyo_apertura_cuenta_vivienda int NOT NULL,
	saldo_inicial_ejercicio decimal(18, 2),
	saldo_final_ejercicio decimal(18, 2),
	porcentaje_participacion decimal(6, 3),
	nif_titular_inmueble_rehabilitacion varchar(12) NOT NULL,
	nivel_identificacion_nif_titular varchar(1) NOT NULL,
	es_identificado_titular bit NOT NULL,
	sw_identificado_titular    varchar(1) NOT NULL,
	expediente_rehabilitacion varchar(19) NOT NULL,
	importe_parcial_obra decimal(18, 2),
	importe_final_obra decimal(18, 2) ,
	importe_prestamo decimal(18, 2) ,
	fecha_formalizacion_prestamo date NOT NULL,
	mes_formalizacion_prestamo int NOT NULL,
	anyo_formalizacion_prestamo int NOT NULL,
	codigo_entidad  varchar(4) NOT NULL,
	codigo_sucursal  varchar(4) NOT NULL,
	codigo_control  varchar(2) NOT NULL,
	numero_cuenta  varchar(10) NOT NULL,
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_781_cuentas_vivienda UNIQUE (id_documento,secuencia),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT PK_tbn1_mi_ds_781_cuentas_vivienda PRIMARY KEY CLUSTERED (id_mi_ds_781_cuentas_vivienda)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_mi_ds_781_cuentas_vivienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_mi_ds_781_cuentas_vivienda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarante_781_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_declarante_781_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarante_781')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_declarante_781 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_complementaria varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_sustitutiva varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD telefono_contacto varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nombre_contacto varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='numero_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD numero_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD contador_revisiones decimal(1, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_rehabilitacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_rehabilitacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_781_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_declarado_781_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_781')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_declarado_781 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_declarado_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nivel_identificacion_nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nivel_identificacion_nif_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='sw_representante ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD sw_representante  varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='numero_identificacion_cuenta_vivienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD numero_identificacion_cuenta_vivienda varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fecha_apertura_cuenta_vivienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD fecha_apertura_cuenta_vivienda date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='mes_apertura_cuenta_vivienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD mes_apertura_cuenta_vivienda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='anyo_apertura_cuenta_vivienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD anyo_apertura_cuenta_vivienda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='saldo_inicial_ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD saldo_inicial_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='saldo_final_ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD saldo_final_ejercicio decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD porcentaje_participacion decimal(6, 3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_titular_inmueble_rehabilitacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nif_titular_inmueble_rehabilitacion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nivel_identificacion_nif_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD nivel_identificacion_nif_titular varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_identificado_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD es_identificado_titular bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='sw_identificado_titular   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD sw_identificado_titular    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='expediente_rehabilitacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD expediente_rehabilitacion varchar(19)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='importe_parcial_obra')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD importe_parcial_obra decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='importe_final_obra')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD importe_final_obra decimal(18, 2) 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='importe_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD importe_prestamo decimal(18, 2) 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fecha_formalizacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD fecha_formalizacion_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='mes_formalizacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD mes_formalizacion_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='anyo_formalizacion_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD anyo_formalizacion_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='codigo_entidad ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD codigo_entidad  varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='codigo_sucursal ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD codigo_sucursal  varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='codigo_control ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD codigo_control  varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='numero_cuenta ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD numero_cuenta  varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_mi_ds_781_cuentas_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_mi_ds_781_cuentas_vivienda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarante_781_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_declarante_781_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarante_781' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_declarante_781 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_complementaria varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_sustitutiva varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN telefono_contacto varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nombre_contacto varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='numero_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN numero_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN contador_revisiones decimal(1, 0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_rehabilitacion varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN secuencia varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_administracion_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_781_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_declarado_781_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_781' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_declarado_781 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_declarado_no_identificado_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nivel_identificacion_nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nivel_identificacion_nif_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='sw_representante ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN sw_representante  varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='numero_identificacion_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN numero_identificacion_cuenta_vivienda varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fecha_apertura_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN fecha_apertura_cuenta_vivienda date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='mes_apertura_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN mes_apertura_cuenta_vivienda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='anyo_apertura_cuenta_vivienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN anyo_apertura_cuenta_vivienda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='saldo_inicial_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN saldo_inicial_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='saldo_final_ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN saldo_final_ejercicio decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN porcentaje_participacion decimal(6, 3) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nif_titular_inmueble_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nif_titular_inmueble_rehabilitacion varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='nivel_identificacion_nif_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN nivel_identificacion_nif_titular varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='es_identificado_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN es_identificado_titular bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='sw_identificado_titular   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN sw_identificado_titular    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='expediente_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN expediente_rehabilitacion varchar(19) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='importe_parcial_obra' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN importe_parcial_obra decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='importe_final_obra' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN importe_final_obra decimal(18, 2)  NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='importe_prestamo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN importe_prestamo decimal(18, 2)  NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fecha_formalizacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN fecha_formalizacion_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='mes_formalizacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN mes_formalizacion_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='anyo_formalizacion_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN anyo_formalizacion_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='codigo_entidad ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN codigo_entidad  varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='codigo_sucursal ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN codigo_sucursal  varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='codigo_control ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN codigo_control  varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='numero_cuenta ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN numero_cuenta  varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_781_cuentas_vivienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT PK_tbn1_mi_ds_781_cuentas_vivienda PRIMARY KEY CLUSTERED (id_mi_ds_781_cuentas_vivienda)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_administracion_hacienda1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_781_cuentas_vivienda' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda ADD CONSTRAINT FK_tbn1_mi_ds_781_cuentas_vivienda_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_781_cuentas_vivienda_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_781_cuentas_vivienda_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_781_cuentas_vivienda_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_mi_ds_781_cuentas_vivienda_ssis',
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
mae_noid AS 
(
        SELECT id_mae_no_identificados,
                    ejercicio,
                    clavagru,
                    clavdeta
        FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
        WHERE  aplicacion = 'BW'
        AND detamodel = '781'
),
query AS (

	--CUENTA VIVIENDA (INTERNOS)
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.deejerc 		AS ejercicio,
		coalesce(decl.demodel ,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		0	AS es_externo_declarante,
		coalesce(ddos.donifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(ddos.donifde ,''),9)+' '+right(coalesce(ddos.donifde ,''),2),'') AS nif_declarante_781,
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
		decl.dencaja 	AS numero_caja,
		decl.decrevi 	AS contador_revisiones,
		CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END AS fecha_presentacion,
		month(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS mes_presentacion,
		year(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS anyo_presentacion ,
		CASE WHEN decl.derhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,
		
		CAST(ddos.dosecue  AS varchar)	AS secuencia,
	
  ----- datos CUENTA VIVIENDA -----
		admini_ddos.id_administracion AS id_administracion_declarado,
		0	AS es_externo_declarado,
		coalesce(ddos.donifdo ,'') 	AS nif_declarado_781_11,
		coalesce(left(coalesce(ddos.donifdo ,''),9)+' '+right(coalesce(ddos.donifdo ,''),2),'') 	AS nif_declarado_781,
		CASE WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.donifdo,'') ELSE '' END	AS nif_declarado_no_identificado_11,
		coalesce(left(CASE WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.donifdo,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.donifdo,'') ELSE '' END,2),'')	AS nif_declarado_no_identificado  ,
		CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarado,
		coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarado,
		ddos.doident  AS nivel_identificacion_nif_declarado,
		CASE WHEN ddos.doident =1 THEN 1 ELSE 0 END	AS es_identificado_declarado,
		CASE
			WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_declarado,
		coalesce(dorepre,'') 	AS sw_representante ,
		provincia.id_provincia	AS id_provincia,
		coalesce(ddos.donumer,'') AS numero_identificacion_cuenta_vivienda,
		CASE WHEN ddos.dofecha <>'0001-01-01' THEN ddos.dofecha ELSE CAST('21000101' AS date) END AS fecha_apertura_cuenta_vivienda,
		month(CASE WHEN ddos.dofecha <>'0001-01-01' THEN ddos.dofecha ELSE CAST('21000101' AS date) END) AS mes_apertura_cuenta_vivienda,
		year(CASE WHEN ddos.dofecha <>'0001-01-01' THEN ddos.dofecha ELSE CAST('21000101' AS date) END)	AS anyo_apertura_cuenta_vivienda,
		round(ddos.dosdini/100,2)	AS saldo_inicial_ejercicio,
		round(ddos.dosdfin/100,2)	AS saldo_final_ejercicio,
		round(ddos.doparti/100,2)	AS porcentaje_participacion,
		
		--part.panumer		AS numero_partida,
		--round(part.padecla/100,2)	AS importe_valor_declarado,
		--round(part.pacalcu/100,2)	AS importe_valor_calculado,
		
 ----- datos REHABILITACIÓN VIVIENDA -----
		''	AS nif_titular_inmueble_rehabilitacion,
		''	AS nivel_identificacion_nif_titular, 
		0	AS es_identificado_titular,

		''	AS sw_identificado_titular,

		'' 	AS expediente_rehabilitacion,
		0	AS importe_parcial_obra,
		0	AS importe_final_obra,
		0	AS importe_prestamo,
		CAST('21000101' AS date) AS fecha_formalizacion_prestamo,
		month(CAST('21000101' AS date)) AS mes_formalizacion_prestamo,
		year(CAST('21000101' AS date))	AS anyo_formalizacion_prestamo,
		''	AS codigo_entidad,
		''	AS codigo_sucursal,
		''	AS codigo_control,
		''	AS numero_cuenta 

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1decl_bw WHERE demodel='781') decl
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1ddos_bw ddos ON decl.deejerc=ddos.doejerc  AND decl.derefer =ddos.dorefer 

	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe
			ON	decl.deejerc = mae_noid_cabe.ejercicio
			AND cast(decl.derefer as varchar)= mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.deejerc = mae_noid_det.ejercicio
			AND cast(decl.derefer as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(ddos.dosecue  as varchar) , 13)=  mae_noid_det.clavdeta 

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.doejerc AS varchar)+'VG'+CAST(ddos.dorefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (ddos.donifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.donifdo=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipop)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.docodpr)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON (admini_ddos.cod_administracion='B')
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_administracion='B')
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

UNION ALL	
	
	--CUENTA VIVIENDA (EXTERNOS)
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.dxejerc 		AS ejercicio,
		coalesce(decl.dxmodel,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		1	AS es_externo_declarante,
		coalesce(ddos.doxnifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(ddos.doxnifde ,''),9)+' '+right(coalesce(ddos.doxnifde ,''),2),'') AS nif_declarante_781,
		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,
		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,

		'' 	AS es_complementaria,
		''	AS es_sustitutiva,
		-1	AS id_tipo_presentacion,  --carga por integridad
		''	AS telefono_contacto,
		''	AS nombre_contacto,
		'' 	AS numero_caja,
		0 	AS contador_revisiones,
		'21000101' fecha_presentacion,
		01		AS mes_presentacion,
		2100	AS anyo_presentacion ,
		CASE WHEN decl.dxrhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,

		CAST(ddos.doxsecue  AS varchar)	AS secuencia,

  ----- datos CUENTA VIVIENDA -----
		admini_ddos.id_administracion AS id_administracion_declarado,
		1	AS es_externo_declarado,
		coalesce(ddos.doxnifdo ,'') 	AS nif_declarado_781_11,
		coalesce(left(coalesce(ddos.doxnifdo ,''),9)+' '+right(coalesce(ddos.doxnifdo ,''),2),'') 	AS nif_declarado_781,
		CASE WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.doxnifdo,'') ELSE '' END	AS nif_declarado_no_identificado_11,
		coalesce(left(CASE WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.doxnifdo,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.doxnifdo,'') ELSE '' END,2),'')	AS nif_declarado_no_identificado  ,
		CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarado,
		coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarado,
		ddos.doxident  AS nivel_identificacion_nif_declarado,
		CASE WHEN ddos.doxident =1 THEN 1 ELSE 0 END	AS es_identificado_declarado,
		CASE
			WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_declarado,
		doxrepre 	AS sw_representante ,
		provincia.id_provincia	AS id_provincia,
		coalesce(ddos.doxnumer,'') AS numero_identificacion_cuenta_vivienda,
		CASE WHEN ddos.doxfecha <>'0001-01-01' THEN ddos.doxfecha ELSE CAST('21000101' AS date) END AS fecha_apertura_cuenta_vivienda,
		month(CASE WHEN ddos.doxfecha <>'0001-01-01' THEN ddos.doxfecha ELSE CAST('21000101' AS date) END) AS mes_apertura_cuenta_vivienda,
		year(CASE WHEN ddos.doxfecha <>'0001-01-01' THEN ddos.doxfecha ELSE CAST('21000101' AS date) END)	AS anyo_apertura_cuenta_vivienda,
		round(ddos.doxsdini/100,2)	AS saldo_inicial_ejercicio,
		round(ddos.doxsdfin/100,2)	AS saldo_final_ejercicio,
		round(ddos.doxparti/100,2)	AS porcentaje_participacion,

		--part.paxnumer		AS numero_partida,
		--round(part.paxdecla/100,2)	AS importe_valor_declarado,
		--round(part.paxcalcu/100,2)	AS importe_valor_calculado,
        
  ----- datos REHABILITACIÓN VIVIENDA -----
		''	AS nif_titular_inmueble_rehabilitacion,
		''	AS nivel_identificacion_nif_titular, 
		0	AS es_identificado_titular,

		''	AS sw_identificado_titular,

		'' 	AS expediente_rehabilitacion,
		0	AS importe_parcial_obra,
		0	AS importe_final_obra,
		0	AS importe_prestamo,
		CAST('21000101' AS date) AS fecha_formalizacion_prestamo,
		month(CAST('21000101' AS date)) AS mes_formalizacion_prestamo,
		year(CAST('21000101' AS date))	AS anyo_formalizacion_prestamo,
		''	AS codigo_entidad,
		''	AS codigo_sucursal,
		''	AS codigo_control,
		''	AS numero_cuenta 

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3de_bw WHERE dxmodel='781') decl 
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1i3do_bw ddos ON decl.dxejerc=ddos.doxejerc  AND decl.dxrefer=ddos.doxrefer 

	--no_identificados_declarante
	LEFT JOIN	mae_noid mae_noid_cabe
			ON	decl.dxejerc = mae_noid_cabe.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
	
	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.dxejerc = mae_noid_det.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(ddos.doxsecue  as varchar) , 13)=  mae_noid_det.clavdeta

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.doxejerc AS varchar)+'VG'+CAST(ddos.doxrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (ddos.doxnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.doxnifdo=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.doxcodpr)
	
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON (admini_ddos.cod_provincia=ddos.doxadmon )
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_provincia=decl.dxadmon)
    
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

UNION ALL
	
	--REHABILITACIÓN VIVIENDA (INTERNOS)   
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.deejerc 		AS ejercicio,
		coalesce(decl.demodel ,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		0	AS es_externo_declarante,

		coalesce(rhvi.rhnifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(rhvi.rhnifde ,''),9)+' '+right(coalesce(rhvi.rhnifde ,''),2),'') AS nif_declarante_781,

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
		decl.dencaja 	AS numero_caja,
		decl.decrevi 	AS contador_revisiones,
		CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END AS fecha_presentacion,
		month(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS mes_presentacion,
		year(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS anyo_presentacion ,
		CASE WHEN decl.derhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,

		CAST(rhvi.rhsecue  AS varchar)	AS secuencia,

  ----- datos CUENTA VIVIENDA -----
		1	AS id_administracion_declarado,  
		0	AS es_externo_declarado,

		''	AS nif_declarado_781_11,
		'' 	AS nif_declarado_781,

		''	AS nif_declarado_no_identificado_11,
		''	AS nif_declarado_no_identificado  ,
		0   AS es_contribuyente_declarado,
		
		indefinidos.id_contribuyente	AS id_contribuyente_declarado, 
		''  AS nivel_identificacion_nif_declarado,
	    0   AS es_identificado_declarado,
		
		''  AS sw_identificado_declarado,
		''  AS sw_representante ,
		
		-1   AS id_provincia, 
		''  AS numero_identificacion_cuenta_vivienda,
		
		CAST('21000101' AS date) AS fecha_apertura_cuenta_vivienda,
		month(CAST('21000101' AS date)) AS mes_apertura_cuenta_vivienda,
		year(CAST('21000101' AS date))	AS anyo_apertura_cuenta_vivienda,

		0	AS saldo_inicial_ejercicio,
		0	AS saldo_final_ejercicio,
		0	AS porcentaje_participacion,

		--part.panumer		AS numero_partida,
		--round(part.padecla/100,2)	AS importe_valor_declarado,
		--round(part.pacalcu/100,2)	AS importe_valor_calculado,

  ----- datos REHABILITACIÓN VIVIENDA -----
		coalesce(left(coalesce(rhvi.rhnifti ,''),9)+' '+right(coalesce(rhvi.rhnifti ,''),2),'') 	AS nif_titular_inmueble_rehabilitacion,
	
		coalesce(rhvi.rhident,'')   AS nivel_identificacion_nif_titular, 
		CASE WHEN rhvi.rhident =1 THEN 1 ELSE 0 END	AS es_identificado_titular,

		CASE
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_titular,

		coalesce(rhvi.rhnexpe,'') 	AS expediente_rehabilitacion,
		round(rhvi.rhicpar/100,2)	AS importe_parcial_obra,
		round(rhvi.rhicfin/100,2)	AS importe_final_obra,
		round(rhvi.rhimpre/100,2)	AS importe_prestamo,
		CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END AS fecha_formalizacion_prestamo,
		month(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END) AS mes_formalizacion_prestamo,
		year(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END)	AS anyo_formalizacion_prestamo,
		coalesce(rhvi.rhentip,'')	AS codigo_entidad,
		coalesce(rhvi.rhsucup,'')	AS codigo_sucursal,
		coalesce(rhvi.rhcodcp,'') 	AS codigo_control,
		coalesce(rhvi.rhnctap,'')	AS numero_cuenta 

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1decl_bw WHERE demodel='781') decl
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1rhvi_bw rhvi ON  decl.deejerc=rhvi.rhejerc AND decl.derefer=rhvi.rhrefer
	
	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe
			ON	decl.deejerc = mae_noid_cabe.ejercicio
			AND cast(decl.derefer as varchar)= mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.deejerc = mae_noid_det.ejercicio
			AND cast(decl.derefer as varchar) = mae_noid_det.clavagru  
			AND right('0000000000000' +  cast(rhvi.rhsecue   as varchar) , 13)=  mae_noid_det.clavdeta 
		  
	
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(rhvi.rhejerc AS varchar)+'VG'+CAST(rhvi.rhrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (rhvi.rhnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_titular ON (rhvi.rhnifti =c_titular.nif_maestro AND c_titular.fec_fin_vigencia=CAST('21000101' AS datetime))
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipop)

	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_administracion='B')
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_tit ON (admini_tit.cod_provincia=rhvi.rhadmon)

	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

UNION ALL
	
	--REHABILITACIÓN VIVIENDA (EXTERNOS)
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.dxejerc 		AS ejercicio,
		coalesce(decl.dxmodel,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		1	AS es_externo_declarante,

		coalesce(rhvi.rhnifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(rhvi.rhnifde ,''),9)+' '+right(coalesce(rhvi.rhnifde ,''),2),'') AS nif_declarante_781,

		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,

		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,

		'' 	AS es_complementaria,
		''	AS es_sustitutiva,
		-1	AS id_tipo_presentacion,  --carga por integridad
		''	AS telefono_contacto,
		''	AS nombre_contacto,
		'' 	AS numero_caja,
		0 	AS contador_revisiones,
		'21000101' fecha_presentacion,
		01		AS mes_presentacion,
		2100	AS anyo_presentacion ,
		CASE WHEN decl.dxrhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,

		CAST(rhvi.rhsecue  AS varchar)	AS secuencia,
		
        ----- datos CUENTA VIVIENDA -----
		admini_tit.id_administracion AS id_administracion_declarado,  --administracion de rhvi -- tener en cuenta en COGNOS !!!
	
		1	AS es_externo_declarado,

		'' 	AS nif_declarado_781_11,
		'' 	AS nif_declarado_781,

		''	AS nif_declarado_no_identificado_11,
		''	AS nif_declarado_no_identificado,
		0   AS es_contribuyente_declarado,
		
		indefinidos.id_contribuyente	AS id_contribuyente_declarado, 
		''  AS nivel_identificacion_nif_declarado,
	    0   AS es_identificado_declarado,
		
		'' AS sw_identificado_declarado,
		'' AS sw_representante ,
		
		-1  AS id_provincia,    
		'' AS numero_identificacion_cuenta_vivienda,
		
		CAST('21000101' AS date) AS fecha_apertura_cuenta_vivienda,
		month(CAST('21000101' AS date)) AS mes_apertura_cuenta_vivienda,
		year(CAST('21000101' AS date))	AS anyo_apertura_cuenta_vivienda,

		0	AS saldo_inicial_ejercicio,
		0	AS saldo_final_ejercicio,
		0	AS porcentaje_participacion,

		--part.panumer		AS numero_partida,
		--round(part.padecla/100,2)	AS importe_valor_declarado,
		--round(part.pacalcu/100,2)	AS importe_valor_calculado,

		----- datos REHABILITACIÓN VIVIENDA -----
		coalesce(left(coalesce(rhvi.rhnifti ,''),9)+' '+right(coalesce(rhvi.rhnifti ,''),2),'') 	AS nif_titular_inmueble_rehabilitacion,
		
		coalesce(rhvi.rhident,'')   AS nivel_identificacion_nif_titular, 
		CASE WHEN rhvi.rhident =1 THEN 1 ELSE 0 END	AS es_identificado_titular,

		CASE
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_titular,

		coalesce(rhvi.rhnexpe,'') 	AS expediente_rehabilitacion,
		round(rhvi.rhicpar/100,2)	AS importe_parcial_obra,
		round(rhvi.rhicfin/100,2)	AS importe_final_obra,
		round(rhvi.rhimpre/100,2)	AS importe_prestamo,
		CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END AS fecha_formalizacion_prestamo,
		month(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END) AS mes_formalizacion_prestamo,
		year(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END)	AS anyo_formalizacion_prestamo,
		coalesce(rhvi.rhentip,'')	AS codigo_entidad,
		coalesce(rhvi.rhsucup,'')	AS codigo_sucursal,
		coalesce(rhvi.rhcodcp,'') 	AS codigo_control,
		coalesce(rhvi.rhnctap,'')	AS numero_cuenta 

    FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3de_bw WHERE dxmodel='781') decl  
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1rhvi_bw rhvi ON   decl.dxejerc=rhvi.rhejerc AND decl.dxrefer=rhvi.rhrefer 

	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe
			ON	decl.dxejerc = mae_noid_cabe.ejercicio
			AND cast(decl.dxrefer as varchar)= mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.dxejerc = mae_noid_det.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_det.clavagru  
			AND right('0000000000000' +  cast(rhvi.rhsecue   as varchar) , 13)=  mae_noid_det.clavdeta 
	

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(rhvi.rhejerc AS varchar)+'VG'+CAST(rhvi.rhrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (rhvi.rhnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_titular ON (rhvi.rhnifti =c_titular.nif_maestro AND c_titular.fec_fin_vigencia=CAST('21000101' AS datetime))

	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_provincia=decl.dxadmon)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_tit ON (admini_tit.cod_provincia=rhvi.rhadmon)
	
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_781_cuentas_vivienda AS tbn1_mi_ds_781_cuentas_vivienda
	USING query ON query.id_documento=tbn1_mi_ds_781_cuentas_vivienda.id_documento AND query.secuencia=tbn1_mi_ds_781_cuentas_vivienda.secuencia
	WHEN MATCHED AND ((tbn1_mi_ds_781_cuentas_vivienda.id_expediente<>query.id_expediente OR (tbn1_mi_ds_781_cuentas_vivienda.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_781_cuentas_vivienda.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_781_cuentas_vivienda.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.ejercicio<>query.ejercicio OR (tbn1_mi_ds_781_cuentas_vivienda.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.modelo <>query.modelo  OR (tbn1_mi_ds_781_cuentas_vivienda.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_administracion_declarante<>query.id_administracion_declarante OR (tbn1_mi_ds_781_cuentas_vivienda.id_administracion_declarante IS NULL AND query.id_administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_administracion_declarante IS NOT NULL AND query.id_administracion_declarante IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_781_cuentas_vivienda.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_declarante_781_11<>query.nif_declarante_781_11 OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarante_781_11 IS NULL AND query.nif_declarante_781_11 IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarante_781_11 IS NOT NULL AND query.nif_declarante_781_11 IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_declarante_781<>query.nif_declarante_781 OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarante_781 IS NULL AND query.nif_declarante_781 IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarante_781 IS NOT NULL AND query.nif_declarante_781 IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_781_cuentas_vivienda.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_781_cuentas_vivienda.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_complementaria<>query.es_complementaria OR (tbn1_mi_ds_781_cuentas_vivienda.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_sustitutiva<>query.es_sustitutiva OR (tbn1_mi_ds_781_cuentas_vivienda.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_781_cuentas_vivienda.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.telefono_contacto<>query.telefono_contacto OR (tbn1_mi_ds_781_cuentas_vivienda.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nombre_contacto<>query.nombre_contacto OR (tbn1_mi_ds_781_cuentas_vivienda.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.numero_caja<>query.numero_caja OR (tbn1_mi_ds_781_cuentas_vivienda.numero_caja IS NULL AND query.numero_caja IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.numero_caja IS NOT NULL AND query.numero_caja IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_781_cuentas_vivienda.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_781_cuentas_vivienda.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_781_cuentas_vivienda.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.anyo_presentacion <>query.anyo_presentacion  OR (tbn1_mi_ds_781_cuentas_vivienda.anyo_presentacion  IS NULL AND query.anyo_presentacion  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.anyo_presentacion  IS NOT NULL AND query.anyo_presentacion  IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_rehabilitacion<>query.es_rehabilitacion OR (tbn1_mi_ds_781_cuentas_vivienda.es_rehabilitacion IS NULL AND query.es_rehabilitacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_rehabilitacion IS NOT NULL AND query.es_rehabilitacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_administracion_declarado<>query.id_administracion_declarado OR (tbn1_mi_ds_781_cuentas_vivienda.id_administracion_declarado IS NULL AND query.id_administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_administracion_declarado IS NOT NULL AND query.id_administracion_declarado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_781_cuentas_vivienda.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_781_11<>query.nif_declarado_781_11 OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_781_11 IS NULL AND query.nif_declarado_781_11 IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_781_11 IS NOT NULL AND query.nif_declarado_781_11 IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_781<>query.nif_declarado_781 OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_781 IS NULL AND query.nif_declarado_781 IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_781 IS NOT NULL AND query.nif_declarado_781 IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_781_cuentas_vivienda.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_781_cuentas_vivienda.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nivel_identificacion_nif_declarado<>query.nivel_identificacion_nif_declarado OR (tbn1_mi_ds_781_cuentas_vivienda.nivel_identificacion_nif_declarado IS NULL AND query.nivel_identificacion_nif_declarado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nivel_identificacion_nif_declarado IS NOT NULL AND query.nivel_identificacion_nif_declarado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_781_cuentas_vivienda.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_781_cuentas_vivienda.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.sw_representante <>query.sw_representante  OR (tbn1_mi_ds_781_cuentas_vivienda.sw_representante  IS NULL AND query.sw_representante  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.sw_representante  IS NOT NULL AND query.sw_representante  IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.id_provincia<>query.id_provincia OR (tbn1_mi_ds_781_cuentas_vivienda.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.numero_identificacion_cuenta_vivienda<>query.numero_identificacion_cuenta_vivienda OR (tbn1_mi_ds_781_cuentas_vivienda.numero_identificacion_cuenta_vivienda IS NULL AND query.numero_identificacion_cuenta_vivienda IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.numero_identificacion_cuenta_vivienda IS NOT NULL AND query.numero_identificacion_cuenta_vivienda IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.fecha_apertura_cuenta_vivienda<>query.fecha_apertura_cuenta_vivienda OR (tbn1_mi_ds_781_cuentas_vivienda.fecha_apertura_cuenta_vivienda IS NULL AND query.fecha_apertura_cuenta_vivienda IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.fecha_apertura_cuenta_vivienda IS NOT NULL AND query.fecha_apertura_cuenta_vivienda IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.mes_apertura_cuenta_vivienda<>query.mes_apertura_cuenta_vivienda OR (tbn1_mi_ds_781_cuentas_vivienda.mes_apertura_cuenta_vivienda IS NULL AND query.mes_apertura_cuenta_vivienda IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.mes_apertura_cuenta_vivienda IS NOT NULL AND query.mes_apertura_cuenta_vivienda IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.anyo_apertura_cuenta_vivienda<>query.anyo_apertura_cuenta_vivienda OR (tbn1_mi_ds_781_cuentas_vivienda.anyo_apertura_cuenta_vivienda IS NULL AND query.anyo_apertura_cuenta_vivienda IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.anyo_apertura_cuenta_vivienda IS NOT NULL AND query.anyo_apertura_cuenta_vivienda IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.saldo_inicial_ejercicio<>query.saldo_inicial_ejercicio OR (tbn1_mi_ds_781_cuentas_vivienda.saldo_inicial_ejercicio IS NULL AND query.saldo_inicial_ejercicio IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.saldo_inicial_ejercicio IS NOT NULL AND query.saldo_inicial_ejercicio IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.saldo_final_ejercicio<>query.saldo_final_ejercicio OR (tbn1_mi_ds_781_cuentas_vivienda.saldo_final_ejercicio IS NULL AND query.saldo_final_ejercicio IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.saldo_final_ejercicio IS NOT NULL AND query.saldo_final_ejercicio IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_ds_781_cuentas_vivienda.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nif_titular_inmueble_rehabilitacion<>query.nif_titular_inmueble_rehabilitacion OR (tbn1_mi_ds_781_cuentas_vivienda.nif_titular_inmueble_rehabilitacion IS NULL AND query.nif_titular_inmueble_rehabilitacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nif_titular_inmueble_rehabilitacion IS NOT NULL AND query.nif_titular_inmueble_rehabilitacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.nivel_identificacion_nif_titular<>query.nivel_identificacion_nif_titular OR (tbn1_mi_ds_781_cuentas_vivienda.nivel_identificacion_nif_titular IS NULL AND query.nivel_identificacion_nif_titular IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.nivel_identificacion_nif_titular IS NOT NULL AND query.nivel_identificacion_nif_titular IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.es_identificado_titular<>query.es_identificado_titular OR (tbn1_mi_ds_781_cuentas_vivienda.es_identificado_titular IS NULL AND query.es_identificado_titular IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.es_identificado_titular IS NOT NULL AND query.es_identificado_titular IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.sw_identificado_titular   <>query.sw_identificado_titular    OR (tbn1_mi_ds_781_cuentas_vivienda.sw_identificado_titular    IS NULL AND query.sw_identificado_titular    IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.sw_identificado_titular    IS NOT NULL AND query.sw_identificado_titular    IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.expediente_rehabilitacion<>query.expediente_rehabilitacion OR (tbn1_mi_ds_781_cuentas_vivienda.expediente_rehabilitacion IS NULL AND query.expediente_rehabilitacion IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.expediente_rehabilitacion IS NOT NULL AND query.expediente_rehabilitacion IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.importe_parcial_obra<>query.importe_parcial_obra OR (tbn1_mi_ds_781_cuentas_vivienda.importe_parcial_obra IS NULL AND query.importe_parcial_obra IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.importe_parcial_obra IS NOT NULL AND query.importe_parcial_obra IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.importe_final_obra<>query.importe_final_obra OR (tbn1_mi_ds_781_cuentas_vivienda.importe_final_obra IS NULL AND query.importe_final_obra IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.importe_final_obra IS NOT NULL AND query.importe_final_obra IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.importe_prestamo<>query.importe_prestamo OR (tbn1_mi_ds_781_cuentas_vivienda.importe_prestamo IS NULL AND query.importe_prestamo IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.importe_prestamo IS NOT NULL AND query.importe_prestamo IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.fecha_formalizacion_prestamo<>query.fecha_formalizacion_prestamo OR (tbn1_mi_ds_781_cuentas_vivienda.fecha_formalizacion_prestamo IS NULL AND query.fecha_formalizacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.fecha_formalizacion_prestamo IS NOT NULL AND query.fecha_formalizacion_prestamo IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.mes_formalizacion_prestamo<>query.mes_formalizacion_prestamo OR (tbn1_mi_ds_781_cuentas_vivienda.mes_formalizacion_prestamo IS NULL AND query.mes_formalizacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.mes_formalizacion_prestamo IS NOT NULL AND query.mes_formalizacion_prestamo IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.anyo_formalizacion_prestamo<>query.anyo_formalizacion_prestamo OR (tbn1_mi_ds_781_cuentas_vivienda.anyo_formalizacion_prestamo IS NULL AND query.anyo_formalizacion_prestamo IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.anyo_formalizacion_prestamo IS NOT NULL AND query.anyo_formalizacion_prestamo IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.codigo_entidad <>query.codigo_entidad  OR (tbn1_mi_ds_781_cuentas_vivienda.codigo_entidad  IS NULL AND query.codigo_entidad  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.codigo_entidad  IS NOT NULL AND query.codigo_entidad  IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.codigo_sucursal <>query.codigo_sucursal  OR (tbn1_mi_ds_781_cuentas_vivienda.codigo_sucursal  IS NULL AND query.codigo_sucursal  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.codigo_sucursal  IS NOT NULL AND query.codigo_sucursal  IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.codigo_control <>query.codigo_control  OR (tbn1_mi_ds_781_cuentas_vivienda.codigo_control  IS NULL AND query.codigo_control  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.codigo_control  IS NOT NULL AND query.codigo_control  IS NULL)
			OR tbn1_mi_ds_781_cuentas_vivienda.numero_cuenta <>query.numero_cuenta  OR (tbn1_mi_ds_781_cuentas_vivienda.numero_cuenta  IS NULL AND query.numero_cuenta  IS NOT NULL) OR (tbn1_mi_ds_781_cuentas_vivienda.numero_cuenta  IS NOT NULL AND query.numero_cuenta  IS NULL) OR (fec_baja IS NOT NULL))) THEN
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
			nif_declarante_781_11=query.nif_declarante_781_11,
			nif_declarante_781=query.nif_declarante_781,
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
			nif_declarado_781_11=query.nif_declarado_781_11,
			nif_declarado_781=query.nif_declarado_781,
			nif_declarado_no_identificado_11=query.nif_declarado_no_identificado_11,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
			nivel_identificacion_nif_declarado=query.nivel_identificacion_nif_declarado,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado   =query.sw_identificado_declarado   ,
			sw_representante =query.sw_representante ,
			id_provincia=query.id_provincia,
			numero_identificacion_cuenta_vivienda=query.numero_identificacion_cuenta_vivienda,
			fecha_apertura_cuenta_vivienda=query.fecha_apertura_cuenta_vivienda,
			mes_apertura_cuenta_vivienda=query.mes_apertura_cuenta_vivienda,
			anyo_apertura_cuenta_vivienda=query.anyo_apertura_cuenta_vivienda,
			saldo_inicial_ejercicio=query.saldo_inicial_ejercicio,
			saldo_final_ejercicio=query.saldo_final_ejercicio,
			porcentaje_participacion=query.porcentaje_participacion,
			nif_titular_inmueble_rehabilitacion=query.nif_titular_inmueble_rehabilitacion,
			nivel_identificacion_nif_titular=query.nivel_identificacion_nif_titular,
			es_identificado_titular=query.es_identificado_titular,
			sw_identificado_titular   =query.sw_identificado_titular   ,
			expediente_rehabilitacion=query.expediente_rehabilitacion,
			importe_parcial_obra=query.importe_parcial_obra,
			importe_final_obra=query.importe_final_obra,
			importe_prestamo=query.importe_prestamo,
			fecha_formalizacion_prestamo=query.fecha_formalizacion_prestamo,
			mes_formalizacion_prestamo=query.mes_formalizacion_prestamo,
			anyo_formalizacion_prestamo=query.anyo_formalizacion_prestamo,
			codigo_entidad =query.codigo_entidad ,
			codigo_sucursal =query.codigo_sucursal ,
			codigo_control =query.codigo_control ,
			numero_cuenta =query.numero_cuenta 
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,id_administracion_declarante,es_externo_declarante,nif_declarante_781_11,nif_declarante_781,es_contribuyente_declarante,id_contribuyente_declarante,es_complementaria,es_sustitutiva,id_tipo_presentacion,telefono_contacto,nombre_contacto,numero_caja,contador_revisiones,fecha_presentacion,mes_presentacion,anyo_presentacion ,es_rehabilitacion,secuencia,id_administracion_declarado,es_externo_declarado,nif_declarado_781_11,nif_declarado_781,nif_declarado_no_identificado_11,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado  ,nivel_identificacion_nif_declarado,es_identificado_declarado,sw_identificado_declarado   ,sw_representante ,id_provincia,numero_identificacion_cuenta_vivienda,fecha_apertura_cuenta_vivienda,mes_apertura_cuenta_vivienda,anyo_apertura_cuenta_vivienda,saldo_inicial_ejercicio,saldo_final_ejercicio,porcentaje_participacion,nif_titular_inmueble_rehabilitacion,nivel_identificacion_nif_titular,es_identificado_titular,sw_identificado_titular   ,expediente_rehabilitacion,importe_parcial_obra,importe_final_obra,importe_prestamo,fecha_formalizacion_prestamo,mes_formalizacion_prestamo,anyo_formalizacion_prestamo,codigo_entidad ,codigo_sucursal ,codigo_control ,numero_cuenta ) VALUES (
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
			query.nif_declarante_781_11,
			query.nif_declarante_781,
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
			query.nif_declarado_781_11,
			query.nif_declarado_781,
			query.nif_declarado_no_identificado_11,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado  ,
			query.nivel_identificacion_nif_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.sw_representante ,
			query.id_provincia,
			query.numero_identificacion_cuenta_vivienda,
			query.fecha_apertura_cuenta_vivienda,
			query.mes_apertura_cuenta_vivienda,
			query.anyo_apertura_cuenta_vivienda,
			query.saldo_inicial_ejercicio,
			query.saldo_final_ejercicio,
			query.porcentaje_participacion,
			query.nif_titular_inmueble_rehabilitacion,
			query.nivel_identificacion_nif_titular,
			query.es_identificado_titular,
			query.sw_identificado_titular   ,
			query.expediente_rehabilitacion,
			query.importe_parcial_obra,
			query.importe_final_obra,
			query.importe_prestamo,
			query.fecha_formalizacion_prestamo,
			query.mes_formalizacion_prestamo,
			query.anyo_formalizacion_prestamo,
			query.codigo_entidad ,
			query.codigo_sucursal ,
			query.codigo_control ,
			query.numero_cuenta 
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
