PRINT 'normalizado_mi_171_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos(
	id_mi_ds_171_imposiciones_disposiciones_cobros_fondos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_171 varchar(12) NOT NULL,
	nif_declarante_no_identificado   varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante   varchar(1) NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	cod_banco_espania varchar(4) NOT NULL,
	id_tipo_presentacion int NOT NULL,
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
	nif_declarado_171 varchar(12) NOT NULL,
	nif_declarado_no_identificado   varchar(12) NOT NULL,
	secuencia  varchar(9) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	es_erroneo bit NOT NULL,
	id_tipo_identificacion int NOT NULL,
	codigo_identificacion_titular varchar(20) NOT NULL,
	id_pais int NOT NULL,
	id_clave_declarado int NOT NULL,
	id_clave_tipo_codigo int NOT NULL,
	codigo_iban varchar(4) NOT NULL,
	codigo_entidad   varchar(4) NOT NULL,
	codigo_sucursal  varchar(4) NOT NULL,
	digito_control   varchar(2) NOT NULL,
	codigo_cuenta varchar(10) NOT NULL,
	fecha_operacion  date NOT NULL,
	anyo_operacion int NOT NULL,
	mes_operacion int NOT NULL,
	id_clave_operacion int NOT NULL,
	id_tipo_importe int NOT NULL,
	importe numeric(18,2),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_171_imposiciones_disposiciones_cobros_fondos UNIQUE (id_documento,secuencia ,id_tipo_importe),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_identificacion FOREIGN KEY (id_tipo_identificacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion(id_tipo_identificacion),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(id_clave_declarado),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_tipo_codigo FOREIGN KEY (id_clave_tipo_codigo) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(id_clave_tipo_codigo),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_operacion FOREIGN KEY (id_clave_operacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion(id_clave_operacion),
	CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos PRIMARY KEY CLUSTERED (id_mi_ds_171_imposiciones_disposiciones_cobros_fondos)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_mi_ds_171_imposiciones_disposiciones_cobros_fondos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_mi_ds_171_imposiciones_disposiciones_cobros_fondos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarante_171')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD nif_declarante_171 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarante_no_identificado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD nif_declarante_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='sw_identificado_declarante  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD sw_identificado_declarante   varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD cod_banco_espania varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD num_justificante numeric(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD contador_revisiones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarado_171')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD nif_declarado_171 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarado_no_identificado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD nif_declarado_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='secuencia ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD secuencia  varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD es_erroneo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_tipo_identificacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_identificacion_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD codigo_identificacion_titular varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_clave_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_clave_tipo_codigo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_iban')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD codigo_iban varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_entidad  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD codigo_entidad   varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_sucursal ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD codigo_sucursal  varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='digito_control  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD digito_control   varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD codigo_cuenta varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fecha_operacion ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD fecha_operacion  date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='anyo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD anyo_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='mes_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD mes_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_clave_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD id_tipo_importe int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD importe numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_mi_ds_171_imposiciones_disposiciones_cobros_fondos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarante_171' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN nif_declarante_171 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarante_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN nif_declarante_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='sw_identificado_declarante  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN sw_identificado_declarante   varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN cod_banco_espania varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN num_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN num_justificante numeric(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN contador_revisiones int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarado_171' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN nif_declarado_171 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='nif_declarado_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN nif_declarado_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='secuencia ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN secuencia  varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN es_erroneo bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_identificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_tipo_identificacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_identificacion_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN codigo_identificacion_titular varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_clave_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_clave_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_clave_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_clave_tipo_codigo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_iban' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN codigo_iban varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_entidad  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN codigo_entidad   varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_sucursal ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN codigo_sucursal  varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='digito_control  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN digito_control   varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='codigo_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN codigo_cuenta varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fecha_operacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN fecha_operacion  date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='anyo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN anyo_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='mes_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN mes_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_clave_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_clave_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN importe numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT PK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos PRIMARY KEY CLUSTERED (id_mi_ds_171_imposiciones_disposiciones_cobros_fondos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_identificacion FOREIGN KEY (id_tipo_identificacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion(id_tipo_identificacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(id_clave_declarado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_tipo_codigo FOREIGN KEY (id_clave_tipo_codigo) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(id_clave_tipo_codigo)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_clave_operacion FOREIGN KEY (id_clave_operacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion(id_clave_operacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos ADD CONSTRAINT FK_tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_171_imposiciones_disposiciones_cobros_fondos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_171_imposiciones_disposiciones_cobros_fondos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_171_imposiciones_disposiciones_cobros_fondos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_171_imposiciones_disposiciones_cobros_fondos'
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
			mensaje_error='EXCLU√çDO'
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
        WHERE  aplicacion = 'MF'
        AND detamodel = '171'
	),
query AS (

	SELECT
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      cabe.cabe_ejercicio AS ejercicio,

	  coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
	  coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

      coalesce(cabe.cabe_modelo,'') AS modelo,
      coalesce(cabe.cabe_admon,'') AS administracion_declarante,
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
      coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_171_11,
      coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_171,
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
      coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
      coalesce(cabe.cabe_telefono,'') AS telefono,
      coalesce(cabe.cabe_persona,'') AS razon_social,
      coalesce(cabe.cabe_refpres,'') AS cod_presentador_colectivo,
      coalesce(cabe.cabe_banco,'') AS cod_banco_espania,
      tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
      CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END AS fecha_presentacion,
      month(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END) AS mes_presentacion,
      year(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END) AS anyo_presentacion,
      cabe.cabe_numcaja AS num_caja,
      cabe.cabe_fecalta AS fecha_alta,
      MONTH(cabe.cabe_fecalta) AS mes_alta,
      YEAR(cabe.cabe_fecalta) AS anyo_alta,
      cabe.cabe_justif AS num_justificante,
      tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion,
      cabe.cabe_crevi AS contador_revisiones,
      cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
      coalesce(declarado.mfpe71_admon,'') AS administracion_declarado,
      CASE WHEN declarado.mfpe71_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
      CAST(declarado.mfpe71_secuen AS varchar) AS secuencia,
      coalesce(declarado.mfpe71_cif,'') AS nif_declarado_171_11,
      coalesce(left(coalesce(declarado.mfpe71_cif,''),9)+' '+right(coalesce(declarado.mfpe71_cif,''),2),'') AS nif_declarado_171,
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
      CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END AS nif_declarado_no_identificado_11,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,2),'') AS nif_declarado_no_identificado,
      CASE WHEN declarado.mfpe71_error=1 THEN 1 ELSE 0 END AS es_erroneo,
      tipo_identificacion.id_tipo_identificacion AS id_tipo_identificacion,
      coalesce(declarado.mfpe71_cod_iden,'') AS codigo_identificacion_titular,
      pais.id_pais AS id_pais,
      clave_declarado.id_clave_declarado AS id_clave_declarado,
      clave_tipo_codigo.id_clave_tipo_codigo AS id_clave_tipo_codigo,
      coalesce(declarado.mfpe71_iban,'') AS codigo_iban,
      coalesce(declarado.mfpe71_ccc_banco,'') AS codigo_entidad,
      coalesce(declarado.mfpe71_ccc_sucur,'') AS codigo_sucursal,
      coalesce(declarado.mfpe71_ccc_dc,'') AS digito_control,
      coalesce(declarado.mfpe71_ccc_cuenta,'') AS codigo_cuenta,
      CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END AS fecha_operacion,
      month(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END) AS mes_operacion,
      year(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END) AS anyo_operacion,
      clave_operacion.id_clave_operacion AS id_clave_operacion,
      tipo_importe.id_tipo_importe AS id_tipo_importe,
      round(importes.mfim71_importe/100,2) AS importe

    FROM 
    (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='171') cabe 
	--no_identificados_declarante
	LEFT JOIN	mae_noid mae_noid_cabe
			ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
			AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
	INNER JOIN  dbn1_stg_dhyf.dbo.tbn1pe71_mf declarado ON cabe.cabe_ejercicio=declarado.mfpe71_ejercicio AND cabe.cabe_referdoc=declarado.mfpe71_referdoc	    
	--no_identificados_declarado
	LEFT JOIN	mae_noid mae_noid_det
			ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
			AND cast(cabe.cabe_referdoc as varchar)= mae_noid_det.clavagru
			AND right('0000000000000' +  cast(declarado.mfpe71_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1im71_mf importes ON (declarado.mfpe71_ejercicio=importes.mfim71_ejercicio AND declarado.mfpe71_admon=importes.mfim71_admon AND declarado.mfpe71_referdoc=importes.mfim71_referdoc AND declarado.mfpe71_secuen=importes.mfim71_secuen)
	
	INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_documentos doc 
			ON	doc.referencia = CAST(declarado.mfpe71_ejercicio AS varchar)+'S™'+CAST(declarado.mfpe71_referdoc AS varchar)+'00K0000'
			AND doc.marca_baja IS NULL
			AND doc.fec_baja IS NULL
    
	INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_expedientes e 
			ON	doc.id_expediente = e.id_expediente
			AND e.fec_baja IS NULL
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (declarado.mfpe71_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.mfim71_tipo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion tipo_identificacion ON (tipo_identificacion.cod_tipo_identificacion=declarado.mfpe71_clav_cod_iden)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado clave_declarado ON (clave_declarado.cod_clave_declarado=declarado.mfpe71_clav_declarado)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo clave_tipo_codigo ON (clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe71_tipo_codigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion clave_operacion ON (clave_operacion.cod_clave_operacion=declarado.mfpe71_clav_operacion)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais ON (pais.cod_pais=declarado.mfpe71_pais)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      e.id_expediente,
      cabe.cabe_ejercicio,

	  coalesce(mae_noid_cabe.id_mae_no_identificados,-1) ,
	  coalesce(mae_noid_det.id_mae_no_identificados,-1) ,

      coalesce(cabe.cabe_modelo,''),
      coalesce(cabe.cabe_admon,''),
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END,
      coalesce(cabe.cabe_cifdecl,''),
      coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),''),
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
      coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),''),
      coalesce(cabe.cabe_telefono,''),
      coalesce(cabe.cabe_persona,''),
      coalesce(cabe.cabe_refpres,''),
      coalesce(cabe.cabe_banco,''),
      tipo_pres.id_tipo_presentacion,
      CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END,
      month(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END),
      year(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END),
      cabe.cabe_numcaja,
	  cabe_fecalta,
      cabe.cabe_justif,
      tipo_declaracion.id_tipo_declaracion,
      cabe.cabe_crevi,
      cabe.cabe_regfiscal,
      coalesce(declarado.mfpe71_admon,''),
      CASE WHEN declarado.mfpe71_admon<>'B' THEN 1 ELSE 0 END,
      CAST(declarado.mfpe71_secuen AS varchar),
      coalesce(declarado.mfpe71_cif,''),
      coalesce(left(coalesce(declarado.mfpe71_cif,''),9)+' '+right(coalesce(declarado.mfpe71_cif,''),2),''),
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,2),''),
      CASE WHEN declarado.mfpe71_error=1 THEN 1 ELSE 0 END,
      tipo_identificacion.id_tipo_identificacion,
      coalesce(declarado.mfpe71_cod_iden,''),
      pais.id_pais,
      clave_declarado.id_clave_declarado,
      clave_tipo_codigo.id_clave_tipo_codigo,
      coalesce(declarado.mfpe71_iban,''),
      coalesce(declarado.mfpe71_ccc_banco,''),
      coalesce(declarado.mfpe71_ccc_sucur,''),
      coalesce(declarado.mfpe71_ccc_dc,''),
      coalesce(declarado.mfpe71_ccc_cuenta,''),
      CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END,
      month(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END),
      year(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END),
      clave_operacion.id_clave_operacion,
      tipo_importe.id_tipo_importe,
      round(importes.mfim71_importe/100,2)
)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos AS tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos
	USING query ON query.id_documento=tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_documento AND query.secuencia =tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.secuencia  AND query.id_tipo_importe=tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_importe
	WHEN MATCHED AND ((tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_expediente<>query.id_expediente OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.ejercicio<>query.ejercicio OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.modelo <>query.modelo  OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.administracion_declarante<>query.administracion_declarante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarante_171<>query.nif_declarante_171 OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarante_171 IS NULL AND query.nif_declarante_171 IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarante_171 IS NOT NULL AND query.nif_declarante_171 IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarante_no_identificado  <>query.nif_declarante_no_identificado   OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarante_no_identificado   IS NULL AND query.nif_declarante_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarante_no_identificado   IS NOT NULL AND query.nif_declarante_no_identificado   IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.sw_identificado_declarante  <>query.sw_identificado_declarante   OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.sw_identificado_declarante   IS NULL AND query.sw_identificado_declarante   IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.sw_identificado_declarante   IS NOT NULL AND query.sw_identificado_declarante   IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.telefono<>query.telefono OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.razon_social<>query.razon_social OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.razon_social IS NOT NULL AND query.razon_social IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.cod_banco_espania<>query.cod_banco_espania OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_presentacion <>query.anyo_presentacion  OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_presentacion  IS NULL AND query.anyo_presentacion  IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_presentacion  IS NOT NULL AND query.anyo_presentacion  IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.num_caja<>query.num_caja OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.num_caja IS NULL AND query.num_caja IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.num_caja IS NOT NULL AND query.num_caja IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_alta<>query.mes_alta OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.num_justificante<>query.num_justificante OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.administracion_declarado<>query.administracion_declarado OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarado_171<>query.nif_declarado_171 OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarado_171 IS NULL AND query.nif_declarado_171 IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarado_171 IS NOT NULL AND query.nif_declarado_171 IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarado_no_identificado  <>query.nif_declarado_no_identificado   OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarado_no_identificado   IS NULL AND query.nif_declarado_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.nif_declarado_no_identificado   IS NOT NULL AND query.nif_declarado_no_identificado   IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_erroneo<>query.es_erroneo OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_identificacion<>query.id_tipo_identificacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_identificacion IS NULL AND query.id_tipo_identificacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_tipo_identificacion IS NOT NULL AND query.id_tipo_identificacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_identificacion_titular<>query.codigo_identificacion_titular OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_identificacion_titular IS NULL AND query.codigo_identificacion_titular IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_identificacion_titular IS NOT NULL AND query.codigo_identificacion_titular IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_pais<>query.id_pais OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_declarado<>query.id_clave_declarado OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_declarado IS NULL AND query.id_clave_declarado IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_declarado IS NOT NULL AND query.id_clave_declarado IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_tipo_codigo<>query.id_clave_tipo_codigo OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_tipo_codigo IS NULL AND query.id_clave_tipo_codigo IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_tipo_codigo IS NOT NULL AND query.id_clave_tipo_codigo IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_iban<>query.codigo_iban OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_iban IS NULL AND query.codigo_iban IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_iban IS NOT NULL AND query.codigo_iban IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_entidad  <>query.codigo_entidad   OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_entidad   IS NULL AND query.codigo_entidad   IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_entidad   IS NOT NULL AND query.codigo_entidad   IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_sucursal <>query.codigo_sucursal  OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_sucursal  IS NULL AND query.codigo_sucursal  IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_sucursal  IS NOT NULL AND query.codigo_sucursal  IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.digito_control  <>query.digito_control   OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.digito_control   IS NULL AND query.digito_control   IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.digito_control   IS NOT NULL AND query.digito_control   IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_cuenta<>query.codigo_cuenta OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_cuenta IS NULL AND query.codigo_cuenta IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.codigo_cuenta IS NOT NULL AND query.codigo_cuenta IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_operacion <>query.fecha_operacion  OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_operacion  IS NULL AND query.fecha_operacion  IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.fecha_operacion  IS NOT NULL AND query.fecha_operacion  IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_operacion<>query.anyo_operacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_operacion IS NULL AND query.anyo_operacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.anyo_operacion IS NOT NULL AND query.anyo_operacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_operacion<>query.mes_operacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_operacion IS NULL AND query.mes_operacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.mes_operacion IS NOT NULL AND query.mes_operacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_operacion<>query.id_clave_operacion OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_operacion IS NULL AND query.id_clave_operacion IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.id_clave_operacion IS NOT NULL AND query.id_clave_operacion IS NULL)
			OR tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.importe<>query.importe OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_mi_ds_171_imposiciones_disposiciones_cobros_fondos.importe IS NOT NULL AND query.importe IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			ejercicio=query.ejercicio,
			modelo =query.modelo ,
			administracion_declarante=query.administracion_declarante,
			es_externo_declarante=query.es_externo_declarante,
			nif_declarante_171=query.nif_declarante_171,
			nif_declarante_no_identificado  =query.nif_declarante_no_identificado  ,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante  =query.sw_identificado_declarante  ,
			telefono=query.telefono,
			razon_social=query.razon_social,
			cod_presentador_colectivo=query.cod_presentador_colectivo,
			cod_banco_espania=query.cod_banco_espania,
			id_tipo_presentacion=query.id_tipo_presentacion,
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
			nif_declarado_171=query.nif_declarado_171,
			nif_declarado_no_identificado  =query.nif_declarado_no_identificado  ,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado   =query.sw_identificado_declarado   ,
			es_erroneo=query.es_erroneo,
			id_tipo_identificacion=query.id_tipo_identificacion,
			codigo_identificacion_titular=query.codigo_identificacion_titular,
			id_pais=query.id_pais,
			id_clave_declarado=query.id_clave_declarado,
			id_clave_tipo_codigo=query.id_clave_tipo_codigo,
			codigo_iban=query.codigo_iban,
			codigo_entidad  =query.codigo_entidad  ,
			codigo_sucursal =query.codigo_sucursal ,
			digito_control  =query.digito_control  ,
			codigo_cuenta=query.codigo_cuenta,
			fecha_operacion =query.fecha_operacion ,
			anyo_operacion=query.anyo_operacion,
			mes_operacion=query.mes_operacion,
			id_clave_operacion=query.id_clave_operacion,
			importe=query.importe
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,administracion_declarante,es_externo_declarante,nif_declarante_171,nif_declarante_no_identificado  ,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,id_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion ,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,id_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,nif_declarado_171,nif_declarado_no_identificado  ,secuencia ,es_contribuyente_declarado,id_contribuyente_declarado  ,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo,id_tipo_identificacion,codigo_identificacion_titular,id_pais,id_clave_declarado,id_clave_tipo_codigo,codigo_iban,codigo_entidad  ,codigo_sucursal ,digito_control  ,codigo_cuenta,fecha_operacion ,anyo_operacion,mes_operacion,id_clave_operacion,id_tipo_importe,importe) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.id_mae_no_id_declarante,
			query.id_mae_no_id_declarado,
			query.ejercicio,
			query.modelo ,
			query.administracion_declarante,
			query.es_externo_declarante,
			query.nif_declarante_171,
			query.nif_declarante_no_identificado  ,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante  ,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo,
			query.cod_banco_espania,
			query.id_tipo_presentacion,
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
			query.nif_declarado_171,
			query.nif_declarado_no_identificado  ,
			query.secuencia ,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado  ,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.es_erroneo,
			query.id_tipo_identificacion,
			query.codigo_identificacion_titular,
			query.id_pais,
			query.id_clave_declarado,
			query.id_clave_tipo_codigo,
			query.codigo_iban,
			query.codigo_entidad  ,
			query.codigo_sucursal ,
			query.digito_control  ,
			query.codigo_cuenta,
			query.fecha_operacion ,
			query.anyo_operacion,
			query.mes_operacion,
			query.id_clave_operacion,
			query.id_tipo_importe,
			query.importe
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
