PRINT 'tmp_cargar_mi_ds_modelo_159.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica(
  id_mi_ds_159 int IDENTITY(1,1),
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  ejercicio smallint,
  modelo varchar(3),
  administracion_declarante varchar(1),
  es_externo_declarante bit,
  nif_declarante_159 varchar(11),
  nif_declarante_no_identificado varchar(11),
  es_contribuyente_declarante bit,
  id_contribuyente_declarante int,
  es_identificado_declarante bit,
  sw_identificado_declarante varchar(1),
  telefono varchar(10),
  razon_social varchar(40),
  cod_presentador_colectivo int,
  cod_banco_espania varchar(4),
  id_tipo_presentacion int NOT NULL,
  fecha_presentacion date,
  mes_presentacion int,
  anyo_presentacion int,
  num_caja varchar(8),
  num_justificante numeric(13),
  id_tipo_declaracion int NOT NULL,
  contador_revisiones int,
  regimen_fiscal_deducciones varchar(1),
  administracion_declarado varchar(1),
  es_externo_declarado bit,
  secuencia varchar(9),
  nif_declarado_159 varchar(11),
  nif_declarado_no_identificado varchar(11),
  es_contribuyente_declarado bit,
  id_contribuyente_declarado int,
  es_identificado_declarado bit,
  sw_identificado_declarado varchar(1),
  es_erroneo_declarado bit,
  id_clave_tipo_codigo int NOT NULL,
  codigo_iban varchar(4) NOT NULL,
  codigo_entidad varchar(4) NOT NULL,
  codigo_sucursal varchar(4) NOT NULL,
  digito_control varchar(2) NOT NULL,
  codigo_cuenta varchar(10) NOT NULL,
  id_pais_residencia int NOT NULL,
  identificacion_extranjero varchar(15) NOT NULL,
  contrato_suministro varchar(12) NOT NULL,
  id_cups_codigo_pais int NOT NULL,
  cups_distribuidora varchar(4) NOT NULL,
  cups_numero_libre_asignacion varchar(12) NOT NULL,
  cups_digito_control varchar(2) NOT NULL,
  cups_punto_medida varchar(1) NOT NULL,
  cups_punto_suministro varchar(1) NOT NULL,
  tipo_bien varchar(1) NOT NULL,
  situacion_inmueble varchar(1) NOT NULL,
  referencia_catastral varchar(20) NOT NULL,
  fecha_alta_contrato date NOT NULL,
  fecha_baja_contrato date NOT NULL,
  unidad_medida_consumo varchar(1) NOT NULL,
  unidad_medida_potencia varchar(1) NOT NULL,
  potencia_maxima_contratada varchar(6) NOT NULL,
  id_tipo_importe int NOT NULL,
  importe numeric(18,2),
  id_tipo_periodo int NOT NULL,
  consumo_facturado decimal(4,0) NULL,
  tipo_lectura varchar(1) NULL,
  tipo_direccion varchar(1) NOT NULL,
  orden int NOT NULL,
  num_puente_domicilio varchar(11) NOT NULL,
  tipo_via varchar(5) NULL,
  nombre_via varchar(50) NULL,
  tipo_numero varchar(3) NULL,
  numero_casa varchar(5) NULL,
  calificador_numero varchar(3) NULL,
  bloque varchar(3) NULL,
  portal varchar(3) NULL,
  escalera varchar(3) NULL,
  piso varchar(3) NULL,
  puerta varchar(3) NULL,
  complemento varchar(40) NULL,
  localidad varchar(30) NULL,
  municipio varchar(30) NULL,
  id_municipio int,
  id_provincia int,
  codigo_postal varchar(5) NULL,
  nif_representante varchar(11) NULL,
  forma_juridica_representante varchar(1) NULL,
  letra_nif_representante varchar(1) NULL,
  fecha_alta_representante date NULL,
  fecha_modificacion_representante date NULL,
  sw_baja_representante varchar(1) NULL,
  num_puente_representante varchar(11) NOT NULL,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_ds_mod159 UNIQUE (id_documento,secuencia,id_tipo_importe,id_tipo_periodo),
  CONSTRAINT PK_tbn1_mi_ds_159_consumo_energia_electrica PRIMARY KEY CLUSTERED (id_mi_ds_159),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_clave_tipo_codigo FOREIGN KEY (id_clave_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(id_clave_tipo_codigo),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_paises FOREIGN KEY (id_pais_residencia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_paises1 FOREIGN KEY (id_cups_codigo_pais) REFERENCES dbn1_norm_dhyf.dbo.tbn1_paises(id_pais),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_tipos_periodo FOREIGN KEY (id_tipo_periodo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_tipos_periodo(id_tipo_periodo),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_municipios FOREIGN KEY (id_municipio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_municipios(id_municipio),
  CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_mi_ds_159')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_mi_ds_159 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD ejercicio smallint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD modelo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD administracion_declarante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_externo_declarante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarante_159')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_declarante_159 varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_declarante_no_identificado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_contribuyente_declarante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_contribuyente_declarante int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_identificado_declarante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD sw_identificado_declarante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD razon_social varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_banco_espania varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD mes_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD anyo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_tipo_declaracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD regimen_fiscal_deducciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD administracion_declarado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_externo_declarado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD secuencia varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarado_159')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_declarado_159 varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_declarado_no_identificado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_contribuyente_declarado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_contribuyente_declarado int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_identificado_declarado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD sw_identificado_declarado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_erroneo_declarado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_clave_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_iban')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD codigo_iban varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_entidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD codigo_entidad varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD codigo_sucursal varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='digito_control')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD digito_control varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD codigo_cuenta varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_pais_residencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_pais_residencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='identificacion_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD identificacion_extranjero varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='contrato_suministro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD contrato_suministro varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_cups_codigo_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_cups_codigo_pais int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_distribuidora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_distribuidora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_numero_libre_asignacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_numero_libre_asignacion varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_digito_control')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_digito_control varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_punto_medida')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_punto_medida varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_punto_suministro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_punto_suministro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD tipo_bien varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='situacion_inmueble')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD situacion_inmueble varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='referencia_catastral')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD referencia_catastral varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_alta_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_alta_contrato date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_baja_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_baja_contrato date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='unidad_medida_consumo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD unidad_medida_consumo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='unidad_medida_potencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD unidad_medida_potencia varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='potencia_maxima_contratada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD potencia_maxima_contratada varchar(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_tipo_importe int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD importe numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_periodo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_tipo_periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='consumo_facturado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD consumo_facturado decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_lectura')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD tipo_lectura varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_direccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD tipo_direccion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='orden')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD orden int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_puente_domicilio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD num_puente_domicilio varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_via')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD tipo_via varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nombre_via')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nombre_via varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_numero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD tipo_numero varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='numero_casa')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD numero_casa varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='calificador_numero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD calificador_numero varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='bloque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD bloque varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD portal varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='escalera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD escalera varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='piso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD piso varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='puerta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD puerta varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='complemento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD complemento varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='localidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD localidad varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD municipio varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_municipio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_postal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD codigo_postal varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_representante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='forma_juridica_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD forma_juridica_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='letra_nif_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD letra_nif_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_alta_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_alta_representante date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_modificacion_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_modificacion_representante date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='sw_baja_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD sw_baja_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_puente_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD num_puente_representante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_mi_ds_159' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_mi_ds_159 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN ejercicio smallint NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN modelo varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='administracion_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN administracion_declarante varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_externo_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_externo_declarante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarante_159' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_declarante_159 varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarante_no_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_declarante_no_identificado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_contribuyente_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_contribuyente_declarante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_contribuyente_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_contribuyente_declarante int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_identificado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_identificado_declarante bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='sw_identificado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN sw_identificado_declarante varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='telefono' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN telefono varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN razon_social varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_presentador_colectivo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_banco_espania' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_banco_espania varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='mes_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN mes_presentacion int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='anyo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN anyo_presentacion int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_tipo_declaracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='regimen_fiscal_deducciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN regimen_fiscal_deducciones varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='administracion_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN administracion_declarado varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_externo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_externo_declarado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN secuencia varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarado_159' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_declarado_159 varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarado_no_identificado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_declarado_no_identificado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_contribuyente_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_contribuyente_declarado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_contribuyente_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_contribuyente_declarado int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_identificado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_identificado_declarado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='sw_identificado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN sw_identificado_declarado varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_erroneo_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_erroneo_declarado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_clave_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_clave_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_iban' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_iban varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_entidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_entidad varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_sucursal varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='digito_control' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN digito_control varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_cuenta varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_pais_residencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_pais_residencia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='identificacion_extranjero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN identificacion_extranjero varchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='contrato_suministro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN contrato_suministro varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_cups_codigo_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_cups_codigo_pais int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_distribuidora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_distribuidora varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_numero_libre_asignacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_numero_libre_asignacion varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_digito_control' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_digito_control varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_punto_medida' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_punto_medida varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_punto_suministro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_punto_suministro varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN tipo_bien varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='situacion_inmueble' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN situacion_inmueble varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='referencia_catastral' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN referencia_catastral varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_alta_contrato' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_alta_contrato date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_baja_contrato' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_baja_contrato date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='unidad_medida_consumo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN unidad_medida_consumo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='unidad_medida_potencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN unidad_medida_potencia varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='potencia_maxima_contratada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN potencia_maxima_contratada varchar(6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_tipo_importe int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN importe numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_tipo_periodo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='consumo_facturado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN consumo_facturado decimal(4,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_lectura' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN tipo_lectura varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_direccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN tipo_direccion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='orden' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN orden int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_puente_domicilio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN num_puente_domicilio varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_via' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN tipo_via varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nombre_via' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nombre_via varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='tipo_numero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN tipo_numero varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='numero_casa' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN numero_casa varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='calificador_numero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN calificador_numero varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='bloque' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN bloque varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='portal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN portal varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='escalera' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN escalera varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='piso' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN piso varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='puerta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN puerta varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='complemento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN complemento varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='localidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN localidad varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='municipio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN municipio varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_municipio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_municipio int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='codigo_postal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_postal varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_representante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='forma_juridica_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN forma_juridica_representante varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='letra_nif_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN letra_nif_representante varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_alta_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_alta_representante date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_modificacion_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_modificacion_representante date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='sw_baja_representante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN sw_baja_representante varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_puente_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN num_puente_representante varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='PK_tbn1_mi_ds_159_consumo_energia_electrica')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT PK_tbn1_mi_ds_159_consumo_energia_electrica PRIMARY KEY CLUSTERED (id_mi_ds_159)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(id_tipo_declaracion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_contribuyentes1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_contribuyentes1 FOREIGN KEY (id_contribuyente_declarado) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_clave_tipo_codigo FOREIGN KEY (id_clave_tipo_codigo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(id_clave_tipo_codigo)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_paises')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_paises FOREIGN KEY (id_pais_residencia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_paises1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_paises1 FOREIGN KEY (id_cups_codigo_pais) REFERENCES dbn1_norm_dhyf.dbo.tbn1_paises(id_pais)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(id_tipo_importe)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_tipos_periodo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_tipos_periodo FOREIGN KEY (id_tipo_periodo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_tipos_periodo(id_tipo_periodo)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_municipios')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_municipios FOREIGN KEY (id_municipio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_municipios(id_municipio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND CONSTRAINT_NAME='FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD CONSTRAINT FK_tbn1_mi_ds_159_consumo_energia_electrica_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_ds_159_consumo_energia_electrica' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_ds_159_consumo_energia_electrica;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_ds_159_consumo_energia_electrica(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_ds_159_consumo_energia_electrica'
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
  query AS (
    SELECT TOP 100
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      cabe.cabe_ejercicio AS ejercicio,
      coalesce(cabe.cabe_modelo,'') AS modelo,
      coalesce(cabe.cabe_admon,'') AS administracion_declarante,
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
      coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_159,
      CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
      coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
      CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
      CASE
          WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarante,
      CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado,
      coalesce(cabe.cabe_telefono,'') AS telefono,
      coalesce(cabe.cabe_persona,'') AS razon_social,
      coalesce(cabe.cabe_refpres,'') AS cod_presentador_colectivo,
      coalesce(cabe.cabe_banco,'') AS cod_banco_espania,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres END AS fecha_presentacion,
      month(cabe.cabe_fecpres) AS mes_presentacion,
      year(cabe.cabe_fecpres) AS anyo_presentacion,
      cabe.cabe_numcaja AS num_caja,
      cabe.cabe_justif AS num_justificante,
      coalesce(tipo_declaracion.id_tipo_declaracion,indefinidos.id_tipo_declaracion) AS id_tipo_declaracion,
      cabe.cabe_crevi AS contador_revisiones,
      cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
      coalesce(declarado.mfpe59_admon,'') AS administracion_declarado,
      CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
      CAST(declarado.mfpe59_secuen AS varchar) AS secuencia,
      coalesce(declarado.mfpe59_cif,'') AS nif_declarado_159,
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
      CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarado,
      CASE WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe59_cif,'') END AS nif_declarado_no_identificado,
      CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
      coalesce(clave_tipo_codigo.id_clave_tipo_codigo,indefinidos.id_clave_tipo_codigo) AS id_clave_tipo_codigo,
      coalesce(declarado.mfpe59_iban,'') AS codigo_iban,
      coalesce(declarado.mfpe59_ccc_banco,'') AS codigo_entidad,
      coalesce(declarado.mfpe59_ccc_sucur,'') AS codigo_sucursal,
      coalesce(declarado.mfpe59_ccc_dc,'') AS digito_control,
      coalesce(declarado.mfpe59_ccc_cuenta,'') AS codigo_cuenta,
      coalesce(pais_declarado.id_pais,indefinidos.id_pais) AS id_pais_residencia,
      declarado.mfpe59_cie_codigo AS identificacion_extranjero,
      declarado.mfpe59_contrato AS contrato_suministro,
      coalesce(pais_cups.id_pais,indefinidos.id_pais) AS id_cups_codigo_pais,
      declarado.mfpe59_cups_dist AS cups_distribuidora,
      declarado.mfpe59_cups_libre AS cups_numero_libre_asignacion,
      declarado.mfpe59_cups_dc AS cups_digito_control,
      declarado.mfpe59_cups_medida AS cups_punto_medida,
      declarado.mfpe59_cups_suministro AS cups_punto_suministro,
      declarado.mfpe59_tipo_bien AS tipo_bien,
      declarado.mfpe59_situacion AS situacion_inmueble,
      declarado.mfpe59_refcat AS referencia_catastral,
      declarado.mfpe59_fecalta AS fecha_alta_contrato,
      declarado.mfpe59_fecbaja AS fecha_baja_contrato,
      declarado.mfpe59_unidad_medida AS unidad_medida_consumo,
      declarado.mfpe59_pot_unidad AS unidad_medida_potencia,
      declarado.mfpe59_pot_maxima AS potencia_maxima_contratada,
      coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) AS id_tipo_importe,
      CASE
          WHEN row_number() OVER (PARTITION BY doc.id_documento,CAST(declarado.mfpe59_secuen AS varchar),coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe),coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo) ORDER BY coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo))=1 THEN sum(round(importes.mfim59_importe/100,2))
          ELSE 0
      END AS importe,
      coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo) AS id_tipo_periodo,
      consumos.mfco59_con_fact AS consumo_facturado,
      consumos.mfco59_con_tipo AS tipo_lectura,
      domicilio.sddomi_tipo AS tipo_direccion,
      domicilio.sddomi_orden AS orden,
      domicilio.sddomi_nropte AS num_puente_domicilio,
      domicilio.sddomi_tipo_via AS tipo_via,
      domicilio.sddomi_nombre_via AS nombre_via,
      domicilio.sddomi_tipo_numero AS tipo_numero,
      domicilio.sddomi_numero_casa AS numero_casa,
      domicilio.sddomi_calificador AS calificador_numero,
      domicilio.sddomi_bloque AS bloque,
      domicilio.sddomi_portal AS portal,
      domicilio.sddomi_escalera AS escalera,
      domicilio.sddomi_piso AS piso,
      domicilio.sddomi_puerta AS puerta,
      domicilio.sddomi_complemento AS complemento,
      domicilio.sddomi_localidad AS localidad,
      domicilio.sddomi_municipio AS municipio,
      coalesce(municipio.id_municipio,indefinidos.id_municipio) AS id_municipio,
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      domicilio.sddomi_cdgo_postal AS codigo_postal,
      repre.sdrepr_nifrp AS nif_representante,
      repre.sdrepr_fjuri AS forma_juridica_representante,
      repre.sdrepr_letra AS letra_nif_representante,
      repre.sdrepr_falta AS fecha_alta_representante,
      repre.sdrepr_fmodi AS fecha_modificacion_representante,
      repre.sdrepr_baja AS sw_baja_representante,
      repre.sdrepr_nropte AS num_puente_representante
    FROM dbn1_stg_dhyf.dbo.tbn1pe59_mf declarado
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1im59_mf importes ON (declarado.mfpe59_ejercicio=importes.mfim59_ejercicio AND declarado.mfpe59_admon=importes.mfim59_admon AND declarado.mfpe59_referdoc=importes.mfim59_referdoc AND declarado.mfpe59_secuen=importes.mfim59_secuen)
    INNER JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='159') cabe ON cabe.cabe_ejercicio=declarado.mfpe59_ejercicio AND cabe.cabe_referdoc=declarado.mfpe59_referdoc
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1co59_mf consumos ON (declarado.mfpe59_ejercicio=consumos.mfco59_ejercicio AND declarado.mfpe59_admon=consumos.mfco59_admon AND declarado.mfpe59_referdoc=consumos.mfco59_referdoc AND declarado.mfpe59_secuen=consumos.mfco59_secuen)
    LEFT JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1domi_sd WHERE sddomi_modelo='159' AND sddomi_cdgo_prov='48') domicilio ON declarado.mfpe59_ejercicio=domicilio.sddomi_ejercicio AND declarado.mfpe59_admon=domicilio.sddomi_admon AND declarado.mfpe59_referdoc=domicilio.sddomi_referdoc AND declarado.mfpe59_secuen=domicilio.sddomi_secuen
    LEFT JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1repr_sd WHERE sdrepr_model='159') repre ON declarado.mfpe59_ejercicio=repre.sdrepr_ejerc AND declarado.mfpe59_admon=repre.sdrepr_admon AND declarado.mfpe59_referdoc=CAST(repre.sdrepr_refer AS varchar) AND declarado.mfpe59_secuen=repre.sdrepr_secue
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.mfpe59_ejercicio AS varchar)+'I<'+CAST(declarado.mfpe59_referdoc AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (declarado.mfpe59_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.mfim59_tipo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo clave_tipo_codigo ON (clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe59_tipo_codigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_declarado ON (pais_declarado.cod_pais=declarado.mfpe59_cie_pais)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_cups ON (pais_cups.cod_pais=declarado.mfpe59_cups_pais)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=domicilio.sddomi_cdgo_prov)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_municipios municipio ON (municipio.cod_municipio=domicilio.sddomi_cdgo_mun)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_tipos_periodo tipos_periodo ON (tipos_periodo.cod_tipo_periodo=consumos.mfco59_periodo)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      e.id_expediente,
      cabe.cabe_ejercicio,
      coalesce(cabe.cabe_modelo,''),
      coalesce(cabe.cabe_admon,''),
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END,
      coalesce(cabe.cabe_cifdecl,''),
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
      coalesce(cabe.cabe_telefono,''),
      coalesce(cabe.cabe_persona,''),
      coalesce(cabe.cabe_refpres,''),
      coalesce(cabe.cabe_banco,''),
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion),
      CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres END,
      month(cabe.cabe_fecpres),
      year(cabe.cabe_fecpres),
      cabe.cabe_numcaja,
      cabe.cabe_justif,
      coalesce(tipo_declaracion.id_tipo_declaracion,indefinidos.id_tipo_declaracion),
      cabe.cabe_crevi,
      cabe.cabe_regfiscal,
      coalesce(declarado.mfpe59_admon,''),
      CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END,
      CAST(declarado.mfpe59_secuen AS varchar),
      coalesce(declarado.mfpe59_cif,''),
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END,
      CASE
          WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END,
      CASE WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe59_cif,'') END,
      CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END,
      coalesce(clave_tipo_codigo.id_clave_tipo_codigo,indefinidos.id_clave_tipo_codigo),
      coalesce(declarado.mfpe59_iban,''),
      coalesce(declarado.mfpe59_ccc_banco,''),
      coalesce(declarado.mfpe59_ccc_sucur,''),
      coalesce(declarado.mfpe59_ccc_dc,''),
      coalesce(declarado.mfpe59_ccc_cuenta,''),
      coalesce(pais_declarado.id_pais,indefinidos.id_pais),
      declarado.mfpe59_cie_codigo,
      declarado.mfpe59_contrato,
      coalesce(pais_cups.id_pais,indefinidos.id_pais),
      declarado.mfpe59_cups_dist,
      declarado.mfpe59_cups_libre,
      declarado.mfpe59_cups_dc,
      declarado.mfpe59_cups_medida,
      declarado.mfpe59_cups_suministro,
      declarado.mfpe59_tipo_bien,
      declarado.mfpe59_situacion,
      declarado.mfpe59_refcat,
      declarado.mfpe59_fecalta,
      declarado.mfpe59_fecbaja,
      declarado.mfpe59_unidad_medida,
      declarado.mfpe59_pot_unidad,
      declarado.mfpe59_pot_maxima,
      coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe),
      coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo),
      consumos.mfco59_con_fact,
      consumos.mfco59_con_tipo,
      domicilio.sddomi_tipo,
      domicilio.sddomi_orden,
      domicilio.sddomi_nropte,
      domicilio.sddomi_tipo_via,
      domicilio.sddomi_nombre_via,
      domicilio.sddomi_tipo_numero,
      domicilio.sddomi_numero_casa,
      domicilio.sddomi_calificador,
      domicilio.sddomi_bloque,
      domicilio.sddomi_portal,
      domicilio.sddomi_escalera,
      domicilio.sddomi_piso,
      domicilio.sddomi_puerta,
      domicilio.sddomi_complemento,
      domicilio.sddomi_localidad,
      domicilio.sddomi_municipio,
      coalesce(municipio.id_municipio,indefinidos.id_municipio),
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      domicilio.sddomi_cdgo_postal,
      repre.sdrepr_nifrp,
      repre.sdrepr_fjuri,
      repre.sdrepr_letra,
      repre.sdrepr_falta,
      repre.sdrepr_fmodi,
      repre.sdrepr_baja,
      repre.sdrepr_nropte
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica AS tbn1_mi_ds_159_consumo_energia_electrica
  USING query ON query.id_documento=tbn1_mi_ds_159_consumo_energia_electrica.id_documento AND query.fecha_presentacion=tbn1_mi_ds_159_consumo_energia_electrica.fecha_presentacion AND query.secuencia=tbn1_mi_ds_159_consumo_energia_electrica.secuencia AND query.id_tipo_importe=tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_importe AND query.id_tipo_periodo=tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_periodo
  WHEN MATCHED AND ((tbn1_mi_ds_159_consumo_energia_electrica.id_expediente<>query.id_expediente OR (tbn1_mi_ds_159_consumo_energia_electrica.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.ejercicio<>query.ejercicio OR (tbn1_mi_ds_159_consumo_energia_electrica.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.modelo<>query.modelo OR (tbn1_mi_ds_159_consumo_energia_electrica.modelo IS NULL AND query.modelo IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.modelo IS NOT NULL AND query.modelo IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.administracion_declarante<>query.administracion_declarante OR (tbn1_mi_ds_159_consumo_energia_electrica.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_externo_declarante<>query.es_externo_declarante OR (tbn1_mi_ds_159_consumo_energia_electrica.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.nif_declarante_159<>query.nif_declarante_159 OR (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarante_159 IS NULL AND query.nif_declarante_159 IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarante_159 IS NOT NULL AND query.nif_declarante_159 IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (tbn1_mi_ds_159_consumo_energia_electrica.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (tbn1_mi_ds_159_consumo_energia_electrica.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_identificado_declarante<>query.es_identificado_declarante OR (tbn1_mi_ds_159_consumo_energia_electrica.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.sw_identificado_declarante<>query.sw_identificado_declarante OR (tbn1_mi_ds_159_consumo_energia_electrica.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.telefono<>query.telefono OR (tbn1_mi_ds_159_consumo_energia_electrica.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.razon_social<>query.razon_social OR (tbn1_mi_ds_159_consumo_energia_electrica.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_mi_ds_159_consumo_energia_electrica.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cod_banco_espania<>query.cod_banco_espania OR (tbn1_mi_ds_159_consumo_energia_electrica.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.mes_presentacion<>query.mes_presentacion OR (tbn1_mi_ds_159_consumo_energia_electrica.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.anyo_presentacion<>query.anyo_presentacion OR (tbn1_mi_ds_159_consumo_energia_electrica.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.num_caja<>query.num_caja OR (tbn1_mi_ds_159_consumo_energia_electrica.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.num_justificante<>query.num_justificante OR (tbn1_mi_ds_159_consumo_energia_electrica.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_declaracion<>query.id_tipo_declaracion OR (tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.contador_revisiones<>query.contador_revisiones OR (tbn1_mi_ds_159_consumo_energia_electrica.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (tbn1_mi_ds_159_consumo_energia_electrica.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.administracion_declarado<>query.administracion_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_externo_declarado<>query.es_externo_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.nif_declarado_159<>query.nif_declarado_159 OR (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarado_159 IS NULL AND query.nif_declarado_159 IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarado_159 IS NOT NULL AND query.nif_declarado_159 IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_identificado_declarado<>query.es_identificado_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.sw_identificado_declarado<>query.sw_identificado_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.es_erroneo_declarado<>query.es_erroneo_declarado OR (tbn1_mi_ds_159_consumo_energia_electrica.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_clave_tipo_codigo<>query.id_clave_tipo_codigo OR (tbn1_mi_ds_159_consumo_energia_electrica.id_clave_tipo_codigo IS NULL AND query.id_clave_tipo_codigo IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_clave_tipo_codigo IS NOT NULL AND query.id_clave_tipo_codigo IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.codigo_iban<>query.codigo_iban OR (tbn1_mi_ds_159_consumo_energia_electrica.codigo_iban IS NULL AND query.codigo_iban IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.codigo_iban IS NOT NULL AND query.codigo_iban IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.codigo_entidad<>query.codigo_entidad OR (tbn1_mi_ds_159_consumo_energia_electrica.codigo_entidad IS NULL AND query.codigo_entidad IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.codigo_entidad IS NOT NULL AND query.codigo_entidad IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.codigo_sucursal<>query.codigo_sucursal OR (tbn1_mi_ds_159_consumo_energia_electrica.codigo_sucursal IS NULL AND query.codigo_sucursal IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.codigo_sucursal IS NOT NULL AND query.codigo_sucursal IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.digito_control<>query.digito_control OR (tbn1_mi_ds_159_consumo_energia_electrica.digito_control IS NULL AND query.digito_control IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.digito_control IS NOT NULL AND query.digito_control IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.codigo_cuenta<>query.codigo_cuenta OR (tbn1_mi_ds_159_consumo_energia_electrica.codigo_cuenta IS NULL AND query.codigo_cuenta IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.codigo_cuenta IS NOT NULL AND query.codigo_cuenta IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_pais_residencia<>query.id_pais_residencia OR (tbn1_mi_ds_159_consumo_energia_electrica.id_pais_residencia IS NULL AND query.id_pais_residencia IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_pais_residencia IS NOT NULL AND query.id_pais_residencia IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.identificacion_extranjero<>query.identificacion_extranjero OR (tbn1_mi_ds_159_consumo_energia_electrica.identificacion_extranjero IS NULL AND query.identificacion_extranjero IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.identificacion_extranjero IS NOT NULL AND query.identificacion_extranjero IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.contrato_suministro<>query.contrato_suministro OR (tbn1_mi_ds_159_consumo_energia_electrica.contrato_suministro IS NULL AND query.contrato_suministro IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.contrato_suministro IS NOT NULL AND query.contrato_suministro IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_cups_codigo_pais<>query.id_cups_codigo_pais OR (tbn1_mi_ds_159_consumo_energia_electrica.id_cups_codigo_pais IS NULL AND query.id_cups_codigo_pais IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_cups_codigo_pais IS NOT NULL AND query.id_cups_codigo_pais IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cups_distribuidora<>query.cups_distribuidora OR (tbn1_mi_ds_159_consumo_energia_electrica.cups_distribuidora IS NULL AND query.cups_distribuidora IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cups_distribuidora IS NOT NULL AND query.cups_distribuidora IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cups_numero_libre_asignacion<>query.cups_numero_libre_asignacion OR (tbn1_mi_ds_159_consumo_energia_electrica.cups_numero_libre_asignacion IS NULL AND query.cups_numero_libre_asignacion IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cups_numero_libre_asignacion IS NOT NULL AND query.cups_numero_libre_asignacion IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cups_digito_control<>query.cups_digito_control OR (tbn1_mi_ds_159_consumo_energia_electrica.cups_digito_control IS NULL AND query.cups_digito_control IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cups_digito_control IS NOT NULL AND query.cups_digito_control IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cups_punto_medida<>query.cups_punto_medida OR (tbn1_mi_ds_159_consumo_energia_electrica.cups_punto_medida IS NULL AND query.cups_punto_medida IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cups_punto_medida IS NOT NULL AND query.cups_punto_medida IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.cups_punto_suministro<>query.cups_punto_suministro OR (tbn1_mi_ds_159_consumo_energia_electrica.cups_punto_suministro IS NULL AND query.cups_punto_suministro IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.cups_punto_suministro IS NOT NULL AND query.cups_punto_suministro IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.tipo_bien<>query.tipo_bien OR (tbn1_mi_ds_159_consumo_energia_electrica.tipo_bien IS NULL AND query.tipo_bien IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.tipo_bien IS NOT NULL AND query.tipo_bien IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.situacion_inmueble<>query.situacion_inmueble OR (tbn1_mi_ds_159_consumo_energia_electrica.situacion_inmueble IS NULL AND query.situacion_inmueble IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.situacion_inmueble IS NOT NULL AND query.situacion_inmueble IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.referencia_catastral<>query.referencia_catastral OR (tbn1_mi_ds_159_consumo_energia_electrica.referencia_catastral IS NULL AND query.referencia_catastral IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.referencia_catastral IS NOT NULL AND query.referencia_catastral IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.fecha_alta_contrato<>query.fecha_alta_contrato OR (tbn1_mi_ds_159_consumo_energia_electrica.fecha_alta_contrato IS NULL AND query.fecha_alta_contrato IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.fecha_alta_contrato IS NOT NULL AND query.fecha_alta_contrato IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.fecha_baja_contrato<>query.fecha_baja_contrato OR (tbn1_mi_ds_159_consumo_energia_electrica.fecha_baja_contrato IS NULL AND query.fecha_baja_contrato IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.fecha_baja_contrato IS NOT NULL AND query.fecha_baja_contrato IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.unidad_medida_consumo<>query.unidad_medida_consumo OR (tbn1_mi_ds_159_consumo_energia_electrica.unidad_medida_consumo IS NULL AND query.unidad_medida_consumo IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.unidad_medida_consumo IS NOT NULL AND query.unidad_medida_consumo IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.unidad_medida_potencia<>query.unidad_medida_potencia OR (tbn1_mi_ds_159_consumo_energia_electrica.unidad_medida_potencia IS NULL AND query.unidad_medida_potencia IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.unidad_medida_potencia IS NOT NULL AND query.unidad_medida_potencia IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.potencia_maxima_contratada<>query.potencia_maxima_contratada OR (tbn1_mi_ds_159_consumo_energia_electrica.potencia_maxima_contratada IS NULL AND query.potencia_maxima_contratada IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.potencia_maxima_contratada IS NOT NULL AND query.potencia_maxima_contratada IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.importe<>query.importe OR (tbn1_mi_ds_159_consumo_energia_electrica.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.consumo_facturado<>query.consumo_facturado OR (tbn1_mi_ds_159_consumo_energia_electrica.consumo_facturado IS NULL AND query.consumo_facturado IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.consumo_facturado IS NOT NULL AND query.consumo_facturado IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.tipo_lectura<>query.tipo_lectura OR (tbn1_mi_ds_159_consumo_energia_electrica.tipo_lectura IS NULL AND query.tipo_lectura IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.tipo_lectura IS NOT NULL AND query.tipo_lectura IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.tipo_direccion<>query.tipo_direccion OR (tbn1_mi_ds_159_consumo_energia_electrica.tipo_direccion IS NULL AND query.tipo_direccion IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.tipo_direccion IS NOT NULL AND query.tipo_direccion IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.orden<>query.orden OR (tbn1_mi_ds_159_consumo_energia_electrica.orden IS NULL AND query.orden IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.orden IS NOT NULL AND query.orden IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.num_puente_domicilio<>query.num_puente_domicilio OR (tbn1_mi_ds_159_consumo_energia_electrica.num_puente_domicilio IS NULL AND query.num_puente_domicilio IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.num_puente_domicilio IS NOT NULL AND query.num_puente_domicilio IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.tipo_via<>query.tipo_via OR (tbn1_mi_ds_159_consumo_energia_electrica.tipo_via IS NULL AND query.tipo_via IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.tipo_via IS NOT NULL AND query.tipo_via IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.nombre_via<>query.nombre_via OR (tbn1_mi_ds_159_consumo_energia_electrica.nombre_via IS NULL AND query.nombre_via IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.nombre_via IS NOT NULL AND query.nombre_via IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.tipo_numero<>query.tipo_numero OR (tbn1_mi_ds_159_consumo_energia_electrica.tipo_numero IS NULL AND query.tipo_numero IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.tipo_numero IS NOT NULL AND query.tipo_numero IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.numero_casa<>query.numero_casa OR (tbn1_mi_ds_159_consumo_energia_electrica.numero_casa IS NULL AND query.numero_casa IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.numero_casa IS NOT NULL AND query.numero_casa IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.calificador_numero<>query.calificador_numero OR (tbn1_mi_ds_159_consumo_energia_electrica.calificador_numero IS NULL AND query.calificador_numero IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.calificador_numero IS NOT NULL AND query.calificador_numero IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.bloque<>query.bloque OR (tbn1_mi_ds_159_consumo_energia_electrica.bloque IS NULL AND query.bloque IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.bloque IS NOT NULL AND query.bloque IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.portal<>query.portal OR (tbn1_mi_ds_159_consumo_energia_electrica.portal IS NULL AND query.portal IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.portal IS NOT NULL AND query.portal IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.escalera<>query.escalera OR (tbn1_mi_ds_159_consumo_energia_electrica.escalera IS NULL AND query.escalera IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.escalera IS NOT NULL AND query.escalera IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.piso<>query.piso OR (tbn1_mi_ds_159_consumo_energia_electrica.piso IS NULL AND query.piso IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.piso IS NOT NULL AND query.piso IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.puerta<>query.puerta OR (tbn1_mi_ds_159_consumo_energia_electrica.puerta IS NULL AND query.puerta IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.puerta IS NOT NULL AND query.puerta IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.complemento<>query.complemento OR (tbn1_mi_ds_159_consumo_energia_electrica.complemento IS NULL AND query.complemento IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.complemento IS NOT NULL AND query.complemento IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.localidad<>query.localidad OR (tbn1_mi_ds_159_consumo_energia_electrica.localidad IS NULL AND query.localidad IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.localidad IS NOT NULL AND query.localidad IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.municipio<>query.municipio OR (tbn1_mi_ds_159_consumo_energia_electrica.municipio IS NULL AND query.municipio IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.municipio IS NOT NULL AND query.municipio IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_municipio<>query.id_municipio OR (tbn1_mi_ds_159_consumo_energia_electrica.id_municipio IS NULL AND query.id_municipio IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_municipio IS NOT NULL AND query.id_municipio IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.id_provincia<>query.id_provincia OR (tbn1_mi_ds_159_consumo_energia_electrica.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.codigo_postal<>query.codigo_postal OR (tbn1_mi_ds_159_consumo_energia_electrica.codigo_postal IS NULL AND query.codigo_postal IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.codigo_postal IS NOT NULL AND query.codigo_postal IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.nif_representante<>query.nif_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.nif_representante IS NULL AND query.nif_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.nif_representante IS NOT NULL AND query.nif_representante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.forma_juridica_representante<>query.forma_juridica_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.forma_juridica_representante IS NULL AND query.forma_juridica_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.forma_juridica_representante IS NOT NULL AND query.forma_juridica_representante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.letra_nif_representante<>query.letra_nif_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.letra_nif_representante IS NULL AND query.letra_nif_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.letra_nif_representante IS NOT NULL AND query.letra_nif_representante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.fecha_alta_representante<>query.fecha_alta_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.fecha_alta_representante IS NULL AND query.fecha_alta_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.fecha_alta_representante IS NOT NULL AND query.fecha_alta_representante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.fecha_modificacion_representante<>query.fecha_modificacion_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.fecha_modificacion_representante IS NULL AND query.fecha_modificacion_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.fecha_modificacion_representante IS NOT NULL AND query.fecha_modificacion_representante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.sw_baja_representante<>query.sw_baja_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.sw_baja_representante IS NULL AND query.sw_baja_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.sw_baja_representante IS NOT NULL AND query.sw_baja_representante IS NULL)
                    OR tbn1_mi_ds_159_consumo_energia_electrica.num_puente_representante<>query.num_puente_representante OR (tbn1_mi_ds_159_consumo_energia_electrica.num_puente_representante IS NULL AND query.num_puente_representante IS NOT NULL) OR  (tbn1_mi_ds_159_consumo_energia_electrica.num_puente_representante IS NOT NULL AND query.num_puente_representante IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      ejercicio=query.ejercicio,
      modelo=query.modelo,
      administracion_declarante=query.administracion_declarante,
      es_externo_declarante=query.es_externo_declarante,
      nif_declarante_159=query.nif_declarante_159,
      es_contribuyente_declarante=query.es_contribuyente_declarante,
      id_contribuyente_declarante=query.id_contribuyente_declarante,
      es_identificado_declarante=query.es_identificado_declarante,
      sw_identificado_declarante=query.sw_identificado_declarante,
      nif_declarante_no_identificado=query.nif_declarante_no_identificado,
      telefono=query.telefono,
      razon_social=query.razon_social,
      cod_presentador_colectivo=query.cod_presentador_colectivo,
      cod_banco_espania=query.cod_banco_espania,
      id_tipo_presentacion=query.id_tipo_presentacion,
      mes_presentacion=query.mes_presentacion,
      anyo_presentacion=query.anyo_presentacion,
      num_caja=query.num_caja,
      num_justificante=query.num_justificante,
      id_tipo_declaracion=query.id_tipo_declaracion,
      contador_revisiones=query.contador_revisiones,
      regimen_fiscal_deducciones=query.regimen_fiscal_deducciones,
      administracion_declarado=query.administracion_declarado,
      es_externo_declarado=query.es_externo_declarado,
      nif_declarado_159=query.nif_declarado_159,
      es_contribuyente_declarado=query.es_contribuyente_declarado,
      id_contribuyente_declarado=query.id_contribuyente_declarado,
      es_identificado_declarado=query.es_identificado_declarado,
      sw_identificado_declarado=query.sw_identificado_declarado,
      nif_declarado_no_identificado=query.nif_declarado_no_identificado,
      es_erroneo_declarado=query.es_erroneo_declarado,
      id_clave_tipo_codigo=query.id_clave_tipo_codigo,
      codigo_iban=query.codigo_iban,
      codigo_entidad=query.codigo_entidad,
      codigo_sucursal=query.codigo_sucursal,
      digito_control=query.digito_control,
      codigo_cuenta=query.codigo_cuenta,
      id_pais_residencia=query.id_pais_residencia,
      identificacion_extranjero=query.identificacion_extranjero,
      contrato_suministro=query.contrato_suministro,
      id_cups_codigo_pais=query.id_cups_codigo_pais,
      cups_distribuidora=query.cups_distribuidora,
      cups_numero_libre_asignacion=query.cups_numero_libre_asignacion,
      cups_digito_control=query.cups_digito_control,
      cups_punto_medida=query.cups_punto_medida,
      cups_punto_suministro=query.cups_punto_suministro,
      tipo_bien=query.tipo_bien,
      situacion_inmueble=query.situacion_inmueble,
      referencia_catastral=query.referencia_catastral,
      fecha_alta_contrato=query.fecha_alta_contrato,
      fecha_baja_contrato=query.fecha_baja_contrato,
      unidad_medida_consumo=query.unidad_medida_consumo,
      unidad_medida_potencia=query.unidad_medida_potencia,
      potencia_maxima_contratada=query.potencia_maxima_contratada,
      importe=query.importe,
      consumo_facturado=query.consumo_facturado,
      tipo_lectura=query.tipo_lectura,
      tipo_direccion=query.tipo_direccion,
      orden=query.orden,
      num_puente_domicilio=query.num_puente_domicilio,
      tipo_via=query.tipo_via,
      nombre_via=query.nombre_via,
      tipo_numero=query.tipo_numero,
      numero_casa=query.numero_casa,
      calificador_numero=query.calificador_numero,
      bloque=query.bloque,
      portal=query.portal,
      escalera=query.escalera,
      piso=query.piso,
      puerta=query.puerta,
      complemento=query.complemento,
      localidad=query.localidad,
      municipio=query.municipio,
      id_municipio=query.id_municipio,
      id_provincia=query.id_provincia,
      codigo_postal=query.codigo_postal,
      nif_representante=query.nif_representante,
      forma_juridica_representante=query.forma_juridica_representante,
      letra_nif_representante=query.letra_nif_representante,
      fecha_alta_representante=query.fecha_alta_representante,
      fecha_modificacion_representante=query.fecha_modificacion_representante,
      sw_baja_representante=query.sw_baja_representante,
      num_puente_representante=query.num_puente_representante,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,ejercicio,modelo,administracion_declarante,es_externo_declarante,nif_declarante_159,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,nif_declarante_no_identificado,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,id_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,num_justificante,id_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,secuencia,nif_declarado_159,es_contribuyente_declarado,id_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,nif_declarado_no_identificado,es_erroneo_declarado,id_clave_tipo_codigo,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,codigo_cuenta,id_pais_residencia,identificacion_extranjero,contrato_suministro,id_cups_codigo_pais,cups_distribuidora,cups_numero_libre_asignacion,cups_digito_control,cups_punto_medida,cups_punto_suministro,tipo_bien,situacion_inmueble,referencia_catastral,fecha_alta_contrato,fecha_baja_contrato,unidad_medida_consumo,unidad_medida_potencia,potencia_maxima_contratada,id_tipo_importe,importe,id_tipo_periodo,consumo_facturado,tipo_lectura,tipo_direccion,orden,num_puente_domicilio,tipo_via,nombre_via,tipo_numero,numero_casa,calificador_numero,bloque,portal,escalera,piso,puerta,complemento,localidad,municipio,id_municipio,id_provincia,codigo_postal,nif_representante,forma_juridica_representante,letra_nif_representante,fecha_alta_representante,fecha_modificacion_representante,sw_baja_representante,num_puente_representante,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.ejercicio,
      query.modelo,
      query.administracion_declarante,
      query.es_externo_declarante,
      query.nif_declarante_159,
      query.es_contribuyente_declarante,
      query.id_contribuyente_declarante,
      query.es_identificado_declarante,
      query.sw_identificado_declarante,
      query.nif_declarante_no_identificado,
      query.telefono,
      query.razon_social,
      query.cod_presentador_colectivo,
      query.cod_banco_espania,
      query.id_tipo_presentacion,
      query.fecha_presentacion,
      query.mes_presentacion,
      query.anyo_presentacion,
      query.num_caja,
      query.num_justificante,
      query.id_tipo_declaracion,
      query.contador_revisiones,
      query.regimen_fiscal_deducciones,
      query.administracion_declarado,
      query.es_externo_declarado,
      query.secuencia,
      query.nif_declarado_159,
      query.es_contribuyente_declarado,
      query.id_contribuyente_declarado,
      query.es_identificado_declarado,
      query.sw_identificado_declarado,
      query.nif_declarado_no_identificado,
      query.es_erroneo_declarado,
      query.id_clave_tipo_codigo,
      query.codigo_iban,
      query.codigo_entidad,
      query.codigo_sucursal,
      query.digito_control,
      query.codigo_cuenta,
      query.id_pais_residencia,
      query.identificacion_extranjero,
      query.contrato_suministro,
      query.id_cups_codigo_pais,
      query.cups_distribuidora,
      query.cups_numero_libre_asignacion,
      query.cups_digito_control,
      query.cups_punto_medida,
      query.cups_punto_suministro,
      query.tipo_bien,
      query.situacion_inmueble,
      query.referencia_catastral,
      query.fecha_alta_contrato,
      query.fecha_baja_contrato,
      query.unidad_medida_consumo,
      query.unidad_medida_potencia,
      query.potencia_maxima_contratada,
      query.id_tipo_importe,
      query.importe,
      query.id_tipo_periodo,
      query.consumo_facturado,
      query.tipo_lectura,
      query.tipo_direccion,
      query.orden,
      query.num_puente_domicilio,
      query.tipo_via,
      query.nombre_via,
      query.tipo_numero,
      query.numero_casa,
      query.calificador_numero,
      query.bloque,
      query.portal,
      query.escalera,
      query.piso,
      query.puerta,
      query.complemento,
      query.localidad,
      query.municipio,
      query.id_municipio,
      query.id_provincia,
      query.codigo_postal,
      query.nif_representante,
      query.forma_juridica_representante,
      query.letra_nif_representante,
      query.fecha_alta_representante,
      query.fecha_modificacion_representante,
      query.sw_baja_representante,
      query.num_puente_representante,
      getdate(),
      getdate())
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

