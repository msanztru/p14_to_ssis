PRINT 'normalizado_mi_189_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas(
	id_mi_ds_189_valores_seguros_y_rentas int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	id_administracion_declarante int NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_189_11 varchar(12) NOT NULL,
	nif_declarante_189 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	nif_declarante_no_identificado_11 varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante   varchar(1) NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	cod_banco_espania varchar(4) NOT NULL,
	id_tipo_soporte int NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion  int NOT NULL,
	num_caja varchar(8) NOT NULL,
	fecha_alta date NOT NULL,
	mes_alta int NOT NULL,
	anyo_alta int NOT NULL,
	num_justificante numeric(13) NOT NULL,
	id_tipo_declaracion int NOT NULL,
	contador_revisiones int NOT NULL,
	regimen_fiscal_deducciones varchar(1) NOT NULL,
	administracion_declarado varchar(1) NOT NULL,
	es_externo_declarado bit NOT NULL,
	nif_declarado_189_11 varchar(12) NOT NULL,
	nif_declarado_189 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	nif_declarado_no_identificado_11 varchar(12) NOT NULL,
	secuencia  varchar(9) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	es_erroneo bit NOT NULL,
	id_provincia int NOT NULL,
	id_clave_mercado int NOT NULL,
	id_clave_valor_189 int NOT NULL,
	id_clave_identificacion_189 int NOT NULL,
	id_clave_representacion int NOT NULL,
	valor_identificacion varchar(12) NOT NULL,
	id_pais int NOT NULL,
	id_tipo_importe int NOT NULL,
	importe numeric(18,2),
	num_valores decimal(18,0),
	porcentaje_participacion decimal(7,2),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_189_valores_seguros_y_rentas UNIQUE (id_documento,secuencia ,id_tipo_importe),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_clave_mercado FOREIGN KEY (id_clave_mercado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado(id_clave_mercado),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_claves_valor_189 FOREIGN KEY (id_clave_valor_189) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189(id_clave_valor_189),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_claves_identificacion_189 FOREIGN KEY (id_clave_identificacion_189) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189(id_clave_identificacion_189),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_clave_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(id_clave_representacion),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_ds_189_valores_seguros_y_rentas PRIMARY KEY CLUSTERED (id_mi_ds_189_valores_seguros_y_rentas)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_mi_ds_189_valores_seguros_y_rentas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_mi_ds_189_valores_seguros_y_rentas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_189_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarante_189_11 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarante_189 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarante_no_identificado_11 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='sw_identificado_declarante  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD sw_identificado_declarante   varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD cod_banco_espania varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD num_justificante numeric(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD contador_revisiones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_189_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarado_189_11 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarado_189 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD nif_declarado_no_identificado_11 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='secuencia ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD secuencia  varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD es_erroneo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_clave_mercado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_valor_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_clave_valor_189 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_identificacion_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_clave_identificacion_189 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_clave_representacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='valor_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD valor_identificacion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD id_tipo_importe int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD importe numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='num_valores')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD num_valores decimal(18,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD porcentaje_participacion decimal(7,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_mi_ds_189_valores_seguros_y_rentas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_mi_ds_189_valores_seguros_y_rentas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_administracion_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_189_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarante_189_11 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarante_189 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarante_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarante_no_identificado_11 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='sw_identificado_declarante  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN sw_identificado_declarante   varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN cod_banco_espania varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN num_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN num_justificante numeric(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN contador_revisiones int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_189_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarado_189_11 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarado_189 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='nif_declarado_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN nif_declarado_no_identificado_11 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='secuencia ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN secuencia  varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN es_erroneo bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_mercado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_clave_mercado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_valor_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_clave_valor_189 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_identificacion_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_clave_identificacion_189 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_clave_representacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_clave_representacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='valor_identificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN valor_identificacion varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN importe numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='num_valores' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN num_valores decimal(18,0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN porcentaje_participacion decimal(7,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_189_valores_seguros_y_rentas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT PK_tbn1_mi_ds_189_valores_seguros_y_rentas PRIMARY KEY CLUSTERED (id_mi_ds_189_valores_seguros_y_rentas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_clave_mercado FOREIGN KEY (id_clave_mercado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado(id_clave_mercado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_claves_valor_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_claves_valor_189 FOREIGN KEY (id_clave_valor_189) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189(id_clave_valor_189)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_claves_identificacion_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_claves_identificacion_189 FOREIGN KEY (id_clave_identificacion_189) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189(id_clave_identificacion_189)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_clave_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(id_clave_representacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_189_valores_seguros_y_rentas' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas ADD CONSTRAINT FK_tbn1_mi_ds_189_valores_seguros_y_rentas_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_189_valores_seguros_y_rentas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_189_valores_seguros_y_rentas;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_189_valores_seguros_y_rentas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_189_valores_seguros_y_rentas'
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
	WHERE	aplicacion = 'MF'
	AND		detamodel = '189'
),

query AS
(
	SELECT	doc.id_documento AS id_documento,
			e.id_expediente AS id_expediente,
			cabe.cabe_ejercicio AS ejercicio,
			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
			coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
			cabe.cabe_modelo AS modelo,
			cabe.cabe_admon AS administracion_declarante,
			adm_dnte.id_administracion AS id_administracion_declarante,
			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
			cabe.cabe_cifdecl AS nif_declarante_189_11,
			CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
			coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarante,
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
			cabe.cabe_telefono AS telefono,
			cabe.cabe_persona AS razon_social,
			cabe.cabe_refpres AS cod_presentador_colectivo,
			cabe.cabe_banco AS cod_banco_espania,
			sopo.id_tipo_soporte AS id_tipo_soporte,
			cabe.cabe_fecpres AS fecha_presentacion,
			month(cabe.cabe_fecpres) AS mes_presentacion,
			year(cabe.cabe_fecpres) AS anyo_presentacion,
			cabe.cabe_numcaja AS num_caja,
			cabe.cabe_fecalta AS fecha_alta,
			MONTH(cabe.cabe_fecalta) AS mes_alta,
			YEAR(cabe.cabe_fecalta) AS anyo_alta,
			cabe.cabe_justif AS num_justificante,
			decl.id_tipo_declaracion AS id_tipo_declaracion,
			cabe.cabe_crevi AS contador_revisiones,
			cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
			pe89.mfpe89_admon AS administracion_declarado,
			CASE WHEN pe89.mfpe89_admon='B' THEN 0 ELSE 1 END AS es_externo_declarado,
			CAST(pe89.mfpe89_secuen AS varchar) AS secuencia,
			pe89.mfpe89_cif AS nif_declarado_189_11,
			CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
			coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
			CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
			CASE
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarado,
			CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END AS nif_declarado_no_identificado_11,
			prov.id_provincia AS id_provincia,
			pais.id_pais AS id_pais,
			merc.id_clave_mercado AS id_clave_mercado,
			valo.id_clave_valor_189 AS id_clave_valor_189,
			iden.id_clave_identificacion_189 AS id_clave_identificacion_189,
			mfpe89_ident_valor AS valor_identificacion,
			repr.id_clave_representacion AS id_clave_representacion,
			mfpe89_nro_valores AS num_valores,
			round(mfpe89_particip/100,2) AS porcentaje_participacion,
			CASE pe89.mfpe89_error WHEN '1' THEN 1 ELSE 0 END AS es_erroneo,
			impo.id_tipo_importe AS id_tipo_importe,
			round(mfim89_importe/100,2) AS importe,
			coalesce(left(cabe.cabe_cifdecl,9)+' '+right(cabe.cabe_cifdecl,2),'') AS nif_declarante_189,
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
			coalesce(left(pe89.mfpe89_cif,9)+' '+right(pe89.mfpe89_cif,2),'') AS nif_declarado_189,
			coalesce(left(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,2),'') AS nif_declarado_no_identificado
	FROM	(SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='189') cabe 
			--no_identificados_declarante
			LEFT JOIN mae_noid mae_noid_cabe 
					ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
					AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
					AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
			INNER JOIN dbn1_stg_dhyf.dbo.tbn1pe89_mf pe89 
					ON cabe.cabe_ejercicio=pe89.mfpe89_ejercicio 
					AND cabe.cabe_modelo='189' 
					AND cabe.cabe_referdoc=pe89.mfpe89_referdoc
			--no_identificados_declarado
			LEFT JOIN	mae_noid  mae_noid_det
					ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
					AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_det.clavagru
					AND right('0000000000000' +  cast(pe89.mfpe89_secuen as varchar) , 13) = mae_noid_det.clavdeta 
			INNER JOIN	dbn1_stg_dhyf.dbo.tbn1im89_mf im89 
					ON	pe89.mfpe89_ejercicio = im89.mfim89_ejercicio 
					AND pe89.mfpe89_admon = im89.mfim89_admon 
					AND pe89.mfpe89_referdoc = im89.mfim89_referdoc 
					AND pe89.mfpe89_secuen = im89.mfim89_secuen
			INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON	CAST(cabe.cabe_ejercicio AS varchar)+'D['+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'=doc.referencia
					AND	doc.marca_baja IS NULL
					AND	doc.fec_baja IS NULL 
			INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON	doc.id_expediente = e.id_expediente
					AND	e.fec_baja IS NULL
			LEFT JOIN	dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante 
					ON	cabe.cabe_cifdecl = c_declarante.nif_maestro 
					AND c_declarante.fec_fin_vigencia = CAST('21000101' AS datetime)
			LEFT JOIN	dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado 
					ON	pe89.mfpe89_cif = c_declarado.nif_maestro 
					AND c_declarado.fec_fin_vigencia = CAST('21000101' AS datetime)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion decl 
					ON	decl.cod_tipo_declaracion=cabe.cabe_tipodecl
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte sopo 
					ON	sopo.cod_tipo_soporte=cabe.cabe_tiposoporte
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
					ON	pe89.mfpe89_provincia=prov.cod_provincia
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais 
					ON	pe89.mfpe89_pais=pais.cod_pais
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado merc 
					ON	pe89.mfpe89_clv_mercado=merc.cod_clave_mercado
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 valo 
					ON	pe89.mfpe89_clv_valor=valo.cod_clave_valor_189
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 iden 
					ON	pe89.mfpe89_clv_ident=iden.cod_clave_identificacion_189
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion repr 
					ON	pe89.mfpe89_clv_represe=repr.cod_clave_representacion
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe impo 
					ON	im89.mfim89_tipo=impo.cod_tipo_importe
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_dnte
					ON	cabe.cabe_admon = adm_dnte.cod_administracion
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	GROUP BY
			doc.id_documento,
			e.id_expediente,
			cabe.cabe_ejercicio,
			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) ,
			coalesce(mae_noid_det.id_mae_no_identificados,-1) ,
			cabe.cabe_modelo,
			cabe.cabe_admon,
			adm_dnte.id_administracion,
			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END,
			cabe.cabe_cifdecl,
			CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
			coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente),
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END,
			CASE
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END,
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,
			cabe.cabe_telefono,
			cabe.cabe_persona,
			cabe.cabe_refpres,
			cabe.cabe_banco,
			sopo.id_tipo_soporte,
			cabe.cabe_fecpres,
			month(cabe.cabe_fecpres),
			year(cabe.cabe_fecpres),
			cabe.cabe_numcaja,
			cabe_fecalta,
			cabe.cabe_justif,
			decl.id_tipo_declaracion,
			cabe.cabe_crevi,
			cabe.cabe_regfiscal,
			pe89.mfpe89_admon,
			CASE WHEN pe89.mfpe89_admon='B' THEN 0 ELSE 1 END,
			CAST(pe89.mfpe89_secuen AS varchar),
			pe89.mfpe89_cif,
			CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END,
			coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
			CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END,
			CASE
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
				ELSE ''
			END,
			CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,
			prov.id_provincia,
			pais.id_pais,
			merc.id_clave_mercado,
			valo.id_clave_valor_189,
			iden.id_clave_identificacion_189,
			mfpe89_ident_valor,
			repr.id_clave_representacion,
			mfpe89_nro_valores,
			mfpe89_particip,
			CASE pe89.mfpe89_error WHEN '1' THEN 1 ELSE 0 END,
			impo.id_tipo_importe,
			round(mfim89_importe/100,2),
			coalesce(left(cabe.cabe_cifdecl,9)+' '+right(cabe.cabe_cifdecl,2),''),
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),''),
			coalesce(left(pe89.mfpe89_cif,9)+' '+right(pe89.mfpe89_cif,2),''),
			coalesce(left(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,2),'')
)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_189_valores_seguros_y_rentas AS tbn1_mi_ds_189_valores_seguros_y_rentas
	USING query ON query.id_documento=tbn1_mi_ds_189_valores_seguros_y_rentas.id_documento AND query.secuencia =tbn1_mi_ds_189_valores_seguros_y_rentas.secuencia  AND query.id_tipo_importe=tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_importe
	WHEN MATCHED AND ((tbn1_mi_ds_189_valores_seguros_y_rentas.id_expediente<>query.id_expediente OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.ejercicio<>query.ejercicio OR (tbn1_mi_ds_189_valores_seguros_y_rentas.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.modelo <>query.modelo  OR (tbn1_mi_ds_189_valores_seguros_y_rentas.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.administracion_declarante<>query.administracion_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_administracion_declarante<>query.id_administracion_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_administracion_declarante IS NULL AND query.id_administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_administracion_declarante IS NOT NULL AND query.id_administracion_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_189_11<>query.nif_declarante_189_11 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_189_11 IS NULL AND query.nif_declarante_189_11 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_189_11 IS NOT NULL AND query.nif_declarante_189_11 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_189<>query.nif_declarante_189 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_189 IS NULL AND query.nif_declarante_189 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_189 IS NOT NULL AND query.nif_declarante_189 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_no_identificado_11<>query.nif_declarante_no_identificado_11 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_no_identificado_11 IS NULL AND query.nif_declarante_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarante_no_identificado_11 IS NOT NULL AND query.nif_declarante_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.sw_identificado_declarante  <>query.sw_identificado_declarante   OR (tbn1_mi_ds_189_valores_seguros_y_rentas.sw_identificado_declarante   IS NULL AND query.sw_identificado_declarante   IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.sw_identificado_declarante   IS NOT NULL AND query.sw_identificado_declarante   IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.telefono<>query.telefono OR (tbn1_mi_ds_189_valores_seguros_y_rentas.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.razon_social<>query.razon_social OR (tbn1_mi_ds_189_valores_seguros_y_rentas.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.razon_social IS NOT NULL AND query.razon_social IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_189_valores_seguros_y_rentas.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.cod_banco_espania<>query.cod_banco_espania OR (tbn1_mi_ds_189_valores_seguros_y_rentas.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_soporte<>query.id_tipo_soporte OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_soporte IS NULL AND query.id_tipo_soporte IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_soporte IS NOT NULL AND query.id_tipo_soporte IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_189_valores_seguros_y_rentas.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_189_valores_seguros_y_rentas.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.anyo_presentacion <>query.anyo_presentacion  OR (tbn1_mi_ds_189_valores_seguros_y_rentas.anyo_presentacion  IS NULL AND query.anyo_presentacion  IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.anyo_presentacion  IS NOT NULL AND query.anyo_presentacion  IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.num_caja<>query.num_caja OR (tbn1_mi_ds_189_valores_seguros_y_rentas.num_caja IS NULL AND query.num_caja IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.num_caja IS NOT NULL AND query.num_caja IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_189_valores_seguros_y_rentas.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.mes_alta<>query.mes_alta OR (tbn1_mi_ds_189_valores_seguros_y_rentas.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_189_valores_seguros_y_rentas.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.num_justificante<>query.num_justificante OR (tbn1_mi_ds_189_valores_seguros_y_rentas.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_189_valores_seguros_y_rentas.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_189_valores_seguros_y_rentas.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.administracion_declarado<>query.administracion_declarado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_189_11<>query.nif_declarado_189_11 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_189_11 IS NULL AND query.nif_declarado_189_11 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_189_11 IS NOT NULL AND query.nif_declarado_189_11 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_189<>query.nif_declarado_189 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_189 IS NULL AND query.nif_declarado_189 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_189 IS NOT NULL AND query.nif_declarado_189 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_189_valores_seguros_y_rentas.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.es_erroneo<>query.es_erroneo OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_provincia<>query.id_provincia OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_mercado<>query.id_clave_mercado OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_mercado IS NULL AND query.id_clave_mercado IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_mercado IS NOT NULL AND query.id_clave_mercado IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_valor_189<>query.id_clave_valor_189 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_valor_189 IS NULL AND query.id_clave_valor_189 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_valor_189 IS NOT NULL AND query.id_clave_valor_189 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_identificacion_189<>query.id_clave_identificacion_189 OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_identificacion_189 IS NULL AND query.id_clave_identificacion_189 IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_identificacion_189 IS NOT NULL AND query.id_clave_identificacion_189 IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_representacion<>query.id_clave_representacion OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_representacion IS NULL AND query.id_clave_representacion IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_clave_representacion IS NOT NULL AND query.id_clave_representacion IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.valor_identificacion<>query.valor_identificacion OR (tbn1_mi_ds_189_valores_seguros_y_rentas.valor_identificacion IS NULL AND query.valor_identificacion IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.valor_identificacion IS NOT NULL AND query.valor_identificacion IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.id_pais<>query.id_pais OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.importe<>query.importe OR (tbn1_mi_ds_189_valores_seguros_y_rentas.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.importe IS NOT NULL AND query.importe IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.num_valores<>query.num_valores OR (tbn1_mi_ds_189_valores_seguros_y_rentas.num_valores IS NULL AND query.num_valores IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.num_valores IS NOT NULL AND query.num_valores IS NULL)
			OR tbn1_mi_ds_189_valores_seguros_y_rentas.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_ds_189_valores_seguros_y_rentas.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_ds_189_valores_seguros_y_rentas.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			ejercicio=query.ejercicio,
			modelo =query.modelo ,
			administracion_declarante=query.administracion_declarante,
			id_administracion_declarante=query.id_administracion_declarante,
			es_externo_declarante=query.es_externo_declarante,
			nif_declarante_189_11=query.nif_declarante_189_11,
			nif_declarante_189=query.nif_declarante_189,
			nif_declarante_no_identificado=query.nif_declarante_no_identificado,
			nif_declarante_no_identificado_11=query.nif_declarante_no_identificado_11,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante  =query.sw_identificado_declarante  ,
			telefono=query.telefono,
			razon_social=query.razon_social,
			cod_presentador_colectivo=query.cod_presentador_colectivo,
			cod_banco_espania=query.cod_banco_espania,
			id_tipo_soporte=query.id_tipo_soporte,
			fecha_presentacion=query.fecha_presentacion,
			mes_presentacion=query.mes_presentacion,
			anyo_presentacion =query.anyo_presentacion ,
			num_caja=query.num_caja,
			fecha_alta=query.fecha_alta,
			mes_alta=query.mes_alta,
			anyo_alta=query.anyo_alta,
			num_justificante=query.num_justificante,
			id_tipo_declaracion=query.id_tipo_declaracion,
			contador_revisiones=query.contador_revisiones,
			regimen_fiscal_deducciones=query.regimen_fiscal_deducciones,
			administracion_declarado=query.administracion_declarado,
			es_externo_declarado=query.es_externo_declarado,
			nif_declarado_189_11=query.nif_declarado_189_11,
			nif_declarado_189=query.nif_declarado_189,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			nif_declarado_no_identificado_11=query.nif_declarado_no_identificado_11,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado   =query.sw_identificado_declarado   ,
			es_erroneo=query.es_erroneo,
			id_provincia=query.id_provincia,
			id_clave_mercado=query.id_clave_mercado,
			id_clave_valor_189=query.id_clave_valor_189,
			id_clave_identificacion_189=query.id_clave_identificacion_189,
			id_clave_representacion=query.id_clave_representacion,
			valor_identificacion=query.valor_identificacion,
			id_pais=query.id_pais,
			importe=query.importe,
			num_valores=query.num_valores,
			porcentaje_participacion=query.porcentaje_participacion
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,administracion_declarante,id_administracion_declarante,es_externo_declarante,nif_declarante_189_11,nif_declarante_189,nif_declarante_no_identificado,nif_declarante_no_identificado_11,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,id_tipo_soporte,fecha_presentacion,mes_presentacion,anyo_presentacion ,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,id_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,nif_declarado_189_11,nif_declarado_189,nif_declarado_no_identificado,nif_declarado_no_identificado_11,secuencia ,es_contribuyente_declarado,id_contribuyente_declarado  ,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo,id_provincia,id_clave_mercado,id_clave_valor_189,id_clave_identificacion_189,id_clave_representacion,valor_identificacion,id_pais,id_tipo_importe,importe,num_valores,porcentaje_participacion) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.id_mae_no_id_declarante,
			query.id_mae_no_id_declarado,
			query.ejercicio,
			query.modelo ,
			query.administracion_declarante,
			query.id_administracion_declarante,
			query.es_externo_declarante,
			query.nif_declarante_189_11,
			query.nif_declarante_189,
			query.nif_declarante_no_identificado,
			query.nif_declarante_no_identificado_11,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante  ,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo,
			query.cod_banco_espania,
			query.id_tipo_soporte,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion ,
			query.num_caja,
			query.fecha_alta,
			query.mes_alta,
			query.anyo_alta,
			query.num_justificante,
			query.id_tipo_declaracion,
			query.contador_revisiones,
			query.regimen_fiscal_deducciones,
			query.administracion_declarado,
			query.es_externo_declarado,
			query.nif_declarado_189_11,
			query.nif_declarado_189,
			query.nif_declarado_no_identificado,
			query.nif_declarado_no_identificado_11,
			query.secuencia ,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado  ,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.es_erroneo,
			query.id_provincia,
			query.id_clave_mercado,
			query.id_clave_valor_189,
			query.id_clave_identificacion_189,
			query.id_clave_representacion,
			query.valor_identificacion,
			query.id_pais,
			query.id_tipo_importe,
			query.importe,
			query.num_valores,
			query.porcentaje_participacion
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
