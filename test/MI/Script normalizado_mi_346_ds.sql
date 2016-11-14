PRINT 'normalizado_mi_346_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos(
	id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_346_11 varchar(11) NOT NULL,
	nif_declarante_no_identificado_11 varchar(11) NOT NULL,
	nif_declarante_346 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	telefono varchar(10) NOT NULL,
	razon_social varchar(40) NOT NULL,
	cod_presentador_colectivo int NOT NULL,
	cod_banco_espania varchar(4) NOT NULL,
	id_tipo_soporte int NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	num_caja varchar(8) NOT NULL,
	fecha_alta date NOT NULL,
	mes_alta int NOT NULL,
	anyo_alta int NOT NULL,
	num_justificante decimal(13,0) NOT NULL,
	id_tipo_declaracion int NOT NULL,
	contador_revisiones int NOT NULL,
	regimen_fiscal_deducciones varchar(1) NOT NULL,
	administracion_declarado varchar(1) NOT NULL,
	es_externo_declarado bit NOT NULL,
	secuencia varchar(9) NOT NULL,
	nif_declarado_346_11 varchar(11) NOT NULL,
	nif_declarado_no_identificado_11 varchar(11) NOT NULL,
	nif_declarado_346 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	id_provincia int NOT NULL,
	id_clave_percepcion int NOT NULL,
	id_tipo_percepcion int NOT NULL,
	ejercicio_devengo varchar(4) NOT NULL,
	concepto varchar(57) NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	es_erroneo bit NOT NULL,
	id_mae_claves_caracteres_intervencion int NOT NULL,
	id_tipo_importe int NOT NULL,
	importe decimal(18,2),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos UNIQUE (id_documento,secuencia,id_tipo_importe),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(id_tipo_soporte),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_claves_percepcion FOREIGN KEY (id_clave_percepcion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion(id_clave_percepcion),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipos_percepcion FOREIGN KEY (id_tipo_percepcion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion(id_tipo_percepcion),
	CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos PRIMARY KEY CLUSTERED (id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_346_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarante_346_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarante_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_346')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarante_346 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD cod_banco_espania varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD num_justificante decimal(13,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD contador_revisiones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_346_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarado_346_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarado_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_346')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarado_346 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_clave_percepcion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_clave_percepcion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_percepcion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_tipo_percepcion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD ejercicio_devengo varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='concepto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD concepto varchar(57)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD es_erroneo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mae_claves_caracteres_intervencion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_mae_claves_caracteres_intervencion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD id_tipo_importe int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD importe decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN modelo varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_346_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarante_346_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarante_no_identificado_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_346' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarante_346 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN cod_banco_espania varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN num_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN num_justificante decimal(13,0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN contador_revisiones int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN secuencia varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_346_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarado_346_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarado_no_identificado_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_346' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarado_346 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_clave_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_clave_percepcion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_tipo_percepcion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN ejercicio_devengo varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='concepto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN concepto varchar(57) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN es_erroneo bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_mae_claves_caracteres_intervencion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_mae_claves_caracteres_intervencion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN importe decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT PK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos PRIMARY KEY CLUSTERED (id_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipos_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(id_tipo_soporte)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_claves_percepcion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_claves_percepcion FOREIGN KEY (id_clave_percepcion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion(id_clave_percepcion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipos_percepcion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipos_percepcion FOREIGN KEY (id_tipo_percepcion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion(id_tipo_percepcion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos ADD CONSTRAINT FK_tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos'
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
			WHERE  aplicacion = 'MF'
			AND detamodel = '346'
	),
	query AS (
				SELECT	docu.id_documento AS id_documento,
						e.id_expediente AS id_expediente,
						cabe.cabe_ejercicio AS ejercicio,
						cabe.cabe_modelo AS modelo,
						cabe.cabe_admon AS administracion_declarante,
						CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
						cabe.cabe_cifdecl AS nif_declarante_346_11,
						coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_346,
						CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
						coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
					
						coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
						coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

						CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
						CASE
						WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
						END AS sw_identificado_declarante,
						CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
						coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
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
						month(cabe.cabe_fecalta) AS mes_alta,
						year(cabe.cabe_fecalta) AS anyo_alta,
						cabe.cabe_justif AS num_justificante,
						decl.id_tipo_declaracion AS id_tipo_declaracion,
						cabe.cabe_crevi AS contador_revisiones,
						cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
						--declarado
						declarado.pe46_admon AS administracion_declarado,
						CASE WHEN declarado.pe46_admon = 'B' THEN 0 ELSE 1 END AS es_externo_declarado,
						CAST(declarado.pe46_secuen AS varchar) AS secuencia,
						declarado.pe46_cif AS nif_declarado_346_11,
						CASE WHEN CASE WHEN declarado.pe46_identif = 1 THEN 1 ELSE 0 END = 0 THEN declarado.pe46_cif ELSE '' END AS nif_declarado_no_identificado_11,
						coalesce(left(declarado.pe46_cif,9)+' '+right(declarado.pe46_cif,2),'') AS nif_declarado_346,
						coalesce(left(CASE WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=0 THEN declarado.pe46_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=0 THEN declarado.pe46_cif ELSE '' END,2),'') AS nif_declarado_no_identificado,
						CASE WHEN d.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
						coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
						prov.id_provincia AS id_provincia,
						clv_per.id_clave_percepcion AS id_clave_percepcion,
						tip_per.id_tipo_percepcion AS id_tipo_percepcion,
						pe46_ejer_dvgo AS ejercicio_devengo,
						pe46_concepto AS concepto,
						CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
						CASE
							WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
							WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=0 THEN 1
							WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
							ELSE ''
						END AS sw_identificado_declarado,
						CASE declarado.pe46_error WHEN '1' THEN 1 ELSE 0 END AS es_erroneo,
						id_mae_claves_caracteres_intervencion AS id_mae_claves_caracteres_intervencion,
						--importes
						impo.id_tipo_importe AS id_tipo_importe,
						round(im46_importe/100,2) AS importe					

				FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='346') cabe
						--no_identificados_declarante
						LEFT JOIN	mae_noid mae_noid_cabe
								ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
								AND cast(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
								AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
						--declarados
						INNER JOIN	dbn1_stg_dhyf.dbo.tbn1pe46_mf declarado
								ON	cabe.cabe_ejercicio = declarado.pe46_ejercicio
								AND cabe.cabe_modelo = '346'
								AND cabe.cabe_referdoc = declarado.pe46_referdoc
						--no_identificados_declarado
						LEFT JOIN	mae_noid mae_noid_det
								ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
								AND cast(cabe.cabe_referdoc as varchar) = mae_noid_det.clavagru
								AND right('0000000000000' +  cast(declarado.pe46_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
						--importes
						INNER JOIN	dbn1_stg_dhyf.dbo.tbn1im46_mf importes 
								ON	declarado.pe46_ejercicio = importes.im46_ejercicio 
								AND declarado.pe46_admon = importes.im46_admon 
								AND declarado.pe46_referdoc = importes.im46_referdoc 
								AND declarado.pe46_secuen=importes.im46_secuen
						--documentos
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
								ON docu.referencia = CAST(cabe.cabe_ejercicio AS varchar)+'FF'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'
						--expedientes
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
								ON docu.id_expediente=e.id_expediente
						--buscar los nif en contribuyentes (para declarante y declarados)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
								ON cabe.cabe_cifdecl=c.nif_maestro 
								AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
								ON declarado.pe46_cif=d.nif_maestro 
								AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
						--JOIN con cada maestro
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
								ON declarado.pe46_provincia = prov.cod_provincia
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte sopo 
								ON sopo.cod_tipo_soporte = cabe.cabe_tiposoporte
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion decl 
								ON decl.cod_tipo_declaracion = cabe.cabe_tipodecl
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion clv_per
								ON declarado.pe46_clave = clv_per.cod_clave_percepcion
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion tip_per
								ON declarado.pe46_tipoper = tip_per.cod_tipo_percepcion
						INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion car_int
								ON declarado.pe46_caracter_interv = car_int.cod_clave_caracter_intervencion
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe impo 
								ON importes.im46_tipo=impo.cod_tipo_importe
						--CROSS JOIN con la tabla de valores indefinidos
						CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos AS tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos
	USING query ON query.id_documento=tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_documento AND query.secuencia=tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.secuencia AND query.id_tipo_importe=tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_importe
	WHEN MATCHED AND ((tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_expediente<>query.id_expediente OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.ejercicio<>query.ejercicio OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.modelo<>query.modelo OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.modelo IS NULL AND query.modelo IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.modelo IS NOT NULL AND query.modelo IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.administracion_declarante<>query.administracion_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_346_11<>query.nif_declarante_346_11 OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_346_11 IS NULL AND query.nif_declarante_346_11 IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_346_11 IS NOT NULL AND query.nif_declarante_346_11 IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_no_identificado_11<>query.nif_declarante_no_identificado_11 OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_no_identificado_11 IS NULL AND query.nif_declarante_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_no_identificado_11 IS NOT NULL AND query.nif_declarante_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_346<>query.nif_declarante_346 OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_346 IS NULL AND query.nif_declarante_346 IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_346 IS NOT NULL AND query.nif_declarante_346 IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.sw_identificado_declarante<>query.sw_identificado_declarante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.telefono<>query.telefono OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.razon_social<>query.razon_social OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.razon_social IS NOT NULL AND query.razon_social IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.cod_banco_espania<>query.cod_banco_espania OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_soporte<>query.id_tipo_soporte OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_soporte IS NULL AND query.id_tipo_soporte IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_soporte IS NOT NULL AND query.id_tipo_soporte IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.num_caja<>query.num_caja OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.num_caja IS NULL AND query.num_caja IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.num_caja IS NOT NULL AND query.num_caja IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.mes_alta<>query.mes_alta OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.num_justificante<>query.num_justificante OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.administracion_declarado<>query.administracion_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_346_11<>query.nif_declarado_346_11 OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_346_11 IS NULL AND query.nif_declarado_346_11 IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_346_11 IS NOT NULL AND query.nif_declarado_346_11 IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_346<>query.nif_declarado_346 OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_346 IS NULL AND query.nif_declarado_346 IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_346 IS NOT NULL AND query.nif_declarado_346 IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_provincia<>query.id_provincia OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_clave_percepcion<>query.id_clave_percepcion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_clave_percepcion IS NULL AND query.id_clave_percepcion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_clave_percepcion IS NOT NULL AND query.id_clave_percepcion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_percepcion<>query.id_tipo_percepcion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_percepcion IS NULL AND query.id_tipo_percepcion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_tipo_percepcion IS NOT NULL AND query.id_tipo_percepcion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.concepto<>query.concepto OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.concepto IS NULL AND query.concepto IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.concepto IS NOT NULL AND query.concepto IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.sw_identificado_declarado<>query.sw_identificado_declarado OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_erroneo<>query.es_erroneo OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_claves_caracteres_intervencion<>query.id_mae_claves_caracteres_intervencion OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_claves_caracteres_intervencion IS NULL AND query.id_mae_claves_caracteres_intervencion IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.id_mae_claves_caracteres_intervencion IS NOT NULL AND query.id_mae_claves_caracteres_intervencion IS NULL)
			OR tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.importe<>query.importe OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_mi_ds_346_subvenciones_indemnizaciones_agricultores_ganaderos.importe IS NOT NULL AND query.importe IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			ejercicio=query.ejercicio,
			modelo=query.modelo,
			administracion_declarante=query.administracion_declarante,
			es_externo_declarante=query.es_externo_declarante,
			nif_declarante_346_11=query.nif_declarante_346_11,
			nif_declarante_no_identificado_11=query.nif_declarante_no_identificado_11,
			nif_declarante_346=query.nif_declarante_346,
			nif_declarante_no_identificado=query.nif_declarante_no_identificado,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante=query.sw_identificado_declarante,
			telefono=query.telefono,
			razon_social=query.razon_social,
			cod_presentador_colectivo=query.cod_presentador_colectivo,
			cod_banco_espania=query.cod_banco_espania,
			id_tipo_soporte=query.id_tipo_soporte,
			fecha_presentacion=query.fecha_presentacion,
			mes_presentacion=query.mes_presentacion,
			anyo_presentacion=query.anyo_presentacion,
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
			nif_declarado_346_11=query.nif_declarado_346_11,
			nif_declarado_no_identificado_11=query.nif_declarado_no_identificado_11,
			nif_declarado_346=query.nif_declarado_346,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado=query.id_contribuyente_declarado,
			id_provincia=query.id_provincia,
			id_clave_percepcion=query.id_clave_percepcion,
			id_tipo_percepcion=query.id_tipo_percepcion,
			ejercicio_devengo=query.ejercicio_devengo,
			concepto=query.concepto,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado=query.sw_identificado_declarado,
			es_erroneo=query.es_erroneo,
			id_mae_claves_caracteres_intervencion=query.id_mae_claves_caracteres_intervencion,
			importe=query.importe
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo,administracion_declarante,es_externo_declarante,nif_declarante_346_11,nif_declarante_no_identificado_11,nif_declarante_346,nif_declarante_no_identificado,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,id_tipo_soporte,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,id_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,secuencia,nif_declarado_346_11,nif_declarado_no_identificado_11,nif_declarado_346,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado,id_provincia,id_clave_percepcion,id_tipo_percepcion,ejercicio_devengo,concepto,es_identificado_declarado,sw_identificado_declarado,es_erroneo,id_mae_claves_caracteres_intervencion,id_tipo_importe,importe) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.id_mae_no_id_declarante,
			query.id_mae_no_id_declarado,
			query.ejercicio,
			query.modelo,
			query.administracion_declarante,
			query.es_externo_declarante,
			query.nif_declarante_346_11,
			query.nif_declarante_no_identificado_11,
			query.nif_declarante_346,
			query.nif_declarante_no_identificado,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.telefono,
			query.razon_social,
			query.cod_presentador_colectivo,
			query.cod_banco_espania,
			query.id_tipo_soporte,
			query.fecha_presentacion,
			query.mes_presentacion,
			query.anyo_presentacion,
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
			query.secuencia,
			query.nif_declarado_346_11,
			query.nif_declarado_no_identificado_11,
			query.nif_declarado_346,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado,
			query.id_provincia,
			query.id_clave_percepcion,
			query.id_tipo_percepcion,
			query.ejercicio_devengo,
			query.concepto,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.es_erroneo,
			query.id_mae_claves_caracteres_intervencion,
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
