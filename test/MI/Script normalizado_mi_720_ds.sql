PRINT 'normalizado_mi_720_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero(
	id_mi_ds_720_bienes_derechos_extranjero int IDENTITY(1,1),
	id_documento int NOT NULL,
	id_expediente int NOT NULL,
	id_mae_no_id_declarante int NOT NULL,
	id_mae_no_id_declarado int NOT NULL,
	ejercicio smallint NOT NULL,
	modelo varchar(3) NOT NULL,
	administracion_declarante varchar(1) NOT NULL,
	es_externo_declarante bit NOT NULL,
	nif_declarante_720_11 varchar(11) NOT NULL,
	nif_declarante_no_identificado_11 varchar(11) NOT NULL,
	nif_declarante_720 varchar(12) NOT NULL,
	nif_declarante_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarante bit NOT NULL,
	id_contribuyente_declarante int NOT NULL,
	es_identificado_declarante bit NOT NULL,
	sw_identificado_declarante varchar(1) NOT NULL,
	telefono varchar(10) NOT NULL,
	persona_relacionarse varchar(40) NOT NULL,
	id_mae_entidades_bancarias int NOT NULL,
	id_tipo_soporte int NOT NULL,
	fecha_presentacion date NOT NULL,
	mes_presentacion int NOT NULL,
	anyo_presentacion int NOT NULL,
	num_caja varchar(8) NOT NULL,
	fecha_alta date NOT NULL,
	mes_alta int NOT NULL,
	anyo_alta int NOT NULL,
	num_justificante varchar(13) NOT NULL,
	id_tipo_declaracion int NOT NULL,
	num_justificante_sustitutiva varchar(13) NOT NULL,
	contador_revisiones decimal(2,0) NOT NULL,
	regimen_fiscal_deducciones varchar(1) NOT NULL,
	pendiente_baja varchar(1) NOT NULL,
	administracion_declarado varchar(1) NOT NULL,
	es_externo_declarado bit NOT NULL,
	secuencia int NOT NULL,
	nif_declarado_720_11 varchar(11) NOT NULL,
	nif_declarado_no_identificado_11 varchar(11) NOT NULL,
	nif_declarado_720 varchar(12) NOT NULL,
	nif_declarado_no_identificado varchar(12) NOT NULL,
	es_contribuyente_declarado bit NOT NULL,
	id_contribuyente_declarado int NOT NULL,
	nif_representante_legal varchar(9) NOT NULL,
	id_mae_claves_titularidad int NOT NULL,
	otra_titularidad varchar(25) NOT NULL,
	id_mae_claves_bienes_720 int NOT NULL,
	id_mae_subclaves_bienes_720 int NOT NULL,
	id_pais int NOT NULL,
	nombre_entidad varchar(41) NOT NULL,
	nif_entidad varchar(20) NOT NULL,
	fecha_incorporacion date NOT NULL,
	mes_incorporacion int NOT NULL,
	anyo_incorporacion int NOT NULL,
	id_mae_origenes_bienes_720 int NOT NULL,
	fecha_extincion date NOT NULL,
	mes_extincion int NOT NULL,
	anyo_extincion int NOT NULL,
	saldo decimal(18,2),
	saldo_medio_ultimo_trimestre decimal(18,2),
	porc_participacion decimal(5,2),
	es_identificado_declarado bit NOT NULL,
	sw_identificado_declarado varchar(1) NOT NULL,
	desc_bien varchar(25) NOT NULL,
	id_mae_claves_tipos_bienes_muebles_inmuebles int NOT NULL,
	id_pais_registro_bien int NOT NULL,
	registro_matricula varchar(18) NOT NULL,
	id_mae_claves_cuenta int NOT NULL,
	cod_intenacional_bancario varchar(11) NOT NULL,
	cuenta varchar(34) NOT NULL,
	id_mae_claves_identificacion_valor_accion int NOT NULL,
	identificacion_valor_accion varchar(12) NOT NULL,
	id_clave_representacion int NOT NULL,
	num_valores decimal(12,0),
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_720_bienes_derechos_extranjero UNIQUE (id_documento,secuencia),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(id_tipo_soporte),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_paises1 FOREIGN KEY (id_pais_registro_bien) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_clave_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(id_clave_representacion),
	CONSTRAINT PK_tbn1_mi_ds_720_bienes_derechos_extranjero PRIMARY KEY CLUSTERED (id_mi_ds_720_bienes_derechos_extranjero)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mi_ds_720_bienes_derechos_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mi_ds_720_bienes_derechos_extranjero int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_720_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarante_720_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarante_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_720')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarante_720 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='persona_relacionarse')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD persona_relacionarse varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_entidades_bancarias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_entidades_bancarias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_tipo_soporte int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD num_justificante varchar(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_justificante_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD num_justificante_sustitutiva varchar(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD contador_revisiones decimal(2,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='pendiente_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD pendiente_baja varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD secuencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_720_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarado_720_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarado_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_720')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarado_720 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_representante_legal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_representante_legal varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_titularidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_claves_titularidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='otra_titularidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD otra_titularidad varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_bienes_720')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_claves_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_subclaves_bienes_720')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_subclaves_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nombre_entidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nombre_entidad varchar(41)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_entidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD nif_entidad varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_incorporacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fecha_incorporacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_incorporacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD mes_incorporacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_incorporacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD anyo_incorporacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_origenes_bienes_720')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_origenes_bienes_720 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_extincion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fecha_extincion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_extincion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD mes_extincion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_extincion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD anyo_extincion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='saldo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD saldo decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='saldo_medio_ultimo_trimestre')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD saldo_medio_ultimo_trimestre decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='porc_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD porc_participacion decimal(5,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='desc_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD desc_bien varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_tipos_bienes_muebles_inmuebles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_claves_tipos_bienes_muebles_inmuebles int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_pais_registro_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_pais_registro_bien int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='registro_matricula')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD registro_matricula varchar(18)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_claves_cuenta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='cod_intenacional_bancario')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD cod_intenacional_bancario varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD cuenta varchar(34)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_identificacion_valor_accion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_mae_claves_identificacion_valor_accion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='identificacion_valor_accion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD identificacion_valor_accion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD id_clave_representacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_valores')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD num_valores decimal(12,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mi_ds_720_bienes_derechos_extranjero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mi_ds_720_bienes_derechos_extranjero int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN ejercicio smallint NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN modelo varchar(3) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN administracion_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN es_externo_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_720_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarante_720_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarante_no_identificado_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarante_720 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN telefono varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='persona_relacionarse' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN persona_relacionarse varchar(40) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_entidades_bancarias' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_entidades_bancarias int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_tipo_soporte int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fecha_presentacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN mes_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN anyo_presentacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN num_caja varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fecha_alta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN mes_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN anyo_alta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN num_justificante varchar(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_justificante_sustitutiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN num_justificante_sustitutiva varchar(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN contador_revisiones decimal(2,0) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN regimen_fiscal_deducciones varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='pendiente_baja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN pendiente_baja varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN administracion_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN es_externo_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN secuencia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_720_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarado_720_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_no_identificado_11' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarado_no_identificado_11 varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarado_720 varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_representante_legal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_representante_legal varchar(9) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_claves_titularidad int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='otra_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN otra_titularidad varchar(25) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_claves_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_subclaves_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_subclaves_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_pais int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nombre_entidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nombre_entidad varchar(41) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='nif_entidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN nif_entidad varchar(20) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_incorporacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fecha_incorporacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_incorporacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN mes_incorporacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_incorporacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN anyo_incorporacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_origenes_bienes_720' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_origenes_bienes_720 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fecha_extincion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fecha_extincion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='mes_extincion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN mes_extincion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='anyo_extincion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN anyo_extincion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='saldo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN saldo decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='saldo_medio_ultimo_trimestre' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN saldo_medio_ultimo_trimestre decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='porc_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN porc_participacion decimal(5,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='desc_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN desc_bien varchar(25) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_tipos_bienes_muebles_inmuebles' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_claves_tipos_bienes_muebles_inmuebles int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_pais_registro_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_pais_registro_bien int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='registro_matricula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN registro_matricula varchar(18) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_claves_cuenta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='cod_intenacional_bancario' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN cod_intenacional_bancario varchar(11) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN cuenta varchar(34) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_mae_claves_identificacion_valor_accion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_mae_claves_identificacion_valor_accion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='identificacion_valor_accion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN identificacion_valor_accion varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='id_clave_representacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN id_clave_representacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='num_valores' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN num_valores decimal(12,0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_720_bienes_derechos_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT PK_tbn1_mi_ds_720_bienes_derechos_extranjero PRIMARY KEY CLUSTERED (id_mi_ds_720_bienes_derechos_extranjero)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_tipos_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_tipos_soporte FOREIGN KEY (id_tipo_soporte) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(id_tipo_soporte)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_paises1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_paises1 FOREIGN KEY (id_pais_registro_bien) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_720_bienes_derechos_extranjero' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero ADD CONSTRAINT FK_tbn1_mi_ds_720_bienes_derechos_extranjero_tbn1_mi_clave_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(id_clave_representacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_720_bienes_derechos_extranjero' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_720_bienes_derechos_extranjero;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_720_bienes_derechos_extranjero(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_720_bienes_derechos_extranjero'
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
			AND detamodel = '720'
	),
	query AS (

				SELECT	docu.id_documento AS id_documento,
						e.id_expediente AS id_expediente,
						cabe.mfdecl_ejercicio AS ejercicio,
						cabe.mfdecl_modelo AS modelo,
						cabe.mfdecl_admon AS administracion_declarante,

						coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
						coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

						CASE WHEN cabe.mfdecl_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
						cabe.mfdecl_cifdecl AS nif_declarante_720_11,
						coalesce(left(coalesce(cabe.mfdecl_cifdecl,''),9)+' '+right(coalesce(cabe.mfdecl_cifdecl,''),2),'') AS nif_declarante_720,
						CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
						coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
						CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
						CASE
						WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
						END AS sw_identificado_declarante,
						CASE WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.mfdecl_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
						coalesce(left(CASE WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.mfdecl_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.mfdecl_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
						cabe.mfdecl_telefono AS telefono,
						cabe.mfdecl_persona AS persona_relacionarse,
						banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,
						sopo.id_tipo_soporte AS id_tipo_soporte,
						cabe.mfdecl_fecpres AS fecha_presentacion,
						month(cabe.mfdecl_fecpres) AS mes_presentacion,
						year(cabe.mfdecl_fecpres) AS anyo_presentacion,
						cabe.mfdecl_numcaja AS num_caja,
						cabe.mfdecl_fecalta AS fecha_alta,
						month(cabe.mfdecl_fecalta) AS mes_alta,
						year(cabe.mfdecl_fecalta) AS anyo_alta,
						cabe.mfdecl_justif AS num_justificante,
						decl.id_tipo_declaracion AS id_tipo_declaracion,
						cabe.mfdecl_justifsus AS num_justificante_sustitutiva,
						cabe.mfdecl_crevi AS contador_revisiones,
						cabe.mfdecl_regfiscal AS regimen_fiscal_deducciones,
						cabe.mfdecl_baja AS pendiente_baja,
						--declarado
						declarado.mf720d_admon AS administracion_declarado,
						CASE WHEN declarado.mf720d_admon = 'B' THEN 0 ELSE 1 END AS es_externo_declarado,
						declarado.mf720d_secuen AS secuencia,
						declarado.mf720d_cif AS nif_declarado_720_11,
						CASE WHEN CASE WHEN declarado.mf720d_ident = 1 THEN 1 ELSE 0 END = 0 THEN declarado.mf720d_cif ELSE '' END AS nif_declarado_no_identificado_11,
						coalesce(left(declarado.mf720d_cif,9)+' '+right(declarado.mf720d_cif,2),'') AS nif_declarado_720,
						coalesce(left(CASE WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=0 THEN declarado.mf720d_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=0 THEN declarado.mf720d_cif ELSE '' END,2),'') AS nif_declarado_no_identificado,
						CASE WHEN d.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
						coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
						mf720d_represen AS nif_representante_legal,
						titu.id_mae_claves_titularidad AS id_mae_claves_titularidad,
						mf720d_tit_desc AS otra_titularidad,
						bien.id_mae_claves_bienes_720 AS id_mae_claves_bienes_720,
						sub_bien.id_mae_subclaves_bienes_720 AS id_mae_subclaves_bienes_720,
						pais.id_pais AS id_pais,
						mf720d_nombre_entidad AS nombre_entidad,
						mf720d_nif_entidad AS nif_entidad,
						mf720d_incorporacion AS fecha_incorporacion,
						month(mf720d_incorporacion) AS mes_incorporacion,
						year(mf720d_incorporacion) AS anyo_incorporacion,
						orig.id_mae_origenes_bienes_720 AS id_mae_origenes_bienes_720,
						mf720d_extincion AS fecha_extincion,
						month(mf720d_extincion) AS mes_extincion,
						year(mf720d_extincion) AS anyo_extincion,
						mf720d_saldo/100 AS saldo,
						mf720d_saldo_medio/100 AS saldo_medio_ultimo_trimestre,
						mf720d_participacion/100 AS porc_participacion,
						CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
						CASE
							WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
							WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=0 THEN 1
							WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
							ELSE ''
						END AS sw_identificado_declarado,
						--bienes
						coalesce(mf720b_bien_desc,'') AS desc_bien,
						coalesce(mueb.id_mae_claves_tipos_bienes_muebles_inmuebles,-1) AS id_mae_claves_tipos_bienes_muebles_inmuebles,
						coalesce(pais_reg.id_pais,-1) AS id_pais_registro_bien,
						coalesce(mf720b_reg_numero,'') AS registro_matricula,
						--cuentas
						coalesce(cuen.id_mae_claves_cuenta,-1) AS id_mae_claves_cuenta,
						coalesce(mf720c_bic,'') AS cod_intenacional_bancario,
						coalesce(mf720c_cuenta,'') AS cuenta,
						--valores/acciones
						coalesce(valo.id_mae_claves_identificacion_valor_accion,-1) AS id_mae_claves_identificacion_valor_accion,
						coalesce(mf720v_ident,'') AS identificacion_valor_accion,
						coalesce(repr.id_clave_representacion,-1) AS id_clave_representacion,
						coalesce(mf720v_nro_valores,0) AS num_valores

				FROM	dbn1_stg_dhyf.dbo.tbn1decl_mf cabe
					--no_identificados_declarante
					LEFT JOIN mae_noid mae_noid_cabe
							ON	cabe.mfdecl_ejercicio = mae_noid_cabe.ejercicio
							AND cast(cabe.mfdecl_referdoc as varchar) = mae_noid_cabe.clavagru
							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
						--declarados
						INNER JOIN	dbn1_stg_dhyf.dbo.tbn1720d_mf declarado
								ON	cabe.mfdecl_ejercicio = declarado.mf720d_ejercicio
								AND cabe.mfdecl_modelo = '720'
								AND cabe.mfdecl_referdoc = declarado.mf720d_referdoc	
							--no_identificados_declarado
						LEFT JOIN	mae_noid mae_noid_det
								ON	cabe.mfdecl_ejercicio = mae_noid_det.ejercicio
								AND cast(cabe.mfdecl_referdoc as varchar) = mae_noid_det.clavagru
								AND right('0000000000000' +  cast(declarado.mf720d_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
						--documentos
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
								ON docu.referencia = CAST(cabe.mfdecl_ejercicio AS varchar)+'W='+CAST(cabe.mfdecl_referdoc AS varchar)+'00K0000'
						--expedientes
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
								ON docu.id_expediente=e.id_expediente
						--buscar los nif en contribuyentes (para declarante y declarados)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
								ON cabe.mfdecl_cifdecl=c.nif_maestro 
								AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
								ON declarado.mf720d_cif=d.nif_maestro 
								AND d.fec_fin_vigencia=CAST('21000101' AS datetime)										
						--LEFT JOIN con tablas de Bienes, Cuentas y Valores/Acciones 
						LEFT JOIN dbn1_stg_dhyf.dbo.tbn1720b_mf bienes
								ON	declarado.mf720d_ejercicio = bienes.mf720b_ejercicio
								AND	declarado.mf720d_admon = bienes.mf720b_admon
								AND	declarado.mf720d_referdoc = bienes.mf720b_referdoc
								AND	declarado.mf720d_secuen = bienes.mf720b_secuen					
						LEFT JOIN dbn1_stg_dhyf.dbo.tbn1720c_mf cuentas
								ON	declarado.mf720d_ejercicio = cuentas.mf720c_ejercicio
								AND	declarado.mf720d_admon = cuentas.mf720c_admon
								AND	declarado.mf720d_referdoc = cuentas.mf720c_referdoc
								AND	declarado.mf720d_secuen = cuentas.mf720c_secuen
						LEFT JOIN dbn1_stg_dhyf.dbo.tbn1720v_mf valores
								ON	declarado.mf720d_ejercicio = valores.mf720v_ejercicio
								AND	declarado.mf720d_admon = valores.mf720v_admon
								AND	declarado.mf720d_referdoc = valores.mf720v_referdoc
								AND	declarado.mf720d_secuen = valores.mf720v_secuen
						--LEFT JOIN con cada maestro
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias banc
								ON cabe.mfdecl_banco = banc.cod_entidad_bancaria
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte sopo
								ON cabe.mfdecl_tiposoporte = sopo.cod_tipo_soporte
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion decl
								ON cabe.mfdecl_tipodecl = decl.cod_tipo_declaracion
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad titu
								ON declarado.mf720d_tit_clave = titu.cod_clave_titularidad
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 bien
								ON declarado.mf720d_bien_clave = bien.cod_clave_bien_720
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_bienes_720 sub_bien
								ON declarado.mf720d_bien_clave = sub_bien.cod_clave_bien_720
								AND declarado.mf720d_bien_subclave = sub_bien.cod_subclave_bien_720
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais
								ON declarado.mf720d_bien_pais = pais.cod_pais
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles mueb
								ON bienes.mf720b_tipo_bien = mueb.cod_clave_tipo_bien_mueble_inmueble
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_reg
								ON bienes.mf720b_reg_pais = pais_reg.cod_pais
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 orig
								ON declarado.mf720d_origen_bien = orig.cod_origen_bien_720
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta cuen
								ON cuentas.mf720c_clave_cuenta = cuen.cod_clave_cuenta
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion valo
								ON valores.mf720v_clave_ident = valo.cod_clave_identificacion_valor_accion
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion repr
								ON valores.mf720v_repres_valores = repr.cod_clave_representacion
						--CROSS JOIN con la tabla de valores indefinidos
						CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_720_bienes_derechos_extranjero AS tbn1_mi_ds_720_bienes_derechos_extranjero
	USING query ON query.id_documento=tbn1_mi_ds_720_bienes_derechos_extranjero.id_documento AND query.secuencia=tbn1_mi_ds_720_bienes_derechos_extranjero.secuencia
	WHEN MATCHED AND ((tbn1_mi_ds_720_bienes_derechos_extranjero.id_expediente<>query.id_expediente OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.ejercicio<>query.ejercicio OR (tbn1_mi_ds_720_bienes_derechos_extranjero.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.modelo<>query.modelo OR (tbn1_mi_ds_720_bienes_derechos_extranjero.modelo IS NULL AND query.modelo IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.modelo IS NOT NULL AND query.modelo IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.administracion_declarante<>query.administracion_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_720_11<>query.nif_declarante_720_11 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_720_11 IS NULL AND query.nif_declarante_720_11 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_720_11 IS NOT NULL AND query.nif_declarante_720_11 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_no_identificado_11<>query.nif_declarante_no_identificado_11 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_no_identificado_11 IS NULL AND query.nif_declarante_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_no_identificado_11 IS NOT NULL AND query.nif_declarante_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_720<>query.nif_declarante_720 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_720 IS NULL AND query.nif_declarante_720 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_720 IS NOT NULL AND query.nif_declarante_720 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.sw_identificado_declarante<>query.sw_identificado_declarante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.telefono<>query.telefono OR (tbn1_mi_ds_720_bienes_derechos_extranjero.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.persona_relacionarse<>query.persona_relacionarse OR (tbn1_mi_ds_720_bienes_derechos_extranjero.persona_relacionarse IS NULL AND query.persona_relacionarse IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.persona_relacionarse IS NOT NULL AND query.persona_relacionarse IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_entidades_bancarias<>query.id_mae_entidades_bancarias OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_entidades_bancarias IS NULL AND query.id_mae_entidades_bancarias IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_entidades_bancarias IS NOT NULL AND query.id_mae_entidades_bancarias IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_tipo_soporte<>query.id_tipo_soporte OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_tipo_soporte IS NULL AND query.id_tipo_soporte IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_tipo_soporte IS NOT NULL AND query.id_tipo_soporte IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.num_caja<>query.num_caja OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_caja IS NULL AND query.num_caja IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_caja IS NOT NULL AND query.num_caja IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.mes_alta<>query.mes_alta OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.num_justificante<>query.num_justificante OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.num_justificante_sustitutiva<>query.num_justificante_sustitutiva OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_justificante_sustitutiva IS NULL AND query.num_justificante_sustitutiva IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_justificante_sustitutiva IS NOT NULL AND query.num_justificante_sustitutiva IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_720_bienes_derechos_extranjero.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_720_bienes_derechos_extranjero.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.pendiente_baja<>query.pendiente_baja OR (tbn1_mi_ds_720_bienes_derechos_extranjero.pendiente_baja IS NULL AND query.pendiente_baja IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.pendiente_baja IS NOT NULL AND query.pendiente_baja IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.administracion_declarado<>query.administracion_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_720_11<>query.nif_declarado_720_11 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_720_11 IS NULL AND query.nif_declarado_720_11 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_720_11 IS NOT NULL AND query.nif_declarado_720_11 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_720<>query.nif_declarado_720 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_720 IS NULL AND query.nif_declarado_720 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_720 IS NOT NULL AND query.nif_declarado_720 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_representante_legal<>query.nif_representante_legal OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_representante_legal IS NULL AND query.nif_representante_legal IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_representante_legal IS NOT NULL AND query.nif_representante_legal IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_titularidad<>query.id_mae_claves_titularidad OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_titularidad IS NULL AND query.id_mae_claves_titularidad IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_titularidad IS NOT NULL AND query.id_mae_claves_titularidad IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.otra_titularidad<>query.otra_titularidad OR (tbn1_mi_ds_720_bienes_derechos_extranjero.otra_titularidad IS NULL AND query.otra_titularidad IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.otra_titularidad IS NOT NULL AND query.otra_titularidad IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_bienes_720<>query.id_mae_claves_bienes_720 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_bienes_720 IS NULL AND query.id_mae_claves_bienes_720 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_bienes_720 IS NOT NULL AND query.id_mae_claves_bienes_720 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_subclaves_bienes_720<>query.id_mae_subclaves_bienes_720 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_subclaves_bienes_720 IS NULL AND query.id_mae_subclaves_bienes_720 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_subclaves_bienes_720 IS NOT NULL AND query.id_mae_subclaves_bienes_720 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_pais<>query.id_pais OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nombre_entidad<>query.nombre_entidad OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nombre_entidad IS NULL AND query.nombre_entidad IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nombre_entidad IS NOT NULL AND query.nombre_entidad IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.nif_entidad<>query.nif_entidad OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_entidad IS NULL AND query.nif_entidad IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.nif_entidad IS NOT NULL AND query.nif_entidad IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_incorporacion<>query.fecha_incorporacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_incorporacion IS NULL AND query.fecha_incorporacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_incorporacion IS NOT NULL AND query.fecha_incorporacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.mes_incorporacion<>query.mes_incorporacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_incorporacion IS NULL AND query.mes_incorporacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_incorporacion IS NOT NULL AND query.mes_incorporacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_incorporacion<>query.anyo_incorporacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_incorporacion IS NULL AND query.anyo_incorporacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_incorporacion IS NOT NULL AND query.anyo_incorporacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_origenes_bienes_720<>query.id_mae_origenes_bienes_720 OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_origenes_bienes_720 IS NULL AND query.id_mae_origenes_bienes_720 IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_origenes_bienes_720 IS NOT NULL AND query.id_mae_origenes_bienes_720 IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_extincion<>query.fecha_extincion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_extincion IS NULL AND query.fecha_extincion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.fecha_extincion IS NOT NULL AND query.fecha_extincion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.mes_extincion<>query.mes_extincion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_extincion IS NULL AND query.mes_extincion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.mes_extincion IS NOT NULL AND query.mes_extincion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_extincion<>query.anyo_extincion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_extincion IS NULL AND query.anyo_extincion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.anyo_extincion IS NOT NULL AND query.anyo_extincion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.saldo<>query.saldo OR (tbn1_mi_ds_720_bienes_derechos_extranjero.saldo IS NULL AND query.saldo IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.saldo IS NOT NULL AND query.saldo IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.saldo_medio_ultimo_trimestre<>query.saldo_medio_ultimo_trimestre OR (tbn1_mi_ds_720_bienes_derechos_extranjero.saldo_medio_ultimo_trimestre IS NULL AND query.saldo_medio_ultimo_trimestre IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.saldo_medio_ultimo_trimestre IS NOT NULL AND query.saldo_medio_ultimo_trimestre IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.porc_participacion<>query.porc_participacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.sw_identificado_declarado<>query.sw_identificado_declarado OR (tbn1_mi_ds_720_bienes_derechos_extranjero.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.desc_bien<>query.desc_bien OR (tbn1_mi_ds_720_bienes_derechos_extranjero.desc_bien IS NULL AND query.desc_bien IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.desc_bien IS NOT NULL AND query.desc_bien IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_tipos_bienes_muebles_inmuebles<>query.id_mae_claves_tipos_bienes_muebles_inmuebles OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_tipos_bienes_muebles_inmuebles IS NULL AND query.id_mae_claves_tipos_bienes_muebles_inmuebles IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_tipos_bienes_muebles_inmuebles IS NOT NULL AND query.id_mae_claves_tipos_bienes_muebles_inmuebles IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_pais_registro_bien<>query.id_pais_registro_bien OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_pais_registro_bien IS NULL AND query.id_pais_registro_bien IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_pais_registro_bien IS NOT NULL AND query.id_pais_registro_bien IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.registro_matricula<>query.registro_matricula OR (tbn1_mi_ds_720_bienes_derechos_extranjero.registro_matricula IS NULL AND query.registro_matricula IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.registro_matricula IS NOT NULL AND query.registro_matricula IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_cuenta<>query.id_mae_claves_cuenta OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_cuenta IS NULL AND query.id_mae_claves_cuenta IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_cuenta IS NOT NULL AND query.id_mae_claves_cuenta IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.cod_intenacional_bancario<>query.cod_intenacional_bancario OR (tbn1_mi_ds_720_bienes_derechos_extranjero.cod_intenacional_bancario IS NULL AND query.cod_intenacional_bancario IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.cod_intenacional_bancario IS NOT NULL AND query.cod_intenacional_bancario IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.cuenta<>query.cuenta OR (tbn1_mi_ds_720_bienes_derechos_extranjero.cuenta IS NULL AND query.cuenta IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.cuenta IS NOT NULL AND query.cuenta IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_identificacion_valor_accion<>query.id_mae_claves_identificacion_valor_accion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_identificacion_valor_accion IS NULL AND query.id_mae_claves_identificacion_valor_accion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_mae_claves_identificacion_valor_accion IS NOT NULL AND query.id_mae_claves_identificacion_valor_accion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.identificacion_valor_accion<>query.identificacion_valor_accion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.identificacion_valor_accion IS NULL AND query.identificacion_valor_accion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.identificacion_valor_accion IS NOT NULL AND query.identificacion_valor_accion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.id_clave_representacion<>query.id_clave_representacion OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_clave_representacion IS NULL AND query.id_clave_representacion IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.id_clave_representacion IS NOT NULL AND query.id_clave_representacion IS NULL)
			OR tbn1_mi_ds_720_bienes_derechos_extranjero.num_valores<>query.num_valores OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_valores IS NULL AND query.num_valores IS NOT NULL) OR (tbn1_mi_ds_720_bienes_derechos_extranjero.num_valores IS NOT NULL AND query.num_valores IS NULL) OR (fec_baja IS NOT NULL))) THEN
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
			nif_declarante_720_11=query.nif_declarante_720_11,
			nif_declarante_no_identificado_11=query.nif_declarante_no_identificado_11,
			nif_declarante_720=query.nif_declarante_720,
			nif_declarante_no_identificado=query.nif_declarante_no_identificado,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante=query.sw_identificado_declarante,
			telefono=query.telefono,
			persona_relacionarse=query.persona_relacionarse,
			id_mae_entidades_bancarias=query.id_mae_entidades_bancarias,
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
			num_justificante_sustitutiva=query.num_justificante_sustitutiva,
			contador_revisiones=query.contador_revisiones,
			regimen_fiscal_deducciones=query.regimen_fiscal_deducciones,
			pendiente_baja=query.pendiente_baja,
			administracion_declarado=query.administracion_declarado,
			es_externo_declarado=query.es_externo_declarado,
			nif_declarado_720_11=query.nif_declarado_720_11,
			nif_declarado_no_identificado_11=query.nif_declarado_no_identificado_11,
			nif_declarado_720=query.nif_declarado_720,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado=query.id_contribuyente_declarado,
			nif_representante_legal=query.nif_representante_legal,
			id_mae_claves_titularidad=query.id_mae_claves_titularidad,
			otra_titularidad=query.otra_titularidad,
			id_mae_claves_bienes_720=query.id_mae_claves_bienes_720,
			id_mae_subclaves_bienes_720=query.id_mae_subclaves_bienes_720,
			id_pais=query.id_pais,
			nombre_entidad=query.nombre_entidad,
			nif_entidad=query.nif_entidad,
			fecha_incorporacion=query.fecha_incorporacion,
			mes_incorporacion=query.mes_incorporacion,
			anyo_incorporacion=query.anyo_incorporacion,
			id_mae_origenes_bienes_720=query.id_mae_origenes_bienes_720,
			fecha_extincion=query.fecha_extincion,
			mes_extincion=query.mes_extincion,
			anyo_extincion=query.anyo_extincion,
			saldo=query.saldo,
			saldo_medio_ultimo_trimestre=query.saldo_medio_ultimo_trimestre,
			porc_participacion=query.porc_participacion,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado=query.sw_identificado_declarado,
			desc_bien=query.desc_bien,
			id_mae_claves_tipos_bienes_muebles_inmuebles=query.id_mae_claves_tipos_bienes_muebles_inmuebles,
			id_pais_registro_bien=query.id_pais_registro_bien,
			registro_matricula=query.registro_matricula,
			id_mae_claves_cuenta=query.id_mae_claves_cuenta,
			cod_intenacional_bancario=query.cod_intenacional_bancario,
			cuenta=query.cuenta,
			id_mae_claves_identificacion_valor_accion=query.id_mae_claves_identificacion_valor_accion,
			identificacion_valor_accion=query.identificacion_valor_accion,
			id_clave_representacion=query.id_clave_representacion,
			num_valores=query.num_valores
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo,administracion_declarante,es_externo_declarante,nif_declarante_720_11,nif_declarante_no_identificado_11,nif_declarante_720,nif_declarante_no_identificado,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,telefono,persona_relacionarse,id_mae_entidades_bancarias,id_tipo_soporte,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,id_tipo_declaracion,num_justificante_sustitutiva,contador_revisiones,regimen_fiscal_deducciones,pendiente_baja,administracion_declarado,es_externo_declarado,secuencia,nif_declarado_720_11,nif_declarado_no_identificado_11,nif_declarado_720,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado,nif_representante_legal,id_mae_claves_titularidad,otra_titularidad,id_mae_claves_bienes_720,id_mae_subclaves_bienes_720,id_pais,nombre_entidad,nif_entidad,fecha_incorporacion,mes_incorporacion,anyo_incorporacion,id_mae_origenes_bienes_720,fecha_extincion,mes_extincion,anyo_extincion,saldo,saldo_medio_ultimo_trimestre,porc_participacion,es_identificado_declarado,sw_identificado_declarado,desc_bien,id_mae_claves_tipos_bienes_muebles_inmuebles,id_pais_registro_bien,registro_matricula,id_mae_claves_cuenta,cod_intenacional_bancario,cuenta,id_mae_claves_identificacion_valor_accion,identificacion_valor_accion,id_clave_representacion,num_valores) VALUES (
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
			query.nif_declarante_720_11,
			query.nif_declarante_no_identificado_11,
			query.nif_declarante_720,
			query.nif_declarante_no_identificado,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.telefono,
			query.persona_relacionarse,
			query.id_mae_entidades_bancarias,
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
			query.num_justificante_sustitutiva,
			query.contador_revisiones,
			query.regimen_fiscal_deducciones,
			query.pendiente_baja,
			query.administracion_declarado,
			query.es_externo_declarado,
			query.secuencia,
			query.nif_declarado_720_11,
			query.nif_declarado_no_identificado_11,
			query.nif_declarado_720,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado,
			query.nif_representante_legal,
			query.id_mae_claves_titularidad,
			query.otra_titularidad,
			query.id_mae_claves_bienes_720,
			query.id_mae_subclaves_bienes_720,
			query.id_pais,
			query.nombre_entidad,
			query.nif_entidad,
			query.fecha_incorporacion,
			query.mes_incorporacion,
			query.anyo_incorporacion,
			query.id_mae_origenes_bienes_720,
			query.fecha_extincion,
			query.mes_extincion,
			query.anyo_extincion,
			query.saldo,
			query.saldo_medio_ultimo_trimestre,
			query.porc_participacion,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.desc_bien,
			query.id_mae_claves_tipos_bienes_muebles_inmuebles,
			query.id_pais_registro_bien,
			query.registro_matricula,
			query.id_mae_claves_cuenta,
			query.cod_intenacional_bancario,
			query.cuenta,
			query.id_mae_claves_identificacion_valor_accion,
			query.identificacion_valor_accion,
			query.id_clave_representacion,
			query.num_valores
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
