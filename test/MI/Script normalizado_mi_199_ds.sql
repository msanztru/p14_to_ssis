PRINT 'normalizado_mi_199_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques(
	id_mi_ds_199_operaciones_entidades_credito_cheques int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo  varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_199 varchar(12) NOT NULL,
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
	nif_declarado_199 varchar(12) NOT NULL,
	nif_declarado_no_identificado   varchar(12) NOT NULL,
	secuencia  varchar(9) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado   int NOT NULL,
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado    varchar(1) NOT NULL,
	es_erroneo_declarado bit NOT NULL,
	cif_representante varchar(9) NOT NULL,
	nombre_representante varchar(40) NOT NULL,
	codigo_extranjero varchar(15) NOT NULL,
	id_provincia int NOT NULL,
	id_pais int NOT NULL,
	fecha_operacion date NOT NULL,
	anyo_operacion int NOT NULL,
	mes_operacion int NOT NULL,
	id_clave_operacion_cheque int NOT NULL,
	num_cheque varchar(20) NOT NULL,
	codigo_sucursal varchar(4) NOT NULL,
	id_tipo_importe int NOT NULL,
	importe numeric(18,2),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_199_operaciones_entidades_credito_cheques UNIQUE (id_documento,secuencia ),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_clave_operacion_cheque FOREIGN KEY (id_clave_operacion_cheque) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque(id_clave_operacion_cheque),
	CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe),
	CONSTRAINT PK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques PRIMARY KEY CLUSTERED (id_mi_ds_199_operaciones_entidades_credito_cheques)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_mi_ds_199_operaciones_entidades_credito_cheques')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_mi_ds_199_operaciones_entidades_credito_cheques int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='modelo ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD modelo  varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarante_199')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD nif_declarante_199 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarante_no_identificado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD nif_declarante_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='sw_identificado_declarante  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD sw_identificado_declarante   varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD cod_banco_espania varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='anyo_presentacion ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD anyo_presentacion  int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD num_justificante numeric(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD contador_revisiones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarado_199')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD nif_declarado_199 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarado_no_identificado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD nif_declarado_no_identificado   varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='secuencia ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD secuencia  varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_contribuyente_declarado  ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_contribuyente_declarado   int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='sw_identificado_declarado   ')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD sw_identificado_declarado    varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD es_erroneo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='cif_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD cif_representante varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nombre_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD nombre_representante varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='codigo_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD codigo_extranjero varchar(15)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fecha_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD fecha_operacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='anyo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD anyo_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='mes_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD mes_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_clave_operacion_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_clave_operacion_cheque int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='num_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD num_cheque varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='codigo_sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD codigo_sucursal varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD id_tipo_importe int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD importe numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_mi_ds_199_operaciones_entidades_credito_cheques' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_mi_ds_199_operaciones_entidades_credito_cheques int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='modelo ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN modelo  varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarante_199' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN nif_declarante_199 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarante_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN nif_declarante_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='sw_identificado_declarante  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN sw_identificado_declarante   varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN razon_social varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN cod_banco_espania varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='anyo_presentacion ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN anyo_presentacion  int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN num_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN num_justificante numeric(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN contador_revisiones int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarado_199' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN nif_declarado_199 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nif_declarado_no_identificado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN nif_declarado_no_identificado   varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='secuencia ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN secuencia  varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_contribuyente_declarado  ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_contribuyente_declarado   int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='sw_identificado_declarado   ' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN sw_identificado_declarado    varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='cif_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN cif_representante varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='nombre_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN nombre_representante varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='codigo_extranjero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN codigo_extranjero varchar(15) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_provincia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fecha_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN fecha_operacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='anyo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN anyo_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='mes_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN mes_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_clave_operacion_cheque' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_clave_operacion_cheque int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='num_cheque' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN num_cheque varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='codigo_sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN codigo_sucursal varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN id_tipo_importe int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN importe numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT PK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques PRIMARY KEY CLUSTERED (id_mi_ds_199_operaciones_entidades_credito_cheques)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado  ) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_clave_operacion_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_clave_operacion_cheque FOREIGN KEY (id_clave_operacion_cheque) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque(id_clave_operacion_cheque)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_199_operaciones_entidades_credito_cheques' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques ADD CONSTRAINT FK_tbn1_mi_ds_199_operaciones_entidades_credito_cheques_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_199_operaciones_entidades_credito_cheques' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_199_operaciones_entidades_credito_cheques;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_199_operaciones_entidades_credito_cheques(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_199_operaciones_entidades_credito_cheques'
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
        AND detamodel = '199'
),
query AS (

    SELECT --top 10
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      cabe.cabe_ejercicio AS ejercicio,

	  coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
	  coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

      coalesce(cabe.cabe_modelo,'') AS modelo,
      coalesce(cabe.cabe_admon,'') AS administracion_declarante,
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
      coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_199_11,
      coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_199,
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
      cabe.cabe_fecpres AS fecha_presentacion,
      month(cabe.cabe_fecpres) AS mes_presentacion,
      year(cabe.cabe_fecpres) AS anyo_presentacion,
      cabe.cabe_numcaja AS num_caja,
      cabe.cabe_fecalta AS fecha_alta,
      month(cabe.cabe_fecalta) AS mes_alta,
      year(cabe.cabe_fecalta) AS anyo_alta,
      cabe.cabe_justif AS num_justificante,
      tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion,
      cabe.cabe_crevi AS contador_revisiones,
      cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
      declarado.da99_admon AS administracion_declarado,
      CASE WHEN declarado.da99_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
      CAST(declarado.da99_secuen AS varchar) AS secuencia,
      coalesce(declarado.da99_cif,'') AS nif_declarado_199_11,
      coalesce(left(coalesce(declarado.da99_cif,''),9)+' '+right(coalesce(declarado.da99_cif,''),2),'') AS nif_declarado_199,
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
      CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da99_cif,'')
          ELSE ''
      END AS nif_declarado_no_identificado_11,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da99_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da99_cif,'')
          ELSE ''
      END,2),'') AS nif_declarado_no_identificado,
      CASE WHEN declarado.da99_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
      coalesce(da99_cif_represen,'') AS cif_representante,
      coalesce(da99_nom_represen,'') AS nombre_representante,
      da99_codigo_ext AS codigo_extranjero,
      provincia.id_provincia AS id_provincia,
      pais.id_pais AS id_pais,
      declarado.da99_fechaoper AS fecha_operacion,
      month(declarado.da99_fechaoper) AS mes_operacion,
      year(declarado.da99_fechaoper) AS anyo_operacion,
      clave_operacion_cheque.id_clave_operacion_cheque AS id_clave_operacion_cheque,
      da99_nrocheque AS num_cheque,
      coalesce(da99_sucursal,'') AS codigo_sucursal,
      tipo_importe.id_tipo_importe AS id_tipo_importe,
      round(importes.im99_importe/100,2) AS importe

    FROM 
	    (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='199') cabe 
	--no_identificados_declarante
	LEFT JOIN	mae_noid mae_noid_cabe
			ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
			AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1da99_mf declarado ON cabe.cabe_ejercicio=declarado.da99_ejercicio AND cabe.cabe_referdoc=declarado.da99_referdoc	
	--no_identificados_declarado
	LEFT JOIN	mae_noid  mae_noid_det
			ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
			AND CAST(cabe.cabe_referdoc as Varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(declarado.da99_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1im99_mf importes ON (declarado.da99_ejercicio=importes.im99_ejercicio AND declarado.da99_admon=importes.im99_admon AND declarado.da99_referdoc=importes.im99_referdoc AND declarado.da99_secuen=importes.im99_secuen)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.da99_ejercicio AS varchar)+'ZO'+CAST(declarado.da99_referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (declarado.da99_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.im99_tipo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque clave_operacion_cheque ON (clave_operacion_cheque.cod_clave_operacion_cheque=declarado.da99_claveoper)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais ON (pais.cod_pais=declarado.da99_pais)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=declarado.da99_provincia)
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
      cabe.cabe_fecpres,
      month(cabe.cabe_fecpres),
      year(cabe.cabe_fecpres),
      cabe.cabe_numcaja,
      cabe.cabe_fecalta,
      month(cabe.cabe_fecalta),
      year(cabe.cabe_fecalta),
      cabe.cabe_justif,
      tipo_declaracion.id_tipo_declaracion,
      cabe.cabe_crevi,
      cabe.cabe_regfiscal,
      declarado.da99_admon,
      CASE WHEN declarado.da99_admon<>'B' THEN 1 ELSE 0 END,
      CAST(declarado.da99_secuen AS varchar),
      coalesce(declarado.da99_cif,''),
      coalesce(left(coalesce(declarado.da99_cif,''),9)+' '+right(coalesce(declarado.da99_cif,''),2),''),
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END,
      CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END,
      CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da99_cif,'')
          ELSE ''
      END,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da99_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.da99_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da99_cif,'')
          ELSE ''
      END,2),''),
      CASE WHEN declarado.da99_error=1 THEN 1 ELSE 0 END,
      coalesce(da99_cif_represen,''),
      coalesce(da99_nom_represen,''),
      da99_codigo_ext,
      provincia.id_provincia,
      pais.id_pais,
      declarado.da99_fechaoper,
      month(declarado.da99_fechaoper),
      year(declarado.da99_fechaoper),
      clave_operacion_cheque.id_clave_operacion_cheque,
      da99_nrocheque,
      coalesce(da99_sucursal,''),
      tipo_importe.id_tipo_importe,
      round(importes.im99_importe/100,2)
	  )
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_199_operaciones_entidades_credito_cheques AS tbn1_mi_ds_199_operaciones_entidades_credito_cheques
	USING query ON query.id_documento=tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_documento AND query.secuencia =tbn1_mi_ds_199_operaciones_entidades_credito_cheques.secuencia 
	WHEN MATCHED AND ((tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_expediente<>query.id_expediente OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.ejercicio<>query.ejercicio OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.modelo <>query.modelo  OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.modelo  IS NULL AND query.modelo  IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.modelo  IS NOT NULL AND query.modelo  IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.administracion_declarante<>query.administracion_declarante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarante_199<>query.nif_declarante_199 OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarante_199 IS NULL AND query.nif_declarante_199 IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarante_199 IS NOT NULL AND query.nif_declarante_199 IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarante_no_identificado  <>query.nif_declarante_no_identificado   OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarante_no_identificado   IS NULL AND query.nif_declarante_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarante_no_identificado   IS NOT NULL AND query.nif_declarante_no_identificado   IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.sw_identificado_declarante  <>query.sw_identificado_declarante   OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.sw_identificado_declarante   IS NULL AND query.sw_identificado_declarante   IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.sw_identificado_declarante   IS NOT NULL AND query.sw_identificado_declarante   IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.telefono<>query.telefono OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.razon_social<>query.razon_social OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.razon_social IS NOT NULL AND query.razon_social IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cod_banco_espania<>query.cod_banco_espania OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_presentacion <>query.anyo_presentacion  OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_presentacion  IS NULL AND query.anyo_presentacion  IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_presentacion  IS NOT NULL AND query.anyo_presentacion  IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_caja<>query.num_caja OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_caja IS NULL AND query.num_caja IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_caja IS NOT NULL AND query.num_caja IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_alta<>query.mes_alta OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_justificante<>query.num_justificante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.administracion_declarado<>query.administracion_declarado OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarado_199<>query.nif_declarado_199 OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarado_199 IS NULL AND query.nif_declarado_199 IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarado_199 IS NOT NULL AND query.nif_declarado_199 IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarado_no_identificado  <>query.nif_declarado_no_identificado   OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarado_no_identificado   IS NULL AND query.nif_declarado_no_identificado   IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nif_declarado_no_identificado   IS NOT NULL AND query.nif_declarado_no_identificado   IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_contribuyente_declarado  <>query.id_contribuyente_declarado   OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_contribuyente_declarado   IS NULL AND query.id_contribuyente_declarado   IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_contribuyente_declarado   IS NOT NULL AND query.id_contribuyente_declarado   IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.sw_identificado_declarado   <>query.sw_identificado_declarado    OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.sw_identificado_declarado    IS NULL AND query.sw_identificado_declarado    IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.sw_identificado_declarado    IS NOT NULL AND query.sw_identificado_declarado    IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_erroneo_declarado<>query.es_erroneo_declarado OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cif_representante<>query.cif_representante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cif_representante IS NULL AND query.cif_representante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.cif_representante IS NOT NULL AND query.cif_representante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nombre_representante<>query.nombre_representante OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nombre_representante IS NULL AND query.nombre_representante IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.nombre_representante IS NOT NULL AND query.nombre_representante IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.codigo_extranjero<>query.codigo_extranjero OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.codigo_extranjero IS NULL AND query.codigo_extranjero IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.codigo_extranjero IS NOT NULL AND query.codigo_extranjero IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_provincia<>query.id_provincia OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_pais<>query.id_pais OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_operacion<>query.fecha_operacion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_operacion IS NULL AND query.fecha_operacion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.fecha_operacion IS NOT NULL AND query.fecha_operacion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_operacion<>query.anyo_operacion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_operacion IS NULL AND query.anyo_operacion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.anyo_operacion IS NOT NULL AND query.anyo_operacion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_operacion<>query.mes_operacion OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_operacion IS NULL AND query.mes_operacion IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.mes_operacion IS NOT NULL AND query.mes_operacion IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_clave_operacion_cheque<>query.id_clave_operacion_cheque OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_clave_operacion_cheque IS NULL AND query.id_clave_operacion_cheque IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_clave_operacion_cheque IS NOT NULL AND query.id_clave_operacion_cheque IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_cheque<>query.num_cheque OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_cheque IS NULL AND query.num_cheque IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.num_cheque IS NOT NULL AND query.num_cheque IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.codigo_sucursal<>query.codigo_sucursal OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.codigo_sucursal IS NULL AND query.codigo_sucursal IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.codigo_sucursal IS NOT NULL AND query.codigo_sucursal IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_importe<>query.id_tipo_importe OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_importe IS NULL AND query.id_tipo_importe IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.id_tipo_importe IS NOT NULL AND query.id_tipo_importe IS NULL)
			OR tbn1_mi_ds_199_operaciones_entidades_credito_cheques.importe<>query.importe OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_mi_ds_199_operaciones_entidades_credito_cheques.importe IS NOT NULL AND query.importe IS NULL) OR (fec_baja IS NOT NULL))) THEN
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
			nif_declarante_199=query.nif_declarante_199,
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
			nif_declarado_199=query.nif_declarado_199,
			nif_declarado_no_identificado  =query.nif_declarado_no_identificado  ,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado  =query.id_contribuyente_declarado  ,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado   =query.sw_identificado_declarado   ,
			es_erroneo_declarado=query.es_erroneo_declarado,
			cif_representante=query.cif_representante,
			nombre_representante=query.nombre_representante,
			codigo_extranjero=query.codigo_extranjero,
			id_provincia=query.id_provincia,
			id_pais=query.id_pais,
			fecha_operacion=query.fecha_operacion,
			anyo_operacion=query.anyo_operacion,
			mes_operacion=query.mes_operacion,
			id_clave_operacion_cheque=query.id_clave_operacion_cheque,
			num_cheque=query.num_cheque,
			codigo_sucursal=query.codigo_sucursal,
			id_tipo_importe=query.id_tipo_importe,
			importe=query.importe
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo ,administracion_declarante,es_externo_declarante,nif_declarante_199,nif_declarante_no_identificado  ,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante  ,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,id_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion ,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,id_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,nif_declarado_199,nif_declarado_no_identificado  ,secuencia ,es_contribuyente_declarado,id_contribuyente_declarado  ,es_identificado_declarado,sw_identificado_declarado   ,es_erroneo_declarado,cif_representante,nombre_representante,codigo_extranjero,id_provincia,id_pais,fecha_operacion,anyo_operacion,mes_operacion,id_clave_operacion_cheque,num_cheque,codigo_sucursal,id_tipo_importe,importe) VALUES (
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
			query.nif_declarante_199,
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
			query.nif_declarado_199,
			query.nif_declarado_no_identificado  ,
			query.secuencia ,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado  ,
			query.es_identificado_declarado,
			query.sw_identificado_declarado   ,
			query.es_erroneo_declarado,
			query.cif_representante,
			query.nombre_representante,
			query.codigo_extranjero,
			query.id_provincia,
			query.id_pais,
			query.fecha_operacion,
			query.anyo_operacion,
			query.mes_operacion,
			query.id_clave_operacion_cheque,
			query.num_cheque,
			query.codigo_sucursal,
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
