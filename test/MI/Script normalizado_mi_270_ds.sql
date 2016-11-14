PRINT 'normalizado_mi_270_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias(
	id_mi_ds_270_gravamen_premios_y_loterias int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo varchar(3) NOT NULL,
	nif_declarante_270 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	delegacion_hacienda varchar(2) NOT NULL,
	id_tipo_presentacion int NOT NULL,
	id_tipo_declaracion int NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	id_administracion int NOT NULL,
	es_erroneo_declarante bit NOT NULL,
	hay_observaciones bit NOT NULL,
	es_historico bit NOT NULL,
	volumen_operaciones decimal(18,2),
	secuencia varchar(11) NOT NULL,
	nif_declarado_270 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	nif_representante_legal varchar(9) NOT NULL,
	nombre_representante_legal varchar(40) NOT NULL,
	id_mae_tipos_perceptor int NOT NULL,
	id_clave_personalidad int NOT NULL,
	id_provincia int NOT NULL,
	fecha_sorteo date NOT NULL,
	mes_sorteo int NOT NULL,
	anyo_sorteo int NOT NULL,
	fecha_pago date NOT NULL,
	mes_pago int NOT NULL,
	anyo_pago int NOT NULL,
	gestor_cobro varchar(1) NOT NULL,
	nif_pais_residencia_fiscal varchar(20) NOT NULL,
	fecha_nacimiento date NOT NULL,
	mes_nacimiento int NOT NULL,
	anyo_nacimiento int NOT NULL,
	lugar_nacimiento varchar(35) NOT NULL,
	id_pais_nacimiento int NOT NULL,
	id_pais_residencia_fiscal int NOT NULL,
	es_erroneo_declarado bit NOT NULL,
	id_tipo_importe int NOT NULL,
	importe_premio decimal(18,2),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_270_gravamen_premios_y_loterias UNIQUE (id_documento,secuencia,id_tipo_importe),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_paises FOREIGN KEY (id_pais_nacimiento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_paises1 FOREIGN KEY (id_pais_residencia_fiscal) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_ds_270_gravamen_premios_y_loterias PRIMARY KEY CLUSTERED (id_mi_ds_270_gravamen_premios_y_loterias)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mi_ds_270_gravamen_premios_y_loterias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_mi_ds_270_gravamen_premios_y_loterias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarante_270')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nif_declarante_270 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD delegacion_hacienda varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_administracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_erroneo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_erroneo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD hay_observaciones bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_historico bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD volumen_operaciones decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarado_270')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nif_declarado_270 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_representante_legal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nif_representante_legal varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nombre_representante_legal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nombre_representante_legal varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mae_tipos_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_mae_tipos_perceptor int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_clave_personalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_clave_personalidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_sorteo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fecha_sorteo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_sorteo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD mes_sorteo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_sorteo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD anyo_sorteo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fecha_pago date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD mes_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD anyo_pago int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='gestor_cobro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD gestor_cobro varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_pais_residencia_fiscal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD nif_pais_residencia_fiscal varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_nacimiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fecha_nacimiento date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_nacimiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD mes_nacimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_nacimiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD anyo_nacimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='lugar_nacimiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD lugar_nacimiento varchar(35)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_pais_nacimiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_pais_nacimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_pais_residencia_fiscal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_pais_residencia_fiscal int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD es_erroneo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD id_tipo_importe int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='importe_premio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD importe_premio decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mi_ds_270_gravamen_premios_y_loterias' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_mi_ds_270_gravamen_premios_y_loterias int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN modelo varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarante_270' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nif_declarante_270 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_administracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_erroneo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_erroneo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN hay_observaciones bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_historico bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN volumen_operaciones decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN secuencia varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarado_270' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nif_declarado_270 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_representante_legal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nif_representante_legal varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nombre_representante_legal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nombre_representante_legal varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_mae_tipos_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_mae_tipos_perceptor int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_clave_personalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_clave_personalidad int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_sorteo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fecha_sorteo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_sorteo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN mes_sorteo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_sorteo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN anyo_sorteo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fecha_pago date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN mes_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN anyo_pago int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='gestor_cobro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN gestor_cobro varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='nif_pais_residencia_fiscal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN nif_pais_residencia_fiscal varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fecha_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fecha_nacimiento date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='mes_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN mes_nacimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='anyo_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN anyo_nacimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='lugar_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN lugar_nacimiento varchar(35) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_pais_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_pais_nacimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_pais_residencia_fiscal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_pais_residencia_fiscal int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='importe_premio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN importe_premio decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_270_gravamen_premios_y_loterias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT PK_tbn1_mi_ds_270_gravamen_premios_y_loterias PRIMARY KEY CLUSTERED (id_mi_ds_270_gravamen_premios_y_loterias)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_paises FOREIGN KEY (id_pais_nacimiento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_paises1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_paises1 FOREIGN KEY (id_pais_residencia_fiscal) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_270_gravamen_premios_y_loterias' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias ADD CONSTRAINT FK_tbn1_mi_ds_270_gravamen_premios_y_loterias_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_270_gravamen_premios_y_loterias' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_270_gravamen_premios_y_loterias;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_270_gravamen_premios_y_loterias(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_270_gravamen_premios_y_loterias'
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
		SELECT	id_mae_no_identificados,
				ejercicio,
				clavagru,
				clavdeta
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
		WHERE	aplicacion = 'AF'
		AND		detamodel = '270'
	),
	query AS (
		SELECT
			docu.id_documento AS id_documento
,			e.id_expediente AS id_expediente
			--cabe_af
,			cabe.caejercicio AS ejercicio
,			cabe.camodelo AS modelo
,			coalesce(left(coalesce(cabe.cacifdecl,''),9)+' '+right(coalesce(cabe.cacifdecl,''),2),'') AS nif_declarante_270
,			coalesce(left(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado
,			CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante
,			coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante
,			CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
				WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarante
,			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante
,			coalesce(cabe.catelefono,'') AS telefono
,			coalesce(cabe.capersona,'') AS razon_social
,			cabe.caenlace AS cod_presentador_colectivo
,			coalesce(cabe.cadh,'') AS delegacion_hacienda
,			tipo_pres.id_tipo_presentacion AS id_tipo_presentacion
,			tipo_decl.id_tipo_declaracion AS id_tipo_declaracion
,			cabe.cafecpres AS fecha_presentacion
,			month(cabe.cafecpres) AS mes_presentacion
,			year(cabe.cafecpres) AS anyo_presentacion
,			adm_orig.id_administracion AS id_administracion
,			CASE WHEN cabe.caerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante
,			CASE WHEN cabe.caobserva<>'0' THEN 1 ELSE 0 END AS hay_observaciones
,			CASE WHEN cabe.cahistorico='1' THEN 1 ELSE 0 END AS es_historico
,			cabe.cavolumen AS volumen_operaciones
			--270d_af
,			CAST(declarado.af270d_secuen AS varchar) AS secuencia
,			coalesce(left(coalesce(declarado.af270d_cif,''),9)+' '+right(coalesce(declarado.af270d_cif,''),2),'') AS nif_declarado_270
,			coalesce(left(CASE WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.af270d_cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.af270d_cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado
,			CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado
,			coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado
,			CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado
,			CASE
				WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarado
,			coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado
,			declarado.af270d_rl_nif AS nif_representante_legal
,			declarado.af270d_rl_nombre AS nombre_representante_legal
,			perc.id_mae_tipos_perceptor AS id_mae_tipos_perceptor
,			pers.id_mae_claves_personalidad AS id_clave_personalidad
,			prov.id_provincia AS id_provincia
,			declarado.af270d_fec_sorteo AS fecha_sorteo
,			month(declarado.af270d_fec_sorteo) AS mes_sorteo
,			year(declarado.af270d_fec_sorteo) AS anyo_sorteo
,			declarado.af270d_fec_pago AS fecha_pago
,			month(declarado.af270d_fec_pago) AS mes_pago
,			year(declarado.af270d_fec_pago) AS anyo_pago
,			declarado.af270d_gestor AS gestor_cobro
,			declarado.af270d_prf_nif AS nif_pais_residencia_fiscal
,			declarado.af270d_fec_nac AS fecha_nacimiento
,			month(declarado.af270d_fec_nac) AS mes_nacimiento
,			year(declarado.af270d_fec_nac) AS anyo_nacimiento
,			declarado.af270d_lugar_nac AS lugar_nacimiento
,			pais_nac.id_pais AS id_pais_nacimiento
,			pais_rcia.id_pais AS id_pais_residencia_fiscal
,			CASE WHEN declarado.af270d_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado
			--270i_af
,			timp.id_tipo_importe AS id_tipo_importe
,			importe.af270i_importe/100 AS importe_premio
			FROM	dbn1_stg_dhyf.dbo.tbn1cabe_af cabe
					----no_identificados_declarante
					LEFT JOIN	mae_noid mae_noid_cabe
							ON	cabe.caejercicio = mae_noid_cabe.ejercicio
							--AND cabe.careferdoc=mae_noid_cabe.clavagru
							AND CAST(cabe.careferdoc AS VARCHAR(9))= mae_noid_cabe.clavagru
							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
					--declarados
					INNER JOIN dbn1_stg_dhyf.dbo.tbn1270d_af declarado
							ON	cabe.caejercicio = declarado.af270d_ejercicio
							AND cabe.camodelo = '270'
							AND cabe.careferdoc = declarado.af270d_referdoc
					----no_identificados_declarado
					LEFT JOIN	mae_noid mae_noid_det
							ON	cabe.caejercicio = mae_noid_det.ejercicio
							AND CAST(cabe.careferdoc AS VARCHAR(9)) = mae_noid_det.clavagru
							AND right('0000000000000' +  cast(declarado.af270d_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
					--importes
					INNER JOIN dbn1_stg_dhyf.dbo.tbn1270i_af importe
							ON	declarado.af270d_ejercicio = importe.af270i_ejercicio
							AND declarado.af270d_referdoc = importe.af270i_referdoc 
							AND declarado.af270d_secuen = importe.af270i_secuen
					--documentos
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
							ON docu.referencia = CAST(cabe.caejercicio AS varchar)+'Y>'+CAST(cabe.careferdoc AS varchar)+'00K0000'
					--expedientes
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
							ON docu.id_expediente=e.id_expediente
					--buscar los nif en contribuyentes (para declarante y declarados)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
							ON cabe.cacifdecl=c.nif_maestro 
							AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
							ON declarado.af270d_cif=d.nif_maestro 
							AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
					--JOIN con cada maestro
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_orig 
							ON adm_orig.cod_administracion = coalesce('B',cabe.caadmonhaci)
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres 
							ON tipo_pres.cod_tipo_presentacion = cabe.catippres
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl 
							ON tipo_decl.cod_tipo_declaracion = cabe.catipodecl
					INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor perc
							ON declarado.af270d_tipo = perc.cod_tipo_perceptor
					INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad pers
							ON declarado.af270d_clave = pers.cod_clave_personalidad
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
							ON declarado.af270d_provin = prov.cod_provincia
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_nac
							ON declarado.af270d_pais_nac = pais_nac.cod_pais
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_rcia
							ON declarado.af270d_prf_pais = pais_rcia.cod_pais
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe timp
							ON importe.af270i_tipo = timp.cod_tipo_importe
					--CROSS JOIN con la tabla de valores indefinidos
					CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_270_gravamen_premios_y_loterias AS tbn1_mi_ds_270_gravamen_premios_y_loterias
	USING query ON query.id_documento=tbn1_mi_ds_270_gravamen_premios_y_loterias.id_documento AND query.secuencia=tbn1_mi_ds_270_gravamen_premios_y_loterias.secuencia AND query.id_tipo_importe=tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_importe
	WHEN MATCHED AND ((tbn1_mi_ds_270_gravamen_premios_y_loterias.id_expediente<>query.id_expediente OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.ejercicio<>query.ejercicio OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.modelo<>query.modelo OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.modelo IS NULL AND query.modelo IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.modelo IS NOT NULL AND query.modelo IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarante_270<>query.nif_declarante_270 OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarante_270 IS NULL AND query.nif_declarante_270 IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarante_270 IS NOT NULL AND query.nif_declarante_270 IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.sw_identificado_declarante<>query.sw_identificado_declarante OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.telefono<>query.telefono OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.razon_social<>query.razon_social OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.razon_social IS NOT NULL AND query.razon_social IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_administracion<>query.id_administracion OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_erroneo_declarante<>query.es_erroneo_declarante OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_erroneo_declarante IS NULL AND query.es_erroneo_declarante IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_erroneo_declarante IS NOT NULL AND query.es_erroneo_declarante IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.hay_observaciones<>query.hay_observaciones OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_historico<>query.es_historico OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_historico IS NULL AND query.es_historico IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_historico IS NOT NULL AND query.es_historico IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarado_270<>query.nif_declarado_270 OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarado_270 IS NULL AND query.nif_declarado_270 IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarado_270 IS NOT NULL AND query.nif_declarado_270 IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.sw_identificado_declarado<>query.sw_identificado_declarado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_representante_legal<>query.nif_representante_legal OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_representante_legal IS NULL AND query.nif_representante_legal IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_representante_legal IS NOT NULL AND query.nif_representante_legal IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nombre_representante_legal<>query.nombre_representante_legal OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nombre_representante_legal IS NULL AND query.nombre_representante_legal IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nombre_representante_legal IS NOT NULL AND query.nombre_representante_legal IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_tipos_perceptor<>query.id_mae_tipos_perceptor OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_tipos_perceptor IS NULL AND query.id_mae_tipos_perceptor IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_mae_tipos_perceptor IS NOT NULL AND query.id_mae_tipos_perceptor IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_clave_personalidad<>query.id_clave_personalidad OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_clave_personalidad IS NULL AND query.id_clave_personalidad IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_clave_personalidad IS NOT NULL AND query.id_clave_personalidad IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_provincia<>query.id_provincia OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_sorteo<>query.fecha_sorteo OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_sorteo IS NULL AND query.fecha_sorteo IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_sorteo IS NOT NULL AND query.fecha_sorteo IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_sorteo<>query.mes_sorteo OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_sorteo IS NULL AND query.mes_sorteo IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_sorteo IS NOT NULL AND query.mes_sorteo IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_sorteo<>query.anyo_sorteo OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_sorteo IS NULL AND query.anyo_sorteo IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_sorteo IS NOT NULL AND query.anyo_sorteo IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_pago<>query.fecha_pago OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_pago IS NULL AND query.fecha_pago IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_pago IS NOT NULL AND query.fecha_pago IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_pago<>query.mes_pago OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_pago IS NULL AND query.mes_pago IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_pago IS NOT NULL AND query.mes_pago IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_pago<>query.anyo_pago OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_pago IS NULL AND query.anyo_pago IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_pago IS NOT NULL AND query.anyo_pago IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.gestor_cobro<>query.gestor_cobro OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.gestor_cobro IS NULL AND query.gestor_cobro IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.gestor_cobro IS NOT NULL AND query.gestor_cobro IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_pais_residencia_fiscal<>query.nif_pais_residencia_fiscal OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_pais_residencia_fiscal IS NULL AND query.nif_pais_residencia_fiscal IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.nif_pais_residencia_fiscal IS NOT NULL AND query.nif_pais_residencia_fiscal IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_nacimiento<>query.fecha_nacimiento OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_nacimiento IS NULL AND query.fecha_nacimiento IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.fecha_nacimiento IS NOT NULL AND query.fecha_nacimiento IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_nacimiento<>query.mes_nacimiento OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_nacimiento IS NULL AND query.mes_nacimiento IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.mes_nacimiento IS NOT NULL AND query.mes_nacimiento IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_nacimiento<>query.anyo_nacimiento OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_nacimiento IS NULL AND query.anyo_nacimiento IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.anyo_nacimiento IS NOT NULL AND query.anyo_nacimiento IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.lugar_nacimiento<>query.lugar_nacimiento OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.lugar_nacimiento IS NULL AND query.lugar_nacimiento IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.lugar_nacimiento IS NOT NULL AND query.lugar_nacimiento IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_pais_nacimiento<>query.id_pais_nacimiento OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_pais_nacimiento IS NULL AND query.id_pais_nacimiento IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_pais_nacimiento IS NOT NULL AND query.id_pais_nacimiento IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.id_pais_residencia_fiscal<>query.id_pais_residencia_fiscal OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_pais_residencia_fiscal IS NULL AND query.id_pais_residencia_fiscal IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.id_pais_residencia_fiscal IS NOT NULL AND query.id_pais_residencia_fiscal IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.es_erroneo_declarado<>query.es_erroneo_declarado OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
			OR tbn1_mi_ds_270_gravamen_premios_y_loterias.importe_premio<>query.importe_premio OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.importe_premio IS NULL AND query.importe_premio IS NOT NULL) OR (tbn1_mi_ds_270_gravamen_premios_y_loterias.importe_premio IS NOT NULL AND query.importe_premio IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			ejercicio=query.ejercicio,
			modelo=query.modelo,
			nif_declarante_270=query.nif_declarante_270,
			nif_declarante_no_identificado=query.nif_declarante_no_identificado,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante=query.sw_identificado_declarante,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			telefono=query.telefono,
			razon_social=query.razon_social,
			cod_presentador_colectivo=query.cod_presentador_colectivo,
			delegacion_hacienda=query.delegacion_hacienda,
			id_tipo_presentacion=query.id_tipo_presentacion,
			id_tipo_declaracion=query.id_tipo_declaracion,
			fecha_presentacion=query.fecha_presentacion,
			mes_presentacion=query.mes_presentacion,
			anyo_presentacion=query.anyo_presentacion,
			id_administracion=query.id_administracion,
			es_erroneo_declarante=query.es_erroneo_declarante,
			hay_observaciones=query.hay_observaciones,
			es_historico=query.es_historico,
			volumen_operaciones=query.volumen_operaciones,
			nif_declarado_270=query.nif_declarado_270,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado=query.id_contribuyente_declarado,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado=query.sw_identificado_declarado,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			nif_representante_legal=query.nif_representante_legal,
			nombre_representante_legal=query.nombre_representante_legal,
			id_mae_tipos_perceptor=query.id_mae_tipos_perceptor,
			id_clave_personalidad=query.id_clave_personalidad,
			id_provincia=query.id_provincia,
			fecha_sorteo=query.fecha_sorteo,
			mes_sorteo=query.mes_sorteo,
			anyo_sorteo=query.anyo_sorteo,
			fecha_pago=query.fecha_pago,
			mes_pago=query.mes_pago,
			anyo_pago=query.anyo_pago,
			gestor_cobro=query.gestor_cobro,
			nif_pais_residencia_fiscal=query.nif_pais_residencia_fiscal,
			fecha_nacimiento=query.fecha_nacimiento,
			mes_nacimiento=query.mes_nacimiento,
			anyo_nacimiento=query.anyo_nacimiento,
			lugar_nacimiento=query.lugar_nacimiento,
			id_pais_nacimiento=query.id_pais_nacimiento,
			id_pais_residencia_fiscal=query.id_pais_residencia_fiscal,
			es_erroneo_declarado=query.es_erroneo_declarado,
			importe_premio=query.importe_premio
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,ejercicio,modelo,nif_declarante_270,nif_declarante_no_identificado,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,id_mae_no_id_declarante,telefono,razon_social,cod_presentador_colectivo,delegacion_hacienda,id_tipo_presentacion,id_tipo_declaracion,fecha_presentacion,mes_presentacion,anyo_presentacion,id_administracion,es_erroneo_declarante,hay_observaciones,es_historico,volumen_operaciones,secuencia,nif_declarado_270,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,id_mae_no_id_declarado,nif_representante_legal,nombre_representante_legal,id_mae_tipos_perceptor,id_clave_personalidad,id_provincia,fecha_sorteo,mes_sorteo,anyo_sorteo,fecha_pago,mes_pago,anyo_pago,gestor_cobro,nif_pais_residencia_fiscal,fecha_nacimiento,mes_nacimiento,anyo_nacimiento,lugar_nacimiento,id_pais_nacimiento,id_pais_residencia_fiscal,es_erroneo_declarado,id_tipo_importe,importe_premio) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.ejercicio,
			query.modelo,
			query.nif_declarante_270,
			query.nif_declarante_no_identificado,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.id_mae_no_id_declarante,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo,
			query.delegacion_hacienda,
			query.id_tipo_presentacion,
			query.id_tipo_declaracion,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.id_administracion,
			query.es_erroneo_declarante,
			query.hay_observaciones,
			query.es_historico,
			query.volumen_operaciones,
			query.secuencia,
			query.nif_declarado_270,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.id_mae_no_id_declarado,
			query.nif_representante_legal,
			query.nombre_representante_legal,
			query.id_mae_tipos_perceptor,
			query.id_clave_personalidad,
			query.id_provincia,
			query.fecha_sorteo,
			query.mes_sorteo,
			query.anyo_sorteo,
			query.fecha_pago,
			query.mes_pago,
			query.anyo_pago,
			query.gestor_cobro,
			query.nif_pais_residencia_fiscal,
			query.fecha_nacimiento,
			query.mes_nacimiento,
			query.anyo_nacimiento,
			query.lugar_nacimiento,
			query.id_pais_nacimiento,
			query.id_pais_residencia_fiscal,
			query.es_erroneo_declarado,
			query.id_tipo_importe,
			query.importe_premio
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
