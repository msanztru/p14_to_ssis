PRINT 'Script normalizado_mi_ds_198_activos_financieros_ds.sql'
GO


SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros(
	id_mi_ds_198_activos_financieros int IDENTITY(1,1),
	id_documento int,
	id_expediente int,
	ejercicio smallint,
	referencia decimal(9, 0),
	secuencia varchar(11),
	modelo varchar(3),
	nif_declarante_198_11 varchar(11),
	nif_declarado_198_11 varchar(11),
	nif_declarante_no_identificado_11 varchar(11),
	nif_declarado_no_identificado_11 varchar(11),
	nif_declarante_198 varchar(12),
	nif_declarado_198 varchar(12),
	nif_declarante_no_identificado varchar(12),
	nif_declarado_no_identificado varchar(12),
	es_contribuyente_declarante bit,
	es_externo bit,
	id_contribuyente_declarante int,
	es_contribuyente_declarado bit,
	id_contribuyente_declarado int,
	delegacion_hacienda varchar(2),
	cod_administracion varchar(3),
	telefono varchar(10),
	razon_social varchar(40),
	cod_presentador_colectivo int,
	es_identificado_declarante bit,
	sw_identificado_declarante varchar(1),
	cod_entidad_gestora varchar(4),
	cod_tipo_presentacion varchar(1),
	fecha_presentacion date,
	mes_presentacion int,
	anyo_presentacion int,
	num_caja varchar(8),
	es_erroneo_declarante bit,
	num_declarados_erroneos decimal(9, 0),
	hay_observaciones bit,
	es_historico bit,
	fecha_alta date,
	volumen_operaciones decimal(18, 2),
	num_justificante numeric(13, 0),
	cod_tipo_declaracion varchar(1),
	num_justificante_sustitutiva decimal(13, 0),
	contador_revisiones int,
	es_representante varchar(1),
	cod_provincia varchar(2),
	cod_pais varchar(3),
	num_perceptores decimal(3, 0),
	nro_orden decimal(7, 0),
	cod_tipo_codigo varchar(1),
	banco varchar(4),
	sucursal varchar(4),
	num_cuenta varchar(12),
	fecha_operacion date,
	mes_operacion int,
	anyo_operacion int,
	cod_clave_identificacion_fondo varchar(1),
	emisor varchar(12),
	cod_clave_origen varchar(1),
	cod_clave_operacion_198 varchar(1),
	cod_clave_mercado varchar(1),
	id_clave_representacion int,
	cod_clave_valor varchar(1),
	num_activos decimal(15, 2),
	porc_participacion decimal(15, 2),
	cod_clave_declarado varchar(1),
	cod_relacion decimal(7, 0),
	es_identificado_declarado bit,
	sw_identificado_declarado varchar(1),
	es_erroneo_declarado bit,
	fecha_vcto_prestamo date,
	mes_vencimiento_prestamo int,
	anyo_vencimiento_prestamo int,
	cod_tipo_importe varchar(2),
	importe numeric(18, 2),
	id_mae_no_id_declarado int,
	id_mae_no_id_declarante int,
	fecha_carga date,
	CONSTRAINT PK_tbn1_mi_ds_198_activos_financieros PRIMARY KEY CLUSTERED (id_mi_ds_198_activos_financieros)
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
	AND table_name = 'tbn1_mi_ds_198_activos_financieros'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_ds_198_activos_financieros')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='referencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD referencia decimal(9, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarante_198_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarante_198_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarado_198_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarado_198_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarante_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarante_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarado_no_identificado_11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarado_no_identificado_11 varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarante_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarante_198 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarado_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarado_198 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_externo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD delegacion_hacienda varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_administracion varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_entidad_gestora varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_tipo_presentacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_caja varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_erroneo_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_erroneo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_declarados_erroneos decimal(9, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD hay_observaciones bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_historico bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD volumen_operaciones decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_justificante numeric(13, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_tipo_declaracion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_justificante_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_justificante_sustitutiva decimal(13, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD contador_revisiones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_representante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_provincia varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_pais')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_pais varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_perceptores')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_perceptores decimal(3, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='nro_orden')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD nro_orden decimal(7, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_tipo_codigo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD banco varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD sucursal varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_cuenta varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='fecha_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD fecha_operacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='mes_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD mes_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='anyo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD anyo_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_clave_identificacion_fondo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='emisor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD emisor varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_clave_origen varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_clave_operacion_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_clave_operacion_198 varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_clave_mercado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_clave_representacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_clave_valor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_clave_valor varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='num_activos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD num_activos decimal(15, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='porc_participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD porc_participacion decimal(15, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_clave_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_relacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_relacion decimal(7, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD es_erroneo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='fecha_vcto_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD fecha_vcto_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='mes_vencimiento_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD mes_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='anyo_vencimiento_prestamo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD anyo_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD cod_tipo_importe varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD importe numeric(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros' AND COLUMN_NAME='fecha_carga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ADD fecha_carga date
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_ds_198_activos_financieros'
	AND column_name NOT IN ('id_mi_ds_198_activos_financieros', 'id_documento', 'id_expediente', 'ejercicio', 'referencia', 'secuencia', 'modelo', 'nif_declarante_198_11', 'nif_declarado_198_11', 'nif_declarante_no_identificado_11', 'nif_declarado_no_identificado_11', 'nif_declarante_198', 'nif_declarado_198', 'nif_declarante_no_identificado', 'nif_declarado_no_identificado', 'es_contribuyente_declarante', 'es_externo', 'id_contribuyente_declarante', 'es_contribuyente_declarado', 'id_contribuyente_declarado', 'delegacion_hacienda', 'cod_administracion', 'telefono', 'razon_social', 'cod_presentador_colectivo', 'es_identificado_declarante', 'sw_identificado_declarante', 'cod_entidad_gestora', 'cod_tipo_presentacion', 'fecha_presentacion', 'mes_presentacion', 'anyo_presentacion', 'num_caja', 'es_erroneo_declarante', 'num_declarados_erroneos', 'hay_observaciones', 'es_historico', 'fecha_alta', 'volumen_operaciones', 'num_justificante', 'cod_tipo_declaracion', 'num_justificante_sustitutiva', 'contador_revisiones', 'es_representante', 'cod_provincia', 'cod_pais', 'num_perceptores', 'nro_orden', 'cod_tipo_codigo', 'banco', 'sucursal', 'num_cuenta', 'fecha_operacion', 'mes_operacion', 'anyo_operacion', 'cod_clave_identificacion_fondo', 'emisor', 'cod_clave_origen', 'cod_clave_operacion_198', 'cod_clave_mercado', 'id_clave_representacion', 'cod_clave_valor', 'num_activos', 'porc_participacion', 'cod_clave_declarado', 'cod_relacion', 'es_identificado_declarado', 'sw_identificado_declarado', 'es_erroneo_declarado', 'fecha_vcto_prestamo', 'mes_vencimiento_prestamo', 'anyo_vencimiento_prestamo', 'cod_tipo_importe', 'importe', 'id_mae_no_id_declarado', 'id_mae_no_id_declarante', 'fecha_carga')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_documento int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_expediente int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN ejercicio smallint NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN referencia decimal(9, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN secuencia varchar(11) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN modelo varchar(3) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarante_198_11 varchar(11) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarado_198_11 varchar(11) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarante_no_identificado_11 varchar(11) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarado_no_identificado_11 varchar(11) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarante_198 varchar(12) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarado_198 varchar(12) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_externo bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_administracion varchar(3) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN telefono varchar(10) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN razon_social varchar(40) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN fecha_presentacion date NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN mes_presentacion int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN anyo_presentacion int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_caja varchar(8) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_erroneo_declarante bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_declarados_erroneos decimal(9, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN hay_observaciones bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_historico bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN fecha_alta date NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN volumen_operaciones decimal(18, 2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_justificante numeric(13, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_tipo_declaracion varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_justificante_sustitutiva decimal(13, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN contador_revisiones int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_representante varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_provincia varchar(2) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_pais varchar(3) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_perceptores decimal(3, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN nro_orden decimal(7, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_tipo_codigo varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN banco varchar(4) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN sucursal varchar(4) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_cuenta varchar(12) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN fecha_operacion date NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN mes_operacion int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN anyo_operacion int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_clave_identificacion_fondo varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN emisor varchar(12) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_clave_origen varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_clave_operacion_198 varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_clave_mercado varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_clave_representacion int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_clave_valor varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN num_activos decimal(15, 2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN porc_participacion decimal(15, 2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_clave_declarado varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_relacion decimal(7, 0) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN fecha_vcto_prestamo date NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN mes_vencimiento_prestamo int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN anyo_vencimiento_prestamo int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN cod_tipo_importe varchar(2) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN importe numeric(18, 2) NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros ALTER COLUMN fecha_carga date NOT NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_ds_198_activos_financieros_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros (id_documento,secuencia,cod_tipo_importe) INCLUDE (id_mi_ds_198_activos_financieros)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros_cl')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl(
	id_mi_ds_198_activos_financieros int IDENTITY(1,1),
	id_documento int,
	secuencia varchar(11),
	cod_tipo_importe varchar(2),
	CONSTRAINT PK_tbn1_mi_ds_198_activos_financieros_cl PRIMARY KEY CLUSTERED (id_mi_ds_198_activos_financieros)
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
	AND table_name = 'tbn1_mi_ds_198_activos_financieros_cl'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_ds_198_activos_financieros_cl')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros_cl' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros_cl' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_ds_198_activos_financieros_cl' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl ADD cod_tipo_importe varchar(2)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_ds_198_activos_financieros_cl'
	AND column_name NOT IN ('id_mi_ds_198_activos_financieros', 'id_documento', 'secuencia', 'cod_tipo_importe')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl ALTER COLUMN id_documento int NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl ALTER COLUMN secuencia varchar(11) NOT NULL
GO

ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl ALTER COLUMN cod_tipo_importe varchar(2) NOT NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_ds_198_activos_financieros_cl_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros_cl (id_documento,secuencia,cod_tipo_importe) INCLUDE (id_mi_ds_198_activos_financieros)

--Add FKs if necessary
--End table create/prepare


USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_198_activos_financieros' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_198_activos_financieros;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_198_activos_financieros(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_ds_198_activos_financieros'
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

		IF OBJECT_ID('tempdb..#tmp_mi_ds_198_activos_financieros') IS NOT NULL
			DROP TABLE #tmp_mi_ds_198_activos_financieros
		CREATE table #tmp_mi_ds_198_activos_financieros(
			rr_mode varchar(1),
			id_mi_ds_198_activos_financieros int,
			t_id_documento int,
			t_secuencia varchar(11),
			t_cod_tipo_importe varchar(2),
			id_documento int,
			id_expediente int,
			ejercicio smallint,
			referencia decimal(9, 0),
			secuencia varchar(11),
			modelo varchar(3),
			nif_declarante_198_11 varchar(11),
			nif_declarado_198_11 varchar(11),
			nif_declarante_no_identificado_11 varchar(11),
			nif_declarado_no_identificado_11 varchar(11),
			nif_declarante_198 varchar(12),
			nif_declarado_198 varchar(12),
			nif_declarante_no_identificado varchar(12),
			nif_declarado_no_identificado varchar(12),
			es_contribuyente_declarante bit,
			es_externo bit,
			id_contribuyente_declarante int,
			es_contribuyente_declarado bit,
			id_contribuyente_declarado int,
			delegacion_hacienda varchar(2),
			cod_administracion varchar(3),
			telefono varchar(10),
			razon_social varchar(40),
			cod_presentador_colectivo int,
			es_identificado_declarante bit,
			sw_identificado_declarante varchar(1),
			cod_entidad_gestora varchar(4),
			cod_tipo_presentacion varchar(1),
			fecha_presentacion date,
			mes_presentacion int,
			anyo_presentacion int,
			num_caja varchar(8),
			es_erroneo_declarante bit,
			num_declarados_erroneos decimal(9, 0),
			hay_observaciones bit,
			es_historico bit,
			fecha_alta date,
			volumen_operaciones decimal(18, 2),
			num_justificante numeric(13, 0),
			cod_tipo_declaracion varchar(1),
			num_justificante_sustitutiva decimal(13, 0),
			contador_revisiones int,
			es_representante varchar(1),
			cod_provincia varchar(2),
			cod_pais varchar(3),
			num_perceptores decimal(3, 0),
			nro_orden decimal(7, 0),
			cod_tipo_codigo varchar(1),
			banco varchar(4),
			sucursal varchar(4),
			num_cuenta varchar(12),
			fecha_operacion date,
			mes_operacion int,
			anyo_operacion int,
			cod_clave_identificacion_fondo varchar(1),
			emisor varchar(12),
			cod_clave_origen varchar(1),
			cod_clave_operacion_198 varchar(1),
			cod_clave_mercado varchar(1),
			id_clave_representacion int,
			cod_clave_valor varchar(1),
			num_activos decimal(15, 2),
			porc_participacion decimal(15, 2),
			cod_clave_declarado varchar(1),
			cod_relacion decimal(7, 0),
			es_identificado_declarado bit,
			sw_identificado_declarado varchar(1),
			es_erroneo_declarado bit,
			fecha_vcto_prestamo date,
			mes_vencimiento_prestamo int,
			anyo_vencimiento_prestamo int,
			cod_tipo_importe varchar(2),
			importe numeric(18, 2),
			id_mae_no_id_declarado int,
			id_mae_no_id_declarante int,
			fecha_carga date
		);

		;WITH
		query AS (
	SELECT
		t.id_documento,
		t.id_expediente,
		t.ejercicio,
		t.referencia,
		t.secuencia,
		t.modelo,
		t.nif_declarante_198_11,
		t.nif_declarado_198_11,
		t.nif_declarante_no_identificado_11,
		t.nif_declarado_no_identificado_11,
		t.nif_declarante_198,
		t.nif_declarado_198,
		t.nif_declarante_no_identificado,
		t.nif_declarado_no_identificado,
		t.es_contribuyente_declarante,
		t.es_externo,
		t.id_contribuyente_declarante,
		t.es_contribuyente_declarado,
		t.id_contribuyente_declarado,
		t.delegacion_hacienda,
		t.cod_administracion,
		t.telefono,
		t.razon_social,
		t.cod_presentador_colectivo,
		t.es_identificado_declarante,
		t.sw_identificado_declarante,
		t.cod_entidad_gestora,
		t.cod_tipo_presentacion,
		t.fecha_presentacion,
		t.mes_presentacion,
		t.anyo_presentacion,
		t.num_caja,
		t.es_erroneo_declarante,
		t.num_declarados_erroneos,
		t.hay_observaciones,
		t.es_historico,
		t.fecha_alta,
		t.volumen_operaciones,
		t.num_justificante,
		t.cod_tipo_declaracion,
		t.num_justificante_sustitutiva,
		t.contador_revisiones,
		t.es_representante,
		t.cod_provincia,
		t.cod_pais,
		t.num_perceptores,
		t.nro_orden,
		t.cod_tipo_codigo,
		t.banco,
		t.sucursal,
		t.num_cuenta,
		t.fecha_operacion,
		t.mes_operacion,
		t.anyo_operacion,
		t.cod_clave_identificacion_fondo,
		t.emisor,
		t.cod_clave_origen,
		t.cod_clave_operacion_198,
		t.cod_clave_mercado,
		t.id_clave_representacion,
		t.cod_clave_valor,
		t.num_activos,
		t.porc_participacion,
		t.cod_clave_declarado,
		t.cod_relacion,
		t.es_identificado_declarado,
		t.sw_identificado_declarado,
		t.es_erroneo_declarado,
		t.fecha_vcto_prestamo,
		t.mes_vencimiento_prestamo,
		t.anyo_vencimiento_prestamo,
		t.cod_tipo_importe,
		t.importe,
		t.id_mae_no_id_declarado,
		t.id_mae_no_id_declarante,
		t.fecha_carga
	FROM dbo.fnn1_query_carga_ds_mi_ds_198_activos_financieros(@logpadre) t
		)
		INSERT INTO #tmp_mi_ds_198_activos_financieros (rr_mode,id_mi_ds_198_activos_financieros,t_id_documento,t_secuencia,t_cod_tipo_importe,id_documento,id_expediente,ejercicio,referencia,secuencia,modelo,nif_declarante_198_11,nif_declarado_198_11,nif_declarante_no_identificado_11,nif_declarado_no_identificado_11,nif_declarante_198,nif_declarado_198,nif_declarante_no_identificado,nif_declarado_no_identificado,es_contribuyente_declarante,es_externo,id_contribuyente_declarante,es_contribuyente_declarado,id_contribuyente_declarado,delegacion_hacienda,cod_administracion,telefono,razon_social,cod_presentador_colectivo,es_identificado_declarante,sw_identificado_declarante,cod_entidad_gestora,cod_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,es_erroneo_declarante,num_declarados_erroneos,hay_observaciones,es_historico,fecha_alta,volumen_operaciones,num_justificante,cod_tipo_declaracion,num_justificante_sustitutiva,contador_revisiones,es_representante,cod_provincia,cod_pais,num_perceptores,nro_orden,cod_tipo_codigo,banco,sucursal,num_cuenta,fecha_operacion,mes_operacion,anyo_operacion,cod_clave_identificacion_fondo,emisor,cod_clave_origen,cod_clave_operacion_198,cod_clave_mercado,id_clave_representacion,cod_clave_valor,num_activos,porc_participacion,cod_clave_declarado,cod_relacion,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado,fecha_vcto_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo,cod_tipo_importe,importe,id_mae_no_id_declarado,id_mae_no_id_declarante,fecha_carga)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_mi_ds_198_activos_financieros IS NULL THEN 'I'
					WHEN (query.id_documento IS NULL AND t.id_documento IS NOT NULL) AND (query.secuencia IS NULL AND t.secuencia IS NOT NULL) AND (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_mi_ds_198_activos_financieros AS id_mi_ds_198_activos_financieros,
			t.id_documento AS t_id_documento,
			t.secuencia AS t_secuencia,
			t.cod_tipo_importe AS t_cod_tipo_importe,
			query.id_documento AS id_documento,
			query.id_expediente AS id_expediente,
			query.ejercicio AS ejercicio,
			query.referencia AS referencia,
			query.secuencia AS secuencia,
			query.modelo AS modelo,
			query.nif_declarante_198_11 AS nif_declarante_198_11,
			query.nif_declarado_198_11 AS nif_declarado_198_11,
			query.nif_declarante_no_identificado_11 AS nif_declarante_no_identificado_11,
			query.nif_declarado_no_identificado_11 AS nif_declarado_no_identificado_11,
			query.nif_declarante_198 AS nif_declarante_198,
			query.nif_declarado_198 AS nif_declarado_198,
			query.nif_declarante_no_identificado AS nif_declarante_no_identificado,
			query.nif_declarado_no_identificado AS nif_declarado_no_identificado,
			query.es_contribuyente_declarante AS es_contribuyente_declarante,
			query.es_externo AS es_externo,
			query.id_contribuyente_declarante AS id_contribuyente_declarante,
			query.es_contribuyente_declarado AS es_contribuyente_declarado,
			query.id_contribuyente_declarado AS id_contribuyente_declarado,
			query.delegacion_hacienda AS delegacion_hacienda,
			query.cod_administracion AS cod_administracion,
			query.telefono AS telefono,
			query.razon_social AS razon_social,
			query.cod_presentador_colectivo AS cod_presentador_colectivo,
			query.es_identificado_declarante AS es_identificado_declarante,
			query.sw_identificado_declarante AS sw_identificado_declarante,
			query.cod_entidad_gestora AS cod_entidad_gestora,
			query.cod_tipo_presentacion AS cod_tipo_presentacion,
			query.fecha_presentacion AS fecha_presentacion,
			query.mes_presentacion AS mes_presentacion,
			query.anyo_presentacion AS anyo_presentacion,
			query.num_caja AS num_caja,
			query.es_erroneo_declarante AS es_erroneo_declarante,
			query.num_declarados_erroneos AS num_declarados_erroneos,
			query.hay_observaciones AS hay_observaciones,
			query.es_historico AS es_historico,
			query.fecha_alta AS fecha_alta,
			query.volumen_operaciones AS volumen_operaciones,
			query.num_justificante AS num_justificante,
			query.cod_tipo_declaracion AS cod_tipo_declaracion,
			query.num_justificante_sustitutiva AS num_justificante_sustitutiva,
			query.contador_revisiones AS contador_revisiones,
			query.es_representante AS es_representante,
			query.cod_provincia AS cod_provincia,
			query.cod_pais AS cod_pais,
			query.num_perceptores AS num_perceptores,
			query.nro_orden AS nro_orden,
			query.cod_tipo_codigo AS cod_tipo_codigo,
			query.banco AS banco,
			query.sucursal AS sucursal,
			query.num_cuenta AS num_cuenta,
			query.fecha_operacion AS fecha_operacion,
			query.mes_operacion AS mes_operacion,
			query.anyo_operacion AS anyo_operacion,
			query.cod_clave_identificacion_fondo AS cod_clave_identificacion_fondo,
			query.emisor AS emisor,
			query.cod_clave_origen AS cod_clave_origen,
			query.cod_clave_operacion_198 AS cod_clave_operacion_198,
			query.cod_clave_mercado AS cod_clave_mercado,
			query.id_clave_representacion AS id_clave_representacion,
			query.cod_clave_valor AS cod_clave_valor,
			query.num_activos AS num_activos,
			query.porc_participacion AS porc_participacion,
			query.cod_clave_declarado AS cod_clave_declarado,
			query.cod_relacion AS cod_relacion,
			query.es_identificado_declarado AS es_identificado_declarado,
			query.sw_identificado_declarado AS sw_identificado_declarado,
			query.es_erroneo_declarado AS es_erroneo_declarado,
			query.fecha_vcto_prestamo AS fecha_vcto_prestamo,
			query.mes_vencimiento_prestamo AS mes_vencimiento_prestamo,
			query.anyo_vencimiento_prestamo AS anyo_vencimiento_prestamo,
			query.cod_tipo_importe AS cod_tipo_importe,
			query.importe AS importe,
			query.id_mae_no_id_declarado AS id_mae_no_id_declarado,
			query.id_mae_no_id_declarante AS id_mae_no_id_declarante,
			query.fecha_carga AS fecha_carga
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros AS t
		INNER JOIN dbo.fnn1_query_carga_ds_mi_ds_198_activos_financieros_f_id_documento(@logpadre) f ON (t.id_documento=f.id_documento)
		FULL JOIN query on ((query.id_documento=t.id_documento OR (query.id_documento IS NULL AND t.id_documento IS NULL)) AND (query.secuencia=t.secuencia OR (query.secuencia IS NULL AND t.secuencia IS NULL)) AND (query.cod_tipo_importe=t.cod_tipo_importe OR (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NULL)))
		WHERE 
			id_mi_ds_198_activos_financieros IS NULL OR
			((query.id_documento IS NULL AND t.id_documento IS NOT NULL) AND (query.secuencia IS NULL AND t.secuencia IS NOT NULL) AND (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NOT NULL)) OR
			(t.id_documento<>query.id_documento OR (t.id_documento IS NULL AND query.id_documento IS NOT NULL)
                                                  OR (t.id_documento IS NOT NULL AND query.id_documento IS NULL)
				OR t.id_expediente<>query.id_expediente OR (t.id_expediente IS NULL AND query.id_expediente IS NOT NULL)
                                                  OR (t.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
				OR t.ejercicio<>query.ejercicio OR (t.ejercicio IS NULL AND query.ejercicio IS NOT NULL)
                                                  OR (t.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
				OR t.referencia<>query.referencia OR (t.referencia IS NULL AND query.referencia IS NOT NULL)
                                                  OR (t.referencia IS NOT NULL AND query.referencia IS NULL)
				OR t.secuencia<>query.secuencia OR (t.secuencia IS NULL AND query.secuencia IS NOT NULL)
                                                  OR (t.secuencia IS NOT NULL AND query.secuencia IS NULL)
				OR t.modelo<>query.modelo OR (t.modelo IS NULL AND query.modelo IS NOT NULL)
                                                  OR (t.modelo IS NOT NULL AND query.modelo IS NULL)
				OR t.nif_declarante_198_11<>query.nif_declarante_198_11 OR (t.nif_declarante_198_11 IS NULL AND query.nif_declarante_198_11 IS NOT NULL)
                                                  OR (t.nif_declarante_198_11 IS NOT NULL AND query.nif_declarante_198_11 IS NULL)
				OR t.nif_declarado_198_11<>query.nif_declarado_198_11 OR (t.nif_declarado_198_11 IS NULL AND query.nif_declarado_198_11 IS NOT NULL)
                                                  OR (t.nif_declarado_198_11 IS NOT NULL AND query.nif_declarado_198_11 IS NULL)
				OR t.nif_declarante_no_identificado_11<>query.nif_declarante_no_identificado_11 OR (t.nif_declarante_no_identificado_11 IS NULL AND query.nif_declarante_no_identificado_11 IS NOT NULL)
                                                  OR (t.nif_declarante_no_identificado_11 IS NOT NULL AND query.nif_declarante_no_identificado_11 IS NULL)
				OR t.nif_declarado_no_identificado_11<>query.nif_declarado_no_identificado_11 OR (t.nif_declarado_no_identificado_11 IS NULL AND query.nif_declarado_no_identificado_11 IS NOT NULL)
                                                  OR (t.nif_declarado_no_identificado_11 IS NOT NULL AND query.nif_declarado_no_identificado_11 IS NULL)
				OR t.nif_declarante_198<>query.nif_declarante_198 OR (t.nif_declarante_198 IS NULL AND query.nif_declarante_198 IS NOT NULL)
                                                  OR (t.nif_declarante_198 IS NOT NULL AND query.nif_declarante_198 IS NULL)
				OR t.nif_declarado_198<>query.nif_declarado_198 OR (t.nif_declarado_198 IS NULL AND query.nif_declarado_198 IS NOT NULL)
                                                  OR (t.nif_declarado_198 IS NOT NULL AND query.nif_declarado_198 IS NULL)
				OR t.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (t.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL)
                                                  OR (t.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
				OR t.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (t.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL)
                                                  OR (t.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
				OR t.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (t.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL)
                                                  OR (t.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
				OR t.es_externo<>query.es_externo OR (t.es_externo IS NULL AND query.es_externo IS NOT NULL)
                                                  OR (t.es_externo IS NOT NULL AND query.es_externo IS NULL)
				OR t.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (t.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL)
                                                  OR (t.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
				OR t.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (t.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL)
                                                  OR (t.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
				OR t.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (t.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL)
                                                  OR (t.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
				OR t.delegacion_hacienda<>query.delegacion_hacienda OR (t.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL)
                                                  OR (t.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
				OR t.cod_administracion<>query.cod_administracion OR (t.cod_administracion IS NULL AND query.cod_administracion IS NOT NULL)
                                                  OR (t.cod_administracion IS NOT NULL AND query.cod_administracion IS NULL)
				OR t.telefono<>query.telefono OR (t.telefono IS NULL AND query.telefono IS NOT NULL)
                                                  OR (t.telefono IS NOT NULL AND query.telefono IS NULL)
				OR t.razon_social<>query.razon_social OR (t.razon_social IS NULL AND query.razon_social IS NOT NULL)
                                                  OR (t.razon_social IS NOT NULL AND query.razon_social IS NULL)
				OR t.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (t.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL)
                                                  OR (t.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
				OR t.es_identificado_declarante<>query.es_identificado_declarante OR (t.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL)
                                                  OR (t.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
				OR t.sw_identificado_declarante<>query.sw_identificado_declarante OR (t.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL)
                                                  OR (t.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
				OR t.cod_entidad_gestora<>query.cod_entidad_gestora OR (t.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL)
                                                  OR (t.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
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
				OR t.es_erroneo_declarante<>query.es_erroneo_declarante OR (t.es_erroneo_declarante IS NULL AND query.es_erroneo_declarante IS NOT NULL)
                                                  OR (t.es_erroneo_declarante IS NOT NULL AND query.es_erroneo_declarante IS NULL)
				OR t.num_declarados_erroneos<>query.num_declarados_erroneos OR (t.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL)
                                                  OR (t.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
				OR t.hay_observaciones<>query.hay_observaciones OR (t.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL)
                                                  OR (t.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
				OR t.es_historico<>query.es_historico OR (t.es_historico IS NULL AND query.es_historico IS NOT NULL)
                                                  OR (t.es_historico IS NOT NULL AND query.es_historico IS NULL)
				OR t.fecha_alta<>query.fecha_alta OR (t.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL)
                                                  OR (t.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
				OR t.volumen_operaciones<>query.volumen_operaciones OR (t.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL)
                                                  OR (t.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
				OR t.num_justificante<>query.num_justificante OR (t.num_justificante IS NULL AND query.num_justificante IS NOT NULL)
                                                  OR (t.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
				OR t.cod_tipo_declaracion<>query.cod_tipo_declaracion OR (t.cod_tipo_declaracion IS NULL AND query.cod_tipo_declaracion IS NOT NULL)
                                                  OR (t.cod_tipo_declaracion IS NOT NULL AND query.cod_tipo_declaracion IS NULL)
				OR t.num_justificante_sustitutiva<>query.num_justificante_sustitutiva OR (t.num_justificante_sustitutiva IS NULL AND query.num_justificante_sustitutiva IS NOT NULL)
                                                  OR (t.num_justificante_sustitutiva IS NOT NULL AND query.num_justificante_sustitutiva IS NULL)
				OR t.contador_revisiones<>query.contador_revisiones OR (t.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL)
                                                  OR (t.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
				OR t.es_representante<>query.es_representante OR (t.es_representante IS NULL AND query.es_representante IS NOT NULL)
                                                  OR (t.es_representante IS NOT NULL AND query.es_representante IS NULL)
				OR t.cod_provincia<>query.cod_provincia OR (t.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL)
                                                  OR (t.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)
				OR t.cod_pais<>query.cod_pais OR (t.cod_pais IS NULL AND query.cod_pais IS NOT NULL)
                                                  OR (t.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
				OR t.num_perceptores<>query.num_perceptores OR (t.num_perceptores IS NULL AND query.num_perceptores IS NOT NULL)
                                                  OR (t.num_perceptores IS NOT NULL AND query.num_perceptores IS NULL)
				OR t.nro_orden<>query.nro_orden OR (t.nro_orden IS NULL AND query.nro_orden IS NOT NULL)
                                                  OR (t.nro_orden IS NOT NULL AND query.nro_orden IS NULL)
				OR t.cod_tipo_codigo<>query.cod_tipo_codigo OR (t.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL)
                                                  OR (t.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
				OR t.banco<>query.banco OR (t.banco IS NULL AND query.banco IS NOT NULL)
                                                  OR (t.banco IS NOT NULL AND query.banco IS NULL)
				OR t.sucursal<>query.sucursal OR (t.sucursal IS NULL AND query.sucursal IS NOT NULL)
                                                  OR (t.sucursal IS NOT NULL AND query.sucursal IS NULL)
				OR t.num_cuenta<>query.num_cuenta OR (t.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL)
                                                  OR (t.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
				OR t.fecha_operacion<>query.fecha_operacion OR (t.fecha_operacion IS NULL AND query.fecha_operacion IS NOT NULL)
                                                  OR (t.fecha_operacion IS NOT NULL AND query.fecha_operacion IS NULL)
				OR t.mes_operacion<>query.mes_operacion OR (t.mes_operacion IS NULL AND query.mes_operacion IS NOT NULL)
                                                  OR (t.mes_operacion IS NOT NULL AND query.mes_operacion IS NULL)
				OR t.anyo_operacion<>query.anyo_operacion OR (t.anyo_operacion IS NULL AND query.anyo_operacion IS NOT NULL)
                                                  OR (t.anyo_operacion IS NOT NULL AND query.anyo_operacion IS NULL)
				OR t.cod_clave_identificacion_fondo<>query.cod_clave_identificacion_fondo OR (t.cod_clave_identificacion_fondo IS NULL AND query.cod_clave_identificacion_fondo IS NOT NULL)
                                                  OR (t.cod_clave_identificacion_fondo IS NOT NULL AND query.cod_clave_identificacion_fondo IS NULL)
				OR t.emisor<>query.emisor OR (t.emisor IS NULL AND query.emisor IS NOT NULL)
                                                  OR (t.emisor IS NOT NULL AND query.emisor IS NULL)
				OR t.cod_clave_origen<>query.cod_clave_origen OR (t.cod_clave_origen IS NULL AND query.cod_clave_origen IS NOT NULL)
                                                  OR (t.cod_clave_origen IS NOT NULL AND query.cod_clave_origen IS NULL)
				OR t.cod_clave_operacion_198<>query.cod_clave_operacion_198 OR (t.cod_clave_operacion_198 IS NULL AND query.cod_clave_operacion_198 IS NOT NULL)
                                                  OR (t.cod_clave_operacion_198 IS NOT NULL AND query.cod_clave_operacion_198 IS NULL)
				OR t.cod_clave_mercado<>query.cod_clave_mercado OR (t.cod_clave_mercado IS NULL AND query.cod_clave_mercado IS NOT NULL)
                                                  OR (t.cod_clave_mercado IS NOT NULL AND query.cod_clave_mercado IS NULL)
				OR t.id_clave_representacion<>query.id_clave_representacion OR (t.id_clave_representacion IS NULL AND query.id_clave_representacion IS NOT NULL)
                                                  OR (t.id_clave_representacion IS NOT NULL AND query.id_clave_representacion IS NULL)
				OR t.cod_clave_valor<>query.cod_clave_valor OR (t.cod_clave_valor IS NULL AND query.cod_clave_valor IS NOT NULL)
                                                  OR (t.cod_clave_valor IS NOT NULL AND query.cod_clave_valor IS NULL)
				OR t.num_activos<>query.num_activos OR (t.num_activos IS NULL AND query.num_activos IS NOT NULL)
                                                  OR (t.num_activos IS NOT NULL AND query.num_activos IS NULL)
				OR t.porc_participacion<>query.porc_participacion OR (t.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL)
                                                  OR (t.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
				OR t.cod_clave_declarado<>query.cod_clave_declarado OR (t.cod_clave_declarado IS NULL AND query.cod_clave_declarado IS NOT NULL)
                                                  OR (t.cod_clave_declarado IS NOT NULL AND query.cod_clave_declarado IS NULL)
				OR t.cod_relacion<>query.cod_relacion OR (t.cod_relacion IS NULL AND query.cod_relacion IS NOT NULL)
                                                  OR (t.cod_relacion IS NOT NULL AND query.cod_relacion IS NULL)
				OR t.es_identificado_declarado<>query.es_identificado_declarado OR (t.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL)
                                                  OR (t.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
				OR t.sw_identificado_declarado<>query.sw_identificado_declarado OR (t.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL)
                                                  OR (t.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
				OR t.es_erroneo_declarado<>query.es_erroneo_declarado OR (t.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL)
                                                  OR (t.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL)
				OR t.fecha_vcto_prestamo<>query.fecha_vcto_prestamo OR (t.fecha_vcto_prestamo IS NULL AND query.fecha_vcto_prestamo IS NOT NULL)
                                                  OR (t.fecha_vcto_prestamo IS NOT NULL AND query.fecha_vcto_prestamo IS NULL)
				OR t.mes_vencimiento_prestamo<>query.mes_vencimiento_prestamo OR (t.mes_vencimiento_prestamo IS NULL AND query.mes_vencimiento_prestamo IS NOT NULL)
                                                  OR (t.mes_vencimiento_prestamo IS NOT NULL AND query.mes_vencimiento_prestamo IS NULL)
				OR t.anyo_vencimiento_prestamo<>query.anyo_vencimiento_prestamo OR (t.anyo_vencimiento_prestamo IS NULL AND query.anyo_vencimiento_prestamo IS NOT NULL)
                                                  OR (t.anyo_vencimiento_prestamo IS NOT NULL AND query.anyo_vencimiento_prestamo IS NULL)
				OR t.cod_tipo_importe<>query.cod_tipo_importe OR (t.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL)
                                                  OR (t.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
				OR t.importe<>query.importe OR (t.importe IS NULL AND query.importe IS NOT NULL)
                                                  OR (t.importe IS NOT NULL AND query.importe IS NULL)
				OR t.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (t.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
				OR t.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (t.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
				OR t.fecha_carga<>query.fecha_carga OR (t.fecha_carga IS NULL AND query.fecha_carga IS NOT NULL)
                                                  OR (t.fecha_carga IS NOT NULL AND query.fecha_carga IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_ds_198_activos_financieros
		SELECT @count_ins = count(*) from #tmp_mi_ds_198_activos_financieros where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
			SET
				id_documento=s.id_documento,
				id_expediente=s.id_expediente,
				ejercicio=s.ejercicio,
				referencia=s.referencia,
				secuencia=s.secuencia,
				modelo=s.modelo,
				nif_declarante_198_11=s.nif_declarante_198_11,
				nif_declarado_198_11=s.nif_declarado_198_11,
				nif_declarante_no_identificado_11=s.nif_declarante_no_identificado_11,
				nif_declarado_no_identificado_11=s.nif_declarado_no_identificado_11,
				nif_declarante_198=s.nif_declarante_198,
				nif_declarado_198=s.nif_declarado_198,
				nif_declarante_no_identificado=s.nif_declarante_no_identificado,
				nif_declarado_no_identificado=s.nif_declarado_no_identificado,
				es_contribuyente_declarante=s.es_contribuyente_declarante,
				es_externo=s.es_externo,
				id_contribuyente_declarante=s.id_contribuyente_declarante,
				es_contribuyente_declarado=s.es_contribuyente_declarado,
				id_contribuyente_declarado=s.id_contribuyente_declarado,
				delegacion_hacienda=s.delegacion_hacienda,
				cod_administracion=s.cod_administracion,
				telefono=s.telefono,
				razon_social=s.razon_social,
				cod_presentador_colectivo=s.cod_presentador_colectivo,
				es_identificado_declarante=s.es_identificado_declarante,
				sw_identificado_declarante=s.sw_identificado_declarante,
				cod_entidad_gestora=s.cod_entidad_gestora,
				cod_tipo_presentacion=s.cod_tipo_presentacion,
				fecha_presentacion=s.fecha_presentacion,
				mes_presentacion=s.mes_presentacion,
				anyo_presentacion=s.anyo_presentacion,
				num_caja=s.num_caja,
				es_erroneo_declarante=s.es_erroneo_declarante,
				num_declarados_erroneos=s.num_declarados_erroneos,
				hay_observaciones=s.hay_observaciones,
				es_historico=s.es_historico,
				fecha_alta=s.fecha_alta,
				volumen_operaciones=s.volumen_operaciones,
				num_justificante=s.num_justificante,
				cod_tipo_declaracion=s.cod_tipo_declaracion,
				num_justificante_sustitutiva=s.num_justificante_sustitutiva,
				contador_revisiones=s.contador_revisiones,
				es_representante=s.es_representante,
				cod_provincia=s.cod_provincia,
				cod_pais=s.cod_pais,
				num_perceptores=s.num_perceptores,
				nro_orden=s.nro_orden,
				cod_tipo_codigo=s.cod_tipo_codigo,
				banco=s.banco,
				sucursal=s.sucursal,
				num_cuenta=s.num_cuenta,
				fecha_operacion=s.fecha_operacion,
				mes_operacion=s.mes_operacion,
				anyo_operacion=s.anyo_operacion,
				cod_clave_identificacion_fondo=s.cod_clave_identificacion_fondo,
				emisor=s.emisor,
				cod_clave_origen=s.cod_clave_origen,
				cod_clave_operacion_198=s.cod_clave_operacion_198,
				cod_clave_mercado=s.cod_clave_mercado,
				id_clave_representacion=s.id_clave_representacion,
				cod_clave_valor=s.cod_clave_valor,
				num_activos=s.num_activos,
				porc_participacion=s.porc_participacion,
				cod_clave_declarado=s.cod_clave_declarado,
				cod_relacion=s.cod_relacion,
				es_identificado_declarado=s.es_identificado_declarado,
				sw_identificado_declarado=s.sw_identificado_declarado,
				es_erroneo_declarado=s.es_erroneo_declarado,
				fecha_vcto_prestamo=s.fecha_vcto_prestamo,
				mes_vencimiento_prestamo=s.mes_vencimiento_prestamo,
				anyo_vencimiento_prestamo=s.anyo_vencimiento_prestamo,
				cod_tipo_importe=s.cod_tipo_importe,
				importe=s.importe,
				id_mae_no_id_declarado=s.id_mae_no_id_declarado,
				id_mae_no_id_declarante=s.id_mae_no_id_declarante,
				fecha_carga=s.fecha_carga
		FROM (
			SELECT
				id_documento,
				id_expediente,
				ejercicio,
				referencia,
				secuencia,
				modelo,
				nif_declarante_198_11,
				nif_declarado_198_11,
				nif_declarante_no_identificado_11,
				nif_declarado_no_identificado_11,
				nif_declarante_198,
				nif_declarado_198,
				nif_declarante_no_identificado,
				nif_declarado_no_identificado,
				es_contribuyente_declarante,
				es_externo,
				id_contribuyente_declarante,
				es_contribuyente_declarado,
				id_contribuyente_declarado,
				delegacion_hacienda,
				cod_administracion,
				telefono,
				razon_social,
				cod_presentador_colectivo,
				es_identificado_declarante,
				sw_identificado_declarante,
				cod_entidad_gestora,
				cod_tipo_presentacion,
				fecha_presentacion,
				mes_presentacion,
				anyo_presentacion,
				num_caja,
				es_erroneo_declarante,
				num_declarados_erroneos,
				hay_observaciones,
				es_historico,
				fecha_alta,
				volumen_operaciones,
				num_justificante,
				cod_tipo_declaracion,
				num_justificante_sustitutiva,
				contador_revisiones,
				es_representante,
				cod_provincia,
				cod_pais,
				num_perceptores,
				nro_orden,
				cod_tipo_codigo,
				banco,
				sucursal,
				num_cuenta,
				fecha_operacion,
				mes_operacion,
				anyo_operacion,
				cod_clave_identificacion_fondo,
				emisor,
				cod_clave_origen,
				cod_clave_operacion_198,
				cod_clave_mercado,
				id_clave_representacion,
				cod_clave_valor,
				num_activos,
				porc_participacion,
				cod_clave_declarado,
				cod_relacion,
				es_identificado_declarado,
				sw_identificado_declarado,
				es_erroneo_declarado,
				fecha_vcto_prestamo,
				mes_vencimiento_prestamo,
				anyo_vencimiento_prestamo,
				cod_tipo_importe,
				importe,
				id_mae_no_id_declarado,
				id_mae_no_id_declarante,
				fecha_carga
			FROM #tmp_mi_ds_198_activos_financieros
			WHERE rr_mode='U') s
		WHERE (dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros.id_documento=s.id_documento OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros.id_documento IS NULL AND s.id_documento IS NULL)) AND (dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros.secuencia=s.secuencia OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros.secuencia IS NULL AND s.secuencia IS NULL)) AND (dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros.cod_tipo_importe=s.cod_tipo_importe OR (dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros.cod_tipo_importe IS NULL AND s.cod_tipo_importe IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros AS tbn1_mi_ds_198_activos_financieros
		INNER JOIN #tmp_mi_ds_198_activos_financieros AS tmp
		ON ((tbn1_mi_ds_198_activos_financieros.id_documento=tmp.t_id_documento OR (tbn1_mi_ds_198_activos_financieros.id_documento IS NULL AND tmp.t_id_documento IS NULL)) AND (tbn1_mi_ds_198_activos_financieros.secuencia=tmp.t_secuencia OR (tbn1_mi_ds_198_activos_financieros.secuencia IS NULL AND tmp.t_secuencia IS NULL)) AND (tbn1_mi_ds_198_activos_financieros.cod_tipo_importe=tmp.t_cod_tipo_importe OR (tbn1_mi_ds_198_activos_financieros.cod_tipo_importe IS NULL AND tmp.t_cod_tipo_importe IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_ds_198_activos_financieros_unique')
			ALTER INDEX IX_tbn1_mi_ds_198_activos_financieros_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros DISABLE
		END

		INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros WITH(TABLOCK) (id_documento,id_expediente,ejercicio,referencia,secuencia,modelo,nif_declarante_198_11,nif_declarado_198_11,nif_declarante_no_identificado_11,nif_declarado_no_identificado_11,nif_declarante_198,nif_declarado_198,nif_declarante_no_identificado,nif_declarado_no_identificado,es_contribuyente_declarante,es_externo,id_contribuyente_declarante,es_contribuyente_declarado,id_contribuyente_declarado,delegacion_hacienda,cod_administracion,telefono,razon_social,cod_presentador_colectivo,es_identificado_declarante,sw_identificado_declarante,cod_entidad_gestora,cod_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,es_erroneo_declarante,num_declarados_erroneos,hay_observaciones,es_historico,fecha_alta,volumen_operaciones,num_justificante,cod_tipo_declaracion,num_justificante_sustitutiva,contador_revisiones,es_representante,cod_provincia,cod_pais,num_perceptores,nro_orden,cod_tipo_codigo,banco,sucursal,num_cuenta,fecha_operacion,mes_operacion,anyo_operacion,cod_clave_identificacion_fondo,emisor,cod_clave_origen,cod_clave_operacion_198,cod_clave_mercado,id_clave_representacion,cod_clave_valor,num_activos,porc_participacion,cod_clave_declarado,cod_relacion,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado,fecha_vcto_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo,cod_tipo_importe,importe,id_mae_no_id_declarado,id_mae_no_id_declarante,fecha_carga)
		SELECT
			id_documento,
			id_expediente,
			ejercicio,
			referencia,
			secuencia,
			modelo,
			nif_declarante_198_11,
			nif_declarado_198_11,
			nif_declarante_no_identificado_11,
			nif_declarado_no_identificado_11,
			nif_declarante_198,
			nif_declarado_198,
			nif_declarante_no_identificado,
			nif_declarado_no_identificado,
			es_contribuyente_declarante,
			es_externo,
			id_contribuyente_declarante,
			es_contribuyente_declarado,
			id_contribuyente_declarado,
			delegacion_hacienda,
			cod_administracion,
			telefono,
			razon_social,
			cod_presentador_colectivo,
			es_identificado_declarante,
			sw_identificado_declarante,
			cod_entidad_gestora,
			cod_tipo_presentacion,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			num_caja,
			es_erroneo_declarante,
			num_declarados_erroneos,
			hay_observaciones,
			es_historico,
			fecha_alta,
			volumen_operaciones,
			num_justificante,
			cod_tipo_declaracion,
			num_justificante_sustitutiva,
			contador_revisiones,
			es_representante,
			cod_provincia,
			cod_pais,
			num_perceptores,
			nro_orden,
			cod_tipo_codigo,
			banco,
			sucursal,
			num_cuenta,
			fecha_operacion,
			mes_operacion,
			anyo_operacion,
			cod_clave_identificacion_fondo,
			emisor,
			cod_clave_origen,
			cod_clave_operacion_198,
			cod_clave_mercado,
			id_clave_representacion,
			cod_clave_valor,
			num_activos,
			porc_participacion,
			cod_clave_declarado,
			cod_relacion,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_erroneo_declarado,
			fecha_vcto_prestamo,
			mes_vencimiento_prestamo,
			anyo_vencimiento_prestamo,
			cod_tipo_importe,
			importe,
			id_mae_no_id_declarado,
			id_mae_no_id_declarante,
			fecha_carga
			FROM #tmp_mi_ds_198_activos_financieros
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_ds_198_activos_financieros_unique')
			ALTER INDEX IX_tbn1_mi_ds_198_activos_financieros_unique ON dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros REBUILD
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
