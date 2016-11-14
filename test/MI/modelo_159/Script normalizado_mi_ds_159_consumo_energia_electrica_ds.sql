PRINT 'Script normalizado_mi_ds_159_consumo_energia_electrica_ds.sql'
GO


SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica(
	id_mi_ds_159_consumo_energia_electrica int IDENTITY(1,1),
	id_documento int,
	id_expediente int,
	id_mae_no_id_declarante int,
	id_mae_no_id_declarado int,
	ejercicio smallint,
	modelo varchar(3),
	administracion_declarante varchar(1),
	es_externo_declarante bit,
	nif_declarante_159 varchar(12),
	id_contribuyente_declarante int,
	es_identificado_declarante bit,
	telefono varchar(10),
	razon_social varchar(40),
	cod_presentador_colectivo int,
	cod_banco_espania varchar(4),
	cod_tipo_presentacion varchar(1),
	fecha_presentacion date,
	mes_presentacion int,
	anyo_presentacion int,
	num_caja varchar(8),
	fecha_alta date,
	mes_alta int,
	anyo_alta int,
	num_justificante numeric(13,0),
	cod_tipo_declaracion varchar(1),
	contador_revisiones int,
	regimen_fiscal_deducciones varchar(1),
	administracion_declarado varchar(1),
	es_externo_declarado bit,
	nif_declarado_159 varchar(12),
	secuencia varchar(9),
	id_contribuyente_declarado int,
	es_identificado_declarado bit,
	es_erroneo_declarado bit,
	cod_clave_tipo_codigo varchar(1),
	codigo_iban varchar(4),
	codigo_entidad varchar(4),
	codigo_sucursal varchar(4),
	digito_control varchar(2),
	numero_cuenta varchar(10),
	cod_pais_residencia varchar(3),
	identificacion_extranjero varchar(15),
	contrato_suministro varchar(12),
	cod_cups_pais varchar(3),
	cups_distribuidora varchar(4),
	cups_num_libre_asignacion varchar(12),
	cups_digito_control varchar(2),
	cups_medida varchar(1),
	cups_suministro varchar(1),
	cod_tipo_bien varchar(1),
	cod_situacion_inmueble varchar(1),
	referencia_catastral varchar(20),
	fecha_alta_contrato date,
	anyo_alta_contrato int,
	mes_alta_contrato int,
	fecha_baja_contrato date,
	mes_baja_contrato int,
	anyo_baja_contrato int,
	cod_unidad_consumo varchar(1),
	cod_unidad_potencia varchar(1),
	potencia_maxima_contratada varchar(6),
	cod_tipo_importe varchar(2),
	importe decimal(18,2),
	cod_periodo_facturado varchar(2),
	consumo_facturado decimal(4,0),
	cod_tipo_lectura varchar(1),
	domi_municipio varchar(30),
	domi_codigo_municipio varchar(5),
	domi_codigo_provincia varchar(2),
	domi_codigo_postal varchar(5),
	CONSTRAINT PK_tbn1_mi_ds_159_consumo_energia_electrica PRIMARY KEY CLUSTERED (id_mi_ds_159_consumo_energia_electrica)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_ds_159_consumo_energia_electrica'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_norm_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_norm_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_ds_159_consumo_energia_electrica')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_mae_no_id_declarado int
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
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_declarante_159 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_identificado_declarante bit
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_tipo_presentacion varchar(1)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD anyo_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD num_justificante numeric(13,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_tipo_declaracion varchar(1)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='nif_declarado_159')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD nif_declarado_159 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD es_erroneo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_clave_tipo_codigo varchar(1)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='numero_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD numero_cuenta varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_pais_residencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_pais_residencia varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='identificacion_extranjero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD identificacion_extranjero varchar(15)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='contrato_suministro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD contrato_suministro varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_cups_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_cups_pais varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_distribuidora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_distribuidora varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_num_libre_asignacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_num_libre_asignacion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_digito_control')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_digito_control varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_medida')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_medida varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cups_suministro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cups_suministro varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_tipo_bien varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_situacion_inmueble')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_situacion_inmueble varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='referencia_catastral')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD referencia_catastral varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_alta_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_alta_contrato date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='anyo_alta_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD anyo_alta_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='mes_alta_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD mes_alta_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='fecha_baja_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD fecha_baja_contrato date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='mes_baja_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD mes_baja_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='anyo_baja_contrato')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD anyo_baja_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_unidad_consumo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_unidad_consumo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_unidad_potencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_unidad_potencia varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='potencia_maxima_contratada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD potencia_maxima_contratada varchar(6)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_tipo_importe varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD importe decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_periodo_facturado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_periodo_facturado varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='consumo_facturado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD consumo_facturado decimal(4,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='cod_tipo_lectura')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD cod_tipo_lectura varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='domi_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD domi_municipio varchar(30)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='domi_codigo_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD domi_codigo_municipio varchar(5)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='domi_codigo_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD domi_codigo_provincia varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica' AND COLUMN_NAME='domi_codigo_postal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ADD domi_codigo_postal varchar(5)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_ds_159_consumo_energia_electrica'
	AND column_name NOT IN ('id_mi_ds_159_consumo_energia_electrica', 'id_documento', 'id_expediente', 'id_mae_no_id_declarante', 'id_mae_no_id_declarado', 'ejercicio', 'modelo', 'administracion_declarante', 'es_externo_declarante', 'nif_declarante_159', 'id_contribuyente_declarante', 'es_identificado_declarante', 'telefono', 'razon_social', 'cod_presentador_colectivo', 'cod_banco_espania', 'cod_tipo_presentacion', 'fecha_presentacion', 'mes_presentacion', 'anyo_presentacion', 'num_caja', 'fecha_alta', 'mes_alta', 'anyo_alta', 'num_justificante', 'cod_tipo_declaracion', 'contador_revisiones', 'regimen_fiscal_deducciones', 'administracion_declarado', 'es_externo_declarado', 'nif_declarado_159', 'secuencia', 'id_contribuyente_declarado', 'es_identificado_declarado', 'es_erroneo_declarado', 'cod_clave_tipo_codigo', 'codigo_iban', 'codigo_entidad', 'codigo_sucursal', 'digito_control', 'numero_cuenta', 'cod_pais_residencia', 'identificacion_extranjero', 'contrato_suministro', 'cod_cups_pais', 'cups_distribuidora', 'cups_num_libre_asignacion', 'cups_digito_control', 'cups_medida', 'cups_suministro', 'cod_tipo_bien', 'cod_situacion_inmueble', 'referencia_catastral', 'fecha_alta_contrato', 'anyo_alta_contrato', 'mes_alta_contrato', 'fecha_baja_contrato', 'mes_baja_contrato', 'anyo_baja_contrato', 'cod_unidad_consumo', 'cod_unidad_potencia', 'potencia_maxima_contratada', 'cod_tipo_importe', 'importe', 'cod_periodo_facturado', 'consumo_facturado', 'cod_tipo_lectura', 'domi_municipio', 'domi_codigo_municipio', 'domi_codigo_provincia', 'domi_codigo_postal')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_documento int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_expediente int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_mae_no_id_declarante int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_mae_no_id_declarado int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN ejercicio smallint NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN modelo varchar(3) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN administracion_declarante varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_externo_declarante bit NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_declarante_159 varchar(12) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_contribuyente_declarante int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_identificado_declarante bit NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN telefono varchar(10) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN razon_social varchar(40) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_presentador_colectivo int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_banco_espania varchar(4) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_tipo_presentacion varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_presentacion date NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN mes_presentacion int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN anyo_presentacion int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN num_caja varchar(8) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_alta date NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN mes_alta int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN anyo_alta int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN num_justificante numeric(13,0) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_tipo_declaracion varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN contador_revisiones int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN regimen_fiscal_deducciones varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN administracion_declarado varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_externo_declarado bit NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN nif_declarado_159 varchar(12) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN secuencia varchar(9) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN id_contribuyente_declarado int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_identificado_declarado bit NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN es_erroneo_declarado bit NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_clave_tipo_codigo varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_iban varchar(4) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_entidad varchar(4) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN codigo_sucursal varchar(4) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN digito_control varchar(2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN numero_cuenta varchar(10) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_pais_residencia varchar(3) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN identificacion_extranjero varchar(15) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN contrato_suministro varchar(12) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_cups_pais varchar(3) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_distribuidora varchar(4) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_num_libre_asignacion varchar(12) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_digito_control varchar(2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_medida varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cups_suministro varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_tipo_bien varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_situacion_inmueble varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN referencia_catastral varchar(20) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_alta_contrato date NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN anyo_alta_contrato int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN mes_alta_contrato int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN fecha_baja_contrato date NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN mes_baja_contrato int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN anyo_baja_contrato int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_unidad_consumo varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_unidad_potencia varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN potencia_maxima_contratada varchar(6) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_tipo_importe varchar(2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN importe decimal(18,2) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_periodo_facturado varchar(2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN consumo_facturado decimal(4,0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN cod_tipo_lectura varchar(1) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN domi_municipio varchar(30) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN domi_codigo_municipio varchar(5) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN domi_codigo_provincia varchar(2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica ALTER COLUMN domi_codigo_postal varchar(5) NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_ds_159_consumo_energia_electrica_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica (id_documento,secuencia,cod_tipo_importe,cod_periodo_facturado) INCLUDE (id_mi_ds_159_consumo_energia_electrica)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica_cl')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl(
	id_mi_ds_159_consumo_energia_electrica int IDENTITY(1,1),
	id_documento int,
	secuencia varchar(9),
	cod_tipo_importe varchar(2),
	cod_periodo_facturado varchar(2),
	CONSTRAINT PK_tbn1_mi_ds_159_consumo_energia_electrica_cl PRIMARY KEY CLUSTERED (id_mi_ds_159_consumo_energia_electrica)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_ds_159_consumo_energia_electrica_cl'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_norm_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_norm_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_ds_159_consumo_energia_electrica_cl')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica_cl' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica_cl' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica_cl' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ADD cod_tipo_importe varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_159_consumo_energia_electrica_cl' AND COLUMN_NAME='cod_periodo_facturado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ADD cod_periodo_facturado varchar(2)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_ds_159_consumo_energia_electrica_cl'
	AND column_name NOT IN ('id_mi_ds_159_consumo_energia_electrica', 'id_documento', 'secuencia', 'cod_tipo_importe', 'cod_periodo_facturado')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ALTER COLUMN id_documento int NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ALTER COLUMN secuencia varchar(9) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ALTER COLUMN cod_tipo_importe varchar(2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl ALTER COLUMN cod_periodo_facturado varchar(2) NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_ds_159_consumo_energia_electrica_cl_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica_cl (id_documento,secuencia,cod_tipo_importe,cod_periodo_facturado) INCLUDE (id_mi_ds_159_consumo_energia_electrica)

--Add FKs if necessary
--End table create/prepare


USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica'
	SET NOCOUNT ON;
	DECLARE @log int;
	DECLARE @rc int;
	DECLARE @count_all int;
	DECLARE @count_ins int;
	DECLARE @idx_reclim int;
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

		IF OBJECT_ID('tempdb..#tmp_mi_ds_159_consumo_energia_electrica') IS NOT NULL
			DROP TABLE #tmp_mi_ds_159_consumo_energia_electrica
		CREATE table #tmp_mi_ds_159_consumo_energia_electrica(
			rr_mode varchar(1),
			cc int,
			id_mi_ds_159_consumo_energia_electrica int,
			t_id_documento int,
			t_secuencia varchar(9),
			t_cod_tipo_importe varchar(2),
			t_cod_periodo_facturado varchar(2),
			id_documento int,
			id_expediente int,
			id_mae_no_id_declarante int,
			id_mae_no_id_declarado int,
			ejercicio smallint,
			modelo varchar(3),
			administracion_declarante varchar(1),
			es_externo_declarante bit,
			nif_declarante_159 varchar(12),
			id_contribuyente_declarante int,
			es_identificado_declarante bit,
			telefono varchar(10),
			razon_social varchar(40),
			cod_presentador_colectivo int,
			cod_banco_espania varchar(4),
			cod_tipo_presentacion varchar(1),
			fecha_presentacion date,
			mes_presentacion int,
			anyo_presentacion int,
			num_caja varchar(8),
			fecha_alta date,
			mes_alta int,
			anyo_alta int,
			num_justificante numeric(13,0),
			cod_tipo_declaracion varchar(1),
			contador_revisiones int,
			regimen_fiscal_deducciones varchar(1),
			administracion_declarado varchar(1),
			es_externo_declarado bit,
			nif_declarado_159 varchar(12),
			secuencia varchar(9),
			id_contribuyente_declarado int,
			es_identificado_declarado bit,
			es_erroneo_declarado bit,
			cod_clave_tipo_codigo varchar(1),
			codigo_iban varchar(4),
			codigo_entidad varchar(4),
			codigo_sucursal varchar(4),
			digito_control varchar(2),
			numero_cuenta varchar(10),
			cod_pais_residencia varchar(3),
			identificacion_extranjero varchar(15),
			contrato_suministro varchar(12),
			cod_cups_pais varchar(3),
			cups_distribuidora varchar(4),
			cups_num_libre_asignacion varchar(12),
			cups_digito_control varchar(2),
			cups_medida varchar(1),
			cups_suministro varchar(1),
			cod_tipo_bien varchar(1),
			cod_situacion_inmueble varchar(1),
			referencia_catastral varchar(20),
			fecha_alta_contrato date,
			anyo_alta_contrato int,
			mes_alta_contrato int,
			fecha_baja_contrato date,
			mes_baja_contrato int,
			anyo_baja_contrato int,
			cod_unidad_consumo varchar(1),
			cod_unidad_potencia varchar(1),
			potencia_maxima_contratada varchar(6),
			cod_tipo_importe varchar(2),
			importe decimal(18,2),
			cod_periodo_facturado varchar(2),
			consumo_facturado decimal(4,0),
			cod_tipo_lectura varchar(1),
			domi_municipio varchar(30),
			domi_codigo_municipio varchar(5),
			domi_codigo_provincia varchar(2),
			domi_codigo_postal varchar(5)
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		t.id_documento,
		t.id_expediente,
		t.id_mae_no_id_declarante,
		t.id_mae_no_id_declarado,
		t.ejercicio,
		t.modelo,
		t.administracion_declarante,
		t.es_externo_declarante,
		t.nif_declarante_159,
		t.id_contribuyente_declarante,
		t.es_identificado_declarante,
		t.telefono,
		t.razon_social,
		t.cod_presentador_colectivo,
		t.cod_banco_espania,
		t.cod_tipo_presentacion,
		t.fecha_presentacion,
		t.mes_presentacion,
		t.anyo_presentacion,
		t.num_caja,
		t.fecha_alta,
		t.mes_alta,
		t.anyo_alta,
		t.num_justificante,
		t.cod_tipo_declaracion,
		t.contador_revisiones,
		t.regimen_fiscal_deducciones,
		t.administracion_declarado,
		t.es_externo_declarado,
		t.nif_declarado_159,
		t.secuencia,
		t.id_contribuyente_declarado,
		t.es_identificado_declarado,
		t.es_erroneo_declarado,
		t.cod_clave_tipo_codigo,
		t.codigo_iban,
		t.codigo_entidad,
		t.codigo_sucursal,
		t.digito_control,
		t.numero_cuenta,
		t.cod_pais_residencia,
		t.identificacion_extranjero,
		t.contrato_suministro,
		t.cod_cups_pais,
		t.cups_distribuidora,
		t.cups_num_libre_asignacion,
		t.cups_digito_control,
		t.cups_medida,
		t.cups_suministro,
		t.cod_tipo_bien,
		t.cod_situacion_inmueble,
		t.referencia_catastral,
		t.fecha_alta_contrato,
		t.anyo_alta_contrato,
		t.mes_alta_contrato,
		t.fecha_baja_contrato,
		t.mes_baja_contrato,
		t.anyo_baja_contrato,
		t.cod_unidad_consumo,
		t.cod_unidad_potencia,
		t.potencia_maxima_contratada,
		t.cod_tipo_importe,
		t.importe,
		t.cod_periodo_facturado,
		t.consumo_facturado,
		t.cod_tipo_lectura,
		t.domi_municipio,
		t.domi_codigo_municipio,
		t.domi_codigo_provincia,
		t.domi_codigo_postal
	FROM dbo.fnn1_query_carga_ds_mi_ds_159_consumo_energia_electrica(@logpadre) t
		)
		INSERT INTO #tmp_mi_ds_159_consumo_energia_electrica (rr_mode,cc,id_mi_ds_159_consumo_energia_electrica,t_id_documento,t_secuencia,t_cod_tipo_importe,t_cod_periodo_facturado,id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo,administracion_declarante,es_externo_declarante,nif_declarante_159,id_contribuyente_declarante,es_identificado_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,cod_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,cod_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,nif_declarado_159,secuencia,id_contribuyente_declarado,es_identificado_declarado,es_erroneo_declarado,cod_clave_tipo_codigo,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,numero_cuenta,cod_pais_residencia,identificacion_extranjero,contrato_suministro,cod_cups_pais,cups_distribuidora,cups_num_libre_asignacion,cups_digito_control,cups_medida,cups_suministro,cod_tipo_bien,cod_situacion_inmueble,referencia_catastral,fecha_alta_contrato,anyo_alta_contrato,mes_alta_contrato,fecha_baja_contrato,mes_baja_contrato,anyo_baja_contrato,cod_unidad_consumo,cod_unidad_potencia,potencia_maxima_contratada,cod_tipo_importe,importe,cod_periodo_facturado,consumo_facturado,cod_tipo_lectura,domi_municipio,domi_codigo_municipio,domi_codigo_provincia,domi_codigo_postal)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_mi_ds_159_consumo_energia_electrica IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_mi_ds_159_consumo_energia_electrica AS id_mi_ds_159_consumo_energia_electrica,
			t.id_documento AS t_id_documento,
			t.secuencia AS t_secuencia,
			t.cod_tipo_importe AS t_cod_tipo_importe,
			t.cod_periodo_facturado AS t_cod_periodo_facturado,
			query.id_documento AS id_documento,
			query.id_expediente AS id_expediente,
			query.id_mae_no_id_declarante AS id_mae_no_id_declarante,
			query.id_mae_no_id_declarado AS id_mae_no_id_declarado,
			query.ejercicio AS ejercicio,
			query.modelo AS modelo,
			query.administracion_declarante AS administracion_declarante,
			query.es_externo_declarante AS es_externo_declarante,
			query.nif_declarante_159 AS nif_declarante_159,
			query.id_contribuyente_declarante AS id_contribuyente_declarante,
			query.es_identificado_declarante AS es_identificado_declarante,
			query.telefono AS telefono,
			query.razon_social AS razon_social,
			query.cod_presentador_colectivo AS cod_presentador_colectivo,
			query.cod_banco_espania AS cod_banco_espania,
			query.cod_tipo_presentacion AS cod_tipo_presentacion,
			query.fecha_presentacion AS fecha_presentacion,
			query.mes_presentacion AS mes_presentacion,
			query.anyo_presentacion AS anyo_presentacion,
			query.num_caja AS num_caja,
			query.fecha_alta AS fecha_alta,
			query.mes_alta AS mes_alta,
			query.anyo_alta AS anyo_alta,
			query.num_justificante AS num_justificante,
			query.cod_tipo_declaracion AS cod_tipo_declaracion,
			query.contador_revisiones AS contador_revisiones,
			query.regimen_fiscal_deducciones AS regimen_fiscal_deducciones,
			query.administracion_declarado AS administracion_declarado,
			query.es_externo_declarado AS es_externo_declarado,
			query.nif_declarado_159 AS nif_declarado_159,
			query.secuencia AS secuencia,
			query.id_contribuyente_declarado AS id_contribuyente_declarado,
			query.es_identificado_declarado AS es_identificado_declarado,
			query.es_erroneo_declarado AS es_erroneo_declarado,
			query.cod_clave_tipo_codigo AS cod_clave_tipo_codigo,
			query.codigo_iban AS codigo_iban,
			query.codigo_entidad AS codigo_entidad,
			query.codigo_sucursal AS codigo_sucursal,
			query.digito_control AS digito_control,
			query.numero_cuenta AS numero_cuenta,
			query.cod_pais_residencia AS cod_pais_residencia,
			query.identificacion_extranjero AS identificacion_extranjero,
			query.contrato_suministro AS contrato_suministro,
			query.cod_cups_pais AS cod_cups_pais,
			query.cups_distribuidora AS cups_distribuidora,
			query.cups_num_libre_asignacion AS cups_num_libre_asignacion,
			query.cups_digito_control AS cups_digito_control,
			query.cups_medida AS cups_medida,
			query.cups_suministro AS cups_suministro,
			query.cod_tipo_bien AS cod_tipo_bien,
			query.cod_situacion_inmueble AS cod_situacion_inmueble,
			query.referencia_catastral AS referencia_catastral,
			query.fecha_alta_contrato AS fecha_alta_contrato,
			query.anyo_alta_contrato AS anyo_alta_contrato,
			query.mes_alta_contrato AS mes_alta_contrato,
			query.fecha_baja_contrato AS fecha_baja_contrato,
			query.mes_baja_contrato AS mes_baja_contrato,
			query.anyo_baja_contrato AS anyo_baja_contrato,
			query.cod_unidad_consumo AS cod_unidad_consumo,
			query.cod_unidad_potencia AS cod_unidad_potencia,
			query.potencia_maxima_contratada AS potencia_maxima_contratada,
			query.cod_tipo_importe AS cod_tipo_importe,
			query.importe AS importe,
			query.cod_periodo_facturado AS cod_periodo_facturado,
			query.consumo_facturado AS consumo_facturado,
			query.cod_tipo_lectura AS cod_tipo_lectura,
			query.domi_municipio AS domi_municipio,
			query.domi_codigo_municipio AS domi_codigo_municipio,
			query.domi_codigo_provincia AS domi_codigo_provincia,
			query.domi_codigo_postal AS domi_codigo_postal
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica AS t
		INNER JOIN dbo.fnn1_query_carga_ds_mi_ds_159_consumo_energia_electrica_f_id_documento(@logpadre) f ON (t.id_documento=f.id_documento)
		FULL JOIN query on ((query.id_documento=t.id_documento OR (query.id_documento IS NULL AND t.id_documento IS NULL)) AND (query.secuencia=t.secuencia OR (query.secuencia IS NULL AND t.secuencia IS NULL)) AND (query.cod_tipo_importe=t.cod_tipo_importe OR (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NULL)) AND (query.cod_periodo_facturado=t.cod_periodo_facturado OR (query.cod_periodo_facturado IS NULL AND t.cod_periodo_facturado IS NULL)))
		WHERE 
			id_mi_ds_159_consumo_energia_electrica IS NULL OR
			cc IS NULL OR
			(t.id_documento<>query.id_documento OR (t.id_documento IS NULL AND query.id_documento IS NOT NULL)
                                                  OR (t.id_documento IS NOT NULL AND query.id_documento IS NULL)
				OR t.id_expediente<>query.id_expediente OR (t.id_expediente IS NULL AND query.id_expediente IS NOT NULL)
                                                  OR (t.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
				OR t.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (t.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
				OR t.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (t.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
				OR t.ejercicio<>query.ejercicio OR (t.ejercicio IS NULL AND query.ejercicio IS NOT NULL)
                                                  OR (t.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
				OR t.modelo<>query.modelo OR (t.modelo IS NULL AND query.modelo IS NOT NULL)
                                                  OR (t.modelo IS NOT NULL AND query.modelo IS NULL)
				OR t.administracion_declarante<>query.administracion_declarante OR (t.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL)
                                                  OR (t.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
				OR t.es_externo_declarante<>query.es_externo_declarante OR (t.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL)
                                                  OR (t.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
				OR t.nif_declarante_159<>query.nif_declarante_159 OR (t.nif_declarante_159 IS NULL AND query.nif_declarante_159 IS NOT NULL)
                                                  OR (t.nif_declarante_159 IS NOT NULL AND query.nif_declarante_159 IS NULL)
				OR t.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (t.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL)
                                                  OR (t.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
				OR t.es_identificado_declarante<>query.es_identificado_declarante OR (t.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL)
                                                  OR (t.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
				OR t.telefono<>query.telefono OR (t.telefono IS NULL AND query.telefono IS NOT NULL)
                                                  OR (t.telefono IS NOT NULL AND query.telefono IS NULL)
				OR t.razon_social<>query.razon_social OR (t.razon_social IS NULL AND query.razon_social IS NOT NULL)
                                                  OR (t.razon_social IS NOT NULL AND query.razon_social IS NULL)
				OR t.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (t.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL)
                                                  OR (t.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
				OR t.cod_banco_espania<>query.cod_banco_espania OR (t.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL)
                                                  OR (t.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL)
				OR t.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (t.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL)
                                                  OR (t.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
				OR t.fecha_presentacion<>query.fecha_presentacion OR (t.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL)
                                                  OR (t.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
				OR t.mes_presentacion<>query.mes_presentacion OR (t.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL)
                                                  OR (t.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
				OR t.anyo_presentacion<>query.anyo_presentacion OR (t.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL)
                                                  OR (t.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
				OR t.num_caja<>query.num_caja OR (t.num_caja IS NULL AND query.num_caja IS NOT NULL)
                                                  OR (t.num_caja IS NOT NULL AND query.num_caja IS NULL)
				OR t.fecha_alta<>query.fecha_alta OR (t.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL)
                                                  OR (t.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
				OR t.mes_alta<>query.mes_alta OR (t.mes_alta IS NULL AND query.mes_alta IS NOT NULL)
                                                  OR (t.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
				OR t.anyo_alta<>query.anyo_alta OR (t.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL)
                                                  OR (t.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL)
				OR t.num_justificante<>query.num_justificante OR (t.num_justificante IS NULL AND query.num_justificante IS NOT NULL)
                                                  OR (t.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
				OR t.cod_tipo_declaracion<>query.cod_tipo_declaracion OR (t.cod_tipo_declaracion IS NULL AND query.cod_tipo_declaracion IS NOT NULL)
                                                  OR (t.cod_tipo_declaracion IS NOT NULL AND query.cod_tipo_declaracion IS NULL)
				OR t.contador_revisiones<>query.contador_revisiones OR (t.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL)
                                                  OR (t.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
				OR t.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (t.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL)
                                                  OR (t.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
				OR t.administracion_declarado<>query.administracion_declarado OR (t.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL)
                                                  OR (t.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
				OR t.es_externo_declarado<>query.es_externo_declarado OR (t.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL)
                                                  OR (t.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
				OR t.nif_declarado_159<>query.nif_declarado_159 OR (t.nif_declarado_159 IS NULL AND query.nif_declarado_159 IS NOT NULL)
                                                  OR (t.nif_declarado_159 IS NOT NULL AND query.nif_declarado_159 IS NULL)
				OR t.secuencia<>query.secuencia OR (t.secuencia IS NULL AND query.secuencia IS NOT NULL)
                                                  OR (t.secuencia IS NOT NULL AND query.secuencia IS NULL)
				OR t.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (t.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL)
                                                  OR (t.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
				OR t.es_identificado_declarado<>query.es_identificado_declarado OR (t.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL)
                                                  OR (t.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
				OR t.es_erroneo_declarado<>query.es_erroneo_declarado OR (t.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL)
                                                  OR (t.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
				OR t.cod_clave_tipo_codigo<>query.cod_clave_tipo_codigo OR (t.cod_clave_tipo_codigo IS NULL AND query.cod_clave_tipo_codigo IS NOT NULL)
                                                  OR (t.cod_clave_tipo_codigo IS NOT NULL AND query.cod_clave_tipo_codigo IS NULL)
				OR t.codigo_iban<>query.codigo_iban OR (t.codigo_iban IS NULL AND query.codigo_iban IS NOT NULL)
                                                  OR (t.codigo_iban IS NOT NULL AND query.codigo_iban IS NULL)
				OR t.codigo_entidad<>query.codigo_entidad OR (t.codigo_entidad IS NULL AND query.codigo_entidad IS NOT NULL)
                                                  OR (t.codigo_entidad IS NOT NULL AND query.codigo_entidad IS NULL)
				OR t.codigo_sucursal<>query.codigo_sucursal OR (t.codigo_sucursal IS NULL AND query.codigo_sucursal IS NOT NULL)
                                                  OR (t.codigo_sucursal IS NOT NULL AND query.codigo_sucursal IS NULL)
				OR t.digito_control<>query.digito_control OR (t.digito_control IS NULL AND query.digito_control IS NOT NULL)
                                                  OR (t.digito_control IS NOT NULL AND query.digito_control IS NULL)
				OR t.numero_cuenta<>query.numero_cuenta OR (t.numero_cuenta IS NULL AND query.numero_cuenta IS NOT NULL)
                                                  OR (t.numero_cuenta IS NOT NULL AND query.numero_cuenta IS NULL)
				OR t.cod_pais_residencia<>query.cod_pais_residencia OR (t.cod_pais_residencia IS NULL AND query.cod_pais_residencia IS NOT NULL)
                                                  OR (t.cod_pais_residencia IS NOT NULL AND query.cod_pais_residencia IS NULL)
				OR t.identificacion_extranjero<>query.identificacion_extranjero OR (t.identificacion_extranjero IS NULL AND query.identificacion_extranjero IS NOT NULL)
                                                  OR (t.identificacion_extranjero IS NOT NULL AND query.identificacion_extranjero IS NULL)
				OR t.contrato_suministro<>query.contrato_suministro OR (t.contrato_suministro IS NULL AND query.contrato_suministro IS NOT NULL)
                                                  OR (t.contrato_suministro IS NOT NULL AND query.contrato_suministro IS NULL)
				OR t.cod_cups_pais<>query.cod_cups_pais OR (t.cod_cups_pais IS NULL AND query.cod_cups_pais IS NOT NULL)
                                                  OR (t.cod_cups_pais IS NOT NULL AND query.cod_cups_pais IS NULL)
				OR t.cups_distribuidora<>query.cups_distribuidora OR (t.cups_distribuidora IS NULL AND query.cups_distribuidora IS NOT NULL)
                                                  OR (t.cups_distribuidora IS NOT NULL AND query.cups_distribuidora IS NULL)
				OR t.cups_num_libre_asignacion<>query.cups_num_libre_asignacion OR (t.cups_num_libre_asignacion IS NULL AND query.cups_num_libre_asignacion IS NOT NULL)
                                                  OR (t.cups_num_libre_asignacion IS NOT NULL AND query.cups_num_libre_asignacion IS NULL)
				OR t.cups_digito_control<>query.cups_digito_control OR (t.cups_digito_control IS NULL AND query.cups_digito_control IS NOT NULL)
                                                  OR (t.cups_digito_control IS NOT NULL AND query.cups_digito_control IS NULL)
				OR t.cups_medida<>query.cups_medida OR (t.cups_medida IS NULL AND query.cups_medida IS NOT NULL)
                                                  OR (t.cups_medida IS NOT NULL AND query.cups_medida IS NULL)
				OR t.cups_suministro<>query.cups_suministro OR (t.cups_suministro IS NULL AND query.cups_suministro IS NOT NULL)
                                                  OR (t.cups_suministro IS NOT NULL AND query.cups_suministro IS NULL)
				OR t.cod_tipo_bien<>query.cod_tipo_bien OR (t.cod_tipo_bien IS NULL AND query.cod_tipo_bien IS NOT NULL)
                                                  OR (t.cod_tipo_bien IS NOT NULL AND query.cod_tipo_bien IS NULL)
				OR t.cod_situacion_inmueble<>query.cod_situacion_inmueble OR (t.cod_situacion_inmueble IS NULL AND query.cod_situacion_inmueble IS NOT NULL)
                                                  OR (t.cod_situacion_inmueble IS NOT NULL AND query.cod_situacion_inmueble IS NULL)
				OR t.referencia_catastral<>query.referencia_catastral OR (t.referencia_catastral IS NULL AND query.referencia_catastral IS NOT NULL)
                                                  OR (t.referencia_catastral IS NOT NULL AND query.referencia_catastral IS NULL)
				OR t.fecha_alta_contrato<>query.fecha_alta_contrato OR (t.fecha_alta_contrato IS NULL AND query.fecha_alta_contrato IS NOT NULL)
                                                  OR (t.fecha_alta_contrato IS NOT NULL AND query.fecha_alta_contrato IS NULL)
				OR t.anyo_alta_contrato<>query.anyo_alta_contrato OR (t.anyo_alta_contrato IS NULL AND query.anyo_alta_contrato IS NOT NULL)
                                                  OR (t.anyo_alta_contrato IS NOT NULL AND query.anyo_alta_contrato IS NULL)
				OR t.mes_alta_contrato<>query.mes_alta_contrato OR (t.mes_alta_contrato IS NULL AND query.mes_alta_contrato IS NOT NULL)
                                                  OR (t.mes_alta_contrato IS NOT NULL AND query.mes_alta_contrato IS NULL)
				OR t.fecha_baja_contrato<>query.fecha_baja_contrato OR (t.fecha_baja_contrato IS NULL AND query.fecha_baja_contrato IS NOT NULL)
                                                  OR (t.fecha_baja_contrato IS NOT NULL AND query.fecha_baja_contrato IS NULL)
				OR t.mes_baja_contrato<>query.mes_baja_contrato OR (t.mes_baja_contrato IS NULL AND query.mes_baja_contrato IS NOT NULL)
                                                  OR (t.mes_baja_contrato IS NOT NULL AND query.mes_baja_contrato IS NULL)
				OR t.anyo_baja_contrato<>query.anyo_baja_contrato OR (t.anyo_baja_contrato IS NULL AND query.anyo_baja_contrato IS NOT NULL)
                                                  OR (t.anyo_baja_contrato IS NOT NULL AND query.anyo_baja_contrato IS NULL)
				OR t.cod_unidad_consumo<>query.cod_unidad_consumo OR (t.cod_unidad_consumo IS NULL AND query.cod_unidad_consumo IS NOT NULL)
                                                  OR (t.cod_unidad_consumo IS NOT NULL AND query.cod_unidad_consumo IS NULL)
				OR t.cod_unidad_potencia<>query.cod_unidad_potencia OR (t.cod_unidad_potencia IS NULL AND query.cod_unidad_potencia IS NOT NULL)
                                                  OR (t.cod_unidad_potencia IS NOT NULL AND query.cod_unidad_potencia IS NULL)
				OR t.potencia_maxima_contratada<>query.potencia_maxima_contratada OR (t.potencia_maxima_contratada IS NULL AND query.potencia_maxima_contratada IS NOT NULL)
                                                  OR (t.potencia_maxima_contratada IS NOT NULL AND query.potencia_maxima_contratada IS NULL)
				OR t.cod_tipo_importe<>query.cod_tipo_importe OR (t.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL)
                                                  OR (t.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
				OR t.importe<>query.importe OR (t.importe IS NULL AND query.importe IS NOT NULL)
                                                  OR (t.importe IS NOT NULL AND query.importe IS NULL)
				OR t.cod_periodo_facturado<>query.cod_periodo_facturado OR (t.cod_periodo_facturado IS NULL AND query.cod_periodo_facturado IS NOT NULL)
                                                  OR (t.cod_periodo_facturado IS NOT NULL AND query.cod_periodo_facturado IS NULL)
				OR t.consumo_facturado<>query.consumo_facturado OR (t.consumo_facturado IS NULL AND query.consumo_facturado IS NOT NULL)
                                                  OR (t.consumo_facturado IS NOT NULL AND query.consumo_facturado IS NULL)
				OR t.cod_tipo_lectura<>query.cod_tipo_lectura OR (t.cod_tipo_lectura IS NULL AND query.cod_tipo_lectura IS NOT NULL)
                                                  OR (t.cod_tipo_lectura IS NOT NULL AND query.cod_tipo_lectura IS NULL)
				OR t.domi_municipio<>query.domi_municipio OR (t.domi_municipio IS NULL AND query.domi_municipio IS NOT NULL)
                                                  OR (t.domi_municipio IS NOT NULL AND query.domi_municipio IS NULL)
				OR t.domi_codigo_municipio<>query.domi_codigo_municipio OR (t.domi_codigo_municipio IS NULL AND query.domi_codigo_municipio IS NOT NULL)
                                                  OR (t.domi_codigo_municipio IS NOT NULL AND query.domi_codigo_municipio IS NULL)
				OR t.domi_codigo_provincia<>query.domi_codigo_provincia OR (t.domi_codigo_provincia IS NULL AND query.domi_codigo_provincia IS NOT NULL)
                                                  OR (t.domi_codigo_provincia IS NOT NULL AND query.domi_codigo_provincia IS NULL)
				OR t.domi_codigo_postal<>query.domi_codigo_postal OR (t.domi_codigo_postal IS NULL AND query.domi_codigo_postal IS NOT NULL)
                                                  OR (t.domi_codigo_postal IS NOT NULL AND query.domi_codigo_postal IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_ds_159_consumo_energia_electrica
		SELECT @count_ins = count(*) from #tmp_mi_ds_159_consumo_energia_electrica where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
			SET
				id_documento=s.id_documento,
				id_expediente=s.id_expediente,
				id_mae_no_id_declarante=s.id_mae_no_id_declarante,
				id_mae_no_id_declarado=s.id_mae_no_id_declarado,
				ejercicio=s.ejercicio,
				modelo=s.modelo,
				administracion_declarante=s.administracion_declarante,
				es_externo_declarante=s.es_externo_declarante,
				nif_declarante_159=s.nif_declarante_159,
				id_contribuyente_declarante=s.id_contribuyente_declarante,
				es_identificado_declarante=s.es_identificado_declarante,
				telefono=s.telefono,
				razon_social=s.razon_social,
				cod_presentador_colectivo=s.cod_presentador_colectivo,
				cod_banco_espania=s.cod_banco_espania,
				cod_tipo_presentacion=s.cod_tipo_presentacion,
				fecha_presentacion=s.fecha_presentacion,
				mes_presentacion=s.mes_presentacion,
				anyo_presentacion=s.anyo_presentacion,
				num_caja=s.num_caja,
				fecha_alta=s.fecha_alta,
				mes_alta=s.mes_alta,
				anyo_alta=s.anyo_alta,
				num_justificante=s.num_justificante,
				cod_tipo_declaracion=s.cod_tipo_declaracion,
				contador_revisiones=s.contador_revisiones,
				regimen_fiscal_deducciones=s.regimen_fiscal_deducciones,
				administracion_declarado=s.administracion_declarado,
				es_externo_declarado=s.es_externo_declarado,
				nif_declarado_159=s.nif_declarado_159,
				secuencia=s.secuencia,
				id_contribuyente_declarado=s.id_contribuyente_declarado,
				es_identificado_declarado=s.es_identificado_declarado,
				es_erroneo_declarado=s.es_erroneo_declarado,
				cod_clave_tipo_codigo=s.cod_clave_tipo_codigo,
				codigo_iban=s.codigo_iban,
				codigo_entidad=s.codigo_entidad,
				codigo_sucursal=s.codigo_sucursal,
				digito_control=s.digito_control,
				numero_cuenta=s.numero_cuenta,
				cod_pais_residencia=s.cod_pais_residencia,
				identificacion_extranjero=s.identificacion_extranjero,
				contrato_suministro=s.contrato_suministro,
				cod_cups_pais=s.cod_cups_pais,
				cups_distribuidora=s.cups_distribuidora,
				cups_num_libre_asignacion=s.cups_num_libre_asignacion,
				cups_digito_control=s.cups_digito_control,
				cups_medida=s.cups_medida,
				cups_suministro=s.cups_suministro,
				cod_tipo_bien=s.cod_tipo_bien,
				cod_situacion_inmueble=s.cod_situacion_inmueble,
				referencia_catastral=s.referencia_catastral,
				fecha_alta_contrato=s.fecha_alta_contrato,
				anyo_alta_contrato=s.anyo_alta_contrato,
				mes_alta_contrato=s.mes_alta_contrato,
				fecha_baja_contrato=s.fecha_baja_contrato,
				mes_baja_contrato=s.mes_baja_contrato,
				anyo_baja_contrato=s.anyo_baja_contrato,
				cod_unidad_consumo=s.cod_unidad_consumo,
				cod_unidad_potencia=s.cod_unidad_potencia,
				potencia_maxima_contratada=s.potencia_maxima_contratada,
				cod_tipo_importe=s.cod_tipo_importe,
				importe=s.importe,
				cod_periodo_facturado=s.cod_periodo_facturado,
				consumo_facturado=s.consumo_facturado,
				cod_tipo_lectura=s.cod_tipo_lectura,
				domi_municipio=s.domi_municipio,
				domi_codigo_municipio=s.domi_codigo_municipio,
				domi_codigo_provincia=s.domi_codigo_provincia,
				domi_codigo_postal=s.domi_codigo_postal
		FROM (
			SELECT
				id_documento,
				id_expediente,
				id_mae_no_id_declarante,
				id_mae_no_id_declarado,
				ejercicio,
				modelo,
				administracion_declarante,
				es_externo_declarante,
				nif_declarante_159,
				id_contribuyente_declarante,
				es_identificado_declarante,
				telefono,
				razon_social,
				cod_presentador_colectivo,
				cod_banco_espania,
				cod_tipo_presentacion,
				fecha_presentacion,
				mes_presentacion,
				anyo_presentacion,
				num_caja,
				fecha_alta,
				mes_alta,
				anyo_alta,
				num_justificante,
				cod_tipo_declaracion,
				contador_revisiones,
				regimen_fiscal_deducciones,
				administracion_declarado,
				es_externo_declarado,
				nif_declarado_159,
				secuencia,
				id_contribuyente_declarado,
				es_identificado_declarado,
				es_erroneo_declarado,
				cod_clave_tipo_codigo,
				codigo_iban,
				codigo_entidad,
				codigo_sucursal,
				digito_control,
				numero_cuenta,
				cod_pais_residencia,
				identificacion_extranjero,
				contrato_suministro,
				cod_cups_pais,
				cups_distribuidora,
				cups_num_libre_asignacion,
				cups_digito_control,
				cups_medida,
				cups_suministro,
				cod_tipo_bien,
				cod_situacion_inmueble,
				referencia_catastral,
				fecha_alta_contrato,
				anyo_alta_contrato,
				mes_alta_contrato,
				fecha_baja_contrato,
				mes_baja_contrato,
				anyo_baja_contrato,
				cod_unidad_consumo,
				cod_unidad_potencia,
				potencia_maxima_contratada,
				cod_tipo_importe,
				importe,
				cod_periodo_facturado,
				consumo_facturado,
				cod_tipo_lectura,
				domi_municipio,
				domi_codigo_municipio,
				domi_codigo_provincia,
				domi_codigo_postal
			FROM #tmp_mi_ds_159_consumo_energia_electrica
			WHERE rr_mode='U') s
		WHERE (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.id_documento=s.id_documento OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.id_documento IS NULL AND s.id_documento IS NULL)) AND (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.secuencia=s.secuencia OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.secuencia IS NULL AND s.secuencia IS NULL)) AND (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.cod_tipo_importe=s.cod_tipo_importe OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.cod_tipo_importe IS NULL AND s.cod_tipo_importe IS NULL)) AND (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.cod_periodo_facturado=s.cod_periodo_facturado OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica.cod_periodo_facturado IS NULL AND s.cod_periodo_facturado IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica AS tbn1_mi_ds_159_consumo_energia_electrica
		INNER JOIN #tmp_mi_ds_159_consumo_energia_electrica AS tmp
		ON ((tbn1_mi_ds_159_consumo_energia_electrica.id_documento=tmp.t_id_documento OR (tbn1_mi_ds_159_consumo_energia_electrica.id_documento IS NULL AND tmp.t_id_documento IS NULL)) AND (tbn1_mi_ds_159_consumo_energia_electrica.secuencia=tmp.t_secuencia OR (tbn1_mi_ds_159_consumo_energia_electrica.secuencia IS NULL AND tmp.t_secuencia IS NULL)) AND (tbn1_mi_ds_159_consumo_energia_electrica.cod_tipo_importe=tmp.t_cod_tipo_importe OR (tbn1_mi_ds_159_consumo_energia_electrica.cod_tipo_importe IS NULL AND tmp.t_cod_tipo_importe IS NULL)) AND (tbn1_mi_ds_159_consumo_energia_electrica.cod_periodo_facturado=tmp.t_cod_periodo_facturado OR (tbn1_mi_ds_159_consumo_energia_electrica.cod_periodo_facturado IS NULL AND tmp.t_cod_periodo_facturado IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_ds_159_consumo_energia_electrica_unique')
			ALTER INDEX IX_tbn1_mi_ds_159_consumo_energia_electrica_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica DISABLE
		END

		INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica WITH(TABLOCK) (id_documento,id_expediente,id_mae_no_id_declarante,id_mae_no_id_declarado,ejercicio,modelo,administracion_declarante,es_externo_declarante,nif_declarante_159,id_contribuyente_declarante,es_identificado_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,cod_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,fecha_alta,mes_alta,anyo_alta,num_justificante,cod_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,nif_declarado_159,secuencia,id_contribuyente_declarado,es_identificado_declarado,es_erroneo_declarado,cod_clave_tipo_codigo,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,numero_cuenta,cod_pais_residencia,identificacion_extranjero,contrato_suministro,cod_cups_pais,cups_distribuidora,cups_num_libre_asignacion,cups_digito_control,cups_medida,cups_suministro,cod_tipo_bien,cod_situacion_inmueble,referencia_catastral,fecha_alta_contrato,anyo_alta_contrato,mes_alta_contrato,fecha_baja_contrato,mes_baja_contrato,anyo_baja_contrato,cod_unidad_consumo,cod_unidad_potencia,potencia_maxima_contratada,cod_tipo_importe,importe,cod_periodo_facturado,consumo_facturado,cod_tipo_lectura,domi_municipio,domi_codigo_municipio,domi_codigo_provincia,domi_codigo_postal)
		SELECT
			id_documento,
			id_expediente,
			id_mae_no_id_declarante,
			id_mae_no_id_declarado,
			ejercicio,
			modelo,
			administracion_declarante,
			es_externo_declarante,
			nif_declarante_159,
			id_contribuyente_declarante,
			es_identificado_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo,
			cod_banco_espania,
			cod_tipo_presentacion,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			num_caja,
			fecha_alta,
			mes_alta,
			anyo_alta,
			num_justificante,
			cod_tipo_declaracion,
			contador_revisiones,
			regimen_fiscal_deducciones,
			administracion_declarado,
			es_externo_declarado,
			nif_declarado_159,
			secuencia,
			id_contribuyente_declarado,
			es_identificado_declarado,
			es_erroneo_declarado,
			cod_clave_tipo_codigo,
			codigo_iban,
			codigo_entidad,
			codigo_sucursal,
			digito_control,
			numero_cuenta,
			cod_pais_residencia,
			identificacion_extranjero,
			contrato_suministro,
			cod_cups_pais,
			cups_distribuidora,
			cups_num_libre_asignacion,
			cups_digito_control,
			cups_medida,
			cups_suministro,
			cod_tipo_bien,
			cod_situacion_inmueble,
			referencia_catastral,
			fecha_alta_contrato,
			anyo_alta_contrato,
			mes_alta_contrato,
			fecha_baja_contrato,
			mes_baja_contrato,
			anyo_baja_contrato,
			cod_unidad_consumo,
			cod_unidad_potencia,
			potencia_maxima_contratada,
			cod_tipo_importe,
			importe,
			cod_periodo_facturado,
			consumo_facturado,
			cod_tipo_lectura,
			domi_municipio,
			domi_codigo_municipio,
			domi_codigo_provincia,
			domi_codigo_postal
			FROM #tmp_mi_ds_159_consumo_energia_electrica
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_ds_159_consumo_energia_electrica_unique')
			ALTER INDEX IX_tbn1_mi_ds_159_consumo_energia_electrica_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica REBUILD
		END
	EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@rc;
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
