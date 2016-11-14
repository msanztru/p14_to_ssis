PRINT 'normalizado_mi_184_ds.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr(
	id_mi_ds_184_irfp_sociedades_irnr int IDENTITY(1,1),
	id_documento int,
	id_expediente int,
	ejercicio smallint,
	modelo varchar(3),
	id_administracion_declarante int,
	es_externo_declarante bit,
	nif_declarante_184_11 varchar(11),
	nif_declarante_no_identificado_11 varchar(11),
	nif_declarante_184 varchar(12),
	nif_declarante_no_identificado varchar(12),
	es_contribuyente_declarante bit,
	id_contribuyente_declarante int,
	es_identificado_declarante bit,
	sw_identificado_declarante varchar(1),
	id_mae_no_id_declarante int,
	telefono varchar(10),
	persona_relacionarse varchar(40),
	cod_presentador_colectivo int,
	id_mae_entidades_bancarias int,
	id_tipo_presentacion int,
	fecha_presentacion date,
	mes_presentacion int,
	anyo_presentacion int,
	num_caja varchar(8),
	fecha_alta date,
	mes_alta int,
	anyo_alta int,
	num_justificante decimal(13,0),
	id_tipo_declaracion int,
	num_justificante_sustitutiva decimal(13,0),
	contador_revisiones decimal(2,0),
	regimen_fiscal_deducciones varchar(1),
	pendiente_baja varchar(1),
	num_declarados decimal(15, 0),
	id_mae_claves_tipos_entidad int,
	id_mae_claves_actividad_ppal int,
	id_mae_claves_tipos_entidad_extranjero int,
	es_objeto_extranjero varchar (1),
	id_pais_extranjero int,
	renta_residentes_extranjero decimal (8, 2),
	es_regimen_impuesto_soc_extranjero bit,
	cif_representante varchar (9),
	nombre_representante varchar (40),
	volumen_operaciones decimal (18, 2),
	id_administracion_declarado int,
	es_externo_declarado bit,
	secuencia int,
	nif_declarado_184_11 varchar(11),
	nif_declarado_no_identificado_11 varchar(11),
	nif_declarado_184 varchar(12),
	nif_declarado_no_identificado varchar(12),
	es_contribuyente_declarado bit,
	id_contribuyente_declarado int,
	es_identificado_declarado bit,
	sw_identificado_declarado varchar(1),
	id_mae_no_id_declarado int,
	es_representante varchar(1),
	id_provincia int,
	id_pais int,
	id_mae_claves_participe_184 int,
	es_miembro_31_diciembre bit,
	num_dias_miembro decimal(3, 0),
	porcentaje_participacion decimal(7, 4),
	domicilio_fiscal varchar(40),
	es_ejerce_actividad bit,
	porcentaje_atribucion decimal(7, 4),
	es_erroneo_declarado varchar(1),
	id_mae_claves_184_declarante int,
	id_mae_subclaves_184_declarante int,
	campo_declarante smallint,
	orden_declarante smallint,
	valor_declarante bigint,
	es_erroneo_dato_ec_declarante varchar(1),
	id_mae_claves_184_declarado int,
	id_mae_subclaves_184_declarado int,
	campo_declarado smallint,
	orden_declarado smallint,
	valor_declarado bigint,
	es_erroneo_dato_ec_declarado varchar(1),
	contador_declarados int,
	fec_alta datetime,
	fec_modificacion datetime,
	fec_baja datetime,
	CONSTRAINT uk_mi_ds_184_irfp_sociedades_irnr UNIQUE (id_documento,secuencia,id_mae_claves_184_declarante,id_mae_subclaves_184_declarante,campo_declarante,orden_declarante,id_mae_claves_184_declarado,id_mae_subclaves_184_declarado,campo_declarado,orden_declarado),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_paises FOREIGN KEY (id_pais_extranjero) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
	CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_paises1 FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
	CONSTRAINT PK_tbn1_mi_ds_184_irfp_sociedades_irnr PRIMARY KEY CLUSTERED (id_mi_ds_184_irfp_sociedades_irnr)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mi_ds_184_irfp_sociedades_irnr')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mi_ds_184_irfp_sociedades_irnr int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_administracion_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_184_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarante_184_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarante_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_184')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarante_184 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='persona_relacionarse')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD persona_relacionarse varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_entidades_bancarias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_entidades_bancarias int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD num_justificante decimal(13,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_tipo_declaracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_justificante_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD num_justificante_sustitutiva decimal(13,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD contador_revisiones decimal(2,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='pendiente_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD pendiente_baja varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_declarados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD num_declarados decimal(15, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_tipos_entidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_claves_tipos_entidad int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_actividad_ppal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_claves_actividad_ppal int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_tipos_entidad_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_claves_tipos_entidad_extranjero int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_objeto_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_objeto_extranjero varchar (1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_pais_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_pais_extranjero int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='renta_residentes_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD renta_residentes_extranjero decimal (8, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_regimen_impuesto_soc_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_regimen_impuesto_soc_extranjero bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='cif_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD cif_representante varchar (9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nombre_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nombre_representante varchar (40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD volumen_operaciones decimal (18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_administracion_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD secuencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_184_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarado_184_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarado_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_184')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarado_184 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_representante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_participe_184')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_claves_participe_184 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_miembro_31_diciembre')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_miembro_31_diciembre bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_dias_miembro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD num_dias_miembro decimal(3, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD porcentaje_participacion decimal(7, 4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='domicilio_fiscal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD domicilio_fiscal varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_ejerce_actividad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_ejerce_actividad bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='porcentaje_atribucion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD porcentaje_atribucion decimal(7, 4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_erroneo_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_184_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_claves_184_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_subclaves_184_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_subclaves_184_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='campo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD campo_declarante smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='orden_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD orden_declarante smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='valor_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD valor_declarante bigint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_erroneo_dato_ec_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_erroneo_dato_ec_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_184_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_claves_184_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_subclaves_184_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD id_mae_subclaves_184_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='campo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD campo_declarado smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='orden_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD orden_declarado smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='valor_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD valor_declarado bigint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_erroneo_dato_ec_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD es_erroneo_dato_ec_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='contador_declarados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD contador_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD fec_alta datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD fec_modificacion datetime
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD fec_baja datetime
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mi_ds_184_irfp_sociedades_irnr' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mi_ds_184_irfp_sociedades_irnr int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_documento int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_expediente int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN ejercicio smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN modelo varchar(3) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_administracion_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_administracion_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_externo_declarante bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_184_11' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarante_184_11 varchar(11) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_no_identificado_11' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarante_no_identificado_11 varchar(11) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarante_184 varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarante_no_identificado varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_contribuyente_declarante bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_contribuyente_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_identificado_declarante bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN sw_identificado_declarante varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_no_id_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_no_id_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN telefono varchar(10) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='persona_relacionarse' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN persona_relacionarse varchar(40) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN cod_presentador_colectivo int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_entidades_bancarias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_entidades_bancarias int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_tipo_presentacion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN fecha_presentacion date NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN mes_presentacion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN anyo_presentacion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN num_caja varchar(8) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fecha_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN fecha_alta date NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='mes_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN mes_alta int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='anyo_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN anyo_alta int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN num_justificante decimal(13,0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_tipo_declaracion int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_justificante_sustitutiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN num_justificante_sustitutiva decimal(13,0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN contador_revisiones decimal(2,0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN regimen_fiscal_deducciones varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='pendiente_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN pendiente_baja varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_declarados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN num_declarados decimal(15, 0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_tipos_entidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_claves_tipos_entidad int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_actividad_ppal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_claves_actividad_ppal int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_tipos_entidad_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_claves_tipos_entidad_extranjero int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_objeto_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_objeto_extranjero varchar (1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_pais_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_pais_extranjero int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='renta_residentes_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN renta_residentes_extranjero decimal (8, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_regimen_impuesto_soc_extranjero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_regimen_impuesto_soc_extranjero bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='cif_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN cif_representante varchar (9) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nombre_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nombre_representante varchar (40) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN volumen_operaciones decimal (18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_administracion_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_administracion_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_externo_declarado bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN secuencia int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_184_11' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarado_184_11 varchar(11) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_no_identificado_11' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarado_no_identificado_11 varchar(11) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarado_184 varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN nif_declarado_no_identificado varchar(12) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_contribuyente_declarado bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_contribuyente_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_identificado_declarado bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN sw_identificado_declarado varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_no_id_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_no_id_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_representante varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_provincia int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_pais' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_pais int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_participe_184' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_claves_participe_184 int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_miembro_31_diciembre' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_miembro_31_diciembre bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='num_dias_miembro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN num_dias_miembro decimal(3, 0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN porcentaje_participacion decimal(7, 4) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='domicilio_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN domicilio_fiscal varchar(40) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_ejerce_actividad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_ejerce_actividad bit NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='porcentaje_atribucion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN porcentaje_atribucion decimal(7, 4) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_erroneo_declarado varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_184_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_claves_184_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_subclaves_184_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_subclaves_184_declarante int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='campo_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN campo_declarante smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='orden_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN orden_declarante smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='valor_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN valor_declarante bigint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_erroneo_dato_ec_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_erroneo_dato_ec_declarante varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_claves_184_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_claves_184_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='id_mae_subclaves_184_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN id_mae_subclaves_184_declarado int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='campo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN campo_declarado smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='orden_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN orden_declarado smallint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='valor_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN valor_declarado bigint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='es_erroneo_dato_ec_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN es_erroneo_dato_ec_declarado varchar(1) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='contador_declarados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN contador_declarados int NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN fec_alta datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN fec_modificacion datetime NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ALTER COLUMN fec_baja datetime NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_184_irfp_sociedades_irnr')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT PK_tbn1_mi_ds_184_irfp_sociedades_irnr PRIMARY KEY CLUSTERED (id_mi_ds_184_irfp_sociedades_irnr)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_administracion_hacienda FOREIGN KEY (id_administracion_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_paises FOREIGN KEY (id_pais_extranjero) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_administracion_hacienda1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_mi_administracion_hacienda1 FOREIGN KEY (id_administracion_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(id_administracion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_184_irfp_sociedades_irnr' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_paises1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ADD CONSTRAINT FK_tbn1_mi_ds_184_irfp_sociedades_irnr_tbn1_paises1 FOREIGN KEY (id_pais) REFERENCES  dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_184_irfp_sociedades_irnr' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_184_irfp_sociedades_irnr;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_184_irfp_sociedades_irnr(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_184_irfp_sociedades_irnr'
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
		AND		detamodel = '184'
	),
	query AS (
	--DECLARANTE

	SELECT 
			doc.id_documento AS id_documento,
			e.id_expediente AS id_expediente,
			cabe.cabe_ejercicio AS ejercicio,
			cabe.cabe_modelo AS modelo,
			admini_decl.id_administracion AS id_administracion_declarante,

			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
			coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_184_11,  
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
			coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_184,
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
			
			CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
			coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
			END AS sw_identificado_declarante,

			--no_identificados_declarante
			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) AS id_mae_no_id_declarante,

			coalesce(cabe.cabe_telefono,'') AS telefono,
			coalesce(cabe.cabe_persona,'') AS persona_relacionarse,
			cabe.cabe_refpres AS cod_presentador_colectivo,

			banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,
			presenta.id_tipo_presentacion AS id_tipo_presentacion,

			CASE WHEN cabe.cabe_fecpres IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecpres END AS fecha_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN month(cabe.cabe_fecpres) ELSE 0 END AS mes_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN year(cabe.cabe_fecpres) ELSE 0 END AS anyo_presentacion,

			cabe.cabe_numcaja AS num_caja,

			CASE WHEN cabe.cabe_fecalta IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecalta END AS fecha_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN month(cabe.cabe_fecalta) ELSE 0 END AS mes_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN year(cabe.cabe_fecalta) ELSE 0 END AS anyo_alta,

			cabe.cabe_justif AS num_justificante,
			tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
			cabe.cabe_justifsus AS num_justificante_sustitutiva,
			cabe.cabe_crevi AS contador_revisiones,
			cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
			cabe.cabe_baja AS pendiente_baja,
			cabe.cabe_nroreg AS num_declarados,

			--Más datos declarante 
			coalesce(tipos_entidad.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad,
			coalesce(actividad_ppal.id_mae_claves_actividad_ppal_mf,-1) AS id_mae_claves_actividad_ppal,
			coalesce(tipos_entidad_ext.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad_extranjero,

			coalesce(mcabe.mcab_ext_objeto,'') AS es_objeto_extranjero,

			coalesce(pais_mcabe.id_pais,-1) AS id_pais_extranjero,
			coalesce(mcabe.mcab_ext_renta_res/100,0) AS renta_residentes_extranjero, 

			CASE WHEN mcabe.mcab_ext_regim_i_s = 'S' THEN 1 ELSE 0 END AS es_regimen_impuesto_soc_extranjero,	
			
			coalesce(mcabe.mcab_cif_represen,'') AS cif_representante,  
			coalesce(mcabe.mcab_nom_represen,'') AS nombre_representante, 

			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento ORDER BY doc.id_documento,d_eco_cabe.de84_clave, d_eco_cabe.de84_subclave,d_eco_cabe.de84_campo,d_eco_cabe.de84_orden)=1 THEN coalesce(mcabe.mcab_vol_opers/100,0)

				ELSE 0																				
			END AS volumen_operaciones,  --cabe

			--declarado
			1 AS id_administracion_declarado,
			
			NULL es_externo_declarado, --0, 1
			NULL AS secuencia,
			'' AS nif_declarado_184_11,
			'' nif_declarado_no_identificado_11,
			'' AS nif_declarado_184,
			'' AS nif_declarado_no_identificado,
			NULL es_contribuyente_declarado,
			NULL AS id_contribuyente_declarado,
			
			NULL es_identificado_declarado,
			'' sw_identificado_declarado,

			--no_identificados_declarado
			-1 AS id_mae_no_id_declarado,

			''  AS es_representante,  
			-1 AS id_provincia, 
			-1 AS id_pais,
			-1 AS id_mae_claves_participe_184, 
			
			'' es_miembro_31_diciembre,
			0  AS num_dias_miembro,--!!!
			0 porcentaje_participacion, --ddos

			'' AS domicilio_fiscal,
			null es_ejerce_actividad,

			0 porcentaje_atribucion,  --ddos

			'' es_erroneo_declarado, 
			
			--datos_económicos_declarante
			claves_cabe.id_mae_claves_184 AS id_mae_claves_184_declarante,
			subclaves_cabe.id_mae_subclaves_184 AS id_mae_subclaves_184_declarante,
			d_eco_cabe.de84_campo AS campo_declarante,
			d_eco_cabe.de84_orden AS orden_declarante,
			d_eco_cabe.de84_valor  AS valor_declarante,
			CASE WHEN d_eco_cabe.de84_error='1' THEN 1 ELSE 0 END AS es_erroneo_dato_ec_declarante, 
			
			--datos_económicos_declarado
			-1	AS id_mae_claves_184_declarado,											
			-1	AS id_mae_subclaves_184_declarado,
			 0	AS campo_declarado,
			 0	AS orden_declarado,
			 0	AS valor_declarado,
			''	AS es_erroneo_dato_ec_declarado, 
			
			0   AS contador_declarados
	FROM	dbn1_stg_dhyf.dbo.tbn1cabe_mf cabe
					
			--Más datos declarante mcab_mf	
			LEFT JOIN dbn1_stg_dhyf.dbo.tbn1mcab_mf mcabe
					ON	cabe.cabe_ejercicio = mcabe.mcab_ejercicio
					AND cabe.cabe_modelo = '184'    --mcab_admon
					AND	cabe.cabe_admon = mcabe.mcab_admon
					AND	cabe.cabe_referdoc = mcabe.mcab_referdoc

			 LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_mcabe
					ON mcabe.mcab_ext_pais = pais_mcabe.cod_pais 
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad
					ON mcabe.mcab_tipo_entidad = tipos_entidad.cod_clave_tipo_entidad_mf	
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf actividad_ppal
					ON mcabe.mcab_act_ppal = actividad_ppal.cod_clave_actividad_ppal_mf							
						
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad_ext
					ON mcabe.mcab_ext_tipo_enti = tipos_entidad_ext.cod_clave_tipo_entidad_mf		
			
			--datos_economicos declarante
			INNER JOIN dbn1_stg_dhyf.dbo.tbn1de84_mf d_eco_cabe
					ON	cabe.cabe_ejercicio = d_eco_cabe.de84_ejercicio
					AND	cabe.cabe_admon = d_eco_cabe.de84_admon
					AND	cabe.cabe_referdoc = d_eco_cabe.de84_referdoc
					AND	d_eco_cabe.de84_secuen = 0		

			--documentos
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON doc.referencia = CAST(cabe.cabe_ejercicio AS varchar)+'JQ'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'
					AND doc.marca_baja IS NULL

			--expedientes
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON doc.id_expediente=e.id_expediente

			--buscar los nif en contribuyentes (para declarante y declarados)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
					ON cabe.cabe_cifdecl=c.nif_maestro 
					AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON admini_decl.cod_administracion=cabe.cabe_admon	
			
			--LEFT JOIN con cada maestro
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias banc
					ON cabe.cabe_banco = banc.cod_entidad_bancaria 
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion presenta
					ON cabe.cabe_tiposoporte = presenta.cod_tipo_presentacion
					
			--LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte soporte
			--		ON cabe.cabe_tiposoporte = soporte.cod_tipo_soporte
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl
					ON cabe.cabe_tipodecl = tipo_decl.cod_tipo_declaracion	
			
			--declarante
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 claves_cabe
					ON d_eco_cabe.de84_clave = claves_cabe.cod_clave_184

			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184 subclaves_cabe
					ON d_eco_cabe.de84_clave = subclaves_cabe.cod_clave_184
					AND d_eco_cabe.de84_subclave = subclaves_cabe.cod_subclave_184
					
			--no_identificados_declarante
			LEFT JOIN	mae_noid mae_noid_cabe
					ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
					AND CAST(cabe.cabe_referdoc AS VARCHAR(9))= mae_noid_cabe.clavagru
					AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 					
			
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
			
UNION ALL

--DECLARADO
SELECT 
			doc.id_documento AS id_documento,
			e.id_expediente AS id_expediente,
			cabe.cabe_ejercicio AS ejercicio,
			cabe.cabe_modelo AS modelo,
			admini_decl.id_administracion AS id_administracion_declarante,

			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
			coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_184_11,  
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
			coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_184,
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
			
			CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
			coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
			END AS sw_identificado_declarante,

			--no_identificados_declarante
			-1 AS id_mae_no_id_declarante,

			coalesce(cabe.cabe_telefono,'') AS telefono,
			coalesce(cabe.cabe_persona,'') AS persona_relacionarse,
			cabe.cabe_refpres AS cod_presentador_colectivo,

			banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,
			presenta.id_tipo_presentacion AS id_tipo_presentacion,

			CASE WHEN cabe.cabe_fecpres IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecpres END AS fecha_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN month(cabe.cabe_fecpres) ELSE 0 END AS mes_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN year(cabe.cabe_fecpres) ELSE 0 END AS anyo_presentacion,

			cabe.cabe_numcaja AS num_caja,

			CASE WHEN cabe.cabe_fecalta IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecalta END AS fecha_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN month(cabe.cabe_fecalta) ELSE 0 END AS mes_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN year(cabe.cabe_fecalta) ELSE 0 END AS anyo_alta,

			cabe.cabe_justif AS num_justificante,
			tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
			cabe.cabe_justifsus AS num_justificante_sustitutiva,
			cabe.cabe_crevi AS contador_revisiones,
			cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
			cabe.cabe_baja AS pendiente_baja,
			cabe.cabe_nroreg AS num_declarados,

			--Más datos declarante 
			coalesce(tipos_entidad.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad,
			coalesce(actividad_ppal.id_mae_claves_actividad_ppal_mf,-1) AS id_mae_claves_actividad_ppal,
			coalesce(tipos_entidad_ext.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad_extranjero,

			coalesce(mcabe.mcab_ext_objeto,'') AS es_objeto_extranjero,

			coalesce(pais_mcabe.id_pais,-1) AS id_pais_extranjero,
			coalesce(mcabe.mcab_ext_renta_res/100,0) AS renta_residentes_extranjero, 

			CASE WHEN mcabe.mcab_ext_regim_i_s = 'S' THEN 1 ELSE 0 END AS es_regimen_impuesto_soc_extranjero,	
			
			coalesce(mcabe.mcab_cif_represen,'') AS cif_representante,  
			coalesce(mcabe.mcab_nom_represen,'') AS nombre_representante, 

			0 AS volumen_operaciones,  --cabe

			--declarado
			admini_ddos.id_administracion AS id_administracion_declarado,
			
			CASE WHEN ddos.pe84_admon = 'B' THEN 0 ELSE 1 END AS es_externo_declarado,
			ddos.pe84_secuen AS secuencia,
			ddos.pe84_cif AS nif_declarado_184_11,
			CASE WHEN CASE WHEN ddos.pe84_identif = 1 THEN 1 ELSE 0 END = 0 THEN ddos.pe84_cif ELSE '' END AS nif_declarado_no_identificado_11,
			coalesce(left(ddos.pe84_cif,9)+' '+right(ddos.pe84_cif,2),'') AS nif_declarado_184,
			coalesce(left(CASE WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=0 THEN ddos.pe84_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=0 THEN ddos.pe84_cif ELSE '' END,2),'') AS nif_declarado_no_identificado,
			CASE WHEN d.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
			coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
			
			CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
			CASE
				WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
				WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarado,

			--no_identificados_declarado
			coalesce(mae_noid_det.id_mae_no_identificados,-1) AS id_mae_no_id_declarado,

			coalesce(ddos.pe84_represen,'')  AS es_representante,  
			prov.id_provincia AS id_provincia, 
			pais.id_pais AS id_pais,
			claves_participe.id_mae_claves_participe_184 AS id_mae_claves_participe_184, 
			
			CASE WHEN ddos.pe84_miembro_31dic='S' THEN 1 ELSE 0 END AS es_miembro_31_diciembre,
			ddos.pe84_dias_miembro  AS num_dias_miembro,--!!!
			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento,ddos.pe84_secuen ORDER BY doc.id_documento,ddos.pe84_secuen,d_eco_ddos.de84_clave, d_eco_ddos.de84_subclave,d_eco_ddos.de84_campo,d_eco_ddos.de84_orden)=1 THEN coalesce(ddos.pe84_porc_particip/10000,0)
				ELSE 0
			END AS porcentaje_participacion, --ddos

			coalesce(ddos.pe84_domic_fiscal,'') AS domicilio_fiscal,
			CASE WHEN ddos.pe84_ejerce_activ='SI' THEN 1 ELSE 0 END AS es_ejerce_actividad,

			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento,ddos.pe84_secuen ORDER BY doc.id_documento,ddos.pe84_secuen,d_eco_ddos.de84_clave, d_eco_ddos.de84_subclave,d_eco_ddos.de84_campo,d_eco_ddos.de84_orden)=1 THEN coalesce(ddos.pe84_porc_atribuc/10000,0)
				ELSE 0
			END AS porcentaje_atribucion,  --ddos

			CASE WHEN ddos.pe84_error='1' THEN 1 ELSE 0 END AS es_erroneo_declarado, 
			
			--datos_económicos_declarante
			 -1	 AS id_mae_claves_184_declarante,
			 -1  AS id_mae_subclaves_184_declarante,
			  0  AS campo_declarante,
			  0  AS orden_declarante,
			  0  AS valor_declarante,
			 ''  AS es_erroneo_dato_ec_declarante, 
			
			--datos_económicos_declarado
			claves_ddos.id_mae_claves_184 AS id_mae_claves_184_declarado,											
			subclaves_ddos.id_mae_subclaves_184 AS id_mae_subclaves_184_declarado,
			d_eco_ddos.de84_campo AS campo_declarado,
			d_eco_ddos.de84_orden AS orden_declarado,
			d_eco_ddos.de84_valor  AS valor_declarado,
			CASE WHEN d_eco_ddos.de84_error='1' THEN 1 ELSE 0 END AS es_erroneo_dato_ec_declarado,
	
			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento,ddos.pe84_secuen ORDER BY doc.id_documento,ddos.pe84_secuen,d_eco_ddos.de84_clave, d_eco_ddos.de84_subclave,d_eco_ddos.de84_campo,d_eco_ddos.de84_orden)=1 THEN 1
				ELSE 0
			END AS contador_declarados --ddos			
			
	FROM	dbn1_stg_dhyf.dbo.tbn1cabe_mf cabe
					
			--Más datos declarante mcab_mf	
			LEFT JOIN dbn1_stg_dhyf.dbo.tbn1mcab_mf mcabe
					ON	cabe.cabe_ejercicio = mcabe.mcab_ejercicio
					AND cabe.cabe_modelo = '184'    --mcab_admon
					AND	cabe.cabe_admon = mcabe.mcab_admon
					AND	cabe.cabe_referdoc = mcabe.mcab_referdoc

			 LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_mcabe
					ON mcabe.mcab_ext_pais = pais_mcabe.cod_pais 
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad
					ON mcabe.mcab_tipo_entidad = tipos_entidad.cod_clave_tipo_entidad_mf	
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf actividad_ppal
					ON mcabe.mcab_act_ppal = actividad_ppal.cod_clave_actividad_ppal_mf							
						
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad_ext
					ON mcabe.mcab_ext_tipo_enti = tipos_entidad_ext.cod_clave_tipo_entidad_mf		

			--declarados
			INNER JOIN	dbn1_stg_dhyf.dbo.tbn1pe84_mf ddos
					ON	cabe.cabe_ejercicio = ddos.pe84_ejercicio
					AND cabe.cabe_modelo = '184'
					AND cabe.cabe_referdoc = ddos.pe84_referdoc	
								
			--datos_economicos declarado	
			INNER JOIN dbn1_stg_dhyf.dbo.tbn1de84_mf d_eco_ddos
					ON	ddos.pe84_ejercicio = d_eco_ddos.de84_ejercicio
					AND	ddos.pe84_admon = d_eco_ddos.de84_admon
					AND	ddos.pe84_referdoc = d_eco_ddos.de84_referdoc
					AND	ddos.pe84_secuen = d_eco_ddos.de84_secuen
						
			--documentos
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON doc.referencia = CAST(cabe.cabe_ejercicio AS varchar)+'JQ'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'
					AND doc.marca_baja IS NULL

			--expedientes
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON doc.id_expediente=e.id_expediente

			--buscar los nif en contribuyentes (para declarante y declarados)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
					ON cabe.cabe_cifdecl=c.nif_maestro 
					AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
					ON ddos.pe84_cif=d.nif_maestro 
					AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON admini_decl.cod_administracion=cabe.cabe_admon	
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON admini_ddos.cod_administracion=ddos.pe84_admon
			
			--LEFT JOIN con cada maestro
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias banc
					ON cabe.cabe_banco = banc.cod_entidad_bancaria 
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion presenta
					ON cabe.cabe_tiposoporte = presenta.cod_tipo_presentacion
					
			--LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte soporte
			--		ON cabe.cabe_tiposoporte = soporte.cod_tipo_soporte
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl
					ON cabe.cabe_tipodecl = tipo_decl.cod_tipo_declaracion	
			
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais
					ON ddos.pe84_pais = pais.cod_pais 
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov
					ON ddos.pe84_provincia = prov.cod_provincia2		
			
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_participe_184 claves_participe
					ON ddos.pe84_clave_partic = claves_participe.cod_clave_participe_184

			--declarados
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 claves_ddos
					ON d_eco_ddos.de84_clave = claves_ddos.cod_clave_184

			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184 subclaves_ddos
					ON d_eco_ddos.de84_clave = subclaves_ddos.cod_clave_184
					AND d_eco_ddos.de84_subclave = subclaves_ddos.cod_subclave_184
			
			----no_identificados_declarado
			LEFT JOIN	mae_noid mae_noid_det
					ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
					AND CAST(cabe.cabe_referdoc AS VARCHAR(9)) = mae_noid_det.clavagru
					AND right('0000000000000' +  cast(ddos.pe84_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
					
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
)
	MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr AS tbn1_mi_ds_184_irfp_sociedades_irnr
	USING query ON (query.id_documento=tbn1_mi_ds_184_irfp_sociedades_irnr.id_documento OR (query.id_documento IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.id_documento IS NULL)) AND (query.secuencia=tbn1_mi_ds_184_irfp_sociedades_irnr.secuencia OR (query.secuencia IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.secuencia IS NULL)) AND (query.id_mae_claves_184_declarante=tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_184_declarante OR (query.id_mae_claves_184_declarante IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_184_declarante IS NULL)) AND (query.id_mae_subclaves_184_declarante=tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_subclaves_184_declarante OR (query.id_mae_subclaves_184_declarante IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_subclaves_184_declarante IS NULL)) AND (query.campo_declarante=tbn1_mi_ds_184_irfp_sociedades_irnr.campo_declarante OR (query.campo_declarante IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.campo_declarante IS NULL)) AND (query.orden_declarante=tbn1_mi_ds_184_irfp_sociedades_irnr.orden_declarante OR (query.orden_declarante IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.orden_declarante IS NULL)) AND (query.id_mae_claves_184_declarado=tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_184_declarado OR (query.id_mae_claves_184_declarado IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_184_declarado IS NULL)) AND (query.id_mae_subclaves_184_declarado=tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_subclaves_184_declarado OR (query.id_mae_subclaves_184_declarado IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_subclaves_184_declarado IS NULL)) AND (query.campo_declarado=tbn1_mi_ds_184_irfp_sociedades_irnr.campo_declarado OR (query.campo_declarado IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.campo_declarado IS NULL)) AND (query.orden_declarado=tbn1_mi_ds_184_irfp_sociedades_irnr.orden_declarado OR (query.orden_declarado IS NULL AND tbn1_mi_ds_184_irfp_sociedades_irnr.orden_declarado IS NULL))
	WHEN MATCHED AND ((tbn1_mi_ds_184_irfp_sociedades_irnr.id_expediente<>query.id_expediente OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.ejercicio<>query.ejercicio OR (tbn1_mi_ds_184_irfp_sociedades_irnr.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.modelo<>query.modelo OR (tbn1_mi_ds_184_irfp_sociedades_irnr.modelo IS NULL AND query.modelo IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.modelo IS NOT NULL AND query.modelo IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_administracion_declarante<>query.id_administracion_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_administracion_declarante IS NULL AND query.id_administracion_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_administracion_declarante IS NOT NULL AND query.id_administracion_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_184_11<>query.nif_declarante_184_11 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_184_11 IS NULL AND query.nif_declarante_184_11 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_184_11 IS NOT NULL AND query.nif_declarante_184_11 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_no_identificado_11<>query.nif_declarante_no_identificado_11 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_no_identificado_11 IS NULL AND query.nif_declarante_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_no_identificado_11 IS NOT NULL AND query.nif_declarante_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_184<>query.nif_declarante_184 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_184 IS NULL AND query.nif_declarante_184 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_184 IS NOT NULL AND query.nif_declarante_184 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.sw_identificado_declarante<>query.sw_identificado_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.telefono<>query.telefono OR (tbn1_mi_ds_184_irfp_sociedades_irnr.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.telefono IS NOT NULL AND query.telefono IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.persona_relacionarse<>query.persona_relacionarse OR (tbn1_mi_ds_184_irfp_sociedades_irnr.persona_relacionarse IS NULL AND query.persona_relacionarse IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.persona_relacionarse IS NOT NULL AND query.persona_relacionarse IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_184_irfp_sociedades_irnr.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_entidades_bancarias<>query.id_mae_entidades_bancarias OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_entidades_bancarias IS NULL AND query.id_mae_entidades_bancarias IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_entidades_bancarias IS NOT NULL AND query.id_mae_entidades_bancarias IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.fecha_presentacion<>query.fecha_presentacion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.num_caja<>query.num_caja OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_caja IS NULL AND query.num_caja IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_caja IS NOT NULL AND query.num_caja IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.fecha_alta<>query.fecha_alta OR (tbn1_mi_ds_184_irfp_sociedades_irnr.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.mes_alta<>query.mes_alta OR (tbn1_mi_ds_184_irfp_sociedades_irnr.mes_alta IS NULL AND query.mes_alta IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.anyo_alta<>query.anyo_alta OR (tbn1_mi_ds_184_irfp_sociedades_irnr.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.num_justificante<>query.num_justificante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.num_justificante_sustitutiva<>query.num_justificante_sustitutiva OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_justificante_sustitutiva IS NULL AND query.num_justificante_sustitutiva IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_justificante_sustitutiva IS NOT NULL AND query.num_justificante_sustitutiva IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_184_irfp_sociedades_irnr.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_184_irfp_sociedades_irnr.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.pendiente_baja<>query.pendiente_baja OR (tbn1_mi_ds_184_irfp_sociedades_irnr.pendiente_baja IS NULL AND query.pendiente_baja IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.pendiente_baja IS NOT NULL AND query.pendiente_baja IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.num_declarados<>query.num_declarados OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_declarados IS NULL AND query.num_declarados IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_declarados IS NOT NULL AND query.num_declarados IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_tipos_entidad<>query.id_mae_claves_tipos_entidad OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_tipos_entidad IS NULL AND query.id_mae_claves_tipos_entidad IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_tipos_entidad IS NOT NULL AND query.id_mae_claves_tipos_entidad IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_actividad_ppal<>query.id_mae_claves_actividad_ppal OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_actividad_ppal IS NULL AND query.id_mae_claves_actividad_ppal IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_actividad_ppal IS NOT NULL AND query.id_mae_claves_actividad_ppal IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_tipos_entidad_extranjero<>query.id_mae_claves_tipos_entidad_extranjero OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_tipos_entidad_extranjero IS NULL AND query.id_mae_claves_tipos_entidad_extranjero IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_tipos_entidad_extranjero IS NOT NULL AND query.id_mae_claves_tipos_entidad_extranjero IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_objeto_extranjero<>query.es_objeto_extranjero OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_objeto_extranjero IS NULL AND query.es_objeto_extranjero IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_objeto_extranjero IS NOT NULL AND query.es_objeto_extranjero IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_pais_extranjero<>query.id_pais_extranjero OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_pais_extranjero IS NULL AND query.id_pais_extranjero IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_pais_extranjero IS NOT NULL AND query.id_pais_extranjero IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.renta_residentes_extranjero<>query.renta_residentes_extranjero OR (tbn1_mi_ds_184_irfp_sociedades_irnr.renta_residentes_extranjero IS NULL AND query.renta_residentes_extranjero IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.renta_residentes_extranjero IS NOT NULL AND query.renta_residentes_extranjero IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_regimen_impuesto_soc_extranjero<>query.es_regimen_impuesto_soc_extranjero OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_regimen_impuesto_soc_extranjero IS NULL AND query.es_regimen_impuesto_soc_extranjero IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_regimen_impuesto_soc_extranjero IS NOT NULL AND query.es_regimen_impuesto_soc_extranjero IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.cif_representante<>query.cif_representante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.cif_representante IS NULL AND query.cif_representante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.cif_representante IS NOT NULL AND query.cif_representante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nombre_representante<>query.nombre_representante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nombre_representante IS NULL AND query.nombre_representante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nombre_representante IS NOT NULL AND query.nombre_representante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_ds_184_irfp_sociedades_irnr.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_administracion_declarado<>query.id_administracion_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_administracion_declarado IS NULL AND query.id_administracion_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_administracion_declarado IS NOT NULL AND query.id_administracion_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_184_11<>query.nif_declarado_184_11 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_184_11 IS NULL AND query.nif_declarado_184_11 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_184_11 IS NOT NULL AND query.nif_declarado_184_11 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_184<>query.nif_declarado_184 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_184 IS NULL AND query.nif_declarado_184 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_184 IS NOT NULL AND query.nif_declarado_184 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.sw_identificado_declarado<>query.sw_identificado_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_representante<>query.es_representante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_representante IS NULL AND query.es_representante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_representante IS NOT NULL AND query.es_representante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_provincia<>query.id_provincia OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_pais<>query.id_pais OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_pais IS NULL AND query.id_pais IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_pais IS NOT NULL AND query.id_pais IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_participe_184<>query.id_mae_claves_participe_184 OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_participe_184 IS NULL AND query.id_mae_claves_participe_184 IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.id_mae_claves_participe_184 IS NOT NULL AND query.id_mae_claves_participe_184 IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_miembro_31_diciembre<>query.es_miembro_31_diciembre OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_miembro_31_diciembre IS NULL AND query.es_miembro_31_diciembre IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_miembro_31_diciembre IS NOT NULL AND query.es_miembro_31_diciembre IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.num_dias_miembro<>query.num_dias_miembro OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_dias_miembro IS NULL AND query.num_dias_miembro IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.num_dias_miembro IS NOT NULL AND query.num_dias_miembro IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.domicilio_fiscal<>query.domicilio_fiscal OR (tbn1_mi_ds_184_irfp_sociedades_irnr.domicilio_fiscal IS NULL AND query.domicilio_fiscal IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.domicilio_fiscal IS NOT NULL AND query.domicilio_fiscal IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_ejerce_actividad<>query.es_ejerce_actividad OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_ejerce_actividad IS NULL AND query.es_ejerce_actividad IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_ejerce_actividad IS NOT NULL AND query.es_ejerce_actividad IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.porcentaje_atribucion<>query.porcentaje_atribucion OR (tbn1_mi_ds_184_irfp_sociedades_irnr.porcentaje_atribucion IS NULL AND query.porcentaje_atribucion IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.porcentaje_atribucion IS NOT NULL AND query.porcentaje_atribucion IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_declarado<>query.es_erroneo_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.valor_declarante<>query.valor_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.valor_declarante IS NULL AND query.valor_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.valor_declarante IS NOT NULL AND query.valor_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_dato_ec_declarante<>query.es_erroneo_dato_ec_declarante OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_dato_ec_declarante IS NULL AND query.es_erroneo_dato_ec_declarante IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_dato_ec_declarante IS NOT NULL AND query.es_erroneo_dato_ec_declarante IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.valor_declarado<>query.valor_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.valor_declarado IS NULL AND query.valor_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.valor_declarado IS NOT NULL AND query.valor_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_dato_ec_declarado<>query.es_erroneo_dato_ec_declarado OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_dato_ec_declarado IS NULL AND query.es_erroneo_dato_ec_declarado IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.es_erroneo_dato_ec_declarado IS NOT NULL AND query.es_erroneo_dato_ec_declarado IS NULL)
			OR tbn1_mi_ds_184_irfp_sociedades_irnr.contador_declarados<>query.contador_declarados OR (tbn1_mi_ds_184_irfp_sociedades_irnr.contador_declarados IS NULL AND query.contador_declarados IS NOT NULL) OR (tbn1_mi_ds_184_irfp_sociedades_irnr.contador_declarados IS NOT NULL AND query.contador_declarados IS NULL) OR (fec_baja IS NOT NULL))) THEN
		UPDATE SET
			fec_modificacion=getdate(),
			fec_baja=null,
			id_expediente=query.id_expediente,
			ejercicio=query.ejercicio,
			modelo=query.modelo,
			id_administracion_declarante=query.id_administracion_declarante,
			es_externo_declarante=query.es_externo_declarante,
			nif_declarante_184_11=query.nif_declarante_184_11,
			nif_declarante_no_identificado_11=query.nif_declarante_no_identificado_11,
			nif_declarante_184=query.nif_declarante_184,
			nif_declarante_no_identificado=query.nif_declarante_no_identificado,
			es_contribuyente_declarante=query.es_contribuyente_declarante,
			id_contribuyente_declarante=query.id_contribuyente_declarante,
			es_identificado_declarante=query.es_identificado_declarante,
			sw_identificado_declarante=query.sw_identificado_declarante,
			id_mae_no_id_declarante=query.id_mae_no_id_declarante,
			telefono=query.telefono,
			persona_relacionarse=query.persona_relacionarse,
			cod_presentador_colectivo=query.cod_presentador_colectivo,
			id_mae_entidades_bancarias=query.id_mae_entidades_bancarias,
			id_tipo_presentacion=query.id_tipo_presentacion,
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
			num_declarados=query.num_declarados,
			id_mae_claves_tipos_entidad=query.id_mae_claves_tipos_entidad,
			id_mae_claves_actividad_ppal=query.id_mae_claves_actividad_ppal,
			id_mae_claves_tipos_entidad_extranjero=query.id_mae_claves_tipos_entidad_extranjero,
			es_objeto_extranjero=query.es_objeto_extranjero,
			id_pais_extranjero=query.id_pais_extranjero,
			renta_residentes_extranjero=query.renta_residentes_extranjero,
			es_regimen_impuesto_soc_extranjero=query.es_regimen_impuesto_soc_extranjero,
			cif_representante=query.cif_representante,
			nombre_representante=query.nombre_representante,
			volumen_operaciones=query.volumen_operaciones,
			id_administracion_declarado=query.id_administracion_declarado,
			es_externo_declarado=query.es_externo_declarado,
			nif_declarado_184_11=query.nif_declarado_184_11,
			nif_declarado_no_identificado_11=query.nif_declarado_no_identificado_11,
			nif_declarado_184=query.nif_declarado_184,
			nif_declarado_no_identificado=query.nif_declarado_no_identificado,
			es_contribuyente_declarado=query.es_contribuyente_declarado,
			id_contribuyente_declarado=query.id_contribuyente_declarado,
			es_identificado_declarado=query.es_identificado_declarado,
			sw_identificado_declarado=query.sw_identificado_declarado,
			id_mae_no_id_declarado=query.id_mae_no_id_declarado,
			es_representante=query.es_representante,
			id_provincia=query.id_provincia,
			id_pais=query.id_pais,
			id_mae_claves_participe_184=query.id_mae_claves_participe_184,
			es_miembro_31_diciembre=query.es_miembro_31_diciembre,
			num_dias_miembro=query.num_dias_miembro,
			porcentaje_participacion=query.porcentaje_participacion,
			domicilio_fiscal=query.domicilio_fiscal,
			es_ejerce_actividad=query.es_ejerce_actividad,
			porcentaje_atribucion=query.porcentaje_atribucion,
			es_erroneo_declarado=query.es_erroneo_declarado,
			valor_declarante=query.valor_declarante,
			es_erroneo_dato_ec_declarante=query.es_erroneo_dato_ec_declarante,
			valor_declarado=query.valor_declarado,
			es_erroneo_dato_ec_declarado=query.es_erroneo_dato_ec_declarado,
			contador_declarados=query.contador_declarados
	WHEN NOT MATCHED THEN
		INSERT (fec_alta,fec_modificacion,id_documento,id_expediente,ejercicio,modelo,id_administracion_declarante,es_externo_declarante,nif_declarante_184_11,nif_declarante_no_identificado_11,nif_declarante_184,nif_declarante_no_identificado,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,id_mae_no_id_declarante,telefono,persona_relacionarse,cod_presentador_colectivo,id_mae_entidades_bancarias,id_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,id_tipo_declaracion,num_justificante_sustitutiva,contador_revisiones,regimen_fiscal_deducciones,pendiente_baja,num_declarados,id_mae_claves_tipos_entidad,id_mae_claves_actividad_ppal,id_mae_claves_tipos_entidad_extranjero,es_objeto_extranjero,id_pais_extranjero,renta_residentes_extranjero,es_regimen_impuesto_soc_extranjero,cif_representante,nombre_representante,volumen_operaciones,id_administracion_declarado,es_externo_declarado,secuencia,nif_declarado_184_11,nif_declarado_no_identificado_11,nif_declarado_184,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,id_mae_no_id_declarado,es_representante,id_provincia,id_pais,id_mae_claves_participe_184,es_miembro_31_diciembre,num_dias_miembro,porcentaje_participacion,domicilio_fiscal,es_ejerce_actividad,porcentaje_atribucion,es_erroneo_declarado,id_mae_claves_184_declarante,id_mae_subclaves_184_declarante,campo_declarante,orden_declarante,valor_declarante,es_erroneo_dato_ec_declarante,id_mae_claves_184_declarado,id_mae_subclaves_184_declarado,campo_declarado,orden_declarado,valor_declarado,es_erroneo_dato_ec_declarado,contador_declarados) VALUES (
			getdate(),
			getdate(),
			query.id_documento,
			query.id_expediente,
			query.ejercicio,
			query.modelo,
			query.id_administracion_declarante,
			query.es_externo_declarante,
			query.nif_declarante_184_11,
			query.nif_declarante_no_identificado_11,
			query.nif_declarante_184,
			query.nif_declarante_no_identificado,
			query.es_contribuyente_declarante,
			query.id_contribuyente_declarante,
			query.es_identificado_declarante,
			query.sw_identificado_declarante,
			query.id_mae_no_id_declarante,
			query.telefono,
			query.persona_relacionarse,
			query.cod_presentador_colectivo,
			query.id_mae_entidades_bancarias,
			query.id_tipo_presentacion,
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
			query.num_declarados,
			query.id_mae_claves_tipos_entidad,
			query.id_mae_claves_actividad_ppal,
			query.id_mae_claves_tipos_entidad_extranjero,
			query.es_objeto_extranjero,
			query.id_pais_extranjero,
			query.renta_residentes_extranjero,
			query.es_regimen_impuesto_soc_extranjero,
			query.cif_representante,
			query.nombre_representante,
			query.volumen_operaciones,
			query.id_administracion_declarado,
			query.es_externo_declarado,
			query.secuencia,
			query.nif_declarado_184_11,
			query.nif_declarado_no_identificado_11,
			query.nif_declarado_184,
			query.nif_declarado_no_identificado,
			query.es_contribuyente_declarado,
			query.id_contribuyente_declarado,
			query.es_identificado_declarado,
			query.sw_identificado_declarado,
			query.id_mae_no_id_declarado,
			query.es_representante,
			query.id_provincia,
			query.id_pais,
			query.id_mae_claves_participe_184,
			query.es_miembro_31_diciembre,
			query.num_dias_miembro,
			query.porcentaje_participacion,
			query.domicilio_fiscal,
			query.es_ejerce_actividad,
			query.porcentaje_atribucion,
			query.es_erroneo_declarado,
			query.id_mae_claves_184_declarante,
			query.id_mae_subclaves_184_declarante,
			query.campo_declarante,
			query.orden_declarante,
			query.valor_declarante,
			query.es_erroneo_dato_ec_declarante,
			query.id_mae_claves_184_declarado,
			query.id_mae_subclaves_184_declarado,
			query.campo_declarado,
			query.orden_declarado,
			query.valor_declarado,
			query.es_erroneo_dato_ec_declarado,
			query.contador_declarados
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
