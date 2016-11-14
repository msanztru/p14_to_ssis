PRINT 'normalizado_mi_192_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro(
	id_mi_ds_192_operaciones_letras_tesoro int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3)    NOT NULL,
	es_externo bit NOT NULL,
	nif_declarante_192 varchar(12) NOT NULL,
	nif_declarante_no_identificado   varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante   varchar(1)   NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	delegacion_hacienda varchar(2) NOT NULL,
	id_tipo_presentacion int NOT NULL,
	id_administracion int NOT NULL,
	volumen_operaciones decimal(18,2),
	es_representante varchar(1) NOT NULL,
	cod_valor varchar(12) NOT NULL,
	id_clave_origen int NOT NULL,
	id_clave_operacion int NOT NULL,
	id_clave_traspaso int NOT NULL,
	id_clave_declarado int NOT NULL,
	secuencia  varchar(11) NOT NULL,
	nif_declarado_192 varchar(12) NOT NULL,
	nif_declarado_no_identificado   varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	es_erroneo_declarante bit NOT NULL,
	id_provincia int NOT NULL,
	id_pais int NOT NULL,
	es_historico bit NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int  NOT NULL,
	porc_participacion decimal(7, 2),
	num_participes decimal(3, 0),
	nro_orden decimal(8, 0) NOT NULL,
	importe_transmision decimal(18, 2),
	fecha_carga date NOT NULL,
	fecha_transmision date NOT NULL,
	mes_transmision int NOT NULL,
	anyo_transmision int  NOT NULL,
	id_clave_residencia int NOT NULL,
	id_clave_declarante int NOT NULL,
	id_tipo_operacion_192 int NOT NULL,
	importe_adquisicion decimal(18, 2),
	fecha_adquisicion date NOT NULL,
	mes_adquisicion int NOT NULL,
	anyo_adquisicion int  NOT NULL,
	es_erroneo_declarado bit NOT NULL,
	id_tipo_declaracion int NOT NULL,
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_192_operaciones_letras_tesoro UNIQUE (id_documento,secuencia ),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(id_clave_origen),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_claves_traspaso FOREIGN KEY (id_clave_traspaso) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso(id_clave_traspaso),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(id_clave_declarado),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_residencia FOREIGN KEY (id_clave_residencia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_residencia(id_clave_residencia),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_declarante FOREIGN KEY (id_clave_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_declarante(id_clave_declarante),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipos_operacion_192 FOREIGN KEY (id_tipo_operacion_192) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192(id_tipo_operacion_192),
	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT PK_tbn1_mi_ds_192_operaciones_letras_tesoro PRIMARY KEY CLUSTERED (id_mi_ds_192_operaciones_letras_tesoro)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mi_ds_192_operaciones_letras_tesoro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_mi_ds_192_operaciones_letras_tesoro int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD modelo  varchar(3)   
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_externo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_192')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarante_192 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_no_identificado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarante_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarante  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD sw_identificado_declarante   varchar(1)  
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD delegacion_hacienda varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_administracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD volumen_operaciones decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_representante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_valor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD cod_valor varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_origen int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_traspaso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_traspaso int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='secuencia ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD secuencia  varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_192')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarado_192 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_no_identificado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarado_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_erroneo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_historico bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD anyo_presentacion int 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='porc_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD porc_participacion decimal(7, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='num_participes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD num_participes decimal(3, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nro_orden')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nro_orden decimal(8, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_transmision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD importe_transmision decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_carga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_carga date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_transmision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_transmision date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_transmision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD mes_transmision int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_transmision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD anyo_transmision int 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_residencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_residencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_operacion_192')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_tipo_operacion_192 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_adquisicion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD importe_adquisicion decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_adquisicion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_adquisicion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_adquisicion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD mes_adquisicion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_adquisicion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD anyo_adquisicion int 
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_erroneo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mi_ds_192_operaciones_letras_tesoro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_mi_ds_192_operaciones_letras_tesoro int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN modelo  varchar(3)    NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_externo bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_192' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarante_192 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarante_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarante  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN sw_identificado_declarante   varchar(1)   NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_administracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN volumen_operaciones decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_representante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_valor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN cod_valor varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_origen int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_traspaso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_traspaso int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='secuencia ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN secuencia  varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_192' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarado_192 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarado_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_erroneo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_historico bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN anyo_presentacion int  NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='porc_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN porc_participacion decimal(7, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='num_participes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN num_participes decimal(3, 0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nro_orden' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nro_orden decimal(8, 0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_transmision' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN importe_transmision decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_carga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_carga date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_transmision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_transmision date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_transmision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN mes_transmision int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_transmision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN anyo_transmision int  NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_residencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_residencia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_operacion_192' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_tipo_operacion_192 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_adquisicion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN importe_adquisicion decimal(18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_adquisicion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_adquisicion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_adquisicion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN mes_adquisicion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_adquisicion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN anyo_adquisicion int  NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_192_operaciones_letras_tesoro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT PK_tbn1_mi_ds_192_operaciones_letras_tesoro PRIMARY KEY CLUSTERED (id_mi_ds_192_operaciones_letras_tesoro)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(id_clave_origen)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_claves_traspaso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_claves_traspaso FOREIGN KEY (id_clave_traspaso) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso(id_clave_traspaso)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(id_clave_declarado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_residencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_residencia FOREIGN KEY (id_clave_residencia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_residencia(id_clave_residencia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_declarante FOREIGN KEY (id_clave_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_declarante(id_clave_declarante)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipos_operacion_192')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipos_operacion_192 FOREIGN KEY (id_tipo_operacion_192) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192(id_tipo_operacion_192)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro'
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
        WHERE  aplicacion = 'AF'
        AND detamodel = '192'
),
query AS (
		SELECT	--top 1000
					docu.id_documento AS id_documento,
					e.id_expediente AS id_expediente,
					--cabe_af
					cabe.caejercicio AS ejercicio,
					cabe.careferdoc AS referencia,
					coalesce(cabe.camodelo,'') AS modelo,

					coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
					coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
					coalesce(cafecalta,CAST('21000101' AS datetime)) fecha_carga, 

					coalesce(cabe.cacifdecl,'') AS nif_declarante_192_11,
					CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
					coalesce(left(coalesce(cabe.cacifdecl,''),9)+' '+right(coalesce(cabe.cacifdecl,''),2),'') AS nif_declarante_192,					
					coalesce(left(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,					
					CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
					0 AS es_externo,
					coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
					coalesce(cabe.cadh,'') AS delegacion_hacienda,
					adm_orig.id_administracion AS id_administracion,
					coalesce(cabe.catelefono,'') AS telefono,
					coalesce(cabe.capersona,'') AS razon_social,
					cabe.caenlace AS cod_presentador_colectivo,
					CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
					CASE
						WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
					END AS sw_identificado_declarante,
					coalesce(cabe.cacodentg,'') AS cod_entidad_gestora,
					tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
					cabe.cafecpres AS fecha_presentacion,
					month(cabe.cafecpres) AS mes_presentacion,
					year(cabe.cafecpres) AS anyo_presentacion,
					coalesce(cabe.canumcaja,'') AS num_caja,
					CASE WHEN cabe.caerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante,
					cabe.caconterror AS num_declarados_erroneos,
					CASE WHEN cabe.caobserva<>'0' THEN 1 ELSE 0 END AS hay_observaciones,
					CASE WHEN cabe.cahistorico='1' THEN 1 ELSE 0 END AS es_historico,
					cabe.cafecalta AS fecha_alta,
					cabe.cavolumen AS volumen_operaciones,
					cabe.cajustif AS num_justificante,
					tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
					cabe.cajustifsus AS num_justificante_sustitutiva,
					cabe.cacrevi AS contador_revisiones,
					--da20_af
					CAST(declarado.da20secuen AS varchar) AS secuencia,
					coalesce(declarado.da20cif,'') AS nif_declarado_192_11,
					CASE WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da20cif,'') ELSE '' END AS nif_declarado_no_identificado_11,
					coalesce(left(coalesce(declarado.da20cif,''),9)+' '+right(coalesce(declarado.da20cif,''),2),'') AS nif_declarado_192,				
					coalesce(left(CASE WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da20cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN da20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da20cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
					CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
					coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
					coalesce(declarado.da20represen,'') AS es_representante,
					prov.id_provincia AS id_provincia,
					pais.id_pais AS id_pais,
					resi.id_clave_residencia AS id_clave_residencia,
					declarado.da20codigovalor AS cod_valor,
					decl.id_clave_declarante AS id_clave_declarante,
					oper.id_tipo_operacion_192 AS id_tipo_operacion_192,
					declarado.da20nroparticipes AS num_participes,
					declarado.da20nroorden AS nro_orden,

					clv_origen.id_clave_origen AS id_clave_origen,
					clv_ope.id_clave_operacion_192 AS id_clave_operacion,
					declarado.da20porcentaje/100 AS porc_participacion,
					tras.id_clave_traspaso AS id_clave_traspaso,
					clv_decl.id_clave_declarado AS id_clave_declarado,
					declarado.da20fecalta AS fecha_adquisicion,
					month(declarado.da20fecalta) AS mes_adquisicion,
					year(declarado.da20fecalta) AS anyo_adquisicion,
					cast(declarado.da20impalta/100 as decimal(18,2)) AS importe_adquisicion,
					declarado.da20fecbaja AS fecha_transmision,
					month(declarado.da20fecbaja) AS mes_transmision,
					year(declarado.da20fecbaja) AS anyo_transmision,
					cast(declarado.da20impbaja/100 as decimal(18,2)) AS importe_transmision,
					CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
					CASE
						WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
					END AS sw_identificado_declarado,
					CASE WHEN da20error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado
			FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_af WHERE camodelo='192') cabe
					--no_identificados_declarante
					LEFT JOIN	mae_noid mae_noid_cabe
							ON	cabe.caejercicio = mae_noid_cabe.ejercicio
							AND cast(cabe.careferdoc as varchar) = mae_noid_cabe.clavagru
							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
					--declarados
					INNER JOIN dbn1_stg_dhyf.dbo.tbn120da_af declarado
							ON	cabe.caejercicio = declarado.da20ejercicio
							AND cabe.camodelo = '192'
							AND cabe.careferdoc = declarado.da20referdoc
					--no_identificados_declarado
					LEFT JOIN	mae_noid mae_noid_det
							ON	cabe.caejercicio = mae_noid_det.ejercicio
							AND cast(cabe.careferdoc as varchar) = mae_noid_det.clavagru
							AND right('0000000000000' +  cast(declarado.da20secuen  as varchar) , 13)=  mae_noid_det.clavdeta 
					--documentos
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
							ON docu.referencia = CAST(cabe.caejercicio AS varchar)+'AO'+CAST(cabe.careferdoc AS varchar)+'00K0000'
					--expedientes
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
							ON docu.id_expediente=e.id_expediente
					--buscar los nif en contribuyentes (para declarante y declarados)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
							ON cabe.cacifdecl=c.nif_maestro 
							AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
							ON declarado.da20cif=d.nif_maestro 
							AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
					--LEFT JOIN con cada maestro
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_orig 
							ON adm_orig.cod_administracion = coalesce('B',cabe.caadmonhaci)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres 
							ON tipo_pres.cod_tipo_presentacion = cabe.catippres
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl 
							ON tipo_decl.cod_tipo_declaracion = cabe.catipodecl
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
							ON prov.cod_provincia = declarado.da20provin
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais 
							ON pais.cod_pais = declarado.da20pais
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_residencia resi
							ON resi.cod_clave_residencia = declarado.da20clresidencia
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_declarante decl
							ON decl.cod_clave_declarante = declarado.da20cldeclarante
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 oper
							ON oper.cod_tipo_operacion_192 = declarado.da20tipooper
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen clv_origen 
							ON clv_origen.cod_clave_origen = declarado.da20clorigen
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 clv_ope 
							ON clv_ope.cod_clave_operacion_192 = declarado.da20cloperacion
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso tras
							ON tras.cod_clave_traspaso = declarado.da20cltraspaso
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado clv_decl 
							ON clv_decl.cod_clave_declarado = declarado.da20cldeclarado
					CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

		UNION ALL

			SELECT	--top 1000
					docu.id_documento AS id_documento,
					e.id_expediente AS id_expediente,
					--i3ca_af
					cabe.cxejercicio AS ejercicio,
					cabe.cxreferdoc AS referencia,
					coalesce(cabe.cxmodelo,'') AS modelo,

					coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
					coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
					coalesce(cxfecalta,CAST('21000101' AS datetime)) fecha_carga, 

					coalesce(cabe.cxcifdecl,'') AS nif_declarante_192_11,
					CASE WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cxcifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
					coalesce(left(coalesce(cabe.cxcifdecl,''),9)+' '+right(coalesce(cabe.cxcifdecl,''),2),'') AS nif_declarante_192,
					coalesce(left(CASE WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cxcifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cxcifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
					CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
					1 AS es_externo,
					coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
					'' AS delegacion_hacienda, --no existe para externos
					adm_orig.id_administracion AS id_administracion,
					'' AS telefono, --no existe para externos
					'' AS razon_social, --no existe para externos
					0 AS cod_presentador_colectivo, --no existe para externos
					CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
					CASE
						WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
					END AS sw_identificado_declarante,
					'' AS cod_entidad_gestora, --no existe para externos
					-1 AS id_tipo_presentacion, --no existe para externos
					CAST('21000101' AS datetime) AS fecha_presentacion, --no existe para externos
					month(CAST('21000101' AS datetime)) AS mes_presentacion, --no existe para externos
					year(CAST('21000101' AS datetime)) AS anyo_presentacion, --no existe para externos
					NULL AS num_caja, --no existe para externos
					CASE WHEN cabe.cxerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante,
					cabe.cxconterror AS num_declarados_erroneos,
					0 AS hay_observaciones, --no existe para externos
					0 AS es_historico, --no existe para externos
					cabe.cxfecalta AS fecha_alta,
					NULL AS volumen_operaciones, --no existe para externos
					NULL AS num_justificante, --no existe para externos
					-1 AS id_tipo_declaracion, --no existe para externos
					NULL AS num_justificante_sustitutiva, --no existe para externos
					NULL AS contador_revisiones, --no existe para externos
					--8xpe_af
					CAST(declarado.px20nropte AS varchar) AS secuencia,
					coalesce(declarado.px20cif,'') AS nif_declarado_192_11,
					CASE WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px20cif,'') ELSE '' END AS nif_declarado_no_identificado_11,
					coalesce(left(coalesce(declarado.px20cif,''),9)+' '+right(coalesce(declarado.px20cif,''),2),'') AS nif_declarado_192,				
					coalesce(left(CASE WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px20cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px20cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
					CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
					coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
					coalesce(declarado.px20represen,'') AS es_representante,
					prov.id_provincia AS id_provincia,
					pais.id_pais AS id_pais,
					resi.id_clave_residencia AS id_clave_residencia,
					declarado.px20codigovalor AS cod_valor,
					decl.id_clave_declarante AS id_clave_declarante,
					oper.id_tipo_operacion_192 AS id_tipo_operacion_192,
					declarado.px20nroparticipes AS num_participes,
					declarado.px20nroorden AS nro_orden, 

					clv_origen.id_clave_origen AS id_clave_origen,
					clv_ope.id_clave_operacion_192 AS id_clave_operacion,
					declarado.px20porcentaje/100 AS porc_participacion,
					tras.id_clave_traspaso AS id_clave_traspaso,
					clv_decl.id_clave_declarado AS id_clave_declarado,
					declarado.px20fecalta AS fecha_adquisicion,
					month(declarado.px20fecalta) AS mes_adquisicion,
					year(declarado.px20fecalta) AS anyo_adquisicion,
					cast(declarado.px20impalta/100 as decimal(18,2)) AS importe_adquisicion,
					declarado.px20fecbaja AS fecha_transmision,
					month(declarado.px20fecbaja) AS mes_transmision,
					year(declarado.px20fecbaja) AS anyo_transmision,
					cast(declarado.px20impbaja/100 as decimal(18,2)) AS importe_transmision,
					CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
					CASE
						WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
					END AS sw_identificado_declarado,
					CASE WHEN declarado.px20error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado
			FROM	(SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3ca_af WHERE cxmodelo='192') cabe
					--no_identificados_declarante
					LEFT JOIN	mae_noid mae_noid_cabe
							ON	cabe.cxejercicio = mae_noid_cabe.ejercicio
							AND cast(cabe.cxreferdoc as varchar) = mae_noid_cabe.clavagru
							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
					--declarados
					INNER JOIN dbn1_stg_dhyf.dbo.tbn12xpe_af declarado
							ON	cabe.cxejercicio = declarado.px20ejercicio 
							AND	cabe.cxmodelo = '192'
							AND cabe.cxreferdoc = declarado.px20referdoc
							AND cabe.cxadmon = declarado.px20admon
					--no_identificados_declarado
					LEFT JOIN	mae_noid mae_noid_det
							ON	cabe.cxejercicio = mae_noid_det.ejercicio
							AND cast(cabe.cxreferdoc as varchar) = mae_noid_det.clavagru
							AND right('0000000000000' +  cast(declarado.px20nropte  as varchar) , 13)=  mae_noid_det.clavdeta 
					--documentos
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
							ON docu.referencia = CAST(cabe.cxejercicio AS varchar)+'AO'+CAST(cabe.cxreferdoc AS varchar)+'00K0000'
					--expedientes
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
							ON docu.id_expediente = e.id_expediente
					--buscar los nif en contribuyentes (para declarante y declarados)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
							ON	cabe.cxcifdecl = c.nif_maestro 
							AND c.fec_fin_vigencia = CAST('21000101' AS datetime)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
							ON	declarado.px20cif = d.nif_maestro 
							AND d.fec_fin_vigencia = CAST('21000101' AS datetime)
					--LEFT JOIN con cada maestro
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_orig 
							ON adm_orig.cod_administracion = coalesce('B',cabe.cxadmon)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
							ON prov.cod_provincia = declarado.px20provin
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais 
							ON pais.cod_pais = declarado.px20pais
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_residencia resi
							ON resi.cod_clave_residencia = declarado.px20clresidencia
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_declarante decl
							ON decl.cod_clave_declarante = declarado.px20cldeclarante
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 oper
							ON oper.cod_tipo_operacion_192 = declarado.px20tipooper
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen clv_origen 
							ON clv_origen.cod_clave_origen = declarado.px20clorigen
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 clv_ope 
							ON clv_ope.cod_clave_operacion_192 = declarado.px20cloperacion
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso tras
							ON tras.cod_clave_traspaso = declarado.px20cltraspaso
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado clv_decl 
							ON clv_decl.cod_clave_declarado = declarado.px20cldeclarado
					CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos


	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro AS tbn1_mi_ds_192_operaciones_letras_tesoro
	USING query ON query.id_documento=tbn1_mi_ds_192_operaciones_letras_tesoro.id_documento AND query.secuencia =tbn1_mi_ds_192_operaciones_letras_tesoro.secuencia 
	WHEN MATCHED AND ((tbn1_mi_ds_192_operaciones_letras_tesoro.id_expediente<>query.id_expediente OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.ejercicio<>query.ejercicio OR (tbn1_mi_ds_192_operaciones_letras_tesoro.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.modelo <>query.modelo  OR (tbn1_mi_ds_192_operaciones_letras_tesoro.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_externo<>query.es_externo OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_externo IS NULL AND query.es_externo IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_externo IS NOT NULL AND query.es_externo IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_192<>query.nif_declarante_192 OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_192 IS NULL AND query.nif_declarante_192 IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_192 IS NOT NULL AND query.nif_declarante_192 IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_no_identificado  <>query.nif_declarante_no_identificado   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_no_identificado   IS NULL AND query.nif_declarante_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_no_identificado   IS NOT NULL AND query.nif_declarante_no_identificado   IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarante  <>query.sw_identificado_declarante   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarante   IS NULL AND query.sw_identificado_declarante   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarante   IS NOT NULL AND query.sw_identificado_declarante   IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.telefono<>query.telefono OR (tbn1_mi_ds_192_operaciones_letras_tesoro.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.razon_social<>query.razon_social OR (tbn1_mi_ds_192_operaciones_letras_tesoro.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.razon_social IS NOT NULL AND query.razon_social IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_mi_ds_192_operaciones_letras_tesoro.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_administracion<>query.id_administracion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_ds_192_operaciones_letras_tesoro.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_representante<>query.es_representante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_representante IS NULL AND query.es_representante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_representante IS NOT NULL AND query.es_representante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.cod_valor<>query.cod_valor OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_valor IS NULL AND query.cod_valor IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_valor IS NOT NULL AND query.cod_valor IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_origen<>query.id_clave_origen OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_origen IS NULL AND query.id_clave_origen IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_origen IS NOT NULL AND query.id_clave_origen IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_operacion<>query.id_clave_operacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_operacion IS NULL AND query.id_clave_operacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_operacion IS NOT NULL AND query.id_clave_operacion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_traspaso<>query.id_clave_traspaso OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_traspaso IS NULL AND query.id_clave_traspaso IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_traspaso IS NOT NULL AND query.id_clave_traspaso IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarado<>query.id_clave_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarado IS NULL AND query.id_clave_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarado IS NOT NULL AND query.id_clave_declarado IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_192<>query.nif_declarado_192 OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_192 IS NULL AND query.nif_declarado_192 IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_192 IS NOT NULL AND query.nif_declarado_192 IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_no_identificado  <>query.nif_declarado_no_identificado   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_no_identificado   IS NULL AND query.nif_declarado_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_no_identificado   IS NOT NULL AND query.nif_declarado_no_identificado   IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarante<>query.es_erroneo_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarante IS NULL AND query.es_erroneo_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarante IS NOT NULL AND query.es_erroneo_declarante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_provincia<>query.id_provincia OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_pais<>query.id_pais OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_historico<>query.es_historico OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_historico IS NULL AND query.es_historico IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_historico IS NOT NULL AND query.es_historico IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.porc_participacion<>query.porc_participacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.num_participes<>query.num_participes OR (tbn1_mi_ds_192_operaciones_letras_tesoro.num_participes IS NULL AND query.num_participes IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.num_participes IS NOT NULL AND query.num_participes IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nro_orden<>query.nro_orden OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nro_orden IS NULL AND query.nro_orden IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nro_orden IS NOT NULL AND query.nro_orden IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.importe_transmision<>query.importe_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_transmision IS NULL AND query.importe_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_transmision IS NOT NULL AND query.importe_transmision IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_carga<>query.fecha_carga OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_carga IS NULL AND query.fecha_carga IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_carga IS NOT NULL AND query.fecha_carga IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_transmision<>query.fecha_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_transmision IS NULL AND query.fecha_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_transmision IS NOT NULL AND query.fecha_transmision IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.mes_transmision<>query.mes_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_transmision IS NULL AND query.mes_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_transmision IS NOT NULL AND query.mes_transmision IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_transmision<>query.anyo_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_transmision IS NULL AND query.anyo_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_transmision IS NOT NULL AND query.anyo_transmision IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_residencia<>query.id_clave_residencia OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_residencia IS NULL AND query.id_clave_residencia IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_residencia IS NOT NULL AND query.id_clave_residencia IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarante<>query.id_clave_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarante IS NULL AND query.id_clave_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarante IS NOT NULL AND query.id_clave_declarante IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_operacion_192<>query.id_tipo_operacion_192 OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_operacion_192 IS NULL AND query.id_tipo_operacion_192 IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_operacion_192 IS NOT NULL AND query.id_tipo_operacion_192 IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.importe_adquisicion<>query.importe_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_adquisicion IS NULL AND query.importe_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_adquisicion IS NOT NULL AND query.importe_adquisicion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_adquisicion<>query.fecha_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_adquisicion IS NULL AND query.fecha_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_adquisicion IS NOT NULL AND query.fecha_adquisicion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.mes_adquisicion<>query.mes_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_adquisicion IS NULL AND query.mes_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_adquisicion IS NOT NULL AND query.mes_adquisicion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_adquisicion<>query.anyo_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_adquisicion IS NULL AND query.anyo_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_adquisicion IS NOT NULL AND query.anyo_adquisicion IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarado<>query.es_erroneo_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			ejercicio=query.ejercicio,
			modelo =query.modelo ,
			es_externo=query.es_externo,
			nif_declarante_192=query.nif_declarante_192,
			nif_declarante_no_identificado  =query.nif_declarante_no_identificado  ,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante  =query.sw_identificado_declarante  ,
			telefono=query.telefono,
			razon_social=query.razon_social,
			cod_presentador_colectivo=query.cod_presentador_colectivo,
			delegacion_hacienda=query.delegacion_hacienda,
			id_tipo_presentacion=query.id_tipo_presentacion,
			id_administracion=query.id_administracion,
			volumen_operaciones=query.volumen_operaciones,
			es_representante=query.es_representante,
			cod_valor=query.cod_valor,
			id_clave_origen=query.id_clave_origen,
			id_clave_operacion=query.id_clave_operacion,
			id_clave_traspaso=query.id_clave_traspaso,
			id_clave_declarado=query.id_clave_declarado,
			nif_declarado_192=query.nif_declarado_192,
			nif_declarado_no_identificado  =query.nif_declarado_no_identificado  ,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado   =query.sw_identificado_declarado   ,
			es_erroneo_declarante=query.es_erroneo_declarante,
			id_provincia=query.id_provincia,
			id_pais=query.id_pais,
			es_historico=query.es_historico,
			fecha_presentacion=query.fecha_presentacion,
			mes_presentacion=query.mes_presentacion,
			anyo_presentacion=query.anyo_presentacion,
			porc_participacion=query.porc_participacion,
			num_participes=query.num_participes,
			nro_orden=query.nro_orden,
			importe_transmision=query.importe_transmision,
			fecha_carga=query.fecha_carga,
			fecha_transmision=query.fecha_transmision,
			mes_transmision=query.mes_transmision,
			anyo_transmision=query.anyo_transmision,
			id_clave_residencia=query.id_clave_residencia,
			id_clave_declarante=query.id_clave_declarante,
			id_tipo_operacion_192=query.id_tipo_operacion_192,
			importe_adquisicion=query.importe_adquisicion,
			fecha_adquisicion=query.fecha_adquisicion,
			mes_adquisicion=query.mes_adquisicion,
			anyo_adquisicion=query.anyo_adquisicion,
			es_erroneo_declarado=query.es_erroneo_declarado,
			id_tipo_declaracion=query.id_tipo_declaracion
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,es_externo,nif_declarante_192,nif_declarante_no_identificado  ,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,telefono,razon_social,cod_presentador_colectivo,delegacion_hacienda,id_tipo_presentacion,id_administracion,volumen_operaciones,es_representante,cod_valor,id_clave_origen,id_clave_operacion,id_clave_traspaso,id_clave_declarado,secuencia ,nif_declarado_192,nif_declarado_no_identificado  ,es_contribuyente_declarado,id_contribuyente_declarado  ,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo_declarante,id_provincia,id_pais,es_historico,fecha_presentacion,mes_presentacion,anyo_presentacion,porc_participacion,num_participes,nro_orden,importe_transmision,fecha_carga,fecha_transmision,mes_transmision,anyo_transmision,id_clave_residencia,id_clave_declarante,id_tipo_operacion_192,importe_adquisicion,fecha_adquisicion,mes_adquisicion,anyo_adquisicion,es_erroneo_declarado,id_tipo_declaracion) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.id_mae_no_id_declarante,
			query.id_mae_no_id_declarado,
			query.ejercicio,
			query.modelo ,
			query.es_externo,
			query.nif_declarante_192,
			query.nif_declarante_no_identificado  ,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante  ,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo,
			query.delegacion_hacienda,
			query.id_tipo_presentacion,
			query.id_administracion,
			query.volumen_operaciones,
			query.es_representante,
			query.cod_valor,
			query.id_clave_origen,
			query.id_clave_operacion,
			query.id_clave_traspaso,
			query.id_clave_declarado,
			query.secuencia ,
			query.nif_declarado_192,
			query.nif_declarado_no_identificado  ,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado  ,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.es_erroneo_declarante,
			query.id_provincia,
			query.id_pais,
			query.es_historico,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
			query.porc_participacion,
			query.num_participes,
			query.nro_orden,
			query.importe_transmision,
			query.fecha_carga,
			query.fecha_transmision,
			query.mes_transmision,
			query.anyo_transmision,
			query.id_clave_residencia,
			query.id_clave_declarante,
			query.id_tipo_operacion_192,
			query.importe_adquisicion,
			query.fecha_adquisicion,
			query.mes_adquisicion,
			query.anyo_adquisicion,
			query.es_erroneo_declarado,
			query.id_tipo_declaracion
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


--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro')
--CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro(
--	id_mi_ds_192_operaciones_letras_tesoro int IDENTITY(1,1),
--	id_documento int NOT NULL,
--	id_expediente int NOT NULL,
--	id_mae_no_id_declarante int NOT NULL,
--	id_mae_no_id_declarado int NOT NULL,
--	ejercicio smallint NOT NULL,
--	modelo  varchar(3)    NOT NULL,
--	es_externo bit NOT NULL,
--	nif_declarante_192 varchar(12) NOT NULL,
--	nif_declarante_no_identificado   varchar(12) NOT NULL,
--	es_contribuyente_declarante bit NOT NULL,
--	id_contribuyente_declarante int NOT NULL,
--	es_identificado_declarante bit NOT NULL,
--	sw_identificado_declarante   varchar(1)   NOT NULL,
--	telefono varchar(10) NOT NULL,
--	razon_social varchar(40) NOT NULL,
--	cod_presentador_colectivo int NOT NULL,
--	delegacion_hacienda varchar(2) NOT NULL,
--	id_tipo_presentacion int NOT NULL,
--	id_administracion int NOT NULL,
--	volumen_operaciones decimal(18,2),
--	es_representante varchar(1) NOT NULL,
--	cod_valor varchar(12) NOT NULL,
--	id_clave_origen int NOT NULL,
--	id_clave_operacion int NOT NULL,
--	id_clave_traspaso int NOT NULL,
--	id_clave_declarado int NOT NULL,
--	secuencia  varchar(11) NOT NULL,
--	nif_declarado_192 varchar(12) NOT NULL,
--	nif_declarado_no_identificado   varchar(12) NOT NULL,
--	es_contribuyente_declarado bit NOT NULL,
--	id_contribuyente_declarado   int NOT NULL,
--	es_identificado_declarado bit NOT NULL,
--	sw_identificado_declarado    varchar(1) NOT NULL,
--	es_erroneo_declarante bit NOT NULL,
--	id_provincia int NOT NULL,
--	id_pais int NOT NULL,
--	es_historico bit NOT NULL,
--	fecha_presentacion date NOT NULL,
--	mes_presentacion int NOT NULL,
--	anyo_presentacion int  NOT NULL,
--	porc_participacion decimal(7, 2),
--	num_participes decimal(3, 0),
--	importe_transmision decimal(18, 2),
--	fecha_transmision date NOT NULL,
--	mes_transmision int NOT NULL,
--	anyo_transmision int  NOT NULL,
--	id_clave_residencia int NOT NULL,
--	id_clave_declarante int NOT NULL,
--	id_tipo_operacion_192 int NOT NULL,
--	importe_adquisicion decimal(18, 2),
--	fecha_adquisicion date NOT NULL,
--	mes_adquisicion int NOT NULL,
--	anyo_adquisicion int  NOT NULL,
--	es_erroneo_declarado bit NOT NULL,
--	id_tipo_declaracion int NOT NULL,
--	fec_alta datetime,
--	fec_modificacion datetime,
--	fec_baja datetime,
--	CONSTRAINT uk_mi_ds_192_operaciones_letras_tesoro UNIQUE (id_documento,secuencia ),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(id_clave_origen),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_claves_traspaso FOREIGN KEY (id_clave_traspaso) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso(id_clave_traspaso),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(id_clave_declarado),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_residencia FOREIGN KEY (id_clave_residencia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_residencia(id_clave_residencia),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_declarante FOREIGN KEY (id_clave_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_declarante(id_clave_declarante),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipos_operacion_192 FOREIGN KEY (id_tipo_operacion_192) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192(id_tipo_operacion_192),
--	CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
--	CONSTRAINT PK_tbn1_mi_ds_192_operaciones_letras_tesoro PRIMARY KEY CLUSTERED (id_mi_ds_192_operaciones_letras_tesoro)
--)
--GO


--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mi_ds_192_operaciones_letras_tesoro')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_mi_ds_192_operaciones_letras_tesoro int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_documento')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_documento int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_expediente')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_expediente int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_mae_no_id_declarante int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_mae_no_id_declarado int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='ejercicio')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD ejercicio smallint
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='modelo ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD modelo  varchar(3)   
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_externo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_externo bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_192')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarante_192 varchar(12)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_no_identificado  ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarante_no_identificado   varchar(12)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_contribuyente_declarante bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_contribuyente_declarante int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_identificado_declarante bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarante  ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD sw_identificado_declarante   varchar(1)  
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='telefono')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD telefono varchar(10)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='razon_social')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD razon_social varchar(40)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_presentador_colectivo')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD cod_presentador_colectivo int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='delegacion_hacienda')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD delegacion_hacienda varchar(2)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_presentacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_tipo_presentacion int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_administracion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_administracion int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='volumen_operaciones')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD volumen_operaciones decimal(18,2)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_representante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_representante varchar(1)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_valor')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD cod_valor varchar(12)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_origen')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_origen int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_operacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_operacion int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_traspaso')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_traspaso int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_declarado int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='secuencia ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD secuencia  varchar(11)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_192')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarado_192 varchar(12)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_no_identificado  ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD nif_declarado_no_identificado   varchar(12)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_contribuyente_declarado bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarado  ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_contribuyente_declarado   int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_identificado_declarado bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarado   ')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD sw_identificado_declarado    varchar(1)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_erroneo_declarante bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_provincia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_provincia int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_pais')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_pais int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_historico')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_historico bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_presentacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_presentacion date
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_presentacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD mes_presentacion int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_presentacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD anyo_presentacion int 
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='porc_participacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD porc_participacion decimal(7, 2)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='num_participes')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD num_participes decimal(3, 0)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_transmision')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD importe_transmision decimal(18, 2)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_transmision')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_transmision date
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_transmision')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD mes_transmision int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_transmision')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD anyo_transmision int 
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_residencia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_residencia int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_clave_declarante int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_operacion_192')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_tipo_operacion_192 int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_adquisicion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD importe_adquisicion decimal(18, 2)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_adquisicion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fecha_adquisicion date
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_adquisicion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD mes_adquisicion int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_adquisicion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD anyo_adquisicion int 
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD es_erroneo_declarado bit
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_declaracion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD id_tipo_declaracion int
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_alta')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fec_alta datetime
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_modificacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fec_modificacion datetime
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_baja')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD fec_baja datetime
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mi_ds_192_operaciones_letras_tesoro' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_mi_ds_192_operaciones_letras_tesoro int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_documento int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_expediente int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_mae_no_id_declarante int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_mae_no_id_declarado int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN ejercicio smallint NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN modelo  varchar(3)    NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_externo bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_192' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarante_192 varchar(12) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarante_no_identificado  ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarante_no_identificado   varchar(12) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_contribuyente_declarante bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_contribuyente_declarante int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_identificado_declarante bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarante  ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN sw_identificado_declarante   varchar(1)   NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN telefono varchar(10) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN razon_social varchar(40) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN cod_presentador_colectivo int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_tipo_presentacion int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_administracion int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN volumen_operaciones decimal(18,2) NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_representante varchar(1) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='cod_valor' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN cod_valor varchar(12) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_origen' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_origen int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_operacion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_operacion int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_traspaso' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_traspaso int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarado' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_declarado int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='secuencia ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN secuencia  varchar(11) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_192' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarado_192 varchar(12) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='nif_declarado_no_identificado  ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN nif_declarado_no_identificado   varchar(12) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_contribuyente_declarado bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_contribuyente_declarado   int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_identificado_declarado bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_erroneo_declarante bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_provincia int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_pais int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_historico bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_presentacion date NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN mes_presentacion int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN anyo_presentacion int  NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='porc_participacion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN porc_participacion decimal(7, 2) NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='num_participes' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN num_participes decimal(3, 0) NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_transmision' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN importe_transmision decimal(18, 2) NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_transmision' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_transmision date NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_transmision' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN mes_transmision int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_transmision' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN anyo_transmision int  NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_residencia' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_residencia int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_clave_declarante' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_clave_declarante int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_operacion_192' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_tipo_operacion_192 int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='importe_adquisicion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN importe_adquisicion decimal(18, 2) NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fecha_adquisicion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fecha_adquisicion date NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='mes_adquisicion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN mes_adquisicion int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='anyo_adquisicion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN anyo_adquisicion int  NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN es_erroneo_declarado bit NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN id_tipo_declaracion int NOT NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fec_alta datetime NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fec_modificacion datetime NULL
--GO

--IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ALTER COLUMN fec_baja datetime NULL
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_192_operaciones_letras_tesoro')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT PK_tbn1_mi_ds_192_operaciones_letras_tesoro PRIMARY KEY CLUSTERED (id_mi_ds_192_operaciones_letras_tesoro)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_documentos')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_expedientes')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_presentacion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_administracion_hacienda')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_origen')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(id_clave_origen)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_claves_traspaso')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_claves_traspaso FOREIGN KEY (id_clave_traspaso) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso(id_clave_traspaso)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_declarado')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(id_clave_declarado)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes1')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_provincias')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_paises')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_residencia')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_residencia FOREIGN KEY (id_clave_residencia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_residencia(id_clave_residencia)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_declarante')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_claves_declarante FOREIGN KEY (id_clave_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_claves_declarante(id_clave_declarante)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipos_operacion_192')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipos_operacion_192 FOREIGN KEY (id_tipo_operacion_192) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192(id_tipo_operacion_192)
--GO

--IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_192_operaciones_letras_tesoro' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_declaracion')
--ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro ADD CONSTRAINT FK_tbn1_mi_ds_192_operaciones_letras_tesoro_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
--GO

--USE dbn1_stg_dhyf
--GO

--IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro' AND ROUTINE_TYPE='PROCEDURE')
--DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro;
--GO

--CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro(@logpadre int) AS
--BEGIN

--	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_192_operaciones_letras_tesoro'
--	SET NOCOUNT ON;
--	DECLARE @log int;
--	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
--	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
--	DECLARE @continuar_en_caso_error bit=0;
--	IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
--	FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
--	WHERE
--		'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
--		AND excluido=1
--	) BEGIN
--		UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
--			mensaje_error='EXCLUÍDO'
--		WHERE
--			id_log=@log;
--		RETURN
--	END
--		BEGIN TRY


--;WITH
--mae_noid AS 
--(
--        SELECT id_mae_no_identificados,
--                    ejercicio,
--                    clavagru,
--                    clavdeta
--        FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
--        WHERE  aplicacion = 'AF'
--        AND detamodel = '192'
--),
--query AS (
--		SELECT	--top 1000
--					docu.id_documento AS id_documento,
--					e.id_expediente AS id_expediente,
--					--cabe_af
--					cabe.caejercicio AS ejercicio,
--					cabe.careferdoc AS referencia,
--					coalesce(cabe.camodelo,'') AS modelo,

--					coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
--					coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

--					coalesce(cabe.cacifdecl,'') AS nif_declarante_192_11,
--					CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
--					coalesce(left(coalesce(cabe.cacifdecl,''),9)+' '+right(coalesce(cabe.cacifdecl,''),2),'') AS nif_declarante_192,					
--					coalesce(left(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,					
--					CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
--					0 AS es_externo,
--					coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
--					coalesce(cabe.cadh,'') AS delegacion_hacienda,
--					adm_orig.id_administracion AS id_administracion,
--					coalesce(cabe.catelefono,'') AS telefono,
--					coalesce(cabe.capersona,'') AS razon_social,
--					cabe.caenlace AS cod_presentador_colectivo,
--					CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
--					CASE
--						WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
--						WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN 1
--						WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
--						ELSE ''
--					END AS sw_identificado_declarante,
--					coalesce(cabe.cacodentg,'') AS cod_entidad_gestora,
--					tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
--					cabe.cafecpres AS fecha_presentacion,
--					month(cabe.cafecpres) AS mes_presentacion,
--					year(cabe.cafecpres) AS anyo_presentacion,
--					coalesce(cabe.canumcaja,'') AS num_caja,
--					CASE WHEN cabe.caerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante,
--					cabe.caconterror AS num_declarados_erroneos,
--					CASE WHEN cabe.caobserva<>'0' THEN 1 ELSE 0 END AS hay_observaciones,
--					CASE WHEN cabe.cahistorico='1' THEN 1 ELSE 0 END AS es_historico,
--					cabe.cafecalta AS fecha_alta,
--					cabe.cavolumen AS volumen_operaciones,
--					cabe.cajustif AS num_justificante,
--					tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
--					cabe.cajustifsus AS num_justificante_sustitutiva,
--					cabe.cacrevi AS contador_revisiones,
--					--da20_af
--					CAST(declarado.da20secuen AS varchar) AS secuencia,
--					coalesce(declarado.da20cif,'') AS nif_declarado_192_11,
--					CASE WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da20cif,'') ELSE '' END AS nif_declarado_no_identificado_11,
--					coalesce(left(coalesce(declarado.da20cif,''),9)+' '+right(coalesce(declarado.da20cif,''),2),'') AS nif_declarado_192,				
--					coalesce(left(CASE WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da20cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN da20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da20cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
--					CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
--					coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
--					coalesce(declarado.da20represen,'') AS es_representante,
--					prov.id_provincia AS id_provincia,
--					pais.id_pais AS id_pais,
--					resi.id_clave_residencia AS id_clave_residencia,
--					declarado.da20codigovalor AS cod_valor,
--					decl.id_clave_declarante AS id_clave_declarante,
--					oper.id_tipo_operacion_192 AS id_tipo_operacion_192,
--					declarado.da20nroparticipes AS num_participes,
--					declarado.da20nroorden AS orden,
--					clv_origen.id_clave_origen AS id_clave_origen,
--					clv_ope.id_clave_operacion_192 AS id_clave_operacion,
--					declarado.da20porcentaje/100 AS porc_participacion,
--					tras.id_clave_traspaso AS id_clave_traspaso,
--					clv_decl.id_clave_declarado AS id_clave_declarado,
--					declarado.da20fecalta AS fecha_adquisicion,
--					month(declarado.da20fecalta) AS mes_adquisicion,
--					year(declarado.da20fecalta) AS anyo_adquisicion,
--					cast(declarado.da20impalta/100 as decimal(18,2)) AS importe_adquisicion,
--					declarado.da20fecbaja AS fecha_transmision,
--					month(declarado.da20fecbaja) AS mes_transmision,
--					year(declarado.da20fecbaja) AS anyo_transmision,
--					cast(declarado.da20impbaja/100 as decimal(18,2)) AS importe_transmision,
--					CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
--					CASE
--						WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
--						WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=0 THEN 1
--						WHEN CASE WHEN declarado.da20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
--						ELSE ''
--					END AS sw_identificado_declarado,
--					CASE WHEN da20error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado
--			FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_af WHERE camodelo='192') cabe
--					--no_identificados_declarante
--					LEFT JOIN	mae_noid mae_noid_cabe
--							ON	cabe.caejercicio = mae_noid_cabe.ejercicio
--							AND cast(cabe.careferdoc as varchar) = mae_noid_cabe.clavagru
--							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
--					--declarados
--					INNER JOIN dbn1_stg_dhyf.dbo.tbn120da_af declarado
--							ON	cabe.caejercicio = declarado.da20ejercicio
--							AND cabe.camodelo = '192'
--							AND cabe.careferdoc = declarado.da20referdoc
--					--no_identificados_declarado
--					LEFT JOIN	mae_noid mae_noid_det
--							ON	cabe.caejercicio = mae_noid_det.ejercicio
--							AND cast(cabe.careferdoc as varchar) = mae_noid_det.clavagru
--							AND right('0000000000000' +  cast(declarado.da20secuen  as varchar) , 13)=  mae_noid_det.clavdeta 
--					--documentos
--					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
--							ON docu.referencia = CAST(cabe.caejercicio AS varchar)+'AO'+CAST(cabe.careferdoc AS varchar)+'00K0000'
--					--expedientes
--					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
--							ON docu.id_expediente=e.id_expediente
--					--buscar los nif en contribuyentes (para declarante y declarados)
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
--							ON cabe.cacifdecl=c.nif_maestro 
--							AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
--							ON declarado.da20cif=d.nif_maestro 
--							AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
--					--LEFT JOIN con cada maestro
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_orig 
--							ON adm_orig.cod_administracion = coalesce('B',cabe.caadmonhaci)
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres 
--							ON tipo_pres.cod_tipo_presentacion = cabe.catippres
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl 
--							ON tipo_decl.cod_tipo_declaracion = cabe.catipodecl
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
--							ON prov.cod_provincia = declarado.da20provin
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais 
--							ON pais.cod_pais = declarado.da20pais
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_residencia resi
--							ON resi.cod_clave_residencia = declarado.da20clresidencia
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_declarante decl
--							ON decl.cod_clave_declarante = declarado.da20cldeclarante
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 oper
--							ON oper.cod_tipo_operacion_192 = declarado.da20tipooper
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen clv_origen 
--							ON clv_origen.cod_clave_origen = declarado.da20clorigen
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 clv_ope 
--							ON clv_ope.cod_clave_operacion_192 = declarado.da20cloperacion
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso tras
--							ON tras.cod_clave_traspaso = declarado.da20cltraspaso
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado clv_decl 
--							ON clv_decl.cod_clave_declarado = declarado.da20cldeclarado
--					CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

--		UNION ALL

--			SELECT	--top 1000
--					docu.id_documento AS id_documento,
--					e.id_expediente AS id_expediente,
--					--i3ca_af
--					cabe.cxejercicio AS ejercicio,
--					cabe.cxreferdoc AS referencia,
--					coalesce(cabe.cxmodelo,'') AS modelo,

--					coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
--					coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

--					coalesce(cabe.cxcifdecl,'') AS nif_declarante_192_11,
--					CASE WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cxcifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
--					coalesce(left(coalesce(cabe.cxcifdecl,''),9)+' '+right(coalesce(cabe.cxcifdecl,''),2),'') AS nif_declarante_192,
--					coalesce(left(CASE WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cxcifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cxcifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
--					CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
--					1 AS es_externo,
--					coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
--					'' AS delegacion_hacienda, --no existe para externos
--					adm_orig.id_administracion AS id_administracion,
--					'' AS telefono, --no existe para externos
--					'' AS razon_social, --no existe para externos
--					0 AS cod_presentador_colectivo, --no existe para externos
--					CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
--					CASE
--						WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
--						WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=0 THEN 1
--						WHEN CASE WHEN cabe.cxidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
--						ELSE ''
--					END AS sw_identificado_declarante,
--					'' AS cod_entidad_gestora, --no existe para externos
--					-1 AS id_tipo_presentacion, --no existe para externos
--					CAST('21000101' AS datetime) AS fecha_presentacion, --no existe para externos
--					month(CAST('21000101' AS datetime)) AS mes_presentacion, --no existe para externos
--					year(CAST('21000101' AS datetime)) AS anyo_presentacion, --no existe para externos
--					NULL AS num_caja, --no existe para externos
--					CASE WHEN cabe.cxerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante,
--					cabe.cxconterror AS num_declarados_erroneos,
--					0 AS hay_observaciones, --no existe para externos
--					0 AS es_historico, --no existe para externos
--					cabe.cxfecalta AS fecha_alta,
--					NULL AS volumen_operaciones, --no existe para externos
--					NULL AS num_justificante, --no existe para externos
--					-1 AS id_tipo_declaracion, --no existe para externos
--					NULL AS num_justificante_sustitutiva, --no existe para externos
--					NULL AS contador_revisiones, --no existe para externos
--					--8xpe_af
--					CAST(declarado.px20nropte AS varchar) AS secuencia,
--					coalesce(declarado.px20cif,'') AS nif_declarado_192_11,
--					CASE WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px20cif,'') ELSE '' END AS nif_declarado_no_identificado_11,
--					coalesce(left(coalesce(declarado.px20cif,''),9)+' '+right(coalesce(declarado.px20cif,''),2),'') AS nif_declarado_192,				
--					coalesce(left(CASE WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px20cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px20cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
--					CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
--					coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
--					coalesce(declarado.px20represen,'') AS es_representante,
--					prov.id_provincia AS id_provincia,
--					pais.id_pais AS id_pais,
--					resi.id_clave_residencia AS id_clave_residencia,
--					declarado.px20codigovalor AS cod_valor,
--					decl.id_clave_declarante AS id_clave_declarante,
--					oper.id_tipo_operacion_192 AS id_tipo_operacion_192,
--					declarado.px20nroparticipes AS num_participes,
--					declarado.px20nroorden AS orden,
--					clv_origen.id_clave_origen AS id_clave_origen,
--					clv_ope.id_clave_operacion_192 AS id_clave_operacion,
--					declarado.px20porcentaje/100 AS porc_participacion,
--					tras.id_clave_traspaso AS id_clave_traspaso,
--					clv_decl.id_clave_declarado AS id_clave_declarado,
--					declarado.px20fecalta AS fecha_adquisicion,
--					month(declarado.px20fecalta) AS mes_adquisicion,
--					year(declarado.px20fecalta) AS anyo_adquisicion,
--					cast(declarado.px20impalta/100 as decimal(18,2)) AS importe_adquisicion,
--					declarado.px20fecbaja AS fecha_transmision,
--					month(declarado.px20fecbaja) AS mes_transmision,
--					year(declarado.px20fecbaja) AS anyo_transmision,
--					cast(declarado.px20impbaja/100 as decimal(18,2)) AS importe_transmision,
--					CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
--					CASE
--						WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
--						WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=0 THEN 1
--						WHEN CASE WHEN declarado.px20identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
--						ELSE ''
--					END AS sw_identificado_declarado,
--					CASE WHEN declarado.px20error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado
--			FROM	(SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3ca_af WHERE cxmodelo='192') cabe
--					--no_identificados_declarante
--					LEFT JOIN	mae_noid mae_noid_cabe
--							ON	cabe.cxejercicio = mae_noid_cabe.ejercicio
--							AND cast(cabe.cxreferdoc as varchar) = mae_noid_cabe.clavagru
--							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
--					--declarados
--					INNER JOIN dbn1_stg_dhyf.dbo.tbn12xpe_af declarado
--							ON	cabe.cxejercicio = declarado.px20ejercicio 
--							AND	cabe.cxmodelo = '192'
--							AND cabe.cxreferdoc = declarado.px20referdoc
--							AND cabe.cxadmon = declarado.px20admon
--					--no_identificados_declarado
--					LEFT JOIN	mae_noid mae_noid_det
--							ON	cabe.cxejercicio = mae_noid_det.ejercicio
--							AND cast(cabe.cxreferdoc as varchar) = mae_noid_det.clavagru
--							AND right('0000000000000' +  cast(declarado.px20nropte  as varchar) , 13)=  mae_noid_det.clavdeta 
--					--documentos
--					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
--							ON docu.referencia = CAST(cabe.cxejercicio AS varchar)+'AO'+CAST(cabe.cxreferdoc AS varchar)+'00K0000'
--					--expedientes
--					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
--							ON docu.id_expediente = e.id_expediente
--					--buscar los nif en contribuyentes (para declarante y declarados)
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
--							ON	cabe.cxcifdecl = c.nif_maestro 
--							AND c.fec_fin_vigencia = CAST('21000101' AS datetime)
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
--							ON	declarado.px20cif = d.nif_maestro 
--							AND d.fec_fin_vigencia = CAST('21000101' AS datetime)
--					--LEFT JOIN con cada maestro
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_orig 
--							ON adm_orig.cod_administracion = coalesce('B',cabe.cxadmon)
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
--							ON prov.cod_provincia = declarado.px20provin
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais 
--							ON pais.cod_pais = declarado.px20pais
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_residencia resi
--							ON resi.cod_clave_residencia = declarado.px20clresidencia
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_claves_declarante decl
--							ON decl.cod_clave_declarante = declarado.px20cldeclarante
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192 oper
--							ON oper.cod_tipo_operacion_192 = declarado.px20tipooper
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen clv_origen 
--							ON clv_origen.cod_clave_origen = declarado.px20clorigen
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192 clv_ope 
--							ON clv_ope.cod_clave_operacion_192 = declarado.px20cloperacion
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso tras
--							ON tras.cod_clave_traspaso = declarado.px20cltraspaso
--					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado clv_decl 
--							ON clv_decl.cod_clave_declarado = declarado.px20cldeclarado
--					CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

--	)
--	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_192_operaciones_letras_tesoro AS tbn1_mi_ds_192_operaciones_letras_tesoro
--	USING query ON query.id_documento=tbn1_mi_ds_192_operaciones_letras_tesoro.id_documento AND query.secuencia =tbn1_mi_ds_192_operaciones_letras_tesoro.secuencia 
--	WHEN MATCHED AND ((tbn1_mi_ds_192_operaciones_letras_tesoro.id_expediente<>query.id_expediente OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.ejercicio<>query.ejercicio OR (tbn1_mi_ds_192_operaciones_letras_tesoro.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.modelo <>query.modelo  OR (tbn1_mi_ds_192_operaciones_letras_tesoro.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.modelo  IS NOT NULL AND query.modelo  IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_externo<>query.es_externo OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_externo IS NULL AND query.es_externo IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_externo IS NOT NULL AND query.es_externo IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_192<>query.nif_declarante_192 OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_192 IS NULL AND query.nif_declarante_192 IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_192 IS NOT NULL AND query.nif_declarante_192 IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_no_identificado  <>query.nif_declarante_no_identificado   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_no_identificado   IS NULL AND query.nif_declarante_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarante_no_identificado   IS NOT NULL AND query.nif_declarante_no_identificado   IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarante  <>query.sw_identificado_declarante   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarante   IS NULL AND query.sw_identificado_declarante   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarante   IS NOT NULL AND query.sw_identificado_declarante   IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.telefono<>query.telefono OR (tbn1_mi_ds_192_operaciones_letras_tesoro.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.telefono IS NOT NULL AND query.telefono IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.razon_social<>query.razon_social OR (tbn1_mi_ds_192_operaciones_letras_tesoro.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.razon_social IS NOT NULL AND query.razon_social IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_mi_ds_192_operaciones_letras_tesoro.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_administracion<>query.id_administracion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_administracion IS NULL AND query.id_administracion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_ds_192_operaciones_letras_tesoro.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_representante<>query.es_representante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_representante IS NULL AND query.es_representante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_representante IS NOT NULL AND query.es_representante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.cod_valor<>query.cod_valor OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_valor IS NULL AND query.cod_valor IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.cod_valor IS NOT NULL AND query.cod_valor IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_origen<>query.id_clave_origen OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_origen IS NULL AND query.id_clave_origen IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_origen IS NOT NULL AND query.id_clave_origen IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_operacion<>query.id_clave_operacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_operacion IS NULL AND query.id_clave_operacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_operacion IS NOT NULL AND query.id_clave_operacion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_traspaso<>query.id_clave_traspaso OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_traspaso IS NULL AND query.id_clave_traspaso IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_traspaso IS NOT NULL AND query.id_clave_traspaso IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarado<>query.id_clave_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarado IS NULL AND query.id_clave_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarado IS NOT NULL AND query.id_clave_declarado IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_192<>query.nif_declarado_192 OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_192 IS NULL AND query.nif_declarado_192 IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_192 IS NOT NULL AND query.nif_declarado_192 IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_no_identificado  <>query.nif_declarado_no_identificado   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_no_identificado   IS NULL AND query.nif_declarado_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.nif_declarado_no_identificado   IS NOT NULL AND query.nif_declarado_no_identificado   IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarante<>query.es_erroneo_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarante IS NULL AND query.es_erroneo_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarante IS NOT NULL AND query.es_erroneo_declarante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_provincia<>query.id_provincia OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_pais<>query.id_pais OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_pais IS NOT NULL AND query.id_pais IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_historico<>query.es_historico OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_historico IS NULL AND query.es_historico IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_historico IS NOT NULL AND query.es_historico IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.porc_participacion<>query.porc_participacion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.num_participes<>query.num_participes OR (tbn1_mi_ds_192_operaciones_letras_tesoro.num_participes IS NULL AND query.num_participes IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.num_participes IS NOT NULL AND query.num_participes IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.importe_transmision<>query.importe_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_transmision IS NULL AND query.importe_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_transmision IS NOT NULL AND query.importe_transmision IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_transmision<>query.fecha_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_transmision IS NULL AND query.fecha_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_transmision IS NOT NULL AND query.fecha_transmision IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.mes_transmision<>query.mes_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_transmision IS NULL AND query.mes_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_transmision IS NOT NULL AND query.mes_transmision IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_transmision<>query.anyo_transmision OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_transmision IS NULL AND query.anyo_transmision IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_transmision IS NOT NULL AND query.anyo_transmision IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_residencia<>query.id_clave_residencia OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_residencia IS NULL AND query.id_clave_residencia IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_residencia IS NOT NULL AND query.id_clave_residencia IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarante<>query.id_clave_declarante OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarante IS NULL AND query.id_clave_declarante IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_clave_declarante IS NOT NULL AND query.id_clave_declarante IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_operacion_192<>query.id_tipo_operacion_192 OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_operacion_192 IS NULL AND query.id_tipo_operacion_192 IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_operacion_192 IS NOT NULL AND query.id_tipo_operacion_192 IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.importe_adquisicion<>query.importe_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_adquisicion IS NULL AND query.importe_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.importe_adquisicion IS NOT NULL AND query.importe_adquisicion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_adquisicion<>query.fecha_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_adquisicion IS NULL AND query.fecha_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.fecha_adquisicion IS NOT NULL AND query.fecha_adquisicion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.mes_adquisicion<>query.mes_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_adquisicion IS NULL AND query.mes_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.mes_adquisicion IS NOT NULL AND query.mes_adquisicion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_adquisicion<>query.anyo_adquisicion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_adquisicion IS NULL AND query.anyo_adquisicion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.anyo_adquisicion IS NOT NULL AND query.anyo_adquisicion IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarado<>query.es_erroneo_declarado OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
--			OR tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_192_operaciones_letras_tesoro.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL) OR (fec_baja IS NOT NULL))) THEN
--		UPDATE SET
--			fec_modificacion=getdate(),
--			fec_baja=null,
--			id_expediente=query.id_expediente,
--			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
--			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
--			ejercicio=query.ejercicio,
--			modelo =query.modelo ,
--			es_externo=query.es_externo,
--			nif_declarante_192=query.nif_declarante_192,
--			nif_declarante_no_identificado  =query.nif_declarante_no_identificado  ,
--			es_contribuyente_declarante=query.es_contribuyente_declarante,
--			id_contribuyente_declarante=query.id_contribuyente_declarante,
--			es_identificado_declarante=query.es_identificado_declarante,
--			sw_identificado_declarante  =query.sw_identificado_declarante  ,
--			telefono=query.telefono,
--			razon_social=query.razon_social,
--			cod_presentador_colectivo=query.cod_presentador_colectivo,
--			delegacion_hacienda=query.delegacion_hacienda,
--			id_tipo_presentacion=query.id_tipo_presentacion,
--			id_administracion=query.id_administracion,
--			volumen_operaciones=query.volumen_operaciones,
--			es_representante=query.es_representante,
--			cod_valor=query.cod_valor,
--			id_clave_origen=query.id_clave_origen,
--			id_clave_operacion=query.id_clave_operacion,
--			id_clave_traspaso=query.id_clave_traspaso,
--			id_clave_declarado=query.id_clave_declarado,
--			nif_declarado_192=query.nif_declarado_192,
--			nif_declarado_no_identificado  =query.nif_declarado_no_identificado  ,
--			es_contribuyente_declarado=query.es_contribuyente_declarado,
--			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
--			es_identificado_declarado=query.es_identificado_declarado,
--			sw_identificado_declarado   =query.sw_identificado_declarado   ,
--			es_erroneo_declarante=query.es_erroneo_declarante,
--			id_provincia=query.id_provincia,
--			id_pais=query.id_pais,
--			es_historico=query.es_historico,
--			fecha_presentacion=query.fecha_presentacion,
--			mes_presentacion=query.mes_presentacion,
--			anyo_presentacion=query.anyo_presentacion,
--			porc_participacion=query.porc_participacion,
--			num_participes=query.num_participes,
--			importe_transmision=query.importe_transmision,
--			fecha_transmision=query.fecha_transmision,
--			mes_transmision=query.mes_transmision,
--			anyo_transmision=query.anyo_transmision,
--			id_clave_residencia=query.id_clave_residencia,
--			id_clave_declarante=query.id_clave_declarante,
--			id_tipo_operacion_192=query.id_tipo_operacion_192,
--			importe_adquisicion=query.importe_adquisicion,
--			fecha_adquisicion=query.fecha_adquisicion,
--			mes_adquisicion=query.mes_adquisicion,
--			anyo_adquisicion=query.anyo_adquisicion,
--			es_erroneo_declarado=query.es_erroneo_declarado,
--			id_tipo_declaracion=query.id_tipo_declaracion
--	WHEN NOT MATCHED THEN
--		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,es_externo,nif_declarante_192,nif_declarante_no_identificado  ,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,telefono,razon_social,cod_presentador_colectivo,delegacion_hacienda,id_tipo_presentacion,id_administracion,volumen_operaciones,es_representante,cod_valor,id_clave_origen,id_clave_operacion,id_clave_traspaso,id_clave_declarado,secuencia ,nif_declarado_192,nif_declarado_no_identificado  ,es_contribuyente_declarado,id_contribuyente_declarado  ,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo_declarante,id_provincia,id_pais,es_historico,fecha_presentacion,mes_presentacion,anyo_presentacion,porc_participacion,num_participes,importe_transmision,fecha_transmision,mes_transmision,anyo_transmision,id_clave_residencia,id_clave_declarante,id_tipo_operacion_192,importe_adquisicion,fecha_adquisicion,mes_adquisicion,anyo_adquisicion,es_erroneo_declarado,id_tipo_declaracion) VALUES (
--			getdate(),
--			getdate(),
--			query.id_documento,
--			query.id_expediente,
--			query.id_mae_no_id_declarante,
--			query.id_mae_no_id_declarado,
--			query.ejercicio,
--			query.modelo ,
--			query.es_externo,
--			query.nif_declarante_192,
--			query.nif_declarante_no_identificado  ,
--			query.es_contribuyente_declarante,
--			query.id_contribuyente_declarante,
--			query.es_identificado_declarante,
--			query.sw_identificado_declarante  ,
--			query.telefono,
--			query.razon_social,
--			query.cod_presentador_colectivo,
--			query.delegacion_hacienda,
--			query.id_tipo_presentacion,
--			query.id_administracion,
--			query.volumen_operaciones,
--			query.es_representante,
--			query.cod_valor,
--			query.id_clave_origen,
--			query.id_clave_operacion,
--			query.id_clave_traspaso,
--			query.id_clave_declarado,
--			query.secuencia ,
--			query.nif_declarado_192,
--			query.nif_declarado_no_identificado  ,
--			query.es_contribuyente_declarado,
--			query.id_contribuyente_declarado  ,
--			query.es_identificado_declarado,
--			query.sw_identificado_declarado   ,
--			query.es_erroneo_declarante,
--			query.id_provincia,
--			query.id_pais,
--			query.es_historico,
--			query.fecha_presentacion,
--			query.mes_presentacion,
--			query.anyo_presentacion,
--			query.porc_participacion,
--			query.num_participes,
--			query.importe_transmision,
--			query.fecha_transmision,
--			query.mes_transmision,
--			query.anyo_transmision,
--			query.id_clave_residencia,
--			query.id_clave_declarante,
--			query.id_tipo_operacion_192,
--			query.importe_adquisicion,
--			query.fecha_adquisicion,
--			query.mes_adquisicion,
--			query.anyo_adquisicion,
--			query.es_erroneo_declarado,
--			query.id_tipo_declaracion
--			)
--	WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
--		UPDATE SET
--			fec_baja=getdate(),
--			fec_modificacion=getdate();
--	EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
--		END TRY
--	BEGIN CATCH
--		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
--		UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
--			mensaje_error=error_message(),
--			procedimiento_error=error_procedure()
--		WHERE
--			id_log=@log;
--		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
--	END CATCH

--END

--GO



--/****************/
--/*SP PADRE CARGA*/
--/****************/

----USE dbn1_stg_dhyf
----GO

----IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_ds_192_operaciones_letras_tesoro' AND ROUTINE_TYPE='PROCEDURE')
----DROP PROCEDURE dbo.spn1_cargar_mi_ds_192_operaciones_letras_tesoro;
----GO

----CREATE PROCEDURE dbo.spn1_cargar_mi_ds_192_operaciones_letras_tesoro(@logpadre int) AS
----BEGIN

----  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_ds_192_operaciones_letras_tesoro'
----  SET NOCOUNT ON;
----  DECLARE @log int;
----  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
----  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
----  DECLARE @continuar_en_caso_error bit=0;
----  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
----  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
----  WHERE
----    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
----    AND excluido=1
----  ) BEGIN
----    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
----      mensaje_error='EXCLUÍDO'
----    WHERE
----      id_log=@log;
----    RETURN
----  END
----     BEGIN TRY

----  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ds_modelo_192_INTERNOS @log;
----  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_ds_192_EXTERNOS @log;

----  EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
----   END TRY
----  BEGIN CATCH
----    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
----    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
----      mensaje_error=error_message(),
----      procedimiento_error=error_procedure()
----    WHERE
----      id_log=@log;
----    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
----  END CATCH

----END
----GO

--/**********************/
--/*FIN - SP PADRE CARGA*/
--/**********************/