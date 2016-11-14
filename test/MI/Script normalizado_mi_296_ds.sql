PRINT 'normalizado_mi_296_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente(
	id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_tipo_presentacion int NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	id_tipo_soporte int NOT NULL,
	referencia_presentacion_colectiva varchar(9) NOT NULL,
	id_tipo_declaracion int NOT NULL,
	base_retenciones_declarante decimal(18,2),
	retenciones_declarante decimal(18,2),
	retenciones_ingdosto_declarante decimal(18,2),
	contador_revisiones decimal(2,0) NOT NULL,
	es_anulada bit NOT NULL,
	usuario_retenedor varchar(8) NOT NULL,
	telefono_contacto varchar(10) NOT NULL,
	nombre_contacto varchar(40) NOT NULL,
	secuencia varchar(11) NOT NULL,
	id_pais int NOT NULL,
	fecha_devengo date NOT NULL,
	mes_devengo int NOT NULL,
	anyo_devengo int NOT NULL,
	id_mae_naturalezas_renta int NOT NULL,
	id_mae_claves_tipos_renta int NOT NULL,
	id_mae_subclaves_tipos_renta int NOT NULL,
	base_retenciones_declarado decimal(18,2),
	porcentaje_retencion_declarado decimal(5,2),
	retenciones_declarado decimal(18,2),
	es_mediador bit NOT NULL,
	id_clave_identificacion_fondo int NOT NULL,
	cod_emisor varchar(12) NOT NULL,
	id_mae_claves_pago int NOT NULL,
	id_tipo_codigo int NOT NULL,
	id_mae_entidades_bancarias int NOT NULL,
	sucursal varchar(4) NOT NULL,
	digito_control varchar(2) NOT NULL,
	num_cuenta varchar(10) NOT NULL,
	es_pendiente bit NOT NULL,
	ejercicio_devengo smallint NOT NULL,
	fecha_inicio_prestamo date NOT NULL,
	mes_inicio_prestamo int NOT NULL,
	anyo_inicio_prestamo int NOT NULL,
	fecha_vencimiento_prestamo date NOT NULL,
	mes_vencimiento_prestamo int NOT NULL,
	anyo_vencimiento_prestamo int NOT NULL,
	remuneracion_prestamista decimal(18,2),
	compensaciones decimal(18,2),
	garantias decimal(18,2),
	clave_presentacion_2008 decimal(2,0) NOT NULL,
	id_administracion_declarante int NOT NULL,
	nif_declarante_296 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	cod_extranjero_declarante varchar(12) NOT NULL,
	nombre_declarante varchar(40) NOT NULL,
	id_mae_claves_personalidad_declarante int NOT NULL,
	c_o_declarante varchar(1) NOT NULL,
	fecha_poder_declarante date NOT NULL,
	mes_poder_declarante int NOT NULL,
	anyo_poder_declarante int NOT NULL,
	importe_asociado_declarante decimal(18,2),
	nacionalidad_declarante varchar(30) NOT NULL,
	id_mae_sexos_declarante int NOT NULL,
	fecha_nacimiento_declarante date NOT NULL,
	mes_nacimiento_declarante int NOT NULL,
	anyo_nacimiento_declarante int NOT NULL,
	nif_pais_residencia_fiscal_declarante varchar(20) NOT NULL,
	id_administracion_declarado int NOT NULL,
	nif_declarado_296 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	cod_extranjero_declarado varchar(12) NOT NULL,
	nombre_declarado varchar(40) NOT NULL,
	id_mae_claves_personalidad_declarado int NOT NULL,
	c_o_declarado varchar(1) NOT NULL,
	fecha_poder_declarado date NOT NULL,
	mes_poder_declarado int NOT NULL,
	anyo_poder_declarado int NOT NULL,
	importe_asociado_declarado decimal(18,2),
	nacionalidad_declarado varchar(30) NOT NULL,
	id_mae_sexos_declarado int NOT NULL,
	fecha_nacimiento_declarado date NOT NULL,
	mes_nacimiento_declarado int NOT NULL,
	anyo_nacimiento_declarado int NOT NULL,
	nif_pais_residencia_fiscal_declarado varchar(20) NOT NULL,
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente UNIQUE (id_documento,secuencia),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(id_tipo_soporte),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo(id_clave_identificacion_fondo),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo(id_tipo_codigo),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente PRIMARY KEY CLUSTERED (id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='referencia_presentacion_colectiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD referencia_presentacion_colectiva varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='base_retenciones_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD base_retenciones_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='retenciones_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD retenciones_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='retenciones_ingdosto_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD retenciones_ingdosto_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD contador_revisiones decimal(2,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_anulada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_anulada bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='usuario_retenedor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD usuario_retenedor varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD telefono_contacto varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nombre_contacto varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_devengo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_devengo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_devengo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_naturalezas_renta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_naturalezas_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_tipos_renta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_claves_tipos_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_subclaves_tipos_renta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_subclaves_tipos_renta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='base_retenciones_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD base_retenciones_declarado decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='porcentaje_retencion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD porcentaje_retencion_declarado decimal(5,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='retenciones_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD retenciones_declarado decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_mediador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_mediador bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_clave_identificacion_fondo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='cod_emisor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD cod_emisor varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_claves_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_tipo_codigo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_entidades_bancarias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_entidades_bancarias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD sucursal varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='digito_control')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD digito_control varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD num_cuenta varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_pendiente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_pendiente bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD ejercicio_devengo smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_inicio_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_inicio_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_inicio_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_inicio_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_inicio_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_inicio_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_vencimiento_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_vencimiento_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_vencimiento_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_vencimiento_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='remuneracion_prestamista')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD remuneracion_prestamista decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='compensaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD compensaciones decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='garantias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD garantias decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='clave_presentacion_2008')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD clave_presentacion_2008 decimal(2,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarante_296')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nif_declarante_296 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='cod_extranjero_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD cod_extranjero_declarante varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nombre_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nombre_declarante varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_personalidad_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_claves_personalidad_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='c_o_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD c_o_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_poder_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_poder_declarante date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_poder_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_poder_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_poder_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_poder_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='importe_asociado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD importe_asociado_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nacionalidad_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nacionalidad_declarante varchar(30)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_sexos_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_sexos_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_nacimiento_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_nacimiento_declarante date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_nacimiento_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_nacimiento_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_nacimiento_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_nacimiento_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nif_pais_residencia_fiscal_declarante varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarado_296')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nif_declarado_296 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='cod_extranjero_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD cod_extranjero_declarado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nombre_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nombre_declarado varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_personalidad_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_claves_personalidad_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='c_o_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD c_o_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_poder_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_poder_declarado date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_poder_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_poder_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_poder_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_poder_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='importe_asociado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD importe_asociado_declarado decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nacionalidad_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nacionalidad_declarado varchar(30)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_sexos_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD id_mae_sexos_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_nacimiento_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fecha_nacimiento_declarado date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_nacimiento_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD mes_nacimiento_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_nacimiento_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD anyo_nacimiento_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD nif_pais_residencia_fiscal_declarado varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='referencia_presentacion_colectiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN referencia_presentacion_colectiva varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='base_retenciones_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN base_retenciones_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='retenciones_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN retenciones_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='retenciones_ingdosto_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN retenciones_ingdosto_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN contador_revisiones decimal(2,0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_anulada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_anulada bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='usuario_retenedor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN usuario_retenedor varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN telefono_contacto varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nombre_contacto varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN secuencia varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_devengo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_devengo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_devengo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_naturalezas_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_naturalezas_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_tipos_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_claves_tipos_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_subclaves_tipos_renta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_subclaves_tipos_renta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='base_retenciones_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN base_retenciones_declarado decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='porcentaje_retencion_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN porcentaje_retencion_declarado decimal(5,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='retenciones_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN retenciones_declarado decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_mediador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_mediador bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_clave_identificacion_fondo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='cod_emisor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN cod_emisor varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_claves_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_tipo_codigo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_entidades_bancarias' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_entidades_bancarias int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN sucursal varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='digito_control' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN digito_control varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN num_cuenta varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_pendiente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_pendiente bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN ejercicio_devengo smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_inicio_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_inicio_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_inicio_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_inicio_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_inicio_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_inicio_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_vencimiento_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_vencimiento_prestamo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_vencimiento_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_vencimiento_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_vencimiento_prestamo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_vencimiento_prestamo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='remuneracion_prestamista' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN remuneracion_prestamista decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='compensaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN compensaciones decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='garantias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN garantias decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='clave_presentacion_2008' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN clave_presentacion_2008 decimal(2,0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarante_296' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nif_declarante_296 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='cod_extranjero_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN cod_extranjero_declarante varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nombre_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nombre_declarante varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_personalidad_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_claves_personalidad_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='c_o_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN c_o_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_poder_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_poder_declarante date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_poder_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_poder_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_poder_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_poder_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='importe_asociado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN importe_asociado_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nacionalidad_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nacionalidad_declarante varchar(30) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_sexos_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_sexos_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_nacimiento_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_nacimiento_declarante date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_nacimiento_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_nacimiento_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_nacimiento_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_nacimiento_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nif_pais_residencia_fiscal_declarante varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_administracion_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarado_296' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nif_declarado_296 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='cod_extranjero_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN cod_extranjero_declarado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nombre_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nombre_declarado varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_claves_personalidad_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_claves_personalidad_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='c_o_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN c_o_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_poder_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_poder_declarado date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_poder_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_poder_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_poder_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_poder_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='importe_asociado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN importe_asociado_declarado decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nacionalidad_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nacionalidad_declarado varchar(30) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='id_mae_sexos_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN id_mae_sexos_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fecha_nacimiento_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fecha_nacimiento_declarado date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='mes_nacimiento_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN mes_nacimiento_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='anyo_nacimiento_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN anyo_nacimiento_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='nif_pais_residencia_fiscal_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN nif_pais_residencia_fiscal_declarado varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT PK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente PRIMARY KEY CLUSTERED (id_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipos_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(id_tipo_soporte)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo(id_clave_identificacion_fondo)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo(id_tipo_codigo)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_administracion_hacienda1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ADD CONSTRAINT FK_tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente'
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

	;WITH mae_noid AS
	(
		SELECT	id_mae_no_identificados,
				ejercicio,
				clavagru,
				clavdeta
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
		WHERE	aplicacion = 'NR'
		AND		detamodel = '296'
	),
	query AS
	(
		SELECT	--top 10000
				docu.id_documento AS id_documento,
				e.id_expediente AS id_expediente,
				--cabecera
				tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
				cabe.d296_fecha_presen AS fecha_presentacion,
				month(cabe.d296_fecha_presen) AS mes_presentacion,
				year(cabe.d296_fecha_presen) AS anyo_presentacion,
				tipo_sopo.id_tipo_soporte AS id_tipo_soporte,
				cabe.d296_refer_colec AS referencia_presentacion_colectiva,
				tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY declarado.a296_secuencia )=1 THEN coalesce(cabe.d296_bases_reten/100,0)
					ELSE 0																				
				END AS base_retenciones_declarante,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY declarado.a296_secuencia )=1 THEN coalesce(cabe.d296_retenciones/100,0)
					ELSE 0																				
				END AS retenciones_declarante,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY declarado.a296_secuencia )=1 THEN coalesce(cabe.d296_reten_ingdos/100,0)
					ELSE 0																				
				END AS retenciones_ingdosto_declarante,
				cabe.d296_conta_revis AS contador_revisiones,
				CASE cabe.d296_anulada WHEN 'V' THEN 1 ELSE 0 END AS es_anulada,
				cabe.d296_user_reten AS usuario_retenedor,
				cabe.d296_tfno_contacto AS telefono_contacto,
				cabe.d296_nom_contacto AS nombre_contacto,
				--declarado
				declarado.a296_secuencia AS secuencia,
				pais.id_pais AS id_pais,
				declarado.a296_fecha_deven AS fecha_devengo,
				month(declarado.a296_fecha_deven) AS mes_devengo,
				year(declarado.a296_fecha_deven) AS anyo_devengo,
				natu_rent.id_mae_naturalezas_renta AS id_mae_naturalezas_renta,--a296_naturaleza
				clav_rent.id_mae_claves_tipos_renta AS id_mae_claves_tipos_renta,--a296_clave_2008
				subc_rent.id_mae_subclaves_tipos_renta AS id_mae_subclaves_tipos_renta,--a296_subclave
				declarado.a296_base_reten/100 AS base_retenciones_declarado,
				declarado.a296_porc_reten AS porcentaje_retencion_declarado,
				declarado.a296_retencion/100 AS retenciones_declarado,
				CASE declarado.a296_mediador WHEN 'X' THEN 1 ELSE 0 END AS es_mediador,
				clav_ident.id_clave_identificacion_fondo AS id_clave_identificacion_fondo,--a296_codigo
				declarado.a296_cod_emisor AS cod_emisor,
				clav_pago.id_mae_claves_pago AS id_mae_claves_pago,--a296_pago
				tipo_cod.id_tipo_codigo AS id_tipo_codigo,--a296_tipo_codigo
				enti_banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,--a296_banco_valor
				declarado.a296_sucur_valor AS sucursal,
				declarado.a296_dc_valor AS digito_control,
				declarado.a296_cuenta_valor AS num_cuenta,
				CASE declarado.a296_pendiente WHEN 'X' THEN 1 ELSE 0 END AS es_pendiente,
				declarado.a296_ejer_devengo AS ejercicio_devengo,
				declarado.a296_fec_inic_pres AS fecha_inicio_prestamo,
				month(declarado.a296_fec_inic_pres) AS mes_inicio_prestamo,
				year(declarado.a296_fec_inic_pres) AS anyo_inicio_prestamo,
				declarado.a296_fec_venc_pres AS fecha_vencimiento_prestamo,
				month(declarado.a296_fec_venc_pres) AS mes_vencimiento_prestamo,
				year(declarado.a296_fec_venc_pres) AS anyo_vencimiento_prestamo,
				declarado.a296_renum_al_pres/100 AS remuneracion_prestamista,
				declarado.a296_compensacion/100 AS compensaciones,
				declarado.a296_garantia/100 AS garantias,
				declarado.a296_clave_ej2008 AS clave_presentacion_2008,
				--censo declarantes
				adm_declarante.id_administracion AS id_administracion_declarante,
				censo_declarante.cenr_nif AS nif_declarante_296,
				coalesce(left(CASE WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarante.cenr_nif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarante.cenr_nif,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
				CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
				coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
				CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
				CASE
					WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
					WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN 1
					WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
					ELSE ''
				END AS sw_identificado_declarante,
				coalesce(mae_noid_cabe.id_mae_no_identificados,-1) AS id_mae_no_id_declarante,
				censo_declarante.cenr_cod_extranjer AS cod_extranjero_declarante,
				censo_declarante.cenr_nombre AS nombre_declarante,
				clav_pers_declarante.id_mae_claves_personalidad AS id_mae_claves_personalidad_declarante,--cenr_fj
				censo_declarante.cenr_co AS c_o_declarante,
				censo_declarante.cenr_fecha_poder AS fecha_poder_declarante,
				month(censo_declarante.cenr_fecha_poder) AS mes_poder_declarante,
				year(censo_declarante.cenr_fecha_poder) AS anyo_poder_declarante,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY declarado.a296_secuencia )=1 THEN coalesce(censo_declarante.cenr_importe/100,0)
					ELSE 0																				
				END AS importe_asociado_declarante,
				censo_declarante.cenr_nacionalidad AS nacionalidad_declarante,
				sexo_declarante.id_mae_sexos AS id_mae_sexos_declarante,--cenr_sexo
				censo_declarante.cenr_fecha_naci AS fecha_nacimiento_declarante,
				month(censo_declarante.cenr_fecha_naci) AS mes_nacimiento_declarante,
				year(censo_declarante.cenr_fecha_naci) AS anyo_nacimiento_declarante,
				censo_declarante.cenr_nif_paisresid_fisc AS nif_pais_residencia_fiscal_declarante,
				--censo declarados
				adm_declarado.id_administracion AS id_administracion_declarado,
				censo_declarado.cenr_nif AS nif_declarado_296,
				coalesce(left(CASE WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarado.cenr_nif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarado.cenr_nif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
				CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
				coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
				CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
				CASE
					WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
					WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN 1
					WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
					ELSE ''
				END AS sw_identificado_declarado,
				coalesce(mae_noid_det.id_mae_no_identificados,-1) AS id_mae_no_id_declarado,
				censo_declarado.cenr_cod_extranjer AS cod_extranjero_declarado,
				censo_declarado.cenr_nombre AS nombre_declarado,
				clav_pers_declarado.id_mae_claves_personalidad AS id_mae_claves_personalidad_declarado,--cenr_fj
				censo_declarado.cenr_co AS c_o_declarado,
				censo_declarado.cenr_fecha_poder AS fecha_poder_declarado,
				month(censo_declarado.cenr_fecha_poder) AS mes_poder_declarado,
				year(censo_declarado.cenr_fecha_poder) AS anyo_poder_declarado,
				censo_declarado.cenr_importe/100 AS importe_asociado_declarado,
				censo_declarado.cenr_nacionalidad AS nacionalidad_declarado,
				sexo_declarado.id_mae_sexos AS id_mae_sexos_declarado,--cenr_sexo
				censo_declarado.cenr_fecha_naci AS fecha_nacimiento_declarado,
				month(censo_declarado.cenr_fecha_naci) AS mes_nacimiento_declarado,
				year(censo_declarado.cenr_fecha_naci) AS anyo_nacimiento_declarado,
				censo_declarado.cenr_nif_paisresid_fisc AS nif_pais_residencia_fiscal_declarado
		FROM	tbn1d296_nr cabe
				--censo declarantes
				INNER JOIN	tbn1cenr_nr censo_declarante
						ON	cabe.d296_referencia = censo_declarante.cenr_referencia
						AND	censo_declarante.cenr_clave_relacio = 'DC'
				--no_identificados_declarante
				LEFT JOIN	mae_noid mae_noid_cabe
						ON	CAST(SUBSTRING(cabe.d296_referencia,1,4) AS DECIMAL) = mae_noid_cabe.ejercicio
						AND SUBSTRING(cabe.d296_referencia,7,9)= mae_noid_cabe.clavagru
						AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
				--declarado
				INNER JOIN	tbn1a296_nr declarado
						ON	cabe.d296_referencia = declarado.a296_referencia
				--censo declarados
				INNER JOIN	tbn1cenr_nr censo_declarado
						ON	declarado.a296_referencia = censo_declarado.cenr_referencia
						AND declarado.a296_secuencia = censo_declarado.cenr_secuencia
						AND	censo_declarado.cenr_clave_relacio = 'PT'
				--no_identificados_declarado
				LEFT JOIN	mae_noid mae_noid_det
						ON	CAST(SUBSTRING(cabe.d296_referencia,1,4) AS DECIMAL) = mae_noid_det.ejercicio
						AND SUBSTRING(cabe.d296_referencia,7,9) = mae_noid_det.clavagru
						AND right('0000000000000' +  CAST(declarado.a296_secuencia AS VARCHAR) , 13)=  mae_noid_det.clavdeta
				--documentos
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
						ON docu.referencia = cabe.d296_referencia
						AND docu.marca_baja IS NULL
				--expedientes
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
						ON docu.id_expediente=e.id_expediente
				--buscar los nif en contribuyentes (para declarante, declarados y presentador)
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
						ON censo_declarante.cenr_nif+' '+censo_declarante.cenr_discriminante=c.nif_maestro 
						AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d
						ON censo_declarado.cenr_nif+' '+censo_declarado.cenr_discriminante=d.nif_maestro
						AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
				--JOIN con cada maestro
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres 
						ON cabe.d296_tipo_presen = tipo_pres.cod_tipo_presentacion
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte tipo_sopo
						ON cabe.d296_tipo_soporte = tipo_sopo.cod_tipo_soporte
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl
						ON cabe.d296_comple_susti = tipo_decl.cod_tipo_declaracion
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais
						ON declarado.a296_pais = pais.cod_pais
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta natu_rent
						ON declarado.a296_naturaleza = natu_rent.cod_naturaleza_renta
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta clav_rent
						ON declarado.a296_clave_ej2008 = clav_rent.cod_clave_tipo_renta
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta subc_rent
						ON declarado.a296_subclave = subc_rent.cod_subclave_tipo_renta
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo clav_ident
						ON declarado.a296_codigo = clav_ident.cod_clave_identificacion_fondo
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago clav_pago
						ON declarado.a296_pago= clav_pago.cod_clave_pago
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_cod
						ON declarado.a296_tipo_codigo = tipo_cod.cod_tipo_codigo
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias enti_banc
						ON declarado.a296_banco_valor = enti_banc.cod_entidad_bancaria
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_declarante
						ON censo_declarante.cenr_administra = adm_declarante.cod_administracion
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad clav_pers_declarante
						ON censo_declarante.cenr_fj = clav_pers_declarante.cod_clave_personalidad
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_sexos sexo_declarante
						ON censo_declarante.cenr_sexo = sexo_declarante.cod_sexo
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_declarado
						ON censo_declarado.cenr_administra = adm_declarado.cod_administracion
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad clav_pers_declarado
						ON censo_declarado.cenr_fj = clav_pers_declarado.cod_clave_personalidad
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_sexos sexo_declarado
						ON censo_declarado.cenr_sexo = sexo_declarado.cod_sexo
				CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente AS tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente
	USING query ON query.id_documento=tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_documento AND query.secuencia=tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.secuencia
	WHEN MATCHED AND ((tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_expediente<>query.id_expediente OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_soporte<>query.id_tipo_soporte OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_soporte IS NULL AND query.id_tipo_soporte IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_soporte IS NOT NULL AND query.id_tipo_soporte IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.referencia_presentacion_colectiva<>query.referencia_presentacion_colectiva OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.referencia_presentacion_colectiva IS NULL AND query.referencia_presentacion_colectiva IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.referencia_presentacion_colectiva IS NOT NULL AND query.referencia_presentacion_colectiva IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.base_retenciones_declarante<>query.base_retenciones_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.base_retenciones_declarante IS NULL AND query.base_retenciones_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.base_retenciones_declarante IS NOT NULL AND query.base_retenciones_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_declarante<>query.retenciones_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_declarante IS NULL AND query.retenciones_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_declarante IS NOT NULL AND query.retenciones_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_ingdosto_declarante<>query.retenciones_ingdosto_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_ingdosto_declarante IS NULL AND query.retenciones_ingdosto_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_ingdosto_declarante IS NOT NULL AND query.retenciones_ingdosto_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_anulada<>query.es_anulada OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_anulada IS NULL AND query.es_anulada IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_anulada IS NOT NULL AND query.es_anulada IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.usuario_retenedor<>query.usuario_retenedor OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.usuario_retenedor IS NULL AND query.usuario_retenedor IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.usuario_retenedor IS NOT NULL AND query.usuario_retenedor IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.telefono_contacto<>query.telefono_contacto OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_contacto<>query.nombre_contacto OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_pais<>query.id_pais OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_devengo<>query.fecha_devengo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_devengo IS NULL AND query.fecha_devengo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_devengo IS NOT NULL AND query.fecha_devengo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_devengo<>query.mes_devengo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_devengo IS NULL AND query.mes_devengo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_devengo IS NOT NULL AND query.mes_devengo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_devengo<>query.anyo_devengo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_devengo IS NULL AND query.anyo_devengo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_devengo IS NOT NULL AND query.anyo_devengo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_naturalezas_renta<>query.id_mae_naturalezas_renta OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_naturalezas_renta IS NULL AND query.id_mae_naturalezas_renta IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_naturalezas_renta IS NOT NULL AND query.id_mae_naturalezas_renta IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_tipos_renta<>query.id_mae_claves_tipos_renta OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_tipos_renta IS NULL AND query.id_mae_claves_tipos_renta IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_tipos_renta IS NOT NULL AND query.id_mae_claves_tipos_renta IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_subclaves_tipos_renta<>query.id_mae_subclaves_tipos_renta OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_subclaves_tipos_renta IS NULL AND query.id_mae_subclaves_tipos_renta IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_subclaves_tipos_renta IS NOT NULL AND query.id_mae_subclaves_tipos_renta IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.base_retenciones_declarado<>query.base_retenciones_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.base_retenciones_declarado IS NULL AND query.base_retenciones_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.base_retenciones_declarado IS NOT NULL AND query.base_retenciones_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.porcentaje_retencion_declarado<>query.porcentaje_retencion_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.porcentaje_retencion_declarado IS NULL AND query.porcentaje_retencion_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.porcentaje_retencion_declarado IS NOT NULL AND query.porcentaje_retencion_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_declarado<>query.retenciones_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_declarado IS NULL AND query.retenciones_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.retenciones_declarado IS NOT NULL AND query.retenciones_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_mediador<>query.es_mediador OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_mediador IS NULL AND query.es_mediador IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_mediador IS NOT NULL AND query.es_mediador IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_clave_identificacion_fondo<>query.id_clave_identificacion_fondo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_clave_identificacion_fondo IS NULL AND query.id_clave_identificacion_fondo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_clave_identificacion_fondo IS NOT NULL AND query.id_clave_identificacion_fondo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_emisor<>query.cod_emisor OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_emisor IS NULL AND query.cod_emisor IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_emisor IS NOT NULL AND query.cod_emisor IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_pago<>query.id_mae_claves_pago OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_pago IS NULL AND query.id_mae_claves_pago IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_pago IS NOT NULL AND query.id_mae_claves_pago IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_codigo<>query.id_tipo_codigo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_entidades_bancarias<>query.id_mae_entidades_bancarias OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_entidades_bancarias IS NULL AND query.id_mae_entidades_bancarias IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_entidades_bancarias IS NOT NULL AND query.id_mae_entidades_bancarias IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sucursal<>query.sucursal OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sucursal IS NULL AND query.sucursal IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sucursal IS NOT NULL AND query.sucursal IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.digito_control<>query.digito_control OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.digito_control IS NULL AND query.digito_control IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.digito_control IS NOT NULL AND query.digito_control IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.num_cuenta<>query.num_cuenta OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_pendiente<>query.es_pendiente OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_pendiente IS NULL AND query.es_pendiente IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_pendiente IS NOT NULL AND query.es_pendiente IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_inicio_prestamo<>query.fecha_inicio_prestamo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_inicio_prestamo IS NULL AND query.fecha_inicio_prestamo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_inicio_prestamo IS NOT NULL AND query.fecha_inicio_prestamo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_inicio_prestamo<>query.mes_inicio_prestamo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_inicio_prestamo IS NULL AND query.mes_inicio_prestamo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_inicio_prestamo IS NOT NULL AND query.mes_inicio_prestamo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_inicio_prestamo<>query.anyo_inicio_prestamo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_inicio_prestamo IS NULL AND query.anyo_inicio_prestamo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_inicio_prestamo IS NOT NULL AND query.anyo_inicio_prestamo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_vencimiento_prestamo<>query.fecha_vencimiento_prestamo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_vencimiento_prestamo IS NULL AND query.fecha_vencimiento_prestamo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_vencimiento_prestamo IS NOT NULL AND query.fecha_vencimiento_prestamo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_vencimiento_prestamo<>query.mes_vencimiento_prestamo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_vencimiento_prestamo IS NULL AND query.mes_vencimiento_prestamo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_vencimiento_prestamo IS NOT NULL AND query.mes_vencimiento_prestamo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_vencimiento_prestamo<>query.anyo_vencimiento_prestamo OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_vencimiento_prestamo IS NULL AND query.anyo_vencimiento_prestamo IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_vencimiento_prestamo IS NOT NULL AND query.anyo_vencimiento_prestamo IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.remuneracion_prestamista<>query.remuneracion_prestamista OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.remuneracion_prestamista IS NULL AND query.remuneracion_prestamista IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.remuneracion_prestamista IS NOT NULL AND query.remuneracion_prestamista IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.compensaciones<>query.compensaciones OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.compensaciones IS NULL AND query.compensaciones IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.compensaciones IS NOT NULL AND query.compensaciones IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.garantias<>query.garantias OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.garantias IS NULL AND query.garantias IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.garantias IS NOT NULL AND query.garantias IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.clave_presentacion_2008<>query.clave_presentacion_2008 OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.clave_presentacion_2008 IS NULL AND query.clave_presentacion_2008 IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.clave_presentacion_2008 IS NOT NULL AND query.clave_presentacion_2008 IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_administracion_declarante<>query.id_administracion_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_administracion_declarante IS NULL AND query.id_administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_administracion_declarante IS NOT NULL AND query.id_administracion_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarante_296<>query.nif_declarante_296 OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarante_296 IS NULL AND query.nif_declarante_296 IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarante_296 IS NOT NULL AND query.nif_declarante_296 IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sw_identificado_declarante<>query.sw_identificado_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_extranjero_declarante<>query.cod_extranjero_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_extranjero_declarante IS NULL AND query.cod_extranjero_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_extranjero_declarante IS NOT NULL AND query.cod_extranjero_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_declarante<>query.nombre_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_declarante IS NULL AND query.nombre_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_declarante IS NOT NULL AND query.nombre_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_personalidad_declarante<>query.id_mae_claves_personalidad_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_personalidad_declarante IS NULL AND query.id_mae_claves_personalidad_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_personalidad_declarante IS NOT NULL AND query.id_mae_claves_personalidad_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.c_o_declarante<>query.c_o_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.c_o_declarante IS NULL AND query.c_o_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.c_o_declarante IS NOT NULL AND query.c_o_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_poder_declarante<>query.fecha_poder_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_poder_declarante IS NULL AND query.fecha_poder_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_poder_declarante IS NOT NULL AND query.fecha_poder_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_poder_declarante<>query.mes_poder_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_poder_declarante IS NULL AND query.mes_poder_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_poder_declarante IS NOT NULL AND query.mes_poder_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_poder_declarante<>query.anyo_poder_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_poder_declarante IS NULL AND query.anyo_poder_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_poder_declarante IS NOT NULL AND query.anyo_poder_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.importe_asociado_declarante<>query.importe_asociado_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.importe_asociado_declarante IS NULL AND query.importe_asociado_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.importe_asociado_declarante IS NOT NULL AND query.importe_asociado_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nacionalidad_declarante<>query.nacionalidad_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nacionalidad_declarante IS NULL AND query.nacionalidad_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nacionalidad_declarante IS NOT NULL AND query.nacionalidad_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_sexos_declarante<>query.id_mae_sexos_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_sexos_declarante IS NULL AND query.id_mae_sexos_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_sexos_declarante IS NOT NULL AND query.id_mae_sexos_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_nacimiento_declarante<>query.fecha_nacimiento_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_nacimiento_declarante IS NULL AND query.fecha_nacimiento_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_nacimiento_declarante IS NOT NULL AND query.fecha_nacimiento_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_nacimiento_declarante<>query.mes_nacimiento_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_nacimiento_declarante IS NULL AND query.mes_nacimiento_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_nacimiento_declarante IS NOT NULL AND query.mes_nacimiento_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_nacimiento_declarante<>query.anyo_nacimiento_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_nacimiento_declarante IS NULL AND query.anyo_nacimiento_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_nacimiento_declarante IS NOT NULL AND query.anyo_nacimiento_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_pais_residencia_fiscal_declarante<>query.nif_pais_residencia_fiscal_declarante OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_pais_residencia_fiscal_declarante IS NULL AND query.nif_pais_residencia_fiscal_declarante IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_pais_residencia_fiscal_declarante IS NOT NULL AND query.nif_pais_residencia_fiscal_declarante IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_administracion_declarado<>query.id_administracion_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_administracion_declarado IS NULL AND query.id_administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_administracion_declarado IS NOT NULL AND query.id_administracion_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarado_296<>query.nif_declarado_296 OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarado_296 IS NULL AND query.nif_declarado_296 IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarado_296 IS NOT NULL AND query.nif_declarado_296 IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sw_identificado_declarado<>query.sw_identificado_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_extranjero_declarado<>query.cod_extranjero_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_extranjero_declarado IS NULL AND query.cod_extranjero_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.cod_extranjero_declarado IS NOT NULL AND query.cod_extranjero_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_declarado<>query.nombre_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_declarado IS NULL AND query.nombre_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nombre_declarado IS NOT NULL AND query.nombre_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_personalidad_declarado<>query.id_mae_claves_personalidad_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_personalidad_declarado IS NULL AND query.id_mae_claves_personalidad_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_claves_personalidad_declarado IS NOT NULL AND query.id_mae_claves_personalidad_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.c_o_declarado<>query.c_o_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.c_o_declarado IS NULL AND query.c_o_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.c_o_declarado IS NOT NULL AND query.c_o_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_poder_declarado<>query.fecha_poder_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_poder_declarado IS NULL AND query.fecha_poder_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_poder_declarado IS NOT NULL AND query.fecha_poder_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_poder_declarado<>query.mes_poder_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_poder_declarado IS NULL AND query.mes_poder_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_poder_declarado IS NOT NULL AND query.mes_poder_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_poder_declarado<>query.anyo_poder_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_poder_declarado IS NULL AND query.anyo_poder_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_poder_declarado IS NOT NULL AND query.anyo_poder_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.importe_asociado_declarado<>query.importe_asociado_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.importe_asociado_declarado IS NULL AND query.importe_asociado_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.importe_asociado_declarado IS NOT NULL AND query.importe_asociado_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nacionalidad_declarado<>query.nacionalidad_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nacionalidad_declarado IS NULL AND query.nacionalidad_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nacionalidad_declarado IS NOT NULL AND query.nacionalidad_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_sexos_declarado<>query.id_mae_sexos_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_sexos_declarado IS NULL AND query.id_mae_sexos_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.id_mae_sexos_declarado IS NOT NULL AND query.id_mae_sexos_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_nacimiento_declarado<>query.fecha_nacimiento_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_nacimiento_declarado IS NULL AND query.fecha_nacimiento_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.fecha_nacimiento_declarado IS NOT NULL AND query.fecha_nacimiento_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_nacimiento_declarado<>query.mes_nacimiento_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_nacimiento_declarado IS NULL AND query.mes_nacimiento_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.mes_nacimiento_declarado IS NOT NULL AND query.mes_nacimiento_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_nacimiento_declarado<>query.anyo_nacimiento_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_nacimiento_declarado IS NULL AND query.anyo_nacimiento_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.anyo_nacimiento_declarado IS NOT NULL AND query.anyo_nacimiento_declarado IS NULL)
			OR tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_pais_residencia_fiscal_declarado<>query.nif_pais_residencia_fiscal_declarado OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_pais_residencia_fiscal_declarado IS NULL AND query.nif_pais_residencia_fiscal_declarado IS NOT NULL) OR (tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente.nif_pais_residencia_fiscal_declarado IS NOT NULL AND query.nif_pais_residencia_fiscal_declarado IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			id_tipo_presentacion=query.id_tipo_presentacion,
			fecha_presentacion=query.fecha_presentacion,
			mes_presentacion=query.mes_presentacion,
			anyo_presentacion=query.anyo_presentacion,
			id_tipo_soporte=query.id_tipo_soporte,
			referencia_presentacion_colectiva=query.referencia_presentacion_colectiva,
			id_tipo_declaracion=query.id_tipo_declaracion,
			base_retenciones_declarante=query.base_retenciones_declarante,
			retenciones_declarante=query.retenciones_declarante,
			retenciones_ingdosto_declarante=query.retenciones_ingdosto_declarante,
			contador_revisiones=query.contador_revisiones,
			es_anulada=query.es_anulada,
			usuario_retenedor=query.usuario_retenedor,
			telefono_contacto=query.telefono_contacto,
			nombre_contacto=query.nombre_contacto,
			id_pais=query.id_pais,
			fecha_devengo=query.fecha_devengo,
			mes_devengo=query.mes_devengo,
			anyo_devengo=query.anyo_devengo,
			id_mae_naturalezas_renta=query.id_mae_naturalezas_renta,
			id_mae_claves_tipos_renta=query.id_mae_claves_tipos_renta,
			id_mae_subclaves_tipos_renta=query.id_mae_subclaves_tipos_renta,
			base_retenciones_declarado=query.base_retenciones_declarado,
			porcentaje_retencion_declarado=query.porcentaje_retencion_declarado,
			retenciones_declarado=query.retenciones_declarado,
			es_mediador=query.es_mediador,
			id_clave_identificacion_fondo=query.id_clave_identificacion_fondo,
			cod_emisor=query.cod_emisor,
			id_mae_claves_pago=query.id_mae_claves_pago,
			id_tipo_codigo=query.id_tipo_codigo,
			id_mae_entidades_bancarias=query.id_mae_entidades_bancarias,
			sucursal=query.sucursal,
			digito_control=query.digito_control,
			num_cuenta=query.num_cuenta,
			es_pendiente=query.es_pendiente,
			ejercicio_devengo=query.ejercicio_devengo,
			fecha_inicio_prestamo=query.fecha_inicio_prestamo,
			mes_inicio_prestamo=query.mes_inicio_prestamo,
			anyo_inicio_prestamo=query.anyo_inicio_prestamo,
			fecha_vencimiento_prestamo=query.fecha_vencimiento_prestamo,
			mes_vencimiento_prestamo=query.mes_vencimiento_prestamo,
			anyo_vencimiento_prestamo=query.anyo_vencimiento_prestamo,
			remuneracion_prestamista=query.remuneracion_prestamista,
			compensaciones=query.compensaciones,
			garantias=query.garantias,
			clave_presentacion_2008=query.clave_presentacion_2008,
			id_administracion_declarante=query.id_administracion_declarante,
			nif_declarante_296=query.nif_declarante_296,
			nif_declarante_no_identificado=query.nif_declarante_no_identificado,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante=query.sw_identificado_declarante,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			cod_extranjero_declarante=query.cod_extranjero_declarante,
			nombre_declarante=query.nombre_declarante,
			id_mae_claves_personalidad_declarante=query.id_mae_claves_personalidad_declarante,
			c_o_declarante=query.c_o_declarante,
			fecha_poder_declarante=query.fecha_poder_declarante,
			mes_poder_declarante=query.mes_poder_declarante,
			anyo_poder_declarante=query.anyo_poder_declarante,
			importe_asociado_declarante=query.importe_asociado_declarante,
			nacionalidad_declarante=query.nacionalidad_declarante,
			id_mae_sexos_declarante=query.id_mae_sexos_declarante,
			fecha_nacimiento_declarante=query.fecha_nacimiento_declarante,
			mes_nacimiento_declarante=query.mes_nacimiento_declarante,
			anyo_nacimiento_declarante=query.anyo_nacimiento_declarante,
			nif_pais_residencia_fiscal_declarante=query.nif_pais_residencia_fiscal_declarante,
			id_administracion_declarado=query.id_administracion_declarado,
			nif_declarado_296=query.nif_declarado_296,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado=query.id_contribuyente_declarado,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado=query.sw_identificado_declarado,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			cod_extranjero_declarado=query.cod_extranjero_declarado,
			nombre_declarado=query.nombre_declarado,
			id_mae_claves_personalidad_declarado=query.id_mae_claves_personalidad_declarado,
			c_o_declarado=query.c_o_declarado,
			fecha_poder_declarado=query.fecha_poder_declarado,
			mes_poder_declarado=query.mes_poder_declarado,
			anyo_poder_declarado=query.anyo_poder_declarado,
			importe_asociado_declarado=query.importe_asociado_declarado,
			nacionalidad_declarado=query.nacionalidad_declarado,
			id_mae_sexos_declarado=query.id_mae_sexos_declarado,
			fecha_nacimiento_declarado=query.fecha_nacimiento_declarado,
			mes_nacimiento_declarado=query.mes_nacimiento_declarado,
			anyo_nacimiento_declarado=query.anyo_nacimiento_declarado,
			nif_pais_residencia_fiscal_declarado=query.nif_pais_residencia_fiscal_declarado
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,id_tipo_soporte,referencia_presentacion_colectiva,id_tipo_declaracion,base_retenciones_declarante,retenciones_declarante,retenciones_ingdosto_declarante,contador_revisiones,es_anulada,usuario_retenedor,telefono_contacto,nombre_contacto,secuencia,id_pais,fecha_devengo,mes_devengo,anyo_devengo,id_mae_naturalezas_renta,id_mae_claves_tipos_renta,id_mae_subclaves_tipos_renta,base_retenciones_declarado,porcentaje_retencion_declarado,retenciones_declarado,es_mediador,id_clave_identificacion_fondo,cod_emisor,id_mae_claves_pago,id_tipo_codigo,id_mae_entidades_bancarias,sucursal,digito_control,num_cuenta,es_pendiente,ejercicio_devengo,fecha_inicio_prestamo,mes_inicio_prestamo,anyo_inicio_prestamo,fecha_vencimiento_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo,remuneracion_prestamista,compensaciones,garantias,clave_presentacion_2008,id_administracion_declarante,nif_declarante_296,nif_declarante_no_identificado,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,id_mae_no_id_declarante,cod_extranjero_declarante,nombre_declarante,id_mae_claves_personalidad_declarante,c_o_declarante,fecha_poder_declarante,mes_poder_declarante,anyo_poder_declarante,importe_asociado_declarante,nacionalidad_declarante,id_mae_sexos_declarante,fecha_nacimiento_declarante,mes_nacimiento_declarante,anyo_nacimiento_declarante,nif_pais_residencia_fiscal_declarante,id_administracion_declarado,nif_declarado_296,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,id_mae_no_id_declarado,cod_extranjero_declarado,nombre_declarado,id_mae_claves_personalidad_declarado,c_o_declarado,fecha_poder_declarado,mes_poder_declarado,anyo_poder_declarado,importe_asociado_declarado,nacionalidad_declarado,id_mae_sexos_declarado,fecha_nacimiento_declarado,mes_nacimiento_declarado,anyo_nacimiento_declarado,nif_pais_residencia_fiscal_declarado) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.id_tipo_presentacion,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.id_tipo_soporte,
			query.referencia_presentacion_colectiva,
			query.id_tipo_declaracion,
			query.base_retenciones_declarante,
			query.retenciones_declarante,
			query.retenciones_ingdosto_declarante,
			query.contador_revisiones,
			query.es_anulada,
			query.usuario_retenedor,
			query.telefono_contacto,
			query.nombre_contacto,
			query.secuencia,
			query.id_pais,
			query.fecha_devengo,
			query.mes_devengo,
			query.anyo_devengo,
			query.id_mae_naturalezas_renta,
			query.id_mae_claves_tipos_renta,
			query.id_mae_subclaves_tipos_renta,
			query.base_retenciones_declarado,
			query.porcentaje_retencion_declarado,
			query.retenciones_declarado,
			query.es_mediador,
			query.id_clave_identificacion_fondo,
			query.cod_emisor,
			query.id_mae_claves_pago,
			query.id_tipo_codigo,
			query.id_mae_entidades_bancarias,
			query.sucursal,
			query.digito_control,
			query.num_cuenta,
			query.es_pendiente,
			query.ejercicio_devengo,
			query.fecha_inicio_prestamo,
			query.mes_inicio_prestamo,
			query.anyo_inicio_prestamo,
			query.fecha_vencimiento_prestamo,
			query.mes_vencimiento_prestamo,
			query.anyo_vencimiento_prestamo,
			query.remuneracion_prestamista,
			query.compensaciones,
			query.garantias,
			query.clave_presentacion_2008,
			query.id_administracion_declarante,
			query.nif_declarante_296,
			query.nif_declarante_no_identificado,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.id_mae_no_id_declarante,
			query.cod_extranjero_declarante,
			query.nombre_declarante,
			query.id_mae_claves_personalidad_declarante,
			query.c_o_declarante,
			query.fecha_poder_declarante,
			query.mes_poder_declarante,
			query.anyo_poder_declarante,
			query.importe_asociado_declarante,
			query.nacionalidad_declarante,
			query.id_mae_sexos_declarante,
			query.fecha_nacimiento_declarante,
			query.mes_nacimiento_declarante,
			query.anyo_nacimiento_declarante,
			query.nif_pais_residencia_fiscal_declarante,
			query.id_administracion_declarado,
			query.nif_declarado_296,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.id_mae_no_id_declarado,
			query.cod_extranjero_declarado,
			query.nombre_declarado,
			query.id_mae_claves_personalidad_declarado,
			query.c_o_declarado,
			query.fecha_poder_declarado,
			query.mes_poder_declarado,
			query.anyo_poder_declarado,
			query.importe_asociado_declarado,
			query.nacionalidad_declarado,
			query.id_mae_sexos_declarado,
			query.fecha_nacimiento_declarado,
			query.mes_nacimiento_declarado,
			query.anyo_nacimiento_declarado,
			query.nif_pais_residencia_fiscal_declarado
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
