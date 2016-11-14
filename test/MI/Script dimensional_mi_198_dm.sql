PRINT 'Script dimensional_mi_198_dm.sql'
GO


SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int,
	id_expediente int,
	CONSTRAINT PK_tbn1_mi_198_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_documentos'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_documentos')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos ADD id_expediente int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_documentos'
	AND column_name NOT IN ('id_dim_documentos', 'id_documento', 'id_expediente')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos ALTER COLUMN id_documento int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos ALTER COLUMN id_expediente int NOT NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_documentos_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos (id_documento)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_documentos_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos (id_expediente)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_documentos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos (id_documento,id_expediente) INCLUDE (id_dim_documentos)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos ADD CONSTRAINT FK_tbn1_mi_198_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos ADD CONSTRAINT FK_tbn1_mi_198_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	ejercicio smallint,
	fecha_presentacion date,
	mes_presentacion int,
	anyo_presentacion int,
	fecha_operacion date,
	mes_operacion int,
	anyo_operacion int,
	fecha_vcto_prestamo date,
	mes_vencimiento_prestamo int,
	anyo_vencimiento_prestamo int,
	fecha_carga date,
	CONSTRAINT PK_tbn1_mi_198_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_periodos'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_periodos')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='fecha_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD fecha_operacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='mes_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD mes_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='anyo_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD anyo_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='fecha_vcto_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD fecha_vcto_prestamo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='mes_vencimiento_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD mes_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='anyo_vencimiento_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD anyo_vencimiento_prestamo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_periodos' AND COLUMN_NAME='fecha_carga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ADD fecha_carga date
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_periodos'
	AND column_name NOT IN ('id_dim_periodos', 'ejercicio', 'fecha_presentacion', 'mes_presentacion', 'anyo_presentacion', 'fecha_operacion', 'mes_operacion', 'anyo_operacion', 'fecha_vcto_prestamo', 'mes_vencimiento_prestamo', 'anyo_vencimiento_prestamo', 'fecha_carga')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN ejercicio smallint NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN fecha_presentacion date NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN mes_presentacion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN anyo_presentacion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN fecha_operacion date NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN mes_operacion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN anyo_operacion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN fecha_vcto_prestamo date NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN mes_vencimiento_prestamo int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN anyo_vencimiento_prestamo int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos ALTER COLUMN fecha_carga date NOT NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_periodos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_operacion,mes_operacion,anyo_operacion,fecha_vcto_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo,fecha_carga) INCLUDE (id_dim_periodos)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	secuencia varchar(11),
	nif_declarado_198 varchar(12),
	nif_declarado_no_identificado varchar(12),
	id_contribuyente_declarado int,
	num_perceptores decimal(3, 0),
	nro_orden decimal(7, 0),
	banco varchar(4),
	sucursal varchar(4),
	num_cuenta varchar(12),
	emisor varchar(12),
	cod_relacion decimal(7, 0),
	id_mae_no_id_declarado int,
	CONSTRAINT PK_tbn1_mi_198_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_declarados'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_declarados')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD secuencia varchar(11)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='nif_declarado_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD nif_declarado_198 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='nif_declarado_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD nif_declarado_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='num_perceptores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD num_perceptores decimal(3, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='nro_orden')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD nro_orden decimal(7, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD banco varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD sucursal varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD num_cuenta varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='emisor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD emisor varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='cod_relacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD cod_relacion decimal(7, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD id_mae_no_id_declarado int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_declarados'
	AND column_name NOT IN ('id_dim_declarados', 'secuencia', 'nif_declarado_198', 'nif_declarado_no_identificado', 'id_contribuyente_declarado', 'num_perceptores', 'nro_orden', 'banco', 'sucursal', 'num_cuenta', 'emisor', 'cod_relacion', 'id_mae_no_id_declarado')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN secuencia varchar(11) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN nif_declarado_198 varchar(12) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN nif_declarado_no_identificado varchar(12) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN id_contribuyente_declarado int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN num_perceptores decimal(3, 0) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN nro_orden decimal(7, 0) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN banco varchar(4) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN sucursal varchar(4) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN num_cuenta varchar(12) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN emisor varchar(12) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN cod_relacion decimal(7, 0) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NOT NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_declarados_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados (id_contribuyente_declarado)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_declarados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados (secuencia,nif_declarado_198,nif_declarado_no_identificado,id_contribuyente_declarado,num_perceptores,nro_orden,banco,sucursal,num_cuenta,emisor,cod_relacion,id_mae_no_id_declarado) INCLUDE (id_dim_declarados)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados ADD CONSTRAINT FK_tbn1_mi_198_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo varchar(3),
	delegacion_hacienda varchar(2),
	cod_administracion varchar(3),
	cod_tipo_presentacion varchar(1),
	cod_tipo_declaracion varchar(1),
	id_administracion int,
	id_tipo_presentacion int,
	id_tipo_declaracion int,
	CONSTRAINT PK_tbn1_mi_198_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_datos_caratula'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_datos_caratula')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD delegacion_hacienda varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='cod_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD cod_administracion varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD cod_tipo_presentacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='cod_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD cod_tipo_declaracion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD id_administracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD id_tipo_declaracion int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_datos_caratula'
	AND column_name NOT IN ('id_dim_datos_caratula', 'modelo', 'delegacion_hacienda', 'cod_administracion', 'cod_tipo_presentacion', 'cod_tipo_declaracion', 'id_administracion', 'id_tipo_presentacion', 'id_tipo_declaracion')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN modelo varchar(3) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN cod_administracion varchar(3) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN cod_tipo_declaracion varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN id_administracion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NOT NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_caratula_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula (id_administracion)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_caratula_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula (id_tipo_presentacion)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_caratula_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula (id_tipo_declaracion)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_caratula_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula (modelo,delegacion_hacienda,id_administracion,id_tipo_presentacion,id_tipo_declaracion) INCLUDE (id_dim_datos_caratula)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	nif_declarante_198 varchar(12),
	nif_declarante_no_identificado varchar(12),
	id_contribuyente_declarante int,
	telefono varchar(10),
	razon_social varchar(40),
	cod_presentador_colectivo int,
	cod_entidad_gestora varchar(4),
	id_mae_no_id_declarante int,
	CONSTRAINT PK_tbn1_mi_198_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_declarantes'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_declarantes')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='nif_declarante_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD nif_declarante_198 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='nif_declarante_no_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD nif_declarante_no_identificado varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD cod_entidad_gestora varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD id_mae_no_id_declarante int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_declarantes'
	AND column_name NOT IN ('id_dim_declarantes', 'nif_declarante_198', 'nif_declarante_no_identificado', 'id_contribuyente_declarante', 'telefono', 'razon_social', 'cod_presentador_colectivo', 'cod_entidad_gestora', 'id_mae_no_id_declarante')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN nif_declarante_198 varchar(12) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN nif_declarante_no_identificado varchar(12) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN telefono varchar(10) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN razon_social varchar(40) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN cod_presentador_colectivo int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NOT NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_declarantes_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes (id_contribuyente_declarante)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_declarantes_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes (nif_declarante_198,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo,cod_entidad_gestora,id_mae_no_id_declarante) INCLUDE (id_dim_declarantes)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_198_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_contribuyente_declarante bit,
	es_externo bit,
	es_contribuyente_declarado bit,
	es_identificado_declarante bit,
	sw_identificado_declarante varchar(1),
	es_erroneo_declarante bit,
	es_historico bit,
	es_representante varchar(1),
	es_identificado_declarado bit,
	sw_identificado_declarado varchar(1),
	es_erroneo_declarado bit,
	CONSTRAINT PK_tbn1_mi_198_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_marcas'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_marcas')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_contribuyente_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_externo bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_contribuyente_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='sw_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD sw_identificado_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_erroneo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_erroneo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_historico bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_representante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='sw_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD sw_identificado_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_marcas' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ADD es_erroneo_declarado bit
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_marcas'
	AND column_name NOT IN ('id_dim_marcas', 'es_contribuyente_declarante', 'es_externo', 'es_contribuyente_declarado', 'es_identificado_declarante', 'sw_identificado_declarante', 'es_erroneo_declarante', 'es_historico', 'es_representante', 'es_identificado_declarado', 'sw_identificado_declarado', 'es_erroneo_declarado')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_contribuyente_declarante bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_externo bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_contribuyente_declarado bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_identificado_declarante bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN sw_identificado_declarante varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_erroneo_declarante bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_historico bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_representante varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_identificado_declarado bit NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN sw_identificado_declarado varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas ALTER COLUMN es_erroneo_declarado bit NOT NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_marcas_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas (es_contribuyente_declarante,es_externo,es_contribuyente_declarado,es_identificado_declarante,sw_identificado_declarante,es_erroneo_declarante,es_historico,es_representante,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado) INCLUDE (id_dim_marcas)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	id_clave_representacion int,
	cod_provincia varchar(2),
	cod_pais varchar(3),
	cod_tipo_codigo varchar(1),
	cod_clave_identificacion_fondo varchar(1),
	cod_clave_origen varchar(1),
	cod_clave_operacion_198 varchar(1),
	cod_clave_mercado varchar(1),
	cod_clave_valor varchar(1),
	cod_clave_declarado varchar(1),
	cod_tipo_importe varchar(2),
	id_provincia int,
	id_pais int,
	id_tipo_codigo int,
	id_clave_identificacion_fondo int,
	id_clave_origen int,
	id_clave_operacion_198 int,
	id_clave_mercado int,
	id_clave_valor int,
	id_clave_declarado int,
	id_tipo_importe int,
	CONSTRAINT PK_tbn1_mi_198_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_datos_detalle'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_dim_datos_detalle')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_representacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_provincia varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_pais varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_tipo_codigo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_clave_identificacion_fondo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_clave_origen varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_clave_operacion_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_clave_operacion_198 varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_clave_mercado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_clave_mercado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_clave_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_clave_valor varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_clave_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD cod_tipo_importe varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_provincia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_tipo_codigo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_identificacion_fondo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_origen int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_operacion_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_operacion_198 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_mercado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_mercado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_valor int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_clave_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_dim_datos_detalle' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD id_tipo_importe int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_dim_datos_detalle'
	AND column_name NOT IN ('id_dim_datos_detalle', 'id_clave_representacion', 'cod_provincia', 'cod_pais', 'cod_tipo_codigo', 'cod_clave_identificacion_fondo', 'cod_clave_origen', 'cod_clave_operacion_198', 'cod_clave_mercado', 'cod_clave_valor', 'cod_clave_declarado', 'cod_tipo_importe', 'id_provincia', 'id_pais', 'id_tipo_codigo', 'id_clave_identificacion_fondo', 'id_clave_origen', 'id_clave_operacion_198', 'id_clave_mercado', 'id_clave_valor', 'id_clave_declarado', 'id_tipo_importe')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_representacion int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_provincia varchar(2) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_pais varchar(3) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_tipo_codigo varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_clave_identificacion_fondo varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_clave_origen varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_clave_operacion_198 varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_clave_mercado varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_clave_valor varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_clave_declarado varchar(1) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN cod_tipo_importe varchar(2) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_provincia int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_pais int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_tipo_codigo int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_identificacion_fondo int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_origen int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_operacion_198 int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_mercado int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_valor int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_clave_declarado int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ALTER COLUMN id_tipo_importe int NOT NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_representacion)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_provincia)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_pais)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_tipo_codigo)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_identificacion_fondo)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_origen)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_operacion_198)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_8 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_mercado)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_9 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_valor)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_10 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_declarado)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_11 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_tipo_importe)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_dim_datos_detalle_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle (id_clave_representacion,id_provincia,id_pais,id_tipo_codigo,id_clave_identificacion_fondo,id_clave_origen,id_clave_operacion_198,id_clave_mercado,id_clave_valor,id_clave_declarado,id_tipo_importe) INCLUDE (id_dim_datos_detalle)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_claves_representacion FOREIGN KEY (id_clave_representacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion(id_clave_representacion)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_tipo_codigo FOREIGN KEY (id_tipo_codigo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo(id_tipo_codigo)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_clave_identificacion_fondo FOREIGN KEY (id_clave_identificacion_fondo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo(id_clave_identificacion_fondo)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_clave_origen FOREIGN KEY (id_clave_origen) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen(id_clave_origen)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_clave_operacion_198 FOREIGN KEY (id_clave_operacion_198) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198(id_clave_operacion_198)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_claves_mercado FOREIGN KEY (id_clave_mercado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado(id_clave_mercado)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_clave_valor FOREIGN KEY (id_clave_valor) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor(id_clave_valor)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_clave_declarado FOREIGN KEY (id_clave_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado(id_clave_declarado)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_198_dim_datos_detalle_tbn1_dim_mi_tipo_importe FOREIGN KEY (id_tipo_importe) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe(id_tipo_importe)
GO

--End table create/prepare
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int,
	id_dim_periodos int,
	id_dim_declarados int,
	id_dim_datos_caratula int,
	id_dim_declarantes int,
	id_dim_marcas int,
	id_dim_datos_detalle int,
	volumen_operaciones decimal(18, 2),
	num_activos decimal(15, 2),
	porc_participacion decimal(15, 2),
	importe numeric(18, 2),
	CONSTRAINT PK_tbn1_mi_198_fact PRIMARY KEY CLUSTERED (id)
)
GO


--Drop all Constraints
DECLARE @constraint nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT constraint_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_fact'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DROP CONSTRAINT ' + @constraint
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @constraint
	END
END
GO
--Drop all index


USE dbn1_dmr_dhyf
GO
DECLARE @ncindex nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT name FROM dbn1_dmr_dhyf.dbo.SYSINDEXES
	WHERE id = OBJECT_ID('tbn1_mi_198_fact')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD volumen_operaciones decimal(18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='num_activos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD num_activos decimal(15, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='porc_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD porc_participacion decimal(15, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_198_fact' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD importe numeric(18, 2)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_198_fact'
	AND column_name NOT IN ('id', 'id_dim_documentos', 'id_dim_periodos', 'id_dim_declarados', 'id_dim_datos_caratula', 'id_dim_declarantes', 'id_dim_marcas', 'id_dim_datos_detalle', 'volumen_operaciones', 'num_activos', 'porc_participacion', 'importe')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN volumen_operaciones decimal(18, 2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN num_activos decimal(15, 2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN porc_participacion decimal(15, 2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ALTER COLUMN importe numeric(18, 2) NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_documentos)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_periodos)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_declarados)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_datos_caratula)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_declarantes)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_marcas)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_datos_detalle)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_198_fact_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact (id_dim_documentos,id_dim_periodos,id_dim_declarados,id_dim_datos_caratula,id_dim_declarantes,id_dim_marcas,id_dim_datos_detalle) INCLUDE (id)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos(id_dim_documentos)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos(id_dim_periodos)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados(id_dim_declarados)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula(id_dim_datos_caratula)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes(id_dim_declarantes)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas(id_dim_marcas)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact ADD CONSTRAINT FK_tbn1_mi_198_fact_tbn1_mi_198_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle(id_dim_datos_detalle)
GO

--End table create/prepare


USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_documentos'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_documentos') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_documentos
		CREATE table #tmp_mi_198_dim_documentos(
			rr_mode varchar(1),
			id_dim_documentos int,
			t_id_documento int,
			t_id_expediente int,
			id_documento int,
			id_expediente int
		);

		;WITH
		query AS (
	SELECT
		st.id_documento AS id_documento,
		st.id_expediente AS id_expediente
	FROM (SELECT
		id_documento,
		id_expediente
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		id_documento,
		id_expediente
	) st

	GROUP BY
		st.id_documento,
		st.id_expediente
		)
		INSERT INTO #tmp_mi_198_dim_documentos (rr_mode,id_dim_documentos,t_id_documento,t_id_expediente,id_documento,id_expediente)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_documentos IS NULL THEN 'I'
					WHEN (query.id_documento IS NULL AND t.id_documento IS NOT NULL) AND (query.id_expediente IS NULL AND t.id_expediente IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_documentos AS id_dim_documentos,
			t.id_documento AS t_id_documento,
			t.id_expediente AS t_id_expediente,
			query.id_documento AS id_documento,
			query.id_expediente AS id_expediente
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos AS t
		FULL JOIN query on ((query.id_documento=t.id_documento OR (query.id_documento IS NULL AND t.id_documento IS NULL)) AND (query.id_expediente=t.id_expediente OR (query.id_expediente IS NULL AND t.id_expediente IS NULL)))
		WHERE 
			id_dim_documentos IS NULL OR
			((query.id_documento IS NULL AND t.id_documento IS NOT NULL) AND (query.id_expediente IS NULL AND t.id_expediente IS NOT NULL)) OR
			(t.id_documento<>query.id_documento OR (t.id_documento IS NULL AND query.id_documento IS NOT NULL)
                                                  OR (t.id_documento IS NOT NULL AND query.id_documento IS NULL)
				OR t.id_expediente<>query.id_expediente OR (t.id_expediente IS NULL AND query.id_expediente IS NOT NULL)
                                                  OR (t.id_expediente IS NOT NULL AND query.id_expediente IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_documentos
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_documentos where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_documentos_1')
			ALTER INDEX IX_tbn1_mi_198_dim_documentos_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_documentos_2')
			ALTER INDEX IX_tbn1_mi_198_dim_documentos_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos
			SET
				id_documento=s.id_documento,
				id_expediente=s.id_expediente
		FROM (
			SELECT
				id_documento,
				id_expediente
			FROM #tmp_mi_198_dim_documentos
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos.id_documento=s.id_documento OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos.id_documento IS NULL AND s.id_documento IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos.id_expediente=s.id_expediente OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos.id_expediente IS NULL AND s.id_expediente IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos AS tbn1_mi_198_dim_documentos
		INNER JOIN #tmp_mi_198_dim_documentos AS tmp
		ON ((tbn1_mi_198_dim_documentos.id_documento=tmp.t_id_documento OR (tbn1_mi_198_dim_documentos.id_documento IS NULL AND tmp.t_id_documento IS NULL)) AND (tbn1_mi_198_dim_documentos.id_expediente=tmp.t_id_expediente OR (tbn1_mi_198_dim_documentos.id_expediente IS NULL AND tmp.t_id_expediente IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_documentos_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_documentos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos WITH(TABLOCK) (id_documento,id_expediente)
		SELECT
			id_documento,
			id_expediente
			FROM #tmp_mi_198_dim_documentos
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_documentos_1')
			ALTER INDEX IX_tbn1_mi_198_dim_documentos_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_documentos_2')
			ALTER INDEX IX_tbn1_mi_198_dim_documentos_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_documentos_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_documentos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos REBUILD
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



USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_periodos'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_periodos') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_periodos
		CREATE table #tmp_mi_198_dim_periodos(
			rr_mode varchar(1),
			id_dim_periodos int,
			t_ejercicio smallint,
			t_fecha_presentacion date,
			t_mes_presentacion int,
			t_anyo_presentacion int,
			t_fecha_operacion date,
			t_mes_operacion int,
			t_anyo_operacion int,
			t_fecha_vcto_prestamo date,
			t_mes_vencimiento_prestamo int,
			t_anyo_vencimiento_prestamo int,
			t_fecha_carga date,
			ejercicio smallint,
			fecha_presentacion date,
			mes_presentacion int,
			anyo_presentacion int,
			fecha_operacion date,
			mes_operacion int,
			anyo_operacion int,
			fecha_vcto_prestamo date,
			mes_vencimiento_prestamo int,
			anyo_vencimiento_prestamo int,
			fecha_carga date
		);

		;WITH
		query AS (
	SELECT
		st.ejercicio AS ejercicio,
		st.fecha_presentacion AS fecha_presentacion,
		st.mes_presentacion AS mes_presentacion,
		st.anyo_presentacion AS anyo_presentacion,
		st.fecha_operacion AS fecha_operacion,
		st.mes_operacion AS mes_operacion,
		st.anyo_operacion AS anyo_operacion,
		st.fecha_vcto_prestamo AS fecha_vcto_prestamo,
		st.mes_vencimiento_prestamo AS mes_vencimiento_prestamo,
		st.anyo_vencimiento_prestamo AS anyo_vencimiento_prestamo,
		st.fecha_carga AS fecha_carga
	FROM (SELECT
		ejercicio,
		fecha_presentacion,
		mes_presentacion,
		anyo_presentacion,
		fecha_operacion,
		mes_operacion,
		anyo_operacion,
		fecha_vcto_prestamo,
		mes_vencimiento_prestamo,
		anyo_vencimiento_prestamo,
		fecha_carga
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		ejercicio,
		fecha_presentacion,
		mes_presentacion,
		anyo_presentacion,
		fecha_operacion,
		mes_operacion,
		anyo_operacion,
		fecha_vcto_prestamo,
		mes_vencimiento_prestamo,
		anyo_vencimiento_prestamo,
		fecha_carga
	) st

	GROUP BY
		st.ejercicio,
		st.fecha_presentacion,
		st.mes_presentacion,
		st.anyo_presentacion,
		st.fecha_operacion,
		st.mes_operacion,
		st.anyo_operacion,
		st.fecha_vcto_prestamo,
		st.mes_vencimiento_prestamo,
		st.anyo_vencimiento_prestamo,
		st.fecha_carga
		)
		INSERT INTO #tmp_mi_198_dim_periodos (rr_mode,id_dim_periodos,t_ejercicio,t_fecha_presentacion,t_mes_presentacion,t_anyo_presentacion,t_fecha_operacion,t_mes_operacion,t_anyo_operacion,t_fecha_vcto_prestamo,t_mes_vencimiento_prestamo,t_anyo_vencimiento_prestamo,t_fecha_carga,ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_operacion,mes_operacion,anyo_operacion,fecha_vcto_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo,fecha_carga)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_periodos IS NULL THEN 'I'
					WHEN (query.ejercicio IS NULL AND t.ejercicio IS NOT NULL) AND (query.fecha_presentacion IS NULL AND t.fecha_presentacion IS NOT NULL) AND (query.mes_presentacion IS NULL AND t.mes_presentacion IS NOT NULL) AND (query.anyo_presentacion IS NULL AND t.anyo_presentacion IS NOT NULL) AND (query.fecha_operacion IS NULL AND t.fecha_operacion IS NOT NULL) AND (query.mes_operacion IS NULL AND t.mes_operacion IS NOT NULL) AND (query.anyo_operacion IS NULL AND t.anyo_operacion IS NOT NULL) AND (query.fecha_vcto_prestamo IS NULL AND t.fecha_vcto_prestamo IS NOT NULL) AND (query.mes_vencimiento_prestamo IS NULL AND t.mes_vencimiento_prestamo IS NOT NULL) AND (query.anyo_vencimiento_prestamo IS NULL AND t.anyo_vencimiento_prestamo IS NOT NULL) AND (query.fecha_carga IS NULL AND t.fecha_carga IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_periodos AS id_dim_periodos,
			t.ejercicio AS t_ejercicio,
			t.fecha_presentacion AS t_fecha_presentacion,
			t.mes_presentacion AS t_mes_presentacion,
			t.anyo_presentacion AS t_anyo_presentacion,
			t.fecha_operacion AS t_fecha_operacion,
			t.mes_operacion AS t_mes_operacion,
			t.anyo_operacion AS t_anyo_operacion,
			t.fecha_vcto_prestamo AS t_fecha_vcto_prestamo,
			t.mes_vencimiento_prestamo AS t_mes_vencimiento_prestamo,
			t.anyo_vencimiento_prestamo AS t_anyo_vencimiento_prestamo,
			t.fecha_carga AS t_fecha_carga,
			query.ejercicio AS ejercicio,
			query.fecha_presentacion AS fecha_presentacion,
			query.mes_presentacion AS mes_presentacion,
			query.anyo_presentacion AS anyo_presentacion,
			query.fecha_operacion AS fecha_operacion,
			query.mes_operacion AS mes_operacion,
			query.anyo_operacion AS anyo_operacion,
			query.fecha_vcto_prestamo AS fecha_vcto_prestamo,
			query.mes_vencimiento_prestamo AS mes_vencimiento_prestamo,
			query.anyo_vencimiento_prestamo AS anyo_vencimiento_prestamo,
			query.fecha_carga AS fecha_carga
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos AS t
		FULL JOIN query on ((query.ejercicio=t.ejercicio OR (query.ejercicio IS NULL AND t.ejercicio IS NULL)) AND (query.fecha_presentacion=t.fecha_presentacion OR (query.fecha_presentacion IS NULL AND t.fecha_presentacion IS NULL)) AND (query.mes_presentacion=t.mes_presentacion OR (query.mes_presentacion IS NULL AND t.mes_presentacion IS NULL)) AND (query.anyo_presentacion=t.anyo_presentacion OR (query.anyo_presentacion IS NULL AND t.anyo_presentacion IS NULL)) AND (query.fecha_operacion=t.fecha_operacion OR (query.fecha_operacion IS NULL AND t.fecha_operacion IS NULL)) AND (query.mes_operacion=t.mes_operacion OR (query.mes_operacion IS NULL AND t.mes_operacion IS NULL)) AND (query.anyo_operacion=t.anyo_operacion OR (query.anyo_operacion IS NULL AND t.anyo_operacion IS NULL)) AND (query.fecha_vcto_prestamo=t.fecha_vcto_prestamo OR (query.fecha_vcto_prestamo IS NULL AND t.fecha_vcto_prestamo IS NULL)) AND (query.mes_vencimiento_prestamo=t.mes_vencimiento_prestamo OR (query.mes_vencimiento_prestamo IS NULL AND t.mes_vencimiento_prestamo IS NULL)) AND (query.anyo_vencimiento_prestamo=t.anyo_vencimiento_prestamo OR (query.anyo_vencimiento_prestamo IS NULL AND t.anyo_vencimiento_prestamo IS NULL)) AND (query.fecha_carga=t.fecha_carga OR (query.fecha_carga IS NULL AND t.fecha_carga IS NULL)))
		WHERE 
			id_dim_periodos IS NULL OR
			((query.ejercicio IS NULL AND t.ejercicio IS NOT NULL) AND (query.fecha_presentacion IS NULL AND t.fecha_presentacion IS NOT NULL) AND (query.mes_presentacion IS NULL AND t.mes_presentacion IS NOT NULL) AND (query.anyo_presentacion IS NULL AND t.anyo_presentacion IS NOT NULL) AND (query.fecha_operacion IS NULL AND t.fecha_operacion IS NOT NULL) AND (query.mes_operacion IS NULL AND t.mes_operacion IS NOT NULL) AND (query.anyo_operacion IS NULL AND t.anyo_operacion IS NOT NULL) AND (query.fecha_vcto_prestamo IS NULL AND t.fecha_vcto_prestamo IS NOT NULL) AND (query.mes_vencimiento_prestamo IS NULL AND t.mes_vencimiento_prestamo IS NOT NULL) AND (query.anyo_vencimiento_prestamo IS NULL AND t.anyo_vencimiento_prestamo IS NOT NULL) AND (query.fecha_carga IS NULL AND t.fecha_carga IS NOT NULL)) OR
			(t.ejercicio<>query.ejercicio OR (t.ejercicio IS NULL AND query.ejercicio IS NOT NULL)
                                                  OR (t.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
				OR t.fecha_presentacion<>query.fecha_presentacion OR (t.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL)
                                                  OR (t.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
				OR t.mes_presentacion<>query.mes_presentacion OR (t.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL)
                                                  OR (t.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
				OR t.anyo_presentacion<>query.anyo_presentacion OR (t.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL)
                                                  OR (t.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
				OR t.fecha_operacion<>query.fecha_operacion OR (t.fecha_operacion IS NULL AND query.fecha_operacion IS NOT NULL)
                                                  OR (t.fecha_operacion IS NOT NULL AND query.fecha_operacion IS NULL)
				OR t.mes_operacion<>query.mes_operacion OR (t.mes_operacion IS NULL AND query.mes_operacion IS NOT NULL)
                                                  OR (t.mes_operacion IS NOT NULL AND query.mes_operacion IS NULL)
				OR t.anyo_operacion<>query.anyo_operacion OR (t.anyo_operacion IS NULL AND query.anyo_operacion IS NOT NULL)
                                                  OR (t.anyo_operacion IS NOT NULL AND query.anyo_operacion IS NULL)
				OR t.fecha_vcto_prestamo<>query.fecha_vcto_prestamo OR (t.fecha_vcto_prestamo IS NULL AND query.fecha_vcto_prestamo IS NOT NULL)
                                                  OR (t.fecha_vcto_prestamo IS NOT NULL AND query.fecha_vcto_prestamo IS NULL)
				OR t.mes_vencimiento_prestamo<>query.mes_vencimiento_prestamo OR (t.mes_vencimiento_prestamo IS NULL AND query.mes_vencimiento_prestamo IS NOT NULL)
                                                  OR (t.mes_vencimiento_prestamo IS NOT NULL AND query.mes_vencimiento_prestamo IS NULL)
				OR t.anyo_vencimiento_prestamo<>query.anyo_vencimiento_prestamo OR (t.anyo_vencimiento_prestamo IS NULL AND query.anyo_vencimiento_prestamo IS NOT NULL)
                                                  OR (t.anyo_vencimiento_prestamo IS NOT NULL AND query.anyo_vencimiento_prestamo IS NULL)
				OR t.fecha_carga<>query.fecha_carga OR (t.fecha_carga IS NULL AND query.fecha_carga IS NOT NULL)
                                                  OR (t.fecha_carga IS NOT NULL AND query.fecha_carga IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_periodos
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_periodos where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos
			SET
				ejercicio=s.ejercicio,
				fecha_presentacion=s.fecha_presentacion,
				mes_presentacion=s.mes_presentacion,
				anyo_presentacion=s.anyo_presentacion,
				fecha_operacion=s.fecha_operacion,
				mes_operacion=s.mes_operacion,
				anyo_operacion=s.anyo_operacion,
				fecha_vcto_prestamo=s.fecha_vcto_prestamo,
				mes_vencimiento_prestamo=s.mes_vencimiento_prestamo,
				anyo_vencimiento_prestamo=s.anyo_vencimiento_prestamo,
				fecha_carga=s.fecha_carga
		FROM (
			SELECT
				ejercicio,
				fecha_presentacion,
				mes_presentacion,
				anyo_presentacion,
				fecha_operacion,
				mes_operacion,
				anyo_operacion,
				fecha_vcto_prestamo,
				mes_vencimiento_prestamo,
				anyo_vencimiento_prestamo,
				fecha_carga
			FROM #tmp_mi_198_dim_periodos
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.ejercicio=s.ejercicio OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.ejercicio IS NULL AND s.ejercicio IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_presentacion=s.fecha_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_presentacion IS NULL AND s.fecha_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.mes_presentacion=s.mes_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.mes_presentacion IS NULL AND s.mes_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.anyo_presentacion=s.anyo_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.anyo_presentacion IS NULL AND s.anyo_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_operacion=s.fecha_operacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_operacion IS NULL AND s.fecha_operacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.mes_operacion=s.mes_operacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.mes_operacion IS NULL AND s.mes_operacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.anyo_operacion=s.anyo_operacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.anyo_operacion IS NULL AND s.anyo_operacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_vcto_prestamo=s.fecha_vcto_prestamo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_vcto_prestamo IS NULL AND s.fecha_vcto_prestamo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.mes_vencimiento_prestamo=s.mes_vencimiento_prestamo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.mes_vencimiento_prestamo IS NULL AND s.mes_vencimiento_prestamo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.anyo_vencimiento_prestamo=s.anyo_vencimiento_prestamo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.anyo_vencimiento_prestamo IS NULL AND s.anyo_vencimiento_prestamo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_carga=s.fecha_carga OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos.fecha_carga IS NULL AND s.fecha_carga IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos AS tbn1_mi_198_dim_periodos
		INNER JOIN #tmp_mi_198_dim_periodos AS tmp
		ON ((tbn1_mi_198_dim_periodos.ejercicio=tmp.t_ejercicio OR (tbn1_mi_198_dim_periodos.ejercicio IS NULL AND tmp.t_ejercicio IS NULL)) AND (tbn1_mi_198_dim_periodos.fecha_presentacion=tmp.t_fecha_presentacion OR (tbn1_mi_198_dim_periodos.fecha_presentacion IS NULL AND tmp.t_fecha_presentacion IS NULL)) AND (tbn1_mi_198_dim_periodos.mes_presentacion=tmp.t_mes_presentacion OR (tbn1_mi_198_dim_periodos.mes_presentacion IS NULL AND tmp.t_mes_presentacion IS NULL)) AND (tbn1_mi_198_dim_periodos.anyo_presentacion=tmp.t_anyo_presentacion OR (tbn1_mi_198_dim_periodos.anyo_presentacion IS NULL AND tmp.t_anyo_presentacion IS NULL)) AND (tbn1_mi_198_dim_periodos.fecha_operacion=tmp.t_fecha_operacion OR (tbn1_mi_198_dim_periodos.fecha_operacion IS NULL AND tmp.t_fecha_operacion IS NULL)) AND (tbn1_mi_198_dim_periodos.mes_operacion=tmp.t_mes_operacion OR (tbn1_mi_198_dim_periodos.mes_operacion IS NULL AND tmp.t_mes_operacion IS NULL)) AND (tbn1_mi_198_dim_periodos.anyo_operacion=tmp.t_anyo_operacion OR (tbn1_mi_198_dim_periodos.anyo_operacion IS NULL AND tmp.t_anyo_operacion IS NULL)) AND (tbn1_mi_198_dim_periodos.fecha_vcto_prestamo=tmp.t_fecha_vcto_prestamo OR (tbn1_mi_198_dim_periodos.fecha_vcto_prestamo IS NULL AND tmp.t_fecha_vcto_prestamo IS NULL)) AND (tbn1_mi_198_dim_periodos.mes_vencimiento_prestamo=tmp.t_mes_vencimiento_prestamo OR (tbn1_mi_198_dim_periodos.mes_vencimiento_prestamo IS NULL AND tmp.t_mes_vencimiento_prestamo IS NULL)) AND (tbn1_mi_198_dim_periodos.anyo_vencimiento_prestamo=tmp.t_anyo_vencimiento_prestamo OR (tbn1_mi_198_dim_periodos.anyo_vencimiento_prestamo IS NULL AND tmp.t_anyo_vencimiento_prestamo IS NULL)) AND (tbn1_mi_198_dim_periodos.fecha_carga=tmp.t_fecha_carga OR (tbn1_mi_198_dim_periodos.fecha_carga IS NULL AND tmp.t_fecha_carga IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_periodos_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_periodos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos WITH(TABLOCK) (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_operacion,mes_operacion,anyo_operacion,fecha_vcto_prestamo,mes_vencimiento_prestamo,anyo_vencimiento_prestamo,fecha_carga)
		SELECT
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_operacion,
			mes_operacion,
			anyo_operacion,
			fecha_vcto_prestamo,
			mes_vencimiento_prestamo,
			anyo_vencimiento_prestamo,
			fecha_carga
			FROM #tmp_mi_198_dim_periodos
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_periodos_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_periodos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos REBUILD
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



USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_declarados'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_declarados') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_declarados
		CREATE table #tmp_mi_198_dim_declarados(
			rr_mode varchar(1),
			id_dim_declarados int,
			t_secuencia varchar(11),
			t_nif_declarado_198 varchar(12),
			t_nif_declarado_no_identificado varchar(12),
			t_id_contribuyente_declarado int,
			t_num_perceptores decimal(3, 0),
			t_nro_orden decimal(7, 0),
			t_banco varchar(4),
			t_sucursal varchar(4),
			t_num_cuenta varchar(12),
			t_emisor varchar(12),
			t_cod_relacion decimal(7, 0),
			t_id_mae_no_id_declarado int,
			secuencia varchar(11),
			nif_declarado_198 varchar(12),
			nif_declarado_no_identificado varchar(12),
			id_contribuyente_declarado int,
			num_perceptores decimal(3, 0),
			nro_orden decimal(7, 0),
			banco varchar(4),
			sucursal varchar(4),
			num_cuenta varchar(12),
			emisor varchar(12),
			cod_relacion decimal(7, 0),
			id_mae_no_id_declarado int
		);

		;WITH
		query AS (
	SELECT
		st.secuencia AS secuencia,
		st.nif_declarado_198 AS nif_declarado_198,
		st.nif_declarado_no_identificado AS nif_declarado_no_identificado,
		st.id_contribuyente_declarado AS id_contribuyente_declarado,
		st.num_perceptores AS num_perceptores,
		st.nro_orden AS nro_orden,
		st.banco AS banco,
		st.sucursal AS sucursal,
		st.num_cuenta AS num_cuenta,
		st.emisor AS emisor,
		st.cod_relacion AS cod_relacion,
		st.id_mae_no_id_declarado AS id_mae_no_id_declarado
	FROM (SELECT
		secuencia,
		nif_declarado_198,
		nif_declarado_no_identificado,
		id_contribuyente_declarado,
		num_perceptores,
		nro_orden,
		banco,
		sucursal,
		num_cuenta,
		emisor,
		cod_relacion,
		id_mae_no_id_declarado
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		secuencia,
		nif_declarado_198,
		nif_declarado_no_identificado,
		id_contribuyente_declarado,
		num_perceptores,
		nro_orden,
		banco,
		sucursal,
		num_cuenta,
		emisor,
		cod_relacion,
		id_mae_no_id_declarado
	) st

	GROUP BY
		st.secuencia,
		st.nif_declarado_198,
		st.nif_declarado_no_identificado,
		st.id_contribuyente_declarado,
		st.num_perceptores,
		st.nro_orden,
		st.banco,
		st.sucursal,
		st.num_cuenta,
		st.emisor,
		st.cod_relacion,
		st.id_mae_no_id_declarado
		)
		INSERT INTO #tmp_mi_198_dim_declarados (rr_mode,id_dim_declarados,t_secuencia,t_nif_declarado_198,t_nif_declarado_no_identificado,t_id_contribuyente_declarado,t_num_perceptores,t_nro_orden,t_banco,t_sucursal,t_num_cuenta,t_emisor,t_cod_relacion,t_id_mae_no_id_declarado,secuencia,nif_declarado_198,nif_declarado_no_identificado,id_contribuyente_declarado,num_perceptores,nro_orden,banco,sucursal,num_cuenta,emisor,cod_relacion,id_mae_no_id_declarado)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_declarados IS NULL THEN 'I'
					WHEN (query.secuencia IS NULL AND t.secuencia IS NOT NULL) AND (query.nif_declarado_198 IS NULL AND t.nif_declarado_198 IS NOT NULL) AND (query.nif_declarado_no_identificado IS NULL AND t.nif_declarado_no_identificado IS NOT NULL) AND (query.id_contribuyente_declarado IS NULL AND t.id_contribuyente_declarado IS NOT NULL) AND (query.num_perceptores IS NULL AND t.num_perceptores IS NOT NULL) AND (query.nro_orden IS NULL AND t.nro_orden IS NOT NULL) AND (query.banco IS NULL AND t.banco IS NOT NULL) AND (query.sucursal IS NULL AND t.sucursal IS NOT NULL) AND (query.num_cuenta IS NULL AND t.num_cuenta IS NOT NULL) AND (query.emisor IS NULL AND t.emisor IS NOT NULL) AND (query.cod_relacion IS NULL AND t.cod_relacion IS NOT NULL) AND (query.id_mae_no_id_declarado IS NULL AND t.id_mae_no_id_declarado IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_declarados AS id_dim_declarados,
			t.secuencia AS t_secuencia,
			t.nif_declarado_198 AS t_nif_declarado_198,
			t.nif_declarado_no_identificado AS t_nif_declarado_no_identificado,
			t.id_contribuyente_declarado AS t_id_contribuyente_declarado,
			t.num_perceptores AS t_num_perceptores,
			t.nro_orden AS t_nro_orden,
			t.banco AS t_banco,
			t.sucursal AS t_sucursal,
			t.num_cuenta AS t_num_cuenta,
			t.emisor AS t_emisor,
			t.cod_relacion AS t_cod_relacion,
			t.id_mae_no_id_declarado AS t_id_mae_no_id_declarado,
			query.secuencia AS secuencia,
			query.nif_declarado_198 AS nif_declarado_198,
			query.nif_declarado_no_identificado AS nif_declarado_no_identificado,
			query.id_contribuyente_declarado AS id_contribuyente_declarado,
			query.num_perceptores AS num_perceptores,
			query.nro_orden AS nro_orden,
			query.banco AS banco,
			query.sucursal AS sucursal,
			query.num_cuenta AS num_cuenta,
			query.emisor AS emisor,
			query.cod_relacion AS cod_relacion,
			query.id_mae_no_id_declarado AS id_mae_no_id_declarado
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados AS t
		FULL JOIN query on ((query.secuencia=t.secuencia OR (query.secuencia IS NULL AND t.secuencia IS NULL)) AND (query.nif_declarado_198=t.nif_declarado_198 OR (query.nif_declarado_198 IS NULL AND t.nif_declarado_198 IS NULL)) AND (query.nif_declarado_no_identificado=t.nif_declarado_no_identificado OR (query.nif_declarado_no_identificado IS NULL AND t.nif_declarado_no_identificado IS NULL)) AND (query.id_contribuyente_declarado=t.id_contribuyente_declarado OR (query.id_contribuyente_declarado IS NULL AND t.id_contribuyente_declarado IS NULL)) AND (query.num_perceptores=t.num_perceptores OR (query.num_perceptores IS NULL AND t.num_perceptores IS NULL)) AND (query.nro_orden=t.nro_orden OR (query.nro_orden IS NULL AND t.nro_orden IS NULL)) AND (query.banco=t.banco OR (query.banco IS NULL AND t.banco IS NULL)) AND (query.sucursal=t.sucursal OR (query.sucursal IS NULL AND t.sucursal IS NULL)) AND (query.num_cuenta=t.num_cuenta OR (query.num_cuenta IS NULL AND t.num_cuenta IS NULL)) AND (query.emisor=t.emisor OR (query.emisor IS NULL AND t.emisor IS NULL)) AND (query.cod_relacion=t.cod_relacion OR (query.cod_relacion IS NULL AND t.cod_relacion IS NULL)) AND (query.id_mae_no_id_declarado=t.id_mae_no_id_declarado OR (query.id_mae_no_id_declarado IS NULL AND t.id_mae_no_id_declarado IS NULL)))
		WHERE 
			id_dim_declarados IS NULL OR
			((query.secuencia IS NULL AND t.secuencia IS NOT NULL) AND (query.nif_declarado_198 IS NULL AND t.nif_declarado_198 IS NOT NULL) AND (query.nif_declarado_no_identificado IS NULL AND t.nif_declarado_no_identificado IS NOT NULL) AND (query.id_contribuyente_declarado IS NULL AND t.id_contribuyente_declarado IS NOT NULL) AND (query.num_perceptores IS NULL AND t.num_perceptores IS NOT NULL) AND (query.nro_orden IS NULL AND t.nro_orden IS NOT NULL) AND (query.banco IS NULL AND t.banco IS NOT NULL) AND (query.sucursal IS NULL AND t.sucursal IS NOT NULL) AND (query.num_cuenta IS NULL AND t.num_cuenta IS NOT NULL) AND (query.emisor IS NULL AND t.emisor IS NOT NULL) AND (query.cod_relacion IS NULL AND t.cod_relacion IS NOT NULL) AND (query.id_mae_no_id_declarado IS NULL AND t.id_mae_no_id_declarado IS NOT NULL)) OR
			(t.secuencia<>query.secuencia OR (t.secuencia IS NULL AND query.secuencia IS NOT NULL)
                                                  OR (t.secuencia IS NOT NULL AND query.secuencia IS NULL)
				OR t.nif_declarado_198<>query.nif_declarado_198 OR (t.nif_declarado_198 IS NULL AND query.nif_declarado_198 IS NOT NULL)
                                                  OR (t.nif_declarado_198 IS NOT NULL AND query.nif_declarado_198 IS NULL)
				OR t.nif_declarado_no_identificado<>query.nif_declarado_no_identificado OR (t.nif_declarado_no_identificado IS NULL AND query.nif_declarado_no_identificado IS NOT NULL)
                                                  OR (t.nif_declarado_no_identificado IS NOT NULL AND query.nif_declarado_no_identificado IS NULL)
				OR t.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (t.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL)
                                                  OR (t.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
				OR t.num_perceptores<>query.num_perceptores OR (t.num_perceptores IS NULL AND query.num_perceptores IS NOT NULL)
                                                  OR (t.num_perceptores IS NOT NULL AND query.num_perceptores IS NULL)
				OR t.nro_orden<>query.nro_orden OR (t.nro_orden IS NULL AND query.nro_orden IS NOT NULL)
                                                  OR (t.nro_orden IS NOT NULL AND query.nro_orden IS NULL)
				OR t.banco<>query.banco OR (t.banco IS NULL AND query.banco IS NOT NULL)
                                                  OR (t.banco IS NOT NULL AND query.banco IS NULL)
				OR t.sucursal<>query.sucursal OR (t.sucursal IS NULL AND query.sucursal IS NOT NULL)
                                                  OR (t.sucursal IS NOT NULL AND query.sucursal IS NULL)
				OR t.num_cuenta<>query.num_cuenta OR (t.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL)
                                                  OR (t.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
				OR t.emisor<>query.emisor OR (t.emisor IS NULL AND query.emisor IS NOT NULL)
                                                  OR (t.emisor IS NOT NULL AND query.emisor IS NULL)
				OR t.cod_relacion<>query.cod_relacion OR (t.cod_relacion IS NULL AND query.cod_relacion IS NOT NULL)
                                                  OR (t.cod_relacion IS NOT NULL AND query.cod_relacion IS NULL)
				OR t.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (t.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_declarados
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_declarados where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarados_1')
			ALTER INDEX IX_tbn1_mi_198_dim_declarados_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados
			SET
				secuencia=s.secuencia,
				nif_declarado_198=s.nif_declarado_198,
				nif_declarado_no_identificado=s.nif_declarado_no_identificado,
				id_contribuyente_declarado=s.id_contribuyente_declarado,
				num_perceptores=s.num_perceptores,
				nro_orden=s.nro_orden,
				banco=s.banco,
				sucursal=s.sucursal,
				num_cuenta=s.num_cuenta,
				emisor=s.emisor,
				cod_relacion=s.cod_relacion,
				id_mae_no_id_declarado=s.id_mae_no_id_declarado
		FROM (
			SELECT
				secuencia,
				nif_declarado_198,
				nif_declarado_no_identificado,
				id_contribuyente_declarado,
				num_perceptores,
				nro_orden,
				banco,
				sucursal,
				num_cuenta,
				emisor,
				cod_relacion,
				id_mae_no_id_declarado
			FROM #tmp_mi_198_dim_declarados
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.secuencia=s.secuencia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.secuencia IS NULL AND s.secuencia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.nif_declarado_198=s.nif_declarado_198 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.nif_declarado_198 IS NULL AND s.nif_declarado_198 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.nif_declarado_no_identificado=s.nif_declarado_no_identificado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.nif_declarado_no_identificado IS NULL AND s.nif_declarado_no_identificado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.id_contribuyente_declarado=s.id_contribuyente_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.id_contribuyente_declarado IS NULL AND s.id_contribuyente_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.num_perceptores=s.num_perceptores OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.num_perceptores IS NULL AND s.num_perceptores IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.nro_orden=s.nro_orden OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.nro_orden IS NULL AND s.nro_orden IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.banco=s.banco OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.banco IS NULL AND s.banco IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.sucursal=s.sucursal OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.sucursal IS NULL AND s.sucursal IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.num_cuenta=s.num_cuenta OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.num_cuenta IS NULL AND s.num_cuenta IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.emisor=s.emisor OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.emisor IS NULL AND s.emisor IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.cod_relacion=s.cod_relacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.cod_relacion IS NULL AND s.cod_relacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.id_mae_no_id_declarado=s.id_mae_no_id_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados.id_mae_no_id_declarado IS NULL AND s.id_mae_no_id_declarado IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados AS tbn1_mi_198_dim_declarados
		INNER JOIN #tmp_mi_198_dim_declarados AS tmp
		ON ((tbn1_mi_198_dim_declarados.secuencia=tmp.t_secuencia OR (tbn1_mi_198_dim_declarados.secuencia IS NULL AND tmp.t_secuencia IS NULL)) AND (tbn1_mi_198_dim_declarados.nif_declarado_198=tmp.t_nif_declarado_198 OR (tbn1_mi_198_dim_declarados.nif_declarado_198 IS NULL AND tmp.t_nif_declarado_198 IS NULL)) AND (tbn1_mi_198_dim_declarados.nif_declarado_no_identificado=tmp.t_nif_declarado_no_identificado OR (tbn1_mi_198_dim_declarados.nif_declarado_no_identificado IS NULL AND tmp.t_nif_declarado_no_identificado IS NULL)) AND (tbn1_mi_198_dim_declarados.id_contribuyente_declarado=tmp.t_id_contribuyente_declarado OR (tbn1_mi_198_dim_declarados.id_contribuyente_declarado IS NULL AND tmp.t_id_contribuyente_declarado IS NULL)) AND (tbn1_mi_198_dim_declarados.num_perceptores=tmp.t_num_perceptores OR (tbn1_mi_198_dim_declarados.num_perceptores IS NULL AND tmp.t_num_perceptores IS NULL)) AND (tbn1_mi_198_dim_declarados.nro_orden=tmp.t_nro_orden OR (tbn1_mi_198_dim_declarados.nro_orden IS NULL AND tmp.t_nro_orden IS NULL)) AND (tbn1_mi_198_dim_declarados.banco=tmp.t_banco OR (tbn1_mi_198_dim_declarados.banco IS NULL AND tmp.t_banco IS NULL)) AND (tbn1_mi_198_dim_declarados.sucursal=tmp.t_sucursal OR (tbn1_mi_198_dim_declarados.sucursal IS NULL AND tmp.t_sucursal IS NULL)) AND (tbn1_mi_198_dim_declarados.num_cuenta=tmp.t_num_cuenta OR (tbn1_mi_198_dim_declarados.num_cuenta IS NULL AND tmp.t_num_cuenta IS NULL)) AND (tbn1_mi_198_dim_declarados.emisor=tmp.t_emisor OR (tbn1_mi_198_dim_declarados.emisor IS NULL AND tmp.t_emisor IS NULL)) AND (tbn1_mi_198_dim_declarados.cod_relacion=tmp.t_cod_relacion OR (tbn1_mi_198_dim_declarados.cod_relacion IS NULL AND tmp.t_cod_relacion IS NULL)) AND (tbn1_mi_198_dim_declarados.id_mae_no_id_declarado=tmp.t_id_mae_no_id_declarado OR (tbn1_mi_198_dim_declarados.id_mae_no_id_declarado IS NULL AND tmp.t_id_mae_no_id_declarado IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarados_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_declarados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados WITH(TABLOCK) (secuencia,nif_declarado_198,nif_declarado_no_identificado,id_contribuyente_declarado,num_perceptores,nro_orden,banco,sucursal,num_cuenta,emisor,cod_relacion,id_mae_no_id_declarado)
		SELECT
			secuencia,
			nif_declarado_198,
			nif_declarado_no_identificado,
			id_contribuyente_declarado,
			num_perceptores,
			nro_orden,
			banco,
			sucursal,
			num_cuenta,
			emisor,
			cod_relacion,
			id_mae_no_id_declarado
			FROM #tmp_mi_198_dim_declarados
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarados_1')
			ALTER INDEX IX_tbn1_mi_198_dim_declarados_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarados_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_declarados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados REBUILD
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



USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_datos_caratula'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_datos_caratula') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_datos_caratula
		CREATE table #tmp_mi_198_dim_datos_caratula(
			rr_mode varchar(1),
			id_dim_datos_caratula int,
			t_modelo varchar(3),
			t_delegacion_hacienda varchar(2),
			t_cod_administracion varchar(3),
			t_cod_tipo_presentacion varchar(1),
			t_cod_tipo_declaracion varchar(1),
			t_id_administracion int,
			t_id_tipo_presentacion int,
			t_id_tipo_declaracion int,
			modelo varchar(3),
			delegacion_hacienda varchar(2),
			cod_administracion varchar(3),
			cod_tipo_presentacion varchar(1),
			cod_tipo_declaracion varchar(1),
			id_administracion int,
			id_tipo_presentacion int,
			id_tipo_declaracion int
		);

		;WITH
		query AS (
	SELECT
		st.modelo AS modelo,
		st.delegacion_hacienda AS delegacion_hacienda,
		st.cod_administracion AS cod_administracion,
		st.cod_tipo_presentacion AS cod_tipo_presentacion,
		st.cod_tipo_declaracion AS cod_tipo_declaracion,
		tbn1_dim_mi_administracion_hacienda_id_administracion.id_administracion AS id_administracion,
		tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.id_tipo_presentacion AS id_tipo_presentacion,
		tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion
	FROM (SELECT
		modelo,
		delegacion_hacienda,
		cod_administracion,
		cod_tipo_presentacion,
		cod_tipo_declaracion
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		modelo,
		delegacion_hacienda,
		cod_administracion,
		cod_tipo_presentacion,
		cod_tipo_declaracion
	) st
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda AS tbn1_dim_mi_administracion_hacienda_id_administracion ON (tbn1_dim_mi_administracion_hacienda_id_administracion.cod_administracion=st.cod_administracion)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion AS tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion ON (tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.cod_tipo_presentacion=st.cod_tipo_presentacion)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion AS tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion ON (tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.cod_tipo_declaracion=st.cod_tipo_declaracion)
	GROUP BY
		st.modelo,
		st.delegacion_hacienda,
		st.cod_administracion,
		st.cod_tipo_presentacion,
		st.cod_tipo_declaracion,
		tbn1_dim_mi_administracion_hacienda_id_administracion.id_administracion,
		tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.id_tipo_presentacion,
		tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.id_tipo_declaracion
		)
		INSERT INTO #tmp_mi_198_dim_datos_caratula (rr_mode,id_dim_datos_caratula,t_modelo,t_delegacion_hacienda,t_cod_administracion,t_cod_tipo_presentacion,t_cod_tipo_declaracion,t_id_administracion,t_id_tipo_presentacion,t_id_tipo_declaracion,modelo,delegacion_hacienda,cod_administracion,cod_tipo_presentacion,cod_tipo_declaracion,id_administracion,id_tipo_presentacion,id_tipo_declaracion)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_datos_caratula IS NULL THEN 'I'
					WHEN (query.modelo IS NULL AND t.modelo IS NOT NULL) AND (query.delegacion_hacienda IS NULL AND t.delegacion_hacienda IS NOT NULL) AND (query.cod_administracion IS NULL AND t.cod_administracion IS NOT NULL) AND (query.cod_tipo_presentacion IS NULL AND t.cod_tipo_presentacion IS NOT NULL) AND (query.cod_tipo_declaracion IS NULL AND t.cod_tipo_declaracion IS NOT NULL) AND (query.id_administracion IS NULL AND t.id_administracion IS NOT NULL) AND (query.id_tipo_presentacion IS NULL AND t.id_tipo_presentacion IS NOT NULL) AND (query.id_tipo_declaracion IS NULL AND t.id_tipo_declaracion IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_datos_caratula AS id_dim_datos_caratula,
			t.modelo AS t_modelo,
			t.delegacion_hacienda AS t_delegacion_hacienda,
			t.cod_administracion AS t_cod_administracion,
			t.cod_tipo_presentacion AS t_cod_tipo_presentacion,
			t.cod_tipo_declaracion AS t_cod_tipo_declaracion,
			t.id_administracion AS t_id_administracion,
			t.id_tipo_presentacion AS t_id_tipo_presentacion,
			t.id_tipo_declaracion AS t_id_tipo_declaracion,
			query.modelo AS modelo,
			query.delegacion_hacienda AS delegacion_hacienda,
			query.cod_administracion AS cod_administracion,
			query.cod_tipo_presentacion AS cod_tipo_presentacion,
			query.cod_tipo_declaracion AS cod_tipo_declaracion,
			query.id_administracion AS id_administracion,
			query.id_tipo_presentacion AS id_tipo_presentacion,
			query.id_tipo_declaracion AS id_tipo_declaracion
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula AS t
		FULL JOIN query on ((query.modelo=t.modelo OR (query.modelo IS NULL AND t.modelo IS NULL)) AND (query.delegacion_hacienda=t.delegacion_hacienda OR (query.delegacion_hacienda IS NULL AND t.delegacion_hacienda IS NULL)) AND (query.cod_administracion=t.cod_administracion OR (query.cod_administracion IS NULL AND t.cod_administracion IS NULL)) AND (query.cod_tipo_presentacion=t.cod_tipo_presentacion OR (query.cod_tipo_presentacion IS NULL AND t.cod_tipo_presentacion IS NULL)) AND (query.cod_tipo_declaracion=t.cod_tipo_declaracion OR (query.cod_tipo_declaracion IS NULL AND t.cod_tipo_declaracion IS NULL)) AND (query.id_administracion=t.id_administracion OR (query.id_administracion IS NULL AND t.id_administracion IS NULL)) AND (query.id_tipo_presentacion=t.id_tipo_presentacion OR (query.id_tipo_presentacion IS NULL AND t.id_tipo_presentacion IS NULL)) AND (query.id_tipo_declaracion=t.id_tipo_declaracion OR (query.id_tipo_declaracion IS NULL AND t.id_tipo_declaracion IS NULL)))
		WHERE 
			id_dim_datos_caratula IS NULL OR
			((query.modelo IS NULL AND t.modelo IS NOT NULL) AND (query.delegacion_hacienda IS NULL AND t.delegacion_hacienda IS NOT NULL) AND (query.cod_administracion IS NULL AND t.cod_administracion IS NOT NULL) AND (query.cod_tipo_presentacion IS NULL AND t.cod_tipo_presentacion IS NOT NULL) AND (query.cod_tipo_declaracion IS NULL AND t.cod_tipo_declaracion IS NOT NULL) AND (query.id_administracion IS NULL AND t.id_administracion IS NOT NULL) AND (query.id_tipo_presentacion IS NULL AND t.id_tipo_presentacion IS NOT NULL) AND (query.id_tipo_declaracion IS NULL AND t.id_tipo_declaracion IS NOT NULL)) OR
			(t.modelo<>query.modelo OR (t.modelo IS NULL AND query.modelo IS NOT NULL)
                                                  OR (t.modelo IS NOT NULL AND query.modelo IS NULL)
				OR t.delegacion_hacienda<>query.delegacion_hacienda OR (t.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL)
                                                  OR (t.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
				OR t.cod_administracion<>query.cod_administracion OR (t.cod_administracion IS NULL AND query.cod_administracion IS NOT NULL)
                                                  OR (t.cod_administracion IS NOT NULL AND query.cod_administracion IS NULL)
				OR t.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (t.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL)
                                                  OR (t.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
				OR t.cod_tipo_declaracion<>query.cod_tipo_declaracion OR (t.cod_tipo_declaracion IS NULL AND query.cod_tipo_declaracion IS NOT NULL)
                                                  OR (t.cod_tipo_declaracion IS NOT NULL AND query.cod_tipo_declaracion IS NULL)
				OR t.id_administracion<>query.id_administracion OR (t.id_administracion IS NULL AND query.id_administracion IS NOT NULL)
                                                  OR (t.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
				OR t.id_tipo_presentacion<>query.id_tipo_presentacion OR (t.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL)
                                                  OR (t.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
				OR t.id_tipo_declaracion<>query.id_tipo_declaracion OR (t.id_tipo_declaracion IS NULL AND query.id_tipo_declaracion IS NOT NULL)
                                                  OR (t.id_tipo_declaracion IS NOT NULL AND query.id_tipo_declaracion IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_datos_caratula
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_datos_caratula where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_1')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_2')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_3')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula
			SET
				modelo=s.modelo,
				delegacion_hacienda=s.delegacion_hacienda,
				cod_administracion=s.cod_administracion,
				cod_tipo_presentacion=s.cod_tipo_presentacion,
				cod_tipo_declaracion=s.cod_tipo_declaracion,
				id_administracion=s.id_administracion,
				id_tipo_presentacion=s.id_tipo_presentacion,
				id_tipo_declaracion=s.id_tipo_declaracion
		FROM (
			SELECT
				modelo,
				delegacion_hacienda,
				cod_administracion,
				cod_tipo_presentacion,
				cod_tipo_declaracion,
				id_administracion,
				id_tipo_presentacion,
				id_tipo_declaracion
			FROM #tmp_mi_198_dim_datos_caratula
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.modelo=s.modelo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.modelo IS NULL AND s.modelo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.delegacion_hacienda=s.delegacion_hacienda OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.delegacion_hacienda IS NULL AND s.delegacion_hacienda IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.cod_administracion=s.cod_administracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.cod_administracion IS NULL AND s.cod_administracion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.cod_tipo_presentacion=s.cod_tipo_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.cod_tipo_presentacion IS NULL AND s.cod_tipo_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.cod_tipo_declaracion=s.cod_tipo_declaracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.cod_tipo_declaracion IS NULL AND s.cod_tipo_declaracion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.id_administracion=s.id_administracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.id_administracion IS NULL AND s.id_administracion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.id_tipo_presentacion=s.id_tipo_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.id_tipo_presentacion IS NULL AND s.id_tipo_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.id_tipo_declaracion=s.id_tipo_declaracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula.id_tipo_declaracion IS NULL AND s.id_tipo_declaracion IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula AS tbn1_mi_198_dim_datos_caratula
		INNER JOIN #tmp_mi_198_dim_datos_caratula AS tmp
		ON ((tbn1_mi_198_dim_datos_caratula.modelo=tmp.t_modelo OR (tbn1_mi_198_dim_datos_caratula.modelo IS NULL AND tmp.t_modelo IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.delegacion_hacienda=tmp.t_delegacion_hacienda OR (tbn1_mi_198_dim_datos_caratula.delegacion_hacienda IS NULL AND tmp.t_delegacion_hacienda IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.cod_administracion=tmp.t_cod_administracion OR (tbn1_mi_198_dim_datos_caratula.cod_administracion IS NULL AND tmp.t_cod_administracion IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.cod_tipo_presentacion=tmp.t_cod_tipo_presentacion OR (tbn1_mi_198_dim_datos_caratula.cod_tipo_presentacion IS NULL AND tmp.t_cod_tipo_presentacion IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.cod_tipo_declaracion=tmp.t_cod_tipo_declaracion OR (tbn1_mi_198_dim_datos_caratula.cod_tipo_declaracion IS NULL AND tmp.t_cod_tipo_declaracion IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.id_administracion=tmp.t_id_administracion OR (tbn1_mi_198_dim_datos_caratula.id_administracion IS NULL AND tmp.t_id_administracion IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.id_tipo_presentacion=tmp.t_id_tipo_presentacion OR (tbn1_mi_198_dim_datos_caratula.id_tipo_presentacion IS NULL AND tmp.t_id_tipo_presentacion IS NULL)) AND (tbn1_mi_198_dim_datos_caratula.id_tipo_declaracion=tmp.t_id_tipo_declaracion OR (tbn1_mi_198_dim_datos_caratula.id_tipo_declaracion IS NULL AND tmp.t_id_tipo_declaracion IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula WITH(TABLOCK) (modelo,delegacion_hacienda,cod_administracion,cod_tipo_presentacion,cod_tipo_declaracion,id_administracion,id_tipo_presentacion,id_tipo_declaracion)
		SELECT
			modelo,
			delegacion_hacienda,
			cod_administracion,
			cod_tipo_presentacion,
			cod_tipo_declaracion,
			id_administracion,
			id_tipo_presentacion,
			id_tipo_declaracion
			FROM #tmp_mi_198_dim_datos_caratula
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_1')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_2')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_3')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_caratula_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_caratula_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula REBUILD
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



USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_declarantes'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_declarantes') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_declarantes
		CREATE table #tmp_mi_198_dim_declarantes(
			rr_mode varchar(1),
			id_dim_declarantes int,
			t_nif_declarante_198 varchar(12),
			t_nif_declarante_no_identificado varchar(12),
			t_id_contribuyente_declarante int,
			t_telefono varchar(10),
			t_razon_social varchar(40),
			t_cod_presentador_colectivo int,
			t_cod_entidad_gestora varchar(4),
			t_id_mae_no_id_declarante int,
			nif_declarante_198 varchar(12),
			nif_declarante_no_identificado varchar(12),
			id_contribuyente_declarante int,
			telefono varchar(10),
			razon_social varchar(40),
			cod_presentador_colectivo int,
			cod_entidad_gestora varchar(4),
			id_mae_no_id_declarante int
		);

		;WITH
		query AS (
	SELECT
		st.nif_declarante_198 AS nif_declarante_198,
		st.nif_declarante_no_identificado AS nif_declarante_no_identificado,
		st.id_contribuyente_declarante AS id_contribuyente_declarante,
		st.telefono AS telefono,
		st.razon_social AS razon_social,
		st.cod_presentador_colectivo AS cod_presentador_colectivo,
		st.cod_entidad_gestora AS cod_entidad_gestora,
		st.id_mae_no_id_declarante AS id_mae_no_id_declarante
	FROM (SELECT
		nif_declarante_198,
		nif_declarante_no_identificado,
		id_contribuyente_declarante,
		telefono,
		razon_social,
		cod_presentador_colectivo,
		cod_entidad_gestora,
		id_mae_no_id_declarante
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		nif_declarante_198,
		nif_declarante_no_identificado,
		id_contribuyente_declarante,
		telefono,
		razon_social,
		cod_presentador_colectivo,
		cod_entidad_gestora,
		id_mae_no_id_declarante
	) st

	GROUP BY
		st.nif_declarante_198,
		st.nif_declarante_no_identificado,
		st.id_contribuyente_declarante,
		st.telefono,
		st.razon_social,
		st.cod_presentador_colectivo,
		st.cod_entidad_gestora,
		st.id_mae_no_id_declarante
		)
		INSERT INTO #tmp_mi_198_dim_declarantes (rr_mode,id_dim_declarantes,t_nif_declarante_198,t_nif_declarante_no_identificado,t_id_contribuyente_declarante,t_telefono,t_razon_social,t_cod_presentador_colectivo,t_cod_entidad_gestora,t_id_mae_no_id_declarante,nif_declarante_198,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo,cod_entidad_gestora,id_mae_no_id_declarante)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_declarantes IS NULL THEN 'I'
					WHEN (query.nif_declarante_198 IS NULL AND t.nif_declarante_198 IS NOT NULL) AND (query.nif_declarante_no_identificado IS NULL AND t.nif_declarante_no_identificado IS NOT NULL) AND (query.id_contribuyente_declarante IS NULL AND t.id_contribuyente_declarante IS NOT NULL) AND (query.telefono IS NULL AND t.telefono IS NOT NULL) AND (query.razon_social IS NULL AND t.razon_social IS NOT NULL) AND (query.cod_presentador_colectivo IS NULL AND t.cod_presentador_colectivo IS NOT NULL) AND (query.cod_entidad_gestora IS NULL AND t.cod_entidad_gestora IS NOT NULL) AND (query.id_mae_no_id_declarante IS NULL AND t.id_mae_no_id_declarante IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_declarantes AS id_dim_declarantes,
			t.nif_declarante_198 AS t_nif_declarante_198,
			t.nif_declarante_no_identificado AS t_nif_declarante_no_identificado,
			t.id_contribuyente_declarante AS t_id_contribuyente_declarante,
			t.telefono AS t_telefono,
			t.razon_social AS t_razon_social,
			t.cod_presentador_colectivo AS t_cod_presentador_colectivo,
			t.cod_entidad_gestora AS t_cod_entidad_gestora,
			t.id_mae_no_id_declarante AS t_id_mae_no_id_declarante,
			query.nif_declarante_198 AS nif_declarante_198,
			query.nif_declarante_no_identificado AS nif_declarante_no_identificado,
			query.id_contribuyente_declarante AS id_contribuyente_declarante,
			query.telefono AS telefono,
			query.razon_social AS razon_social,
			query.cod_presentador_colectivo AS cod_presentador_colectivo,
			query.cod_entidad_gestora AS cod_entidad_gestora,
			query.id_mae_no_id_declarante AS id_mae_no_id_declarante
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes AS t
		FULL JOIN query on ((query.nif_declarante_198=t.nif_declarante_198 OR (query.nif_declarante_198 IS NULL AND t.nif_declarante_198 IS NULL)) AND (query.nif_declarante_no_identificado=t.nif_declarante_no_identificado OR (query.nif_declarante_no_identificado IS NULL AND t.nif_declarante_no_identificado IS NULL)) AND (query.id_contribuyente_declarante=t.id_contribuyente_declarante OR (query.id_contribuyente_declarante IS NULL AND t.id_contribuyente_declarante IS NULL)) AND (query.telefono=t.telefono OR (query.telefono IS NULL AND t.telefono IS NULL)) AND (query.razon_social=t.razon_social OR (query.razon_social IS NULL AND t.razon_social IS NULL)) AND (query.cod_presentador_colectivo=t.cod_presentador_colectivo OR (query.cod_presentador_colectivo IS NULL AND t.cod_presentador_colectivo IS NULL)) AND (query.cod_entidad_gestora=t.cod_entidad_gestora OR (query.cod_entidad_gestora IS NULL AND t.cod_entidad_gestora IS NULL)) AND (query.id_mae_no_id_declarante=t.id_mae_no_id_declarante OR (query.id_mae_no_id_declarante IS NULL AND t.id_mae_no_id_declarante IS NULL)))
		WHERE 
			id_dim_declarantes IS NULL OR
			((query.nif_declarante_198 IS NULL AND t.nif_declarante_198 IS NOT NULL) AND (query.nif_declarante_no_identificado IS NULL AND t.nif_declarante_no_identificado IS NOT NULL) AND (query.id_contribuyente_declarante IS NULL AND t.id_contribuyente_declarante IS NOT NULL) AND (query.telefono IS NULL AND t.telefono IS NOT NULL) AND (query.razon_social IS NULL AND t.razon_social IS NOT NULL) AND (query.cod_presentador_colectivo IS NULL AND t.cod_presentador_colectivo IS NOT NULL) AND (query.cod_entidad_gestora IS NULL AND t.cod_entidad_gestora IS NOT NULL) AND (query.id_mae_no_id_declarante IS NULL AND t.id_mae_no_id_declarante IS NOT NULL)) OR
			(t.nif_declarante_198<>query.nif_declarante_198 OR (t.nif_declarante_198 IS NULL AND query.nif_declarante_198 IS NOT NULL)
                                                  OR (t.nif_declarante_198 IS NOT NULL AND query.nif_declarante_198 IS NULL)
				OR t.nif_declarante_no_identificado<>query.nif_declarante_no_identificado OR (t.nif_declarante_no_identificado IS NULL AND query.nif_declarante_no_identificado IS NOT NULL)
                                                  OR (t.nif_declarante_no_identificado IS NOT NULL AND query.nif_declarante_no_identificado IS NULL)
				OR t.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (t.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL)
                                                  OR (t.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
				OR t.telefono<>query.telefono OR (t.telefono IS NULL AND query.telefono IS NOT NULL)
                                                  OR (t.telefono IS NOT NULL AND query.telefono IS NULL)
				OR t.razon_social<>query.razon_social OR (t.razon_social IS NULL AND query.razon_social IS NOT NULL)
                                                  OR (t.razon_social IS NOT NULL AND query.razon_social IS NULL)
				OR t.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (t.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL)
                                                  OR (t.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
				OR t.cod_entidad_gestora<>query.cod_entidad_gestora OR (t.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL)
                                                  OR (t.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
				OR t.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (t.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_declarantes
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_declarantes where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarantes_1')
			ALTER INDEX IX_tbn1_mi_198_dim_declarantes_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes
			SET
				nif_declarante_198=s.nif_declarante_198,
				nif_declarante_no_identificado=s.nif_declarante_no_identificado,
				id_contribuyente_declarante=s.id_contribuyente_declarante,
				telefono=s.telefono,
				razon_social=s.razon_social,
				cod_presentador_colectivo=s.cod_presentador_colectivo,
				cod_entidad_gestora=s.cod_entidad_gestora,
				id_mae_no_id_declarante=s.id_mae_no_id_declarante
		FROM (
			SELECT
				nif_declarante_198,
				nif_declarante_no_identificado,
				id_contribuyente_declarante,
				telefono,
				razon_social,
				cod_presentador_colectivo,
				cod_entidad_gestora,
				id_mae_no_id_declarante
			FROM #tmp_mi_198_dim_declarantes
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.nif_declarante_198=s.nif_declarante_198 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.nif_declarante_198 IS NULL AND s.nif_declarante_198 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.nif_declarante_no_identificado=s.nif_declarante_no_identificado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.nif_declarante_no_identificado IS NULL AND s.nif_declarante_no_identificado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.id_contribuyente_declarante=s.id_contribuyente_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.id_contribuyente_declarante IS NULL AND s.id_contribuyente_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.telefono=s.telefono OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.telefono IS NULL AND s.telefono IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.razon_social=s.razon_social OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.razon_social IS NULL AND s.razon_social IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.cod_presentador_colectivo=s.cod_presentador_colectivo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.cod_presentador_colectivo IS NULL AND s.cod_presentador_colectivo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.cod_entidad_gestora=s.cod_entidad_gestora OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.cod_entidad_gestora IS NULL AND s.cod_entidad_gestora IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.id_mae_no_id_declarante=s.id_mae_no_id_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes.id_mae_no_id_declarante IS NULL AND s.id_mae_no_id_declarante IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes AS tbn1_mi_198_dim_declarantes
		INNER JOIN #tmp_mi_198_dim_declarantes AS tmp
		ON ((tbn1_mi_198_dim_declarantes.nif_declarante_198=tmp.t_nif_declarante_198 OR (tbn1_mi_198_dim_declarantes.nif_declarante_198 IS NULL AND tmp.t_nif_declarante_198 IS NULL)) AND (tbn1_mi_198_dim_declarantes.nif_declarante_no_identificado=tmp.t_nif_declarante_no_identificado OR (tbn1_mi_198_dim_declarantes.nif_declarante_no_identificado IS NULL AND tmp.t_nif_declarante_no_identificado IS NULL)) AND (tbn1_mi_198_dim_declarantes.id_contribuyente_declarante=tmp.t_id_contribuyente_declarante OR (tbn1_mi_198_dim_declarantes.id_contribuyente_declarante IS NULL AND tmp.t_id_contribuyente_declarante IS NULL)) AND (tbn1_mi_198_dim_declarantes.telefono=tmp.t_telefono OR (tbn1_mi_198_dim_declarantes.telefono IS NULL AND tmp.t_telefono IS NULL)) AND (tbn1_mi_198_dim_declarantes.razon_social=tmp.t_razon_social OR (tbn1_mi_198_dim_declarantes.razon_social IS NULL AND tmp.t_razon_social IS NULL)) AND (tbn1_mi_198_dim_declarantes.cod_presentador_colectivo=tmp.t_cod_presentador_colectivo OR (tbn1_mi_198_dim_declarantes.cod_presentador_colectivo IS NULL AND tmp.t_cod_presentador_colectivo IS NULL)) AND (tbn1_mi_198_dim_declarantes.cod_entidad_gestora=tmp.t_cod_entidad_gestora OR (tbn1_mi_198_dim_declarantes.cod_entidad_gestora IS NULL AND tmp.t_cod_entidad_gestora IS NULL)) AND (tbn1_mi_198_dim_declarantes.id_mae_no_id_declarante=tmp.t_id_mae_no_id_declarante OR (tbn1_mi_198_dim_declarantes.id_mae_no_id_declarante IS NULL AND tmp.t_id_mae_no_id_declarante IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarantes_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_declarantes_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes WITH(TABLOCK) (nif_declarante_198,nif_declarante_no_identificado,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo,cod_entidad_gestora,id_mae_no_id_declarante)
		SELECT
			nif_declarante_198,
			nif_declarante_no_identificado,
			id_contribuyente_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo,
			cod_entidad_gestora,
			id_mae_no_id_declarante
			FROM #tmp_mi_198_dim_declarantes
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarantes_1')
			ALTER INDEX IX_tbn1_mi_198_dim_declarantes_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_declarantes_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_declarantes_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes REBUILD
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



USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_marcas'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_marcas') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_marcas
		CREATE table #tmp_mi_198_dim_marcas(
			rr_mode varchar(1),
			id_dim_marcas int,
			t_es_contribuyente_declarante bit,
			t_es_externo bit,
			t_es_contribuyente_declarado bit,
			t_es_identificado_declarante bit,
			t_sw_identificado_declarante varchar(1),
			t_es_erroneo_declarante bit,
			t_es_historico bit,
			t_es_representante varchar(1),
			t_es_identificado_declarado bit,
			t_sw_identificado_declarado varchar(1),
			t_es_erroneo_declarado bit,
			es_contribuyente_declarante bit,
			es_externo bit,
			es_contribuyente_declarado bit,
			es_identificado_declarante bit,
			sw_identificado_declarante varchar(1),
			es_erroneo_declarante bit,
			es_historico bit,
			es_representante varchar(1),
			es_identificado_declarado bit,
			sw_identificado_declarado varchar(1),
			es_erroneo_declarado bit
		);

		;WITH
		query AS (
	SELECT
		st.es_contribuyente_declarante AS es_contribuyente_declarante,
		st.es_externo AS es_externo,
		st.es_contribuyente_declarado AS es_contribuyente_declarado,
		st.es_identificado_declarante AS es_identificado_declarante,
		st.sw_identificado_declarante AS sw_identificado_declarante,
		st.es_erroneo_declarante AS es_erroneo_declarante,
		st.es_historico AS es_historico,
		st.es_representante AS es_representante,
		st.es_identificado_declarado AS es_identificado_declarado,
		st.sw_identificado_declarado AS sw_identificado_declarado,
		st.es_erroneo_declarado AS es_erroneo_declarado
	FROM (SELECT
		es_contribuyente_declarante,
		es_externo,
		es_contribuyente_declarado,
		es_identificado_declarante,
		sw_identificado_declarante,
		es_erroneo_declarante,
		es_historico,
		es_representante,
		es_identificado_declarado,
		sw_identificado_declarado,
		es_erroneo_declarado
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		es_contribuyente_declarante,
		es_externo,
		es_contribuyente_declarado,
		es_identificado_declarante,
		sw_identificado_declarante,
		es_erroneo_declarante,
		es_historico,
		es_representante,
		es_identificado_declarado,
		sw_identificado_declarado,
		es_erroneo_declarado
	) st

	GROUP BY
		st.es_contribuyente_declarante,
		st.es_externo,
		st.es_contribuyente_declarado,
		st.es_identificado_declarante,
		st.sw_identificado_declarante,
		st.es_erroneo_declarante,
		st.es_historico,
		st.es_representante,
		st.es_identificado_declarado,
		st.sw_identificado_declarado,
		st.es_erroneo_declarado
		)
		INSERT INTO #tmp_mi_198_dim_marcas (rr_mode,id_dim_marcas,t_es_contribuyente_declarante,t_es_externo,t_es_contribuyente_declarado,t_es_identificado_declarante,t_sw_identificado_declarante,t_es_erroneo_declarante,t_es_historico,t_es_representante,t_es_identificado_declarado,t_sw_identificado_declarado,t_es_erroneo_declarado,es_contribuyente_declarante,es_externo,es_contribuyente_declarado,es_identificado_declarante,sw_identificado_declarante,es_erroneo_declarante,es_historico,es_representante,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_marcas IS NULL THEN 'I'
					WHEN (query.es_contribuyente_declarante IS NULL AND t.es_contribuyente_declarante IS NOT NULL) AND (query.es_externo IS NULL AND t.es_externo IS NOT NULL) AND (query.es_contribuyente_declarado IS NULL AND t.es_contribuyente_declarado IS NOT NULL) AND (query.es_identificado_declarante IS NULL AND t.es_identificado_declarante IS NOT NULL) AND (query.sw_identificado_declarante IS NULL AND t.sw_identificado_declarante IS NOT NULL) AND (query.es_erroneo_declarante IS NULL AND t.es_erroneo_declarante IS NOT NULL) AND (query.es_historico IS NULL AND t.es_historico IS NOT NULL) AND (query.es_representante IS NULL AND t.es_representante IS NOT NULL) AND (query.es_identificado_declarado IS NULL AND t.es_identificado_declarado IS NOT NULL) AND (query.sw_identificado_declarado IS NULL AND t.sw_identificado_declarado IS NOT NULL) AND (query.es_erroneo_declarado IS NULL AND t.es_erroneo_declarado IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_marcas AS id_dim_marcas,
			t.es_contribuyente_declarante AS t_es_contribuyente_declarante,
			t.es_externo AS t_es_externo,
			t.es_contribuyente_declarado AS t_es_contribuyente_declarado,
			t.es_identificado_declarante AS t_es_identificado_declarante,
			t.sw_identificado_declarante AS t_sw_identificado_declarante,
			t.es_erroneo_declarante AS t_es_erroneo_declarante,
			t.es_historico AS t_es_historico,
			t.es_representante AS t_es_representante,
			t.es_identificado_declarado AS t_es_identificado_declarado,
			t.sw_identificado_declarado AS t_sw_identificado_declarado,
			t.es_erroneo_declarado AS t_es_erroneo_declarado,
			query.es_contribuyente_declarante AS es_contribuyente_declarante,
			query.es_externo AS es_externo,
			query.es_contribuyente_declarado AS es_contribuyente_declarado,
			query.es_identificado_declarante AS es_identificado_declarante,
			query.sw_identificado_declarante AS sw_identificado_declarante,
			query.es_erroneo_declarante AS es_erroneo_declarante,
			query.es_historico AS es_historico,
			query.es_representante AS es_representante,
			query.es_identificado_declarado AS es_identificado_declarado,
			query.sw_identificado_declarado AS sw_identificado_declarado,
			query.es_erroneo_declarado AS es_erroneo_declarado
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas AS t
		FULL JOIN query on ((query.es_contribuyente_declarante=t.es_contribuyente_declarante OR (query.es_contribuyente_declarante IS NULL AND t.es_contribuyente_declarante IS NULL)) AND (query.es_externo=t.es_externo OR (query.es_externo IS NULL AND t.es_externo IS NULL)) AND (query.es_contribuyente_declarado=t.es_contribuyente_declarado OR (query.es_contribuyente_declarado IS NULL AND t.es_contribuyente_declarado IS NULL)) AND (query.es_identificado_declarante=t.es_identificado_declarante OR (query.es_identificado_declarante IS NULL AND t.es_identificado_declarante IS NULL)) AND (query.sw_identificado_declarante=t.sw_identificado_declarante OR (query.sw_identificado_declarante IS NULL AND t.sw_identificado_declarante IS NULL)) AND (query.es_erroneo_declarante=t.es_erroneo_declarante OR (query.es_erroneo_declarante IS NULL AND t.es_erroneo_declarante IS NULL)) AND (query.es_historico=t.es_historico OR (query.es_historico IS NULL AND t.es_historico IS NULL)) AND (query.es_representante=t.es_representante OR (query.es_representante IS NULL AND t.es_representante IS NULL)) AND (query.es_identificado_declarado=t.es_identificado_declarado OR (query.es_identificado_declarado IS NULL AND t.es_identificado_declarado IS NULL)) AND (query.sw_identificado_declarado=t.sw_identificado_declarado OR (query.sw_identificado_declarado IS NULL AND t.sw_identificado_declarado IS NULL)) AND (query.es_erroneo_declarado=t.es_erroneo_declarado OR (query.es_erroneo_declarado IS NULL AND t.es_erroneo_declarado IS NULL)))
		WHERE 
			id_dim_marcas IS NULL OR
			((query.es_contribuyente_declarante IS NULL AND t.es_contribuyente_declarante IS NOT NULL) AND (query.es_externo IS NULL AND t.es_externo IS NOT NULL) AND (query.es_contribuyente_declarado IS NULL AND t.es_contribuyente_declarado IS NOT NULL) AND (query.es_identificado_declarante IS NULL AND t.es_identificado_declarante IS NOT NULL) AND (query.sw_identificado_declarante IS NULL AND t.sw_identificado_declarante IS NOT NULL) AND (query.es_erroneo_declarante IS NULL AND t.es_erroneo_declarante IS NOT NULL) AND (query.es_historico IS NULL AND t.es_historico IS NOT NULL) AND (query.es_representante IS NULL AND t.es_representante IS NOT NULL) AND (query.es_identificado_declarado IS NULL AND t.es_identificado_declarado IS NOT NULL) AND (query.sw_identificado_declarado IS NULL AND t.sw_identificado_declarado IS NOT NULL) AND (query.es_erroneo_declarado IS NULL AND t.es_erroneo_declarado IS NOT NULL)) OR
			(t.es_contribuyente_declarante<>query.es_contribuyente_declarante OR (t.es_contribuyente_declarante IS NULL AND query.es_contribuyente_declarante IS NOT NULL)
                                                  OR (t.es_contribuyente_declarante IS NOT NULL AND query.es_contribuyente_declarante IS NULL)
				OR t.es_externo<>query.es_externo OR (t.es_externo IS NULL AND query.es_externo IS NOT NULL)
                                                  OR (t.es_externo IS NOT NULL AND query.es_externo IS NULL)
				OR t.es_contribuyente_declarado<>query.es_contribuyente_declarado OR (t.es_contribuyente_declarado IS NULL AND query.es_contribuyente_declarado IS NOT NULL)
                                                  OR (t.es_contribuyente_declarado IS NOT NULL AND query.es_contribuyente_declarado IS NULL)
				OR t.es_identificado_declarante<>query.es_identificado_declarante OR (t.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL)
                                                  OR (t.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
				OR t.sw_identificado_declarante<>query.sw_identificado_declarante OR (t.sw_identificado_declarante IS NULL AND query.sw_identificado_declarante IS NOT NULL)
                                                  OR (t.sw_identificado_declarante IS NOT NULL AND query.sw_identificado_declarante IS NULL)
				OR t.es_erroneo_declarante<>query.es_erroneo_declarante OR (t.es_erroneo_declarante IS NULL AND query.es_erroneo_declarante IS NOT NULL)
                                                  OR (t.es_erroneo_declarante IS NOT NULL AND query.es_erroneo_declarante IS NULL)
				OR t.es_historico<>query.es_historico OR (t.es_historico IS NULL AND query.es_historico IS NOT NULL)
                                                  OR (t.es_historico IS NOT NULL AND query.es_historico IS NULL)
				OR t.es_representante<>query.es_representante OR (t.es_representante IS NULL AND query.es_representante IS NOT NULL)
                                                  OR (t.es_representante IS NOT NULL AND query.es_representante IS NULL)
				OR t.es_identificado_declarado<>query.es_identificado_declarado OR (t.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL)
                                                  OR (t.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
				OR t.sw_identificado_declarado<>query.sw_identificado_declarado OR (t.sw_identificado_declarado IS NULL AND query.sw_identificado_declarado IS NOT NULL)
                                                  OR (t.sw_identificado_declarado IS NOT NULL AND query.sw_identificado_declarado IS NULL)
				OR t.es_erroneo_declarado<>query.es_erroneo_declarado OR (t.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL)
                                                  OR (t.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_marcas
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_marcas where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas
			SET
				es_contribuyente_declarante=s.es_contribuyente_declarante,
				es_externo=s.es_externo,
				es_contribuyente_declarado=s.es_contribuyente_declarado,
				es_identificado_declarante=s.es_identificado_declarante,
				sw_identificado_declarante=s.sw_identificado_declarante,
				es_erroneo_declarante=s.es_erroneo_declarante,
				es_historico=s.es_historico,
				es_representante=s.es_representante,
				es_identificado_declarado=s.es_identificado_declarado,
				sw_identificado_declarado=s.sw_identificado_declarado,
				es_erroneo_declarado=s.es_erroneo_declarado
		FROM (
			SELECT
				es_contribuyente_declarante,
				es_externo,
				es_contribuyente_declarado,
				es_identificado_declarante,
				sw_identificado_declarante,
				es_erroneo_declarante,
				es_historico,
				es_representante,
				es_identificado_declarado,
				sw_identificado_declarado,
				es_erroneo_declarado
			FROM #tmp_mi_198_dim_marcas
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_contribuyente_declarante=s.es_contribuyente_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_contribuyente_declarante IS NULL AND s.es_contribuyente_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_externo=s.es_externo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_externo IS NULL AND s.es_externo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_contribuyente_declarado=s.es_contribuyente_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_contribuyente_declarado IS NULL AND s.es_contribuyente_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_identificado_declarante=s.es_identificado_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_identificado_declarante IS NULL AND s.es_identificado_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.sw_identificado_declarante=s.sw_identificado_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.sw_identificado_declarante IS NULL AND s.sw_identificado_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_erroneo_declarante=s.es_erroneo_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_erroneo_declarante IS NULL AND s.es_erroneo_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_historico=s.es_historico OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_historico IS NULL AND s.es_historico IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_representante=s.es_representante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_representante IS NULL AND s.es_representante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_identificado_declarado=s.es_identificado_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_identificado_declarado IS NULL AND s.es_identificado_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.sw_identificado_declarado=s.sw_identificado_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.sw_identificado_declarado IS NULL AND s.sw_identificado_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_erroneo_declarado=s.es_erroneo_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas.es_erroneo_declarado IS NULL AND s.es_erroneo_declarado IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas AS tbn1_mi_198_dim_marcas
		INNER JOIN #tmp_mi_198_dim_marcas AS tmp
		ON ((tbn1_mi_198_dim_marcas.es_contribuyente_declarante=tmp.t_es_contribuyente_declarante OR (tbn1_mi_198_dim_marcas.es_contribuyente_declarante IS NULL AND tmp.t_es_contribuyente_declarante IS NULL)) AND (tbn1_mi_198_dim_marcas.es_externo=tmp.t_es_externo OR (tbn1_mi_198_dim_marcas.es_externo IS NULL AND tmp.t_es_externo IS NULL)) AND (tbn1_mi_198_dim_marcas.es_contribuyente_declarado=tmp.t_es_contribuyente_declarado OR (tbn1_mi_198_dim_marcas.es_contribuyente_declarado IS NULL AND tmp.t_es_contribuyente_declarado IS NULL)) AND (tbn1_mi_198_dim_marcas.es_identificado_declarante=tmp.t_es_identificado_declarante OR (tbn1_mi_198_dim_marcas.es_identificado_declarante IS NULL AND tmp.t_es_identificado_declarante IS NULL)) AND (tbn1_mi_198_dim_marcas.sw_identificado_declarante=tmp.t_sw_identificado_declarante OR (tbn1_mi_198_dim_marcas.sw_identificado_declarante IS NULL AND tmp.t_sw_identificado_declarante IS NULL)) AND (tbn1_mi_198_dim_marcas.es_erroneo_declarante=tmp.t_es_erroneo_declarante OR (tbn1_mi_198_dim_marcas.es_erroneo_declarante IS NULL AND tmp.t_es_erroneo_declarante IS NULL)) AND (tbn1_mi_198_dim_marcas.es_historico=tmp.t_es_historico OR (tbn1_mi_198_dim_marcas.es_historico IS NULL AND tmp.t_es_historico IS NULL)) AND (tbn1_mi_198_dim_marcas.es_representante=tmp.t_es_representante OR (tbn1_mi_198_dim_marcas.es_representante IS NULL AND tmp.t_es_representante IS NULL)) AND (tbn1_mi_198_dim_marcas.es_identificado_declarado=tmp.t_es_identificado_declarado OR (tbn1_mi_198_dim_marcas.es_identificado_declarado IS NULL AND tmp.t_es_identificado_declarado IS NULL)) AND (tbn1_mi_198_dim_marcas.sw_identificado_declarado=tmp.t_sw_identificado_declarado OR (tbn1_mi_198_dim_marcas.sw_identificado_declarado IS NULL AND tmp.t_sw_identificado_declarado IS NULL)) AND (tbn1_mi_198_dim_marcas.es_erroneo_declarado=tmp.t_es_erroneo_declarado OR (tbn1_mi_198_dim_marcas.es_erroneo_declarado IS NULL AND tmp.t_es_erroneo_declarado IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_marcas_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_marcas_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas WITH(TABLOCK) (es_contribuyente_declarante,es_externo,es_contribuyente_declarado,es_identificado_declarante,sw_identificado_declarante,es_erroneo_declarante,es_historico,es_representante,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado)
		SELECT
			es_contribuyente_declarante,
			es_externo,
			es_contribuyente_declarado,
			es_identificado_declarante,
			sw_identificado_declarante,
			es_erroneo_declarante,
			es_historico,
			es_representante,
			es_identificado_declarado,
			sw_identificado_declarado,
			es_erroneo_declarado
			FROM #tmp_mi_198_dim_marcas
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_marcas_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_marcas_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas REBUILD
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



USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_dim_datos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_dim_datos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_dim_datos_detalle(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_datos_detalle'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_dim_datos_detalle') IS NOT NULL
			DROP TABLE #tmp_mi_198_dim_datos_detalle
		CREATE table #tmp_mi_198_dim_datos_detalle(
			rr_mode varchar(1),
			id_dim_datos_detalle int,
			t_id_clave_representacion int,
			t_cod_provincia varchar(2),
			t_cod_pais varchar(3),
			t_cod_tipo_codigo varchar(1),
			t_cod_clave_identificacion_fondo varchar(1),
			t_cod_clave_origen varchar(1),
			t_cod_clave_operacion_198 varchar(1),
			t_cod_clave_mercado varchar(1),
			t_cod_clave_valor varchar(1),
			t_cod_clave_declarado varchar(1),
			t_cod_tipo_importe varchar(2),
			t_id_provincia int,
			t_id_pais int,
			t_id_tipo_codigo int,
			t_id_clave_identificacion_fondo int,
			t_id_clave_origen int,
			t_id_clave_operacion_198 int,
			t_id_clave_mercado int,
			t_id_clave_valor int,
			t_id_clave_declarado int,
			t_id_tipo_importe int,
			id_clave_representacion int,
			cod_provincia varchar(2),
			cod_pais varchar(3),
			cod_tipo_codigo varchar(1),
			cod_clave_identificacion_fondo varchar(1),
			cod_clave_origen varchar(1),
			cod_clave_operacion_198 varchar(1),
			cod_clave_mercado varchar(1),
			cod_clave_valor varchar(1),
			cod_clave_declarado varchar(1),
			cod_tipo_importe varchar(2),
			id_provincia int,
			id_pais int,
			id_tipo_codigo int,
			id_clave_identificacion_fondo int,
			id_clave_origen int,
			id_clave_operacion_198 int,
			id_clave_mercado int,
			id_clave_valor int,
			id_clave_declarado int,
			id_tipo_importe int
		);

		;WITH
		query AS (
	SELECT
		st.id_clave_representacion AS id_clave_representacion,
		st.cod_provincia AS cod_provincia,
		st.cod_pais AS cod_pais,
		st.cod_tipo_codigo AS cod_tipo_codigo,
		st.cod_clave_identificacion_fondo AS cod_clave_identificacion_fondo,
		st.cod_clave_origen AS cod_clave_origen,
		st.cod_clave_operacion_198 AS cod_clave_operacion_198,
		st.cod_clave_mercado AS cod_clave_mercado,
		st.cod_clave_valor AS cod_clave_valor,
		st.cod_clave_declarado AS cod_clave_declarado,
		st.cod_tipo_importe AS cod_tipo_importe,
		tbn1_dim_provincias_id_provincia.id_provincia AS id_provincia,
		tbn1_dim_paises_id_pais.id_pais AS id_pais,
		tbn1_dim_mi_tipo_codigo_id_tipo_codigo.id_tipo_codigo AS id_tipo_codigo,
		tbn1_dim_mi_clave_identificacion_fondo_id_clave_identificacion_fondo.id_clave_identificacion_fondo AS id_clave_identificacion_fondo,
		tbn1_dim_mi_clave_origen_id_clave_origen.id_clave_origen AS id_clave_origen,
		tbn1_dim_mi_clave_operacion_198_id_clave_operacion_198.id_clave_operacion_198 AS id_clave_operacion_198,
		tbn1_dim_mi_claves_mercado_id_clave_mercado.id_clave_mercado AS id_clave_mercado,
		tbn1_dim_mi_clave_valor_id_clave_valor.id_clave_valor AS id_clave_valor,
		tbn1_dim_mi_clave_declarado_id_clave_declarado.id_clave_declarado AS id_clave_declarado,
		tbn1_dim_mi_tipo_importe_id_tipo_importe.id_tipo_importe AS id_tipo_importe
	FROM (SELECT
		id_clave_representacion,
		cod_provincia,
		cod_pais,
		cod_tipo_codigo,
		cod_clave_identificacion_fondo,
		cod_clave_origen,
		cod_clave_operacion_198,
		cod_clave_mercado,
		cod_clave_valor,
		cod_clave_declarado,
		cod_tipo_importe
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros
	GROUP BY
		id_clave_representacion,
		cod_provincia,
		cod_pais,
		cod_tipo_codigo,
		cod_clave_identificacion_fondo,
		cod_clave_origen,
		cod_clave_operacion_198,
		cod_clave_mercado,
		cod_clave_valor,
		cod_clave_declarado,
		cod_tipo_importe
	) st
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_provincias AS tbn1_dim_provincias_id_provincia ON (tbn1_dim_provincias_id_provincia.cod_provincia2=st.cod_provincia)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_paises AS tbn1_dim_paises_id_pais ON (tbn1_dim_paises_id_pais.cod_pais=st.cod_pais)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo AS tbn1_dim_mi_tipo_codigo_id_tipo_codigo ON (tbn1_dim_mi_tipo_codigo_id_tipo_codigo.cod_tipo_codigo=st.cod_tipo_codigo)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo AS tbn1_dim_mi_clave_identificacion_fondo_id_clave_identificacion_fondo ON (tbn1_dim_mi_clave_identificacion_fondo_id_clave_identificacion_fondo.cod_clave_identificacion_fondo=st.cod_clave_identificacion_fondo)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen AS tbn1_dim_mi_clave_origen_id_clave_origen ON (tbn1_dim_mi_clave_origen_id_clave_origen.cod_clave_origen=st.cod_clave_origen)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 AS tbn1_dim_mi_clave_operacion_198_id_clave_operacion_198 ON (tbn1_dim_mi_clave_operacion_198_id_clave_operacion_198.cod_clave_operacion_198=st.cod_clave_operacion_198)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado AS tbn1_dim_mi_claves_mercado_id_clave_mercado ON (tbn1_dim_mi_claves_mercado_id_clave_mercado.cod_clave_mercado=st.cod_clave_mercado)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor AS tbn1_dim_mi_clave_valor_id_clave_valor ON (tbn1_dim_mi_clave_valor_id_clave_valor.cod_clave_valor=st.cod_clave_valor)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado AS tbn1_dim_mi_clave_declarado_id_clave_declarado ON (tbn1_dim_mi_clave_declarado_id_clave_declarado.cod_clave_declarado=st.cod_clave_declarado)
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe AS tbn1_dim_mi_tipo_importe_id_tipo_importe ON (tbn1_dim_mi_tipo_importe_id_tipo_importe.cod_tipo_importe=st.cod_tipo_importe)
	GROUP BY
		st.id_clave_representacion,
		st.cod_provincia,
		st.cod_pais,
		st.cod_tipo_codigo,
		st.cod_clave_identificacion_fondo,
		st.cod_clave_origen,
		st.cod_clave_operacion_198,
		st.cod_clave_mercado,
		st.cod_clave_valor,
		st.cod_clave_declarado,
		st.cod_tipo_importe,
		tbn1_dim_provincias_id_provincia.id_provincia,
		tbn1_dim_paises_id_pais.id_pais,
		tbn1_dim_mi_tipo_codigo_id_tipo_codigo.id_tipo_codigo,
		tbn1_dim_mi_clave_identificacion_fondo_id_clave_identificacion_fondo.id_clave_identificacion_fondo,
		tbn1_dim_mi_clave_origen_id_clave_origen.id_clave_origen,
		tbn1_dim_mi_clave_operacion_198_id_clave_operacion_198.id_clave_operacion_198,
		tbn1_dim_mi_claves_mercado_id_clave_mercado.id_clave_mercado,
		tbn1_dim_mi_clave_valor_id_clave_valor.id_clave_valor,
		tbn1_dim_mi_clave_declarado_id_clave_declarado.id_clave_declarado,
		tbn1_dim_mi_tipo_importe_id_tipo_importe.id_tipo_importe
		)
		INSERT INTO #tmp_mi_198_dim_datos_detalle (rr_mode,id_dim_datos_detalle,t_id_clave_representacion,t_cod_provincia,t_cod_pais,t_cod_tipo_codigo,t_cod_clave_identificacion_fondo,t_cod_clave_origen,t_cod_clave_operacion_198,t_cod_clave_mercado,t_cod_clave_valor,t_cod_clave_declarado,t_cod_tipo_importe,t_id_provincia,t_id_pais,t_id_tipo_codigo,t_id_clave_identificacion_fondo,t_id_clave_origen,t_id_clave_operacion_198,t_id_clave_mercado,t_id_clave_valor,t_id_clave_declarado,t_id_tipo_importe,id_clave_representacion,cod_provincia,cod_pais,cod_tipo_codigo,cod_clave_identificacion_fondo,cod_clave_origen,cod_clave_operacion_198,cod_clave_mercado,cod_clave_valor,cod_clave_declarado,cod_tipo_importe,id_provincia,id_pais,id_tipo_codigo,id_clave_identificacion_fondo,id_clave_origen,id_clave_operacion_198,id_clave_mercado,id_clave_valor,id_clave_declarado,id_tipo_importe)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_datos_detalle IS NULL THEN 'I'
					WHEN (query.id_clave_representacion IS NULL AND t.id_clave_representacion IS NOT NULL) AND (query.cod_provincia IS NULL AND t.cod_provincia IS NOT NULL) AND (query.cod_pais IS NULL AND t.cod_pais IS NOT NULL) AND (query.cod_tipo_codigo IS NULL AND t.cod_tipo_codigo IS NOT NULL) AND (query.cod_clave_identificacion_fondo IS NULL AND t.cod_clave_identificacion_fondo IS NOT NULL) AND (query.cod_clave_origen IS NULL AND t.cod_clave_origen IS NOT NULL) AND (query.cod_clave_operacion_198 IS NULL AND t.cod_clave_operacion_198 IS NOT NULL) AND (query.cod_clave_mercado IS NULL AND t.cod_clave_mercado IS NOT NULL) AND (query.cod_clave_valor IS NULL AND t.cod_clave_valor IS NOT NULL) AND (query.cod_clave_declarado IS NULL AND t.cod_clave_declarado IS NOT NULL) AND (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NOT NULL) AND (query.id_provincia IS NULL AND t.id_provincia IS NOT NULL) AND (query.id_pais IS NULL AND t.id_pais IS NOT NULL) AND (query.id_tipo_codigo IS NULL AND t.id_tipo_codigo IS NOT NULL) AND (query.id_clave_identificacion_fondo IS NULL AND t.id_clave_identificacion_fondo IS NOT NULL) AND (query.id_clave_origen IS NULL AND t.id_clave_origen IS NOT NULL) AND (query.id_clave_operacion_198 IS NULL AND t.id_clave_operacion_198 IS NOT NULL) AND (query.id_clave_mercado IS NULL AND t.id_clave_mercado IS NOT NULL) AND (query.id_clave_valor IS NULL AND t.id_clave_valor IS NOT NULL) AND (query.id_clave_declarado IS NULL AND t.id_clave_declarado IS NOT NULL) AND (query.id_tipo_importe IS NULL AND t.id_tipo_importe IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id_dim_datos_detalle AS id_dim_datos_detalle,
			t.id_clave_representacion AS t_id_clave_representacion,
			t.cod_provincia AS t_cod_provincia,
			t.cod_pais AS t_cod_pais,
			t.cod_tipo_codigo AS t_cod_tipo_codigo,
			t.cod_clave_identificacion_fondo AS t_cod_clave_identificacion_fondo,
			t.cod_clave_origen AS t_cod_clave_origen,
			t.cod_clave_operacion_198 AS t_cod_clave_operacion_198,
			t.cod_clave_mercado AS t_cod_clave_mercado,
			t.cod_clave_valor AS t_cod_clave_valor,
			t.cod_clave_declarado AS t_cod_clave_declarado,
			t.cod_tipo_importe AS t_cod_tipo_importe,
			t.id_provincia AS t_id_provincia,
			t.id_pais AS t_id_pais,
			t.id_tipo_codigo AS t_id_tipo_codigo,
			t.id_clave_identificacion_fondo AS t_id_clave_identificacion_fondo,
			t.id_clave_origen AS t_id_clave_origen,
			t.id_clave_operacion_198 AS t_id_clave_operacion_198,
			t.id_clave_mercado AS t_id_clave_mercado,
			t.id_clave_valor AS t_id_clave_valor,
			t.id_clave_declarado AS t_id_clave_declarado,
			t.id_tipo_importe AS t_id_tipo_importe,
			query.id_clave_representacion AS id_clave_representacion,
			query.cod_provincia AS cod_provincia,
			query.cod_pais AS cod_pais,
			query.cod_tipo_codigo AS cod_tipo_codigo,
			query.cod_clave_identificacion_fondo AS cod_clave_identificacion_fondo,
			query.cod_clave_origen AS cod_clave_origen,
			query.cod_clave_operacion_198 AS cod_clave_operacion_198,
			query.cod_clave_mercado AS cod_clave_mercado,
			query.cod_clave_valor AS cod_clave_valor,
			query.cod_clave_declarado AS cod_clave_declarado,
			query.cod_tipo_importe AS cod_tipo_importe,
			query.id_provincia AS id_provincia,
			query.id_pais AS id_pais,
			query.id_tipo_codigo AS id_tipo_codigo,
			query.id_clave_identificacion_fondo AS id_clave_identificacion_fondo,
			query.id_clave_origen AS id_clave_origen,
			query.id_clave_operacion_198 AS id_clave_operacion_198,
			query.id_clave_mercado AS id_clave_mercado,
			query.id_clave_valor AS id_clave_valor,
			query.id_clave_declarado AS id_clave_declarado,
			query.id_tipo_importe AS id_tipo_importe
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle AS t
		FULL JOIN query on ((query.id_clave_representacion=t.id_clave_representacion OR (query.id_clave_representacion IS NULL AND t.id_clave_representacion IS NULL)) AND (query.cod_provincia=t.cod_provincia OR (query.cod_provincia IS NULL AND t.cod_provincia IS NULL)) AND (query.cod_pais=t.cod_pais OR (query.cod_pais IS NULL AND t.cod_pais IS NULL)) AND (query.cod_tipo_codigo=t.cod_tipo_codigo OR (query.cod_tipo_codigo IS NULL AND t.cod_tipo_codigo IS NULL)) AND (query.cod_clave_identificacion_fondo=t.cod_clave_identificacion_fondo OR (query.cod_clave_identificacion_fondo IS NULL AND t.cod_clave_identificacion_fondo IS NULL)) AND (query.cod_clave_origen=t.cod_clave_origen OR (query.cod_clave_origen IS NULL AND t.cod_clave_origen IS NULL)) AND (query.cod_clave_operacion_198=t.cod_clave_operacion_198 OR (query.cod_clave_operacion_198 IS NULL AND t.cod_clave_operacion_198 IS NULL)) AND (query.cod_clave_mercado=t.cod_clave_mercado OR (query.cod_clave_mercado IS NULL AND t.cod_clave_mercado IS NULL)) AND (query.cod_clave_valor=t.cod_clave_valor OR (query.cod_clave_valor IS NULL AND t.cod_clave_valor IS NULL)) AND (query.cod_clave_declarado=t.cod_clave_declarado OR (query.cod_clave_declarado IS NULL AND t.cod_clave_declarado IS NULL)) AND (query.cod_tipo_importe=t.cod_tipo_importe OR (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NULL)) AND (query.id_provincia=t.id_provincia OR (query.id_provincia IS NULL AND t.id_provincia IS NULL)) AND (query.id_pais=t.id_pais OR (query.id_pais IS NULL AND t.id_pais IS NULL)) AND (query.id_tipo_codigo=t.id_tipo_codigo OR (query.id_tipo_codigo IS NULL AND t.id_tipo_codigo IS NULL)) AND (query.id_clave_identificacion_fondo=t.id_clave_identificacion_fondo OR (query.id_clave_identificacion_fondo IS NULL AND t.id_clave_identificacion_fondo IS NULL)) AND (query.id_clave_origen=t.id_clave_origen OR (query.id_clave_origen IS NULL AND t.id_clave_origen IS NULL)) AND (query.id_clave_operacion_198=t.id_clave_operacion_198 OR (query.id_clave_operacion_198 IS NULL AND t.id_clave_operacion_198 IS NULL)) AND (query.id_clave_mercado=t.id_clave_mercado OR (query.id_clave_mercado IS NULL AND t.id_clave_mercado IS NULL)) AND (query.id_clave_valor=t.id_clave_valor OR (query.id_clave_valor IS NULL AND t.id_clave_valor IS NULL)) AND (query.id_clave_declarado=t.id_clave_declarado OR (query.id_clave_declarado IS NULL AND t.id_clave_declarado IS NULL)) AND (query.id_tipo_importe=t.id_tipo_importe OR (query.id_tipo_importe IS NULL AND t.id_tipo_importe IS NULL)))
		WHERE 
			id_dim_datos_detalle IS NULL OR
			((query.id_clave_representacion IS NULL AND t.id_clave_representacion IS NOT NULL) AND (query.cod_provincia IS NULL AND t.cod_provincia IS NOT NULL) AND (query.cod_pais IS NULL AND t.cod_pais IS NOT NULL) AND (query.cod_tipo_codigo IS NULL AND t.cod_tipo_codigo IS NOT NULL) AND (query.cod_clave_identificacion_fondo IS NULL AND t.cod_clave_identificacion_fondo IS NOT NULL) AND (query.cod_clave_origen IS NULL AND t.cod_clave_origen IS NOT NULL) AND (query.cod_clave_operacion_198 IS NULL AND t.cod_clave_operacion_198 IS NOT NULL) AND (query.cod_clave_mercado IS NULL AND t.cod_clave_mercado IS NOT NULL) AND (query.cod_clave_valor IS NULL AND t.cod_clave_valor IS NOT NULL) AND (query.cod_clave_declarado IS NULL AND t.cod_clave_declarado IS NOT NULL) AND (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NOT NULL) AND (query.id_provincia IS NULL AND t.id_provincia IS NOT NULL) AND (query.id_pais IS NULL AND t.id_pais IS NOT NULL) AND (query.id_tipo_codigo IS NULL AND t.id_tipo_codigo IS NOT NULL) AND (query.id_clave_identificacion_fondo IS NULL AND t.id_clave_identificacion_fondo IS NOT NULL) AND (query.id_clave_origen IS NULL AND t.id_clave_origen IS NOT NULL) AND (query.id_clave_operacion_198 IS NULL AND t.id_clave_operacion_198 IS NOT NULL) AND (query.id_clave_mercado IS NULL AND t.id_clave_mercado IS NOT NULL) AND (query.id_clave_valor IS NULL AND t.id_clave_valor IS NOT NULL) AND (query.id_clave_declarado IS NULL AND t.id_clave_declarado IS NOT NULL) AND (query.id_tipo_importe IS NULL AND t.id_tipo_importe IS NOT NULL)) OR
			(t.id_clave_representacion<>query.id_clave_representacion OR (t.id_clave_representacion IS NULL AND query.id_clave_representacion IS NOT NULL)
                                                  OR (t.id_clave_representacion IS NOT NULL AND query.id_clave_representacion IS NULL)
				OR t.cod_provincia<>query.cod_provincia OR (t.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL)
                                                  OR (t.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)
				OR t.cod_pais<>query.cod_pais OR (t.cod_pais IS NULL AND query.cod_pais IS NOT NULL)
                                                  OR (t.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
				OR t.cod_tipo_codigo<>query.cod_tipo_codigo OR (t.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL)
                                                  OR (t.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
				OR t.cod_clave_identificacion_fondo<>query.cod_clave_identificacion_fondo OR (t.cod_clave_identificacion_fondo IS NULL AND query.cod_clave_identificacion_fondo IS NOT NULL)
                                                  OR (t.cod_clave_identificacion_fondo IS NOT NULL AND query.cod_clave_identificacion_fondo IS NULL)
				OR t.cod_clave_origen<>query.cod_clave_origen OR (t.cod_clave_origen IS NULL AND query.cod_clave_origen IS NOT NULL)
                                                  OR (t.cod_clave_origen IS NOT NULL AND query.cod_clave_origen IS NULL)
				OR t.cod_clave_operacion_198<>query.cod_clave_operacion_198 OR (t.cod_clave_operacion_198 IS NULL AND query.cod_clave_operacion_198 IS NOT NULL)
                                                  OR (t.cod_clave_operacion_198 IS NOT NULL AND query.cod_clave_operacion_198 IS NULL)
				OR t.cod_clave_mercado<>query.cod_clave_mercado OR (t.cod_clave_mercado IS NULL AND query.cod_clave_mercado IS NOT NULL)
                                                  OR (t.cod_clave_mercado IS NOT NULL AND query.cod_clave_mercado IS NULL)
				OR t.cod_clave_valor<>query.cod_clave_valor OR (t.cod_clave_valor IS NULL AND query.cod_clave_valor IS NOT NULL)
                                                  OR (t.cod_clave_valor IS NOT NULL AND query.cod_clave_valor IS NULL)
				OR t.cod_clave_declarado<>query.cod_clave_declarado OR (t.cod_clave_declarado IS NULL AND query.cod_clave_declarado IS NOT NULL)
                                                  OR (t.cod_clave_declarado IS NOT NULL AND query.cod_clave_declarado IS NULL)
				OR t.cod_tipo_importe<>query.cod_tipo_importe OR (t.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL)
                                                  OR (t.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
				OR t.id_provincia<>query.id_provincia OR (t.id_provincia IS NULL AND query.id_provincia IS NOT NULL)
                                                  OR (t.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
				OR t.id_pais<>query.id_pais OR (t.id_pais IS NULL AND query.id_pais IS NOT NULL)
                                                  OR (t.id_pais IS NOT NULL AND query.id_pais IS NULL)
				OR t.id_tipo_codigo<>query.id_tipo_codigo OR (t.id_tipo_codigo IS NULL AND query.id_tipo_codigo IS NOT NULL)
                                                  OR (t.id_tipo_codigo IS NOT NULL AND query.id_tipo_codigo IS NULL)
				OR t.id_clave_identificacion_fondo<>query.id_clave_identificacion_fondo OR (t.id_clave_identificacion_fondo IS NULL AND query.id_clave_identificacion_fondo IS NOT NULL)
                                                  OR (t.id_clave_identificacion_fondo IS NOT NULL AND query.id_clave_identificacion_fondo IS NULL)
				OR t.id_clave_origen<>query.id_clave_origen OR (t.id_clave_origen IS NULL AND query.id_clave_origen IS NOT NULL)
                                                  OR (t.id_clave_origen IS NOT NULL AND query.id_clave_origen IS NULL)
				OR t.id_clave_operacion_198<>query.id_clave_operacion_198 OR (t.id_clave_operacion_198 IS NULL AND query.id_clave_operacion_198 IS NOT NULL)
                                                  OR (t.id_clave_operacion_198 IS NOT NULL AND query.id_clave_operacion_198 IS NULL)
				OR t.id_clave_mercado<>query.id_clave_mercado OR (t.id_clave_mercado IS NULL AND query.id_clave_mercado IS NOT NULL)
                                                  OR (t.id_clave_mercado IS NOT NULL AND query.id_clave_mercado IS NULL)
				OR t.id_clave_valor<>query.id_clave_valor OR (t.id_clave_valor IS NULL AND query.id_clave_valor IS NOT NULL)
                                                  OR (t.id_clave_valor IS NOT NULL AND query.id_clave_valor IS NULL)
				OR t.id_clave_declarado<>query.id_clave_declarado OR (t.id_clave_declarado IS NULL AND query.id_clave_declarado IS NOT NULL)
                                                  OR (t.id_clave_declarado IS NOT NULL AND query.id_clave_declarado IS NULL)
				OR t.id_tipo_importe<>query.id_tipo_importe OR (t.id_tipo_importe IS NULL AND query.id_tipo_importe IS NOT NULL)
                                                  OR (t.id_tipo_importe IS NOT NULL AND query.id_tipo_importe IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_dim_datos_detalle
		SELECT @count_ins = count(*) from #tmp_mi_198_dim_datos_detalle where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_1')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_2')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_3')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_4')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_5')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_6')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_7')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_8')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_8 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_9')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_9 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_10')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_10 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_11')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_11 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle
			SET
				id_clave_representacion=s.id_clave_representacion,
				cod_provincia=s.cod_provincia,
				cod_pais=s.cod_pais,
				cod_tipo_codigo=s.cod_tipo_codigo,
				cod_clave_identificacion_fondo=s.cod_clave_identificacion_fondo,
				cod_clave_origen=s.cod_clave_origen,
				cod_clave_operacion_198=s.cod_clave_operacion_198,
				cod_clave_mercado=s.cod_clave_mercado,
				cod_clave_valor=s.cod_clave_valor,
				cod_clave_declarado=s.cod_clave_declarado,
				cod_tipo_importe=s.cod_tipo_importe,
				id_provincia=s.id_provincia,
				id_pais=s.id_pais,
				id_tipo_codigo=s.id_tipo_codigo,
				id_clave_identificacion_fondo=s.id_clave_identificacion_fondo,
				id_clave_origen=s.id_clave_origen,
				id_clave_operacion_198=s.id_clave_operacion_198,
				id_clave_mercado=s.id_clave_mercado,
				id_clave_valor=s.id_clave_valor,
				id_clave_declarado=s.id_clave_declarado,
				id_tipo_importe=s.id_tipo_importe
		FROM (
			SELECT
				id_clave_representacion,
				cod_provincia,
				cod_pais,
				cod_tipo_codigo,
				cod_clave_identificacion_fondo,
				cod_clave_origen,
				cod_clave_operacion_198,
				cod_clave_mercado,
				cod_clave_valor,
				cod_clave_declarado,
				cod_tipo_importe,
				id_provincia,
				id_pais,
				id_tipo_codigo,
				id_clave_identificacion_fondo,
				id_clave_origen,
				id_clave_operacion_198,
				id_clave_mercado,
				id_clave_valor,
				id_clave_declarado,
				id_tipo_importe
			FROM #tmp_mi_198_dim_datos_detalle
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_representacion=s.id_clave_representacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_representacion IS NULL AND s.id_clave_representacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_provincia=s.cod_provincia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_provincia IS NULL AND s.cod_provincia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_pais=s.cod_pais OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_pais IS NULL AND s.cod_pais IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_tipo_codigo=s.cod_tipo_codigo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_tipo_codigo IS NULL AND s.cod_tipo_codigo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_identificacion_fondo=s.cod_clave_identificacion_fondo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_identificacion_fondo IS NULL AND s.cod_clave_identificacion_fondo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_origen=s.cod_clave_origen OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_origen IS NULL AND s.cod_clave_origen IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_operacion_198=s.cod_clave_operacion_198 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_operacion_198 IS NULL AND s.cod_clave_operacion_198 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_mercado=s.cod_clave_mercado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_mercado IS NULL AND s.cod_clave_mercado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_valor=s.cod_clave_valor OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_valor IS NULL AND s.cod_clave_valor IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_declarado=s.cod_clave_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_clave_declarado IS NULL AND s.cod_clave_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_tipo_importe=s.cod_tipo_importe OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.cod_tipo_importe IS NULL AND s.cod_tipo_importe IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_provincia=s.id_provincia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_provincia IS NULL AND s.id_provincia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_pais=s.id_pais OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_pais IS NULL AND s.id_pais IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_tipo_codigo=s.id_tipo_codigo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_tipo_codigo IS NULL AND s.id_tipo_codigo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_identificacion_fondo=s.id_clave_identificacion_fondo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_identificacion_fondo IS NULL AND s.id_clave_identificacion_fondo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_origen=s.id_clave_origen OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_origen IS NULL AND s.id_clave_origen IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_operacion_198=s.id_clave_operacion_198 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_operacion_198 IS NULL AND s.id_clave_operacion_198 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_mercado=s.id_clave_mercado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_mercado IS NULL AND s.id_clave_mercado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_valor=s.id_clave_valor OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_valor IS NULL AND s.id_clave_valor IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_declarado=s.id_clave_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_clave_declarado IS NULL AND s.id_clave_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_tipo_importe=s.id_tipo_importe OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle.id_tipo_importe IS NULL AND s.id_tipo_importe IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle AS tbn1_mi_198_dim_datos_detalle
		INNER JOIN #tmp_mi_198_dim_datos_detalle AS tmp
		ON ((tbn1_mi_198_dim_datos_detalle.id_clave_representacion=tmp.t_id_clave_representacion OR (tbn1_mi_198_dim_datos_detalle.id_clave_representacion IS NULL AND tmp.t_id_clave_representacion IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_provincia=tmp.t_cod_provincia OR (tbn1_mi_198_dim_datos_detalle.cod_provincia IS NULL AND tmp.t_cod_provincia IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_pais=tmp.t_cod_pais OR (tbn1_mi_198_dim_datos_detalle.cod_pais IS NULL AND tmp.t_cod_pais IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_tipo_codigo=tmp.t_cod_tipo_codigo OR (tbn1_mi_198_dim_datos_detalle.cod_tipo_codigo IS NULL AND tmp.t_cod_tipo_codigo IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_clave_identificacion_fondo=tmp.t_cod_clave_identificacion_fondo OR (tbn1_mi_198_dim_datos_detalle.cod_clave_identificacion_fondo IS NULL AND tmp.t_cod_clave_identificacion_fondo IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_clave_origen=tmp.t_cod_clave_origen OR (tbn1_mi_198_dim_datos_detalle.cod_clave_origen IS NULL AND tmp.t_cod_clave_origen IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_clave_operacion_198=tmp.t_cod_clave_operacion_198 OR (tbn1_mi_198_dim_datos_detalle.cod_clave_operacion_198 IS NULL AND tmp.t_cod_clave_operacion_198 IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_clave_mercado=tmp.t_cod_clave_mercado OR (tbn1_mi_198_dim_datos_detalle.cod_clave_mercado IS NULL AND tmp.t_cod_clave_mercado IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_clave_valor=tmp.t_cod_clave_valor OR (tbn1_mi_198_dim_datos_detalle.cod_clave_valor IS NULL AND tmp.t_cod_clave_valor IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_clave_declarado=tmp.t_cod_clave_declarado OR (tbn1_mi_198_dim_datos_detalle.cod_clave_declarado IS NULL AND tmp.t_cod_clave_declarado IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.cod_tipo_importe=tmp.t_cod_tipo_importe OR (tbn1_mi_198_dim_datos_detalle.cod_tipo_importe IS NULL AND tmp.t_cod_tipo_importe IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_provincia=tmp.t_id_provincia OR (tbn1_mi_198_dim_datos_detalle.id_provincia IS NULL AND tmp.t_id_provincia IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_pais=tmp.t_id_pais OR (tbn1_mi_198_dim_datos_detalle.id_pais IS NULL AND tmp.t_id_pais IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_tipo_codigo=tmp.t_id_tipo_codigo OR (tbn1_mi_198_dim_datos_detalle.id_tipo_codigo IS NULL AND tmp.t_id_tipo_codigo IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_clave_identificacion_fondo=tmp.t_id_clave_identificacion_fondo OR (tbn1_mi_198_dim_datos_detalle.id_clave_identificacion_fondo IS NULL AND tmp.t_id_clave_identificacion_fondo IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_clave_origen=tmp.t_id_clave_origen OR (tbn1_mi_198_dim_datos_detalle.id_clave_origen IS NULL AND tmp.t_id_clave_origen IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_clave_operacion_198=tmp.t_id_clave_operacion_198 OR (tbn1_mi_198_dim_datos_detalle.id_clave_operacion_198 IS NULL AND tmp.t_id_clave_operacion_198 IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_clave_mercado=tmp.t_id_clave_mercado OR (tbn1_mi_198_dim_datos_detalle.id_clave_mercado IS NULL AND tmp.t_id_clave_mercado IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_clave_valor=tmp.t_id_clave_valor OR (tbn1_mi_198_dim_datos_detalle.id_clave_valor IS NULL AND tmp.t_id_clave_valor IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_clave_declarado=tmp.t_id_clave_declarado OR (tbn1_mi_198_dim_datos_detalle.id_clave_declarado IS NULL AND tmp.t_id_clave_declarado IS NULL)) AND (tbn1_mi_198_dim_datos_detalle.id_tipo_importe=tmp.t_id_tipo_importe OR (tbn1_mi_198_dim_datos_detalle.id_tipo_importe IS NULL AND tmp.t_id_tipo_importe IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle WITH(TABLOCK) (id_clave_representacion,cod_provincia,cod_pais,cod_tipo_codigo,cod_clave_identificacion_fondo,cod_clave_origen,cod_clave_operacion_198,cod_clave_mercado,cod_clave_valor,cod_clave_declarado,cod_tipo_importe,id_provincia,id_pais,id_tipo_codigo,id_clave_identificacion_fondo,id_clave_origen,id_clave_operacion_198,id_clave_mercado,id_clave_valor,id_clave_declarado,id_tipo_importe)
		SELECT
			id_clave_representacion,
			cod_provincia,
			cod_pais,
			cod_tipo_codigo,
			cod_clave_identificacion_fondo,
			cod_clave_origen,
			cod_clave_operacion_198,
			cod_clave_mercado,
			cod_clave_valor,
			cod_clave_declarado,
			cod_tipo_importe,
			id_provincia,
			id_pais,
			id_tipo_codigo,
			id_clave_identificacion_fondo,
			id_clave_origen,
			id_clave_operacion_198,
			id_clave_mercado,
			id_clave_valor,
			id_clave_declarado,
			id_tipo_importe
			FROM #tmp_mi_198_dim_datos_detalle
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_1')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_2')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_3')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_4')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_5')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_6')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_7')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_8')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_8 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_9')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_9 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_10')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_10 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_11')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_11 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_dim_datos_detalle_unique')
			ALTER INDEX IX_tbn1_mi_198_dim_datos_detalle_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle REBUILD
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


USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_198_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_198_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_198_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_fact'
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

		IF OBJECT_ID('tempdb..#tmp_mi_198_fact') IS NOT NULL
			DROP TABLE #tmp_mi_198_fact
		CREATE table #tmp_mi_198_fact(
			rr_mode varchar(1),
			id int,
			t_id_dim_documentos int,
			t_id_dim_periodos int,
			t_id_dim_declarados int,
			t_id_dim_datos_caratula int,
			t_id_dim_declarantes int,
			t_id_dim_marcas int,
			t_id_dim_datos_detalle int,
			id_dim_documentos int,
			id_dim_periodos int,
			id_dim_declarados int,
			id_dim_datos_caratula int,
			id_dim_declarantes int,
			id_dim_marcas int,
			id_dim_datos_detalle int,
			volumen_operaciones decimal(18, 2),
			num_activos decimal(15, 2),
			porc_participacion decimal(15, 2),
			importe numeric(18, 2)
		);

		;WITH
		query AS (
	SELECT
		tbn1_mi_198_dim_documentos.id_dim_documentos AS id_dim_documentos,
		tbn1_mi_198_dim_periodos.id_dim_periodos AS id_dim_periodos,
		tbn1_mi_198_dim_declarados.id_dim_declarados AS id_dim_declarados,
		tbn1_mi_198_dim_datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
		tbn1_mi_198_dim_declarantes.id_dim_declarantes AS id_dim_declarantes,
		tbn1_mi_198_dim_marcas.id_dim_marcas AS id_dim_marcas,
		tbn1_mi_198_dim_datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
		sum(st.volumen_operaciones) AS volumen_operaciones,
		sum(st.num_activos) AS num_activos,
		sum(st.porc_participacion) AS porc_participacion,
		sum(st.importe) AS importe
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_198_activos_financieros st
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos AS tbn1_mi_198_dim_documentos ON (tbn1_mi_198_dim_documentos.id_documento=st.id_documento AND tbn1_mi_198_dim_documentos.id_expediente=st.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos AS tbn1_mi_198_dim_periodos ON (tbn1_mi_198_dim_periodos.ejercicio=st.ejercicio AND tbn1_mi_198_dim_periodos.fecha_presentacion=st.fecha_presentacion AND tbn1_mi_198_dim_periodos.mes_presentacion=st.mes_presentacion AND tbn1_mi_198_dim_periodos.anyo_presentacion=st.anyo_presentacion AND tbn1_mi_198_dim_periodos.fecha_operacion=st.fecha_operacion AND tbn1_mi_198_dim_periodos.mes_operacion=st.mes_operacion AND tbn1_mi_198_dim_periodos.anyo_operacion=st.anyo_operacion AND tbn1_mi_198_dim_periodos.fecha_vcto_prestamo=st.fecha_vcto_prestamo AND tbn1_mi_198_dim_periodos.mes_vencimiento_prestamo=st.mes_vencimiento_prestamo AND tbn1_mi_198_dim_periodos.anyo_vencimiento_prestamo=st.anyo_vencimiento_prestamo AND tbn1_mi_198_dim_periodos.fecha_carga=st.fecha_carga)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados AS tbn1_mi_198_dim_declarados ON (tbn1_mi_198_dim_declarados.secuencia=st.secuencia AND tbn1_mi_198_dim_declarados.nif_declarado_198=st.nif_declarado_198 AND tbn1_mi_198_dim_declarados.nif_declarado_no_identificado=st.nif_declarado_no_identificado AND tbn1_mi_198_dim_declarados.id_contribuyente_declarado=st.id_contribuyente_declarado AND tbn1_mi_198_dim_declarados.num_perceptores=st.num_perceptores AND tbn1_mi_198_dim_declarados.nro_orden=st.nro_orden AND tbn1_mi_198_dim_declarados.banco=st.banco AND tbn1_mi_198_dim_declarados.sucursal=st.sucursal AND tbn1_mi_198_dim_declarados.num_cuenta=st.num_cuenta AND tbn1_mi_198_dim_declarados.emisor=st.emisor AND tbn1_mi_198_dim_declarados.cod_relacion=st.cod_relacion AND tbn1_mi_198_dim_declarados.id_mae_no_id_declarado=st.id_mae_no_id_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula AS tbn1_mi_198_dim_datos_caratula ON (tbn1_mi_198_dim_datos_caratula.modelo=st.modelo AND tbn1_mi_198_dim_datos_caratula.delegacion_hacienda=st.delegacion_hacienda AND tbn1_mi_198_dim_datos_caratula.cod_administracion=st.cod_administracion AND tbn1_mi_198_dim_datos_caratula.cod_tipo_presentacion=st.cod_tipo_presentacion AND tbn1_mi_198_dim_datos_caratula.cod_tipo_declaracion=st.cod_tipo_declaracion)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes AS tbn1_mi_198_dim_declarantes ON (tbn1_mi_198_dim_declarantes.nif_declarante_198=st.nif_declarante_198 AND tbn1_mi_198_dim_declarantes.nif_declarante_no_identificado=st.nif_declarante_no_identificado AND tbn1_mi_198_dim_declarantes.id_contribuyente_declarante=st.id_contribuyente_declarante AND tbn1_mi_198_dim_declarantes.telefono=st.telefono AND tbn1_mi_198_dim_declarantes.razon_social=st.razon_social AND tbn1_mi_198_dim_declarantes.cod_presentador_colectivo=st.cod_presentador_colectivo AND tbn1_mi_198_dim_declarantes.cod_entidad_gestora=st.cod_entidad_gestora AND tbn1_mi_198_dim_declarantes.id_mae_no_id_declarante=st.id_mae_no_id_declarante)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas AS tbn1_mi_198_dim_marcas ON (tbn1_mi_198_dim_marcas.es_contribuyente_declarante=st.es_contribuyente_declarante AND tbn1_mi_198_dim_marcas.es_externo=st.es_externo AND tbn1_mi_198_dim_marcas.es_contribuyente_declarado=st.es_contribuyente_declarado AND tbn1_mi_198_dim_marcas.es_identificado_declarante=st.es_identificado_declarante AND tbn1_mi_198_dim_marcas.sw_identificado_declarante=st.sw_identificado_declarante AND tbn1_mi_198_dim_marcas.es_erroneo_declarante=st.es_erroneo_declarante AND tbn1_mi_198_dim_marcas.es_historico=st.es_historico AND tbn1_mi_198_dim_marcas.es_representante=st.es_representante AND tbn1_mi_198_dim_marcas.es_identificado_declarado=st.es_identificado_declarado AND tbn1_mi_198_dim_marcas.sw_identificado_declarado=st.sw_identificado_declarado AND tbn1_mi_198_dim_marcas.es_erroneo_declarado=st.es_erroneo_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle AS tbn1_mi_198_dim_datos_detalle ON (tbn1_mi_198_dim_datos_detalle.cod_provincia=st.cod_provincia AND tbn1_mi_198_dim_datos_detalle.cod_pais=st.cod_pais AND tbn1_mi_198_dim_datos_detalle.cod_tipo_codigo=st.cod_tipo_codigo AND tbn1_mi_198_dim_datos_detalle.cod_clave_identificacion_fondo=st.cod_clave_identificacion_fondo AND tbn1_mi_198_dim_datos_detalle.cod_clave_origen=st.cod_clave_origen AND tbn1_mi_198_dim_datos_detalle.cod_clave_operacion_198=st.cod_clave_operacion_198 AND tbn1_mi_198_dim_datos_detalle.cod_clave_mercado=st.cod_clave_mercado AND tbn1_mi_198_dim_datos_detalle.id_clave_representacion=st.id_clave_representacion AND tbn1_mi_198_dim_datos_detalle.cod_clave_valor=st.cod_clave_valor AND tbn1_mi_198_dim_datos_detalle.cod_clave_declarado=st.cod_clave_declarado AND tbn1_mi_198_dim_datos_detalle.cod_tipo_importe=st.cod_tipo_importe)
	GROUP BY
	id_dim_documentos,
	id_dim_periodos,
	id_dim_declarados,
	id_dim_datos_caratula,
	id_dim_declarantes,
	id_dim_marcas,
	id_dim_datos_detalle
		)
		INSERT INTO #tmp_mi_198_fact (rr_mode,id,t_id_dim_documentos,t_id_dim_periodos,t_id_dim_declarados,t_id_dim_datos_caratula,t_id_dim_declarantes,t_id_dim_marcas,t_id_dim_datos_detalle,id_dim_documentos,id_dim_periodos,id_dim_declarados,id_dim_datos_caratula,id_dim_declarantes,id_dim_marcas,id_dim_datos_detalle,volumen_operaciones,num_activos,porc_participacion,importe)
		SELECT
			rr_mode=
				CASE
					WHEN t.id IS NULL THEN 'I'
					WHEN (query.id_dim_documentos IS NULL AND t.id_dim_documentos IS NOT NULL) AND (query.id_dim_periodos IS NULL AND t.id_dim_periodos IS NOT NULL) AND (query.id_dim_declarados IS NULL AND t.id_dim_declarados IS NOT NULL) AND (query.id_dim_datos_caratula IS NULL AND t.id_dim_datos_caratula IS NOT NULL) AND (query.id_dim_declarantes IS NULL AND t.id_dim_declarantes IS NOT NULL) AND (query.id_dim_marcas IS NULL AND t.id_dim_marcas IS NOT NULL) AND (query.id_dim_datos_detalle IS NULL AND t.id_dim_datos_detalle IS NOT NULL) THEN 'D'
					ELSE 'U' END,
			t.id AS id,
			t.id_dim_documentos AS t_id_dim_documentos,
			t.id_dim_periodos AS t_id_dim_periodos,
			t.id_dim_declarados AS t_id_dim_declarados,
			t.id_dim_datos_caratula AS t_id_dim_datos_caratula,
			t.id_dim_declarantes AS t_id_dim_declarantes,
			t.id_dim_marcas AS t_id_dim_marcas,
			t.id_dim_datos_detalle AS t_id_dim_datos_detalle,
			query.id_dim_documentos AS id_dim_documentos,
			query.id_dim_periodos AS id_dim_periodos,
			query.id_dim_declarados AS id_dim_declarados,
			query.id_dim_datos_caratula AS id_dim_datos_caratula,
			query.id_dim_declarantes AS id_dim_declarantes,
			query.id_dim_marcas AS id_dim_marcas,
			query.id_dim_datos_detalle AS id_dim_datos_detalle,
			query.volumen_operaciones AS volumen_operaciones,
			query.num_activos AS num_activos,
			query.porc_participacion AS porc_participacion,
			query.importe AS importe
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact AS t
		FULL JOIN query on ((query.id_dim_documentos=t.id_dim_documentos OR (query.id_dim_documentos IS NULL AND t.id_dim_documentos IS NULL)) AND (query.id_dim_periodos=t.id_dim_periodos OR (query.id_dim_periodos IS NULL AND t.id_dim_periodos IS NULL)) AND (query.id_dim_declarados=t.id_dim_declarados OR (query.id_dim_declarados IS NULL AND t.id_dim_declarados IS NULL)) AND (query.id_dim_datos_caratula=t.id_dim_datos_caratula OR (query.id_dim_datos_caratula IS NULL AND t.id_dim_datos_caratula IS NULL)) AND (query.id_dim_declarantes=t.id_dim_declarantes OR (query.id_dim_declarantes IS NULL AND t.id_dim_declarantes IS NULL)) AND (query.id_dim_marcas=t.id_dim_marcas OR (query.id_dim_marcas IS NULL AND t.id_dim_marcas IS NULL)) AND (query.id_dim_datos_detalle=t.id_dim_datos_detalle OR (query.id_dim_datos_detalle IS NULL AND t.id_dim_datos_detalle IS NULL)))
		WHERE 
			id IS NULL OR
			((query.id_dim_documentos IS NULL AND t.id_dim_documentos IS NOT NULL) AND (query.id_dim_periodos IS NULL AND t.id_dim_periodos IS NOT NULL) AND (query.id_dim_declarados IS NULL AND t.id_dim_declarados IS NOT NULL) AND (query.id_dim_datos_caratula IS NULL AND t.id_dim_datos_caratula IS NOT NULL) AND (query.id_dim_declarantes IS NULL AND t.id_dim_declarantes IS NOT NULL) AND (query.id_dim_marcas IS NULL AND t.id_dim_marcas IS NOT NULL) AND (query.id_dim_datos_detalle IS NULL AND t.id_dim_datos_detalle IS NOT NULL)) OR
			(t.id_dim_documentos<>query.id_dim_documentos OR (t.id_dim_documentos IS NULL AND query.id_dim_documentos IS NOT NULL)
                                                  OR (t.id_dim_documentos IS NOT NULL AND query.id_dim_documentos IS NULL)
				OR t.id_dim_periodos<>query.id_dim_periodos OR (t.id_dim_periodos IS NULL AND query.id_dim_periodos IS NOT NULL)
                                                  OR (t.id_dim_periodos IS NOT NULL AND query.id_dim_periodos IS NULL)
				OR t.id_dim_declarados<>query.id_dim_declarados OR (t.id_dim_declarados IS NULL AND query.id_dim_declarados IS NOT NULL)
                                                  OR (t.id_dim_declarados IS NOT NULL AND query.id_dim_declarados IS NULL)
				OR t.id_dim_datos_caratula<>query.id_dim_datos_caratula OR (t.id_dim_datos_caratula IS NULL AND query.id_dim_datos_caratula IS NOT NULL)
                                                  OR (t.id_dim_datos_caratula IS NOT NULL AND query.id_dim_datos_caratula IS NULL)
				OR t.id_dim_declarantes<>query.id_dim_declarantes OR (t.id_dim_declarantes IS NULL AND query.id_dim_declarantes IS NOT NULL)
                                                  OR (t.id_dim_declarantes IS NOT NULL AND query.id_dim_declarantes IS NULL)
				OR t.id_dim_marcas<>query.id_dim_marcas OR (t.id_dim_marcas IS NULL AND query.id_dim_marcas IS NOT NULL)
                                                  OR (t.id_dim_marcas IS NOT NULL AND query.id_dim_marcas IS NULL)
				OR t.id_dim_datos_detalle<>query.id_dim_datos_detalle OR (t.id_dim_datos_detalle IS NULL AND query.id_dim_datos_detalle IS NOT NULL)
                                                  OR (t.id_dim_datos_detalle IS NOT NULL AND query.id_dim_datos_detalle IS NULL)
				OR t.volumen_operaciones<>query.volumen_operaciones OR (t.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL)
                                                  OR (t.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
				OR t.num_activos<>query.num_activos OR (t.num_activos IS NULL AND query.num_activos IS NOT NULL)
                                                  OR (t.num_activos IS NOT NULL AND query.num_activos IS NULL)
				OR t.porc_participacion<>query.porc_participacion OR (t.porc_participacion IS NULL AND query.porc_participacion IS NOT NULL)
                                                  OR (t.porc_participacion IS NOT NULL AND query.porc_participacion IS NULL)
				OR t.importe<>query.importe OR (t.importe IS NULL AND query.importe IS NOT NULL)
                                                  OR (t.importe IS NOT NULL AND query.importe IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_198_fact
		SELECT @count_ins = count(*) from #tmp_mi_198_fact where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_1')
			ALTER INDEX IX_tbn1_mi_198_fact_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_2')
			ALTER INDEX IX_tbn1_mi_198_fact_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_3')
			ALTER INDEX IX_tbn1_mi_198_fact_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_4')
			ALTER INDEX IX_tbn1_mi_198_fact_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_5')
			ALTER INDEX IX_tbn1_mi_198_fact_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_6')
			ALTER INDEX IX_tbn1_mi_198_fact_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_7')
			ALTER INDEX IX_tbn1_mi_198_fact_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact
			SET
				id_dim_documentos=s.id_dim_documentos,
				id_dim_periodos=s.id_dim_periodos,
				id_dim_declarados=s.id_dim_declarados,
				id_dim_datos_caratula=s.id_dim_datos_caratula,
				id_dim_declarantes=s.id_dim_declarantes,
				id_dim_marcas=s.id_dim_marcas,
				id_dim_datos_detalle=s.id_dim_datos_detalle,
				volumen_operaciones=s.volumen_operaciones,
				num_activos=s.num_activos,
				porc_participacion=s.porc_participacion,
				importe=s.importe
		FROM (
			SELECT
				id_dim_documentos,
				id_dim_periodos,
				id_dim_declarados,
				id_dim_datos_caratula,
				id_dim_declarantes,
				id_dim_marcas,
				id_dim_datos_detalle,
				volumen_operaciones,
				num_activos,
				porc_participacion,
				importe
			FROM #tmp_mi_198_fact
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_documentos=s.id_dim_documentos OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_documentos IS NULL AND s.id_dim_documentos IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_periodos=s.id_dim_periodos OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_periodos IS NULL AND s.id_dim_periodos IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_declarados=s.id_dim_declarados OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_declarados IS NULL AND s.id_dim_declarados IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_datos_caratula=s.id_dim_datos_caratula OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_datos_caratula IS NULL AND s.id_dim_datos_caratula IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_declarantes=s.id_dim_declarantes OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_declarantes IS NULL AND s.id_dim_declarantes IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_marcas=s.id_dim_marcas OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_marcas IS NULL AND s.id_dim_marcas IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_datos_detalle=s.id_dim_datos_detalle OR (dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact.id_dim_datos_detalle IS NULL AND s.id_dim_datos_detalle IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact AS tbn1_mi_198_fact
		INNER JOIN #tmp_mi_198_fact AS tmp
		ON ((tbn1_mi_198_fact.id_dim_documentos=tmp.t_id_dim_documentos OR (tbn1_mi_198_fact.id_dim_documentos IS NULL AND tmp.t_id_dim_documentos IS NULL)) AND (tbn1_mi_198_fact.id_dim_periodos=tmp.t_id_dim_periodos OR (tbn1_mi_198_fact.id_dim_periodos IS NULL AND tmp.t_id_dim_periodos IS NULL)) AND (tbn1_mi_198_fact.id_dim_declarados=tmp.t_id_dim_declarados OR (tbn1_mi_198_fact.id_dim_declarados IS NULL AND tmp.t_id_dim_declarados IS NULL)) AND (tbn1_mi_198_fact.id_dim_datos_caratula=tmp.t_id_dim_datos_caratula OR (tbn1_mi_198_fact.id_dim_datos_caratula IS NULL AND tmp.t_id_dim_datos_caratula IS NULL)) AND (tbn1_mi_198_fact.id_dim_declarantes=tmp.t_id_dim_declarantes OR (tbn1_mi_198_fact.id_dim_declarantes IS NULL AND tmp.t_id_dim_declarantes IS NULL)) AND (tbn1_mi_198_fact.id_dim_marcas=tmp.t_id_dim_marcas OR (tbn1_mi_198_fact.id_dim_marcas IS NULL AND tmp.t_id_dim_marcas IS NULL)) AND (tbn1_mi_198_fact.id_dim_datos_detalle=tmp.t_id_dim_datos_detalle OR (tbn1_mi_198_fact.id_dim_datos_detalle IS NULL AND tmp.t_id_dim_datos_detalle IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_unique')
			ALTER INDEX IX_tbn1_mi_198_fact_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact WITH(TABLOCK) (id_dim_documentos,id_dim_periodos,id_dim_declarados,id_dim_datos_caratula,id_dim_declarantes,id_dim_marcas,id_dim_datos_detalle,volumen_operaciones,num_activos,porc_participacion,importe)
		SELECT
			id_dim_documentos,
			id_dim_periodos,
			id_dim_declarados,
			id_dim_datos_caratula,
			id_dim_declarantes,
			id_dim_marcas,
			id_dim_datos_detalle,
			volumen_operaciones,
			num_activos,
			porc_participacion,
			importe
			FROM #tmp_mi_198_fact
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_1')
			ALTER INDEX IX_tbn1_mi_198_fact_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_2')
			ALTER INDEX IX_tbn1_mi_198_fact_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_3')
			ALTER INDEX IX_tbn1_mi_198_fact_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_4')
			ALTER INDEX IX_tbn1_mi_198_fact_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_5')
			ALTER INDEX IX_tbn1_mi_198_fact_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_6')
			ALTER INDEX IX_tbn1_mi_198_fact_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_7')
			ALTER INDEX IX_tbn1_mi_198_fact_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_198_fact_unique')
			ALTER INDEX IX_tbn1_mi_198_fact_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact REBUILD
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


USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dm_mi_198' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dm_mi_198;
GO

CREATE PROCEDURE dbo.spn1_cargar_dm_mi_198(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dm_mi_198'
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

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact NOCHECK CONSTRAINT ALL
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_documentos @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_periodos @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_declarados @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_datos_caratula @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_declarantes @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_marcas @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_dim_datos_detalle @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_198_fact @logpadre;
		SET @rc=@@ROWCOUNT;

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_documentos WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_periodos WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarados WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_caratula WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_declarantes WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_marcas WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_dim_datos_detalle WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_198_fact WITH CHECK CHECK CONSTRAINT ALL
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
