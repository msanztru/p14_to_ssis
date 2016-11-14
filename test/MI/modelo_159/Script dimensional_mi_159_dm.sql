PRINT 'Script dimensional_mi_159_dm.sql'
GO


SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_documentos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos(
	id_dim_documentos int IDENTITY(1,1),
	id_documento int,
	id_expediente int,
	CONSTRAINT PK_tbn1_mi_159_dim_documentos PRIMARY KEY CLUSTERED (id_dim_documentos)
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
	AND table_name = 'tbn1_mi_159_dim_documentos'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_documentos')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_documentos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos ADD id_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_documentos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos ADD id_expediente int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_documentos'
	AND column_name NOT IN ('id_dim_documentos', 'id_documento', 'id_expediente')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos ALTER COLUMN id_documento int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos ALTER COLUMN id_expediente int NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_documentos_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos (id_documento)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_documentos_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos (id_expediente)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_documentos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos (id_documento,id_expediente) INCLUDE (id_dim_documentos)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos ADD CONSTRAINT FK_tbn1_mi_159_dim_documentos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos ADD CONSTRAINT FK_tbn1_mi_159_dim_documentos_tbn1_dim_expedientes FOREIGN KEY (id_expediente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_expedientes(id_expediente)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes(
	id_dim_declarantes int IDENTITY(1,1),
	id_mae_no_id_declarante int,
	nif_declarante_159 varchar(12),
	id_contribuyente_declarante int,
	telefono varchar(10),
	razon_social varchar(40),
	cod_presentador_colectivo int,
	cod_banco_espania varchar(4),
	CONSTRAINT PK_tbn1_mi_159_dim_declarantes PRIMARY KEY CLUSTERED (id_dim_declarantes)
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
	AND table_name = 'tbn1_mi_159_dim_declarantes'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_declarantes')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='id_mae_no_id_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD id_mae_no_id_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='nif_declarante_159')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD nif_declarante_159 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='id_contribuyente_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD id_contribuyente_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD telefono varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD cod_presentador_colectivo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarantes' AND COLUMN_NAME='cod_banco_espania')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD cod_banco_espania varchar(4)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_declarantes'
	AND column_name NOT IN ('id_dim_declarantes', 'id_mae_no_id_declarante', 'nif_declarante_159', 'id_contribuyente_declarante', 'telefono', 'razon_social', 'cod_presentador_colectivo', 'cod_banco_espania')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN id_mae_no_id_declarante int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN nif_declarante_159 varchar(12) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN id_contribuyente_declarante int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN telefono varchar(10) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN razon_social varchar(40) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN cod_presentador_colectivo int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ALTER COLUMN cod_banco_espania varchar(4) NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_declarantes_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes (id_mae_no_id_declarante)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_declarantes_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes (id_contribuyente_declarante)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_declarantes_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes (id_mae_no_id_declarante,nif_declarante_159,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania) INCLUDE (id_dim_declarantes)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_159_dim_declarantes_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes ADD CONSTRAINT FK_tbn1_mi_159_dim_declarantes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarante) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados(
	id_dim_declarados int IDENTITY(1,1),
	id_mae_no_id_declarado int,
	nif_declarado_159 varchar(12),
	secuencia varchar(9),
	id_contribuyente_declarado int,
	codigo_iban varchar(4),
	codigo_entidad varchar(4),
	codigo_sucursal varchar(4),
	digito_control varchar(2),
	numero_cuenta varchar(10),
	identificacion_extranjero varchar(15),
	contrato_suministro varchar(12),
	cups_num_libre_asignacion varchar(12),
	cups_digito_control varchar(2),
	referencia_catastral varchar(20),
	CONSTRAINT PK_tbn1_mi_159_dim_declarados PRIMARY KEY CLUSTERED (id_dim_declarados)
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
	AND table_name = 'tbn1_mi_159_dim_declarados'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_declarados')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='id_mae_no_id_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD id_mae_no_id_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='nif_declarado_159')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD nif_declarado_159 varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD secuencia varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='id_contribuyente_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD id_contribuyente_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='codigo_iban')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD codigo_iban varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='codigo_entidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD codigo_entidad varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='codigo_sucursal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD codigo_sucursal varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='digito_control')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD digito_control varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='numero_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD numero_cuenta varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='identificacion_extranjero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD identificacion_extranjero varchar(15)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='contrato_suministro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD contrato_suministro varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='cups_num_libre_asignacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD cups_num_libre_asignacion varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='cups_digito_control')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD cups_digito_control varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_declarados' AND COLUMN_NAME='referencia_catastral')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD referencia_catastral varchar(20)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_declarados'
	AND column_name NOT IN ('id_dim_declarados', 'id_mae_no_id_declarado', 'nif_declarado_159', 'secuencia', 'id_contribuyente_declarado', 'codigo_iban', 'codigo_entidad', 'codigo_sucursal', 'digito_control', 'numero_cuenta', 'identificacion_extranjero', 'contrato_suministro', 'cups_num_libre_asignacion', 'cups_digito_control', 'referencia_catastral')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN id_mae_no_id_declarado int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN nif_declarado_159 varchar(12) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN secuencia varchar(9) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN id_contribuyente_declarado int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN codigo_iban varchar(4) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN codigo_entidad varchar(4) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN codigo_sucursal varchar(4) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN digito_control varchar(2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN numero_cuenta varchar(10) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN identificacion_extranjero varchar(15) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN contrato_suministro varchar(12) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN cups_num_libre_asignacion varchar(12) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN cups_digito_control varchar(2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ALTER COLUMN referencia_catastral varchar(20) NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_declarados_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados (id_mae_no_id_declarado)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_declarados_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados (id_contribuyente_declarado)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_declarados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados (id_mae_no_id_declarado,nif_declarado_159,secuencia,id_contribuyente_declarado,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,numero_cuenta,identificacion_extranjero,contrato_suministro,cups_num_libre_asignacion,cups_digito_control,referencia_catastral) INCLUDE (id_dim_declarados)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD CONSTRAINT FK_tbn1_mi_159_dim_declarados_tbn1_mae_no_identificados FOREIGN KEY (id_mae_no_id_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados ADD CONSTRAINT FK_tbn1_mi_159_dim_declarados_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente_declarado) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc(
	id_dim_periodos_doc int IDENTITY(1,1),
	ejercicio smallint,
	fecha_presentacion date,
	mes_presentacion int,
	anyo_presentacion int,
	fecha_alta date,
	mes_alta int,
	anyo_alta int,
	CONSTRAINT PK_tbn1_mi_159_dim_periodos_doc PRIMARY KEY CLUSTERED (id_dim_periodos_doc)
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
	AND table_name = 'tbn1_mi_159_dim_periodos_doc'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_periodos_doc')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD ejercicio smallint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD fecha_presentacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='mes_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD mes_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='anyo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD anyo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='fecha_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD fecha_alta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='mes_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD mes_alta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos_doc' AND COLUMN_NAME='anyo_alta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ADD anyo_alta int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_periodos_doc'
	AND column_name NOT IN ('id_dim_periodos_doc', 'ejercicio', 'fecha_presentacion', 'mes_presentacion', 'anyo_presentacion', 'fecha_alta', 'mes_alta', 'anyo_alta')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN ejercicio smallint NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN fecha_presentacion date NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN mes_presentacion int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN anyo_presentacion int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN fecha_alta date NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN mes_alta int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc ALTER COLUMN anyo_alta int NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_periodos_doc_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta) INCLUDE (id_dim_periodos_doc)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula(
	id_dim_datos_caratula int IDENTITY(1,1),
	modelo varchar(3),
	regimen_fiscal_deducciones varchar(1),
	administracion_declarante varchar(1),
	cod_tipo_presentacion varchar(1),
	cod_tipo_declaracion varchar(1),
	id_administracion int,
	id_tipo_presentacion int,
	id_tipo_declaracion int,
	CONSTRAINT PK_tbn1_mi_159_dim_datos_caratula PRIMARY KEY CLUSTERED (id_dim_datos_caratula)
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
	AND table_name = 'tbn1_mi_159_dim_datos_caratula'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_datos_caratula')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD modelo varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='regimen_fiscal_deducciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD regimen_fiscal_deducciones varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='administracion_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD administracion_declarante varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD cod_tipo_presentacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='cod_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD cod_tipo_declaracion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD id_administracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD id_tipo_presentacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_caratula' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD id_tipo_declaracion int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_datos_caratula'
	AND column_name NOT IN ('id_dim_datos_caratula', 'modelo', 'regimen_fiscal_deducciones', 'administracion_declarante', 'cod_tipo_presentacion', 'cod_tipo_declaracion', 'id_administracion', 'id_tipo_presentacion', 'id_tipo_declaracion')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN modelo varchar(3) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN regimen_fiscal_deducciones varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN administracion_declarante varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN cod_tipo_presentacion varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN cod_tipo_declaracion varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN id_administracion int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN id_tipo_presentacion int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ALTER COLUMN id_tipo_declaracion int NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_caratula_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula (id_administracion)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_caratula_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula (id_tipo_presentacion)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_caratula_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula (id_tipo_declaracion)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_caratula_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula (modelo,regimen_fiscal_deducciones,id_administracion,id_tipo_presentacion,id_tipo_declaracion) INCLUDE (id_dim_datos_caratula)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_caratula_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_caratula_tbn1_dim_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(id_tipo_presentacion)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_caratula_tbn1_dim_mi_tipo_declaracion FOREIGN KEY (id_tipo_declaracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(id_tipo_declaracion)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas(
	id_dim_marcas int IDENTITY(1,1),
	es_externo_declarante bit,
	es_identificado_declarante bit,
	es_externo_declarado bit,
	es_identificado_declarado bit,
	es_erroneo_declarado bit,
	CONSTRAINT PK_tbn1_mi_159_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
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
	AND table_name = 'tbn1_mi_159_dim_marcas'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_marcas')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_marcas' AND COLUMN_NAME='es_externo_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ADD es_externo_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_marcas' AND COLUMN_NAME='es_identificado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ADD es_identificado_declarante bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_marcas' AND COLUMN_NAME='es_externo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ADD es_externo_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_marcas' AND COLUMN_NAME='es_identificado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ADD es_identificado_declarado bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_marcas' AND COLUMN_NAME='es_erroneo_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ADD es_erroneo_declarado bit
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_marcas'
	AND column_name NOT IN ('id_dim_marcas', 'es_externo_declarante', 'es_identificado_declarante', 'es_externo_declarado', 'es_identificado_declarado', 'es_erroneo_declarado')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ALTER COLUMN es_externo_declarante bit NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ALTER COLUMN es_identificado_declarante bit NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ALTER COLUMN es_externo_declarado bit NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ALTER COLUMN es_identificado_declarado bit NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas ALTER COLUMN es_erroneo_declarado bit NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_marcas_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas (es_externo_declarante,es_identificado_declarante,es_externo_declarado,es_identificado_declarado,es_erroneo_declarado) INCLUDE (id_dim_marcas)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle(
	id_dim_datos_detalle int IDENTITY(1,1),
	potencia_maxima_contratada varchar(6),
	administracion_declarado varchar(1),
	cod_clave_tipo_codigo varchar(1),
	cod_tipo_bien varchar(1),
	cod_situacion_inmueble varchar(1),
	cod_unidad_consumo varchar(1),
	cod_unidad_potencia varchar(1),
	cod_tipo_importe varchar(2),
	id_administracion int,
	id_clave_tipo_codigo int,
	id_mae_tipo_bien int,
	id_mae_situacion_inmueble int,
	id_mae_unidad_consumo int,
	id_mae_unidad_potencia int,
	id_mae_tipo_importe int,
	CONSTRAINT PK_tbn1_mi_159_dim_datos_detalle PRIMARY KEY CLUSTERED (id_dim_datos_detalle)
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
	AND table_name = 'tbn1_mi_159_dim_datos_detalle'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_datos_detalle')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='potencia_maxima_contratada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD potencia_maxima_contratada varchar(6)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='administracion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD administracion_declarado varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='cod_clave_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD cod_clave_tipo_codigo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='cod_tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD cod_tipo_bien varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='cod_situacion_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD cod_situacion_inmueble varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='cod_unidad_consumo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD cod_unidad_consumo varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='cod_unidad_potencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD cod_unidad_potencia varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD cod_tipo_importe varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_administracion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_clave_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_clave_tipo_codigo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_mae_tipo_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_mae_tipo_bien int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_mae_situacion_inmueble')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_mae_situacion_inmueble int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_mae_unidad_consumo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_mae_unidad_consumo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_mae_unidad_potencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_mae_unidad_potencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle' AND COLUMN_NAME='id_mae_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD id_mae_tipo_importe int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_datos_detalle'
	AND column_name NOT IN ('id_dim_datos_detalle', 'potencia_maxima_contratada', 'administracion_declarado', 'cod_clave_tipo_codigo', 'cod_tipo_bien', 'cod_situacion_inmueble', 'cod_unidad_consumo', 'cod_unidad_potencia', 'cod_tipo_importe', 'id_administracion', 'id_clave_tipo_codigo', 'id_mae_tipo_bien', 'id_mae_situacion_inmueble', 'id_mae_unidad_consumo', 'id_mae_unidad_potencia', 'id_mae_tipo_importe')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN potencia_maxima_contratada varchar(6) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN administracion_declarado varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN cod_clave_tipo_codigo varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN cod_tipo_bien varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN cod_situacion_inmueble varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN cod_unidad_consumo varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN cod_unidad_potencia varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN cod_tipo_importe varchar(2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_administracion int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_clave_tipo_codigo int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_mae_tipo_bien int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_mae_situacion_inmueble int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_mae_unidad_consumo int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_mae_unidad_potencia int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ALTER COLUMN id_mae_tipo_importe int NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_administracion)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_clave_tipo_codigo)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_mae_tipo_bien)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_mae_situacion_inmueble)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_mae_unidad_consumo)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_mae_unidad_potencia)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (id_mae_tipo_importe)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle (potencia_maxima_contratada,id_administracion,id_clave_tipo_codigo,id_mae_tipo_bien,id_mae_situacion_inmueble,id_mae_unidad_consumo,id_mae_unidad_potencia,id_mae_tipo_importe) INCLUDE (id_dim_datos_detalle)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_dim_mi_administracion_hacienda FOREIGN KEY (id_administracion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(id_administracion)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_dim_mi_clave_tipo_codigo FOREIGN KEY (id_clave_tipo_codigo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo(id_clave_tipo_codigo)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_mae_tipo_bien FOREIGN KEY (id_mae_tipo_bien) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien(id_mae_tipo_bien)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_mae_situacion_inmueble FOREIGN KEY (id_mae_situacion_inmueble) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble(id_mae_situacion_inmueble)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_mae_unidad_consumo FOREIGN KEY (id_mae_unidad_consumo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo(id_mae_unidad_consumo)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_mae_unidad_potencia FOREIGN KEY (id_mae_unidad_potencia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia(id_mae_unidad_potencia)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle_tbn1_mae_tipo_importe FOREIGN KEY (id_mae_tipo_importe) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe(id_mae_tipo_importe)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2(
	id_dim_datos_detalle2 int IDENTITY(1,1),
	cups_distribuidora varchar(4),
	cups_medida varchar(1),
	cups_suministro varchar(1),
	domi_municipio varchar(30),
	domi_codigo_municipio varchar(5),
	domi_codigo_postal varchar(5),
	cod_pais_residencia varchar(3),
	cod_cups_pais varchar(3),
	domi_codigo_provincia varchar(2),
	id_pais int,
	id_pais_cups int,
	id_provincia int,
	CONSTRAINT PK_tbn1_mi_159_dim_datos_detalle2 PRIMARY KEY CLUSTERED (id_dim_datos_detalle2)
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
	AND table_name = 'tbn1_mi_159_dim_datos_detalle2'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_datos_detalle2')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='cups_distribuidora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD cups_distribuidora varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='cups_medida')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD cups_medida varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='cups_suministro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD cups_suministro varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='domi_municipio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD domi_municipio varchar(30)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='domi_codigo_municipio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD domi_codigo_municipio varchar(5)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='domi_codigo_postal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD domi_codigo_postal varchar(5)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='cod_pais_residencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD cod_pais_residencia varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='cod_cups_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD cod_cups_pais varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='domi_codigo_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD domi_codigo_provincia varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='id_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD id_pais int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='id_pais_cups')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD id_pais_cups int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_detalle2' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD id_provincia int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_datos_detalle2'
	AND column_name NOT IN ('id_dim_datos_detalle2', 'cups_distribuidora', 'cups_medida', 'cups_suministro', 'domi_municipio', 'domi_codigo_municipio', 'domi_codigo_postal', 'cod_pais_residencia', 'cod_cups_pais', 'domi_codigo_provincia', 'id_pais', 'id_pais_cups', 'id_provincia')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN cups_distribuidora varchar(4) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN cups_medida varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN cups_suministro varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN domi_municipio varchar(30) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN domi_codigo_municipio varchar(5) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN domi_codigo_postal varchar(5) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN cod_pais_residencia varchar(3) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN cod_cups_pais varchar(3) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN domi_codigo_provincia varchar(2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN id_pais int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN id_pais_cups int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ALTER COLUMN id_provincia int NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle2_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 (id_pais)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle2_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 (id_pais_cups)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle2_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 (id_provincia)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_detalle2_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 (cups_distribuidora,cups_medida,cups_suministro,domi_municipio,domi_codigo_municipio,domi_codigo_postal,id_pais,id_pais_cups,id_provincia) INCLUDE (id_dim_datos_detalle2)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle2_tbn1_dim_paises FOREIGN KEY (id_pais) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle2_tbn1_dim_paises1 FOREIGN KEY (id_pais_cups) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_paises(id_pais)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_detalle2_tbn1_dim_provincias FOREIGN KEY (id_provincia) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_provincias(id_provincia)
GO

--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos(
	id_dim_periodos int IDENTITY(1,1),
	fecha_alta_contrato date,
	anyo_alta_contrato int,
	mes_alta_contrato int,
	fecha_baja_contrato date,
	mes_baja_contrato int,
	anyo_baja_contrato int,
	CONSTRAINT PK_tbn1_mi_159_dim_periodos PRIMARY KEY CLUSTERED (id_dim_periodos)
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
	AND table_name = 'tbn1_mi_159_dim_periodos'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_periodos')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos' AND COLUMN_NAME='fecha_alta_contrato')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ADD fecha_alta_contrato date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos' AND COLUMN_NAME='anyo_alta_contrato')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ADD anyo_alta_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos' AND COLUMN_NAME='mes_alta_contrato')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ADD mes_alta_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos' AND COLUMN_NAME='fecha_baja_contrato')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ADD fecha_baja_contrato date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos' AND COLUMN_NAME='mes_baja_contrato')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ADD mes_baja_contrato int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_periodos' AND COLUMN_NAME='anyo_baja_contrato')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ADD anyo_baja_contrato int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_periodos'
	AND column_name NOT IN ('id_dim_periodos', 'fecha_alta_contrato', 'anyo_alta_contrato', 'mes_alta_contrato', 'fecha_baja_contrato', 'mes_baja_contrato', 'anyo_baja_contrato')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ALTER COLUMN fecha_alta_contrato date NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ALTER COLUMN anyo_alta_contrato int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ALTER COLUMN mes_alta_contrato int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ALTER COLUMN fecha_baja_contrato date NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ALTER COLUMN mes_baja_contrato int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos ALTER COLUMN anyo_baja_contrato int NULL
GO

--Create indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_periodos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos (fecha_alta_contrato,anyo_alta_contrato,mes_alta_contrato,fecha_baja_contrato,mes_baja_contrato,anyo_baja_contrato) INCLUDE (id_dim_periodos)

--Add FKs if necessary
--End table create/prepare

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_consumo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo(
	id_dim_datos_consumo int IDENTITY(1,1),
	cod_periodo_facturado varchar(2),
	cod_tipo_lectura varchar(1),
	id_mae_tipo_lectura int,
	CONSTRAINT PK_tbn1_mi_159_dim_datos_consumo PRIMARY KEY CLUSTERED (id_dim_datos_consumo)
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
	AND table_name = 'tbn1_mi_159_dim_datos_consumo'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_dim_datos_consumo')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_consumo' AND COLUMN_NAME='cod_periodo_facturado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ADD cod_periodo_facturado varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_consumo' AND COLUMN_NAME='cod_tipo_lectura')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ADD cod_tipo_lectura varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_dim_datos_consumo' AND COLUMN_NAME='id_mae_tipo_lectura')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ADD id_mae_tipo_lectura int
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_dim_datos_consumo'
	AND column_name NOT IN ('id_dim_datos_consumo', 'cod_periodo_facturado', 'cod_tipo_lectura', 'id_mae_tipo_lectura')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ALTER COLUMN cod_periodo_facturado varchar(2) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ALTER COLUMN cod_tipo_lectura varchar(1) NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ALTER COLUMN id_mae_tipo_lectura int NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_consumo_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo (id_mae_tipo_lectura)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_dim_datos_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo (cod_periodo_facturado,id_mae_tipo_lectura) INCLUDE (id_dim_datos_consumo)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo ADD CONSTRAINT FK_tbn1_mi_159_dim_datos_consumo_tbn1_mae_tipo_lectura FOREIGN KEY (id_mae_tipo_lectura) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_lectura(id_mae_tipo_lectura)
GO

--End table create/prepare
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int,
	id_dim_declarantes int,
	id_dim_declarados int,
	id_dim_periodos_doc int,
	id_dim_datos_caratula int,
	id_dim_marcas int,
	id_dim_datos_detalle int,
	id_dim_datos_detalle2 int,
	id_dim_periodos int,
	id_dim_datos_consumo int,
	importe decimal(18,2),
	consumo_facturado decimal(4,0),
	CONSTRAINT PK_tbn1_mi_159_fact PRIMARY KEY CLUSTERED (id)
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
	AND table_name = 'tbn1_mi_159_fact'
	AND constraint_type = 'FOREIGN KEY'
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @constraint
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DROP CONSTRAINT ' + @constraint
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
	WHERE id = OBJECT_ID('tbn1_mi_159_fact')
	AND indid > 0 AND indid < 255 
	AND INDEXPROPERTY(id, name, 'IsStatistics') = 0
	AND INDEXPROPERTY(id, name, 'IsClustered') = 0
	ORDER BY indid DESC
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @ncindex
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'DROP INDEX ' + @ncindex + ' ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact'
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @ncindex
	END
END
GO
--Add all Columns (if not exist)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_periodos_doc')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_periodos_doc int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_datos_detalle2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_datos_detalle2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='id_dim_datos_consumo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD id_dim_datos_consumo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD importe decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_159_fact' AND COLUMN_NAME='consumo_facturado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD consumo_facturado decimal(4,0)
GO

--Drop not used columns
DECLARE @column nvarchar(128)
DECLARE @cursor CURSOR
DECLARE @sqlcmd nvarchar(max)
BEGIN
	SET @cursor = CURSOR FOR
	SELECT column_name FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND table_name = 'tbn1_mi_159_fact'
	AND column_name NOT IN ('id', 'id_dim_documentos', 'id_dim_declarantes', 'id_dim_declarados', 'id_dim_periodos_doc', 'id_dim_datos_caratula', 'id_dim_marcas', 'id_dim_datos_detalle', 'id_dim_datos_detalle2', 'id_dim_periodos', 'id_dim_datos_consumo', 'importe', 'consumo_facturado')
	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @column
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sqlcmd = 'ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DROP COLUMN ' + @column
		EXEC (@sqlcmd)
		FETCH NEXT FROM @cursor INTO @column
	END
END
GO
--Adjust column types
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_documentos int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_declarantes int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_declarados int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_periodos_doc int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_datos_caratula int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_marcas int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_datos_detalle int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_datos_detalle2 int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_periodos int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN id_dim_datos_consumo int NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN importe decimal(18,2) NOT NULL
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ALTER COLUMN consumo_facturado decimal(4,0) NOT NULL
GO

--Create indexes
CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_documentos)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_declarantes)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_declarados)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_periodos_doc)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_datos_caratula)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_marcas)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_datos_detalle)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_8 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_datos_detalle2)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_9 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_periodos)

CREATE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_10 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_datos_consumo)

CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mi_159_fact_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos_doc,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,id_dim_datos_detalle2,id_dim_periodos,id_dim_datos_consumo) INCLUDE (id)

--Add FKs if necessary
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos(id_dim_documentos)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes(id_dim_declarantes)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados(id_dim_declarados)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_periodos_doc FOREIGN KEY (id_dim_periodos_doc) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc(id_dim_periodos_doc)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula(id_dim_datos_caratula)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas(id_dim_marcas)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle(id_dim_datos_detalle)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_datos_detalle2 FOREIGN KEY (id_dim_datos_detalle2) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2(id_dim_datos_detalle2)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos(id_dim_periodos)
GO

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact ADD CONSTRAINT FK_tbn1_mi_159_fact_tbn1_mi_159_dim_datos_consumo FOREIGN KEY (id_dim_datos_consumo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo(id_dim_datos_consumo)
GO

--End table create/prepare


USE dbn1_stg_dhyf
GO
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_documentos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_documentos'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_documentos') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_documentos
		CREATE table #tmp_mi_159_dim_documentos(
			rr_mode varchar(1),
			cc int,
			id_dim_documentos int,
			t_id_documento int,
			t_id_expediente int,
			id_documento int,
			id_expediente int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.id_documento AS id_documento,
		st.id_expediente AS id_expediente
	FROM (SELECT
		id_documento,
		id_expediente
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		id_documento,
		id_expediente
	) st

	GROUP BY
		st.id_documento,
		st.id_expediente
		)
		INSERT INTO #tmp_mi_159_dim_documentos (rr_mode,cc,id_dim_documentos,t_id_documento,t_id_expediente,id_documento,id_expediente)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_documentos IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_documentos AS id_dim_documentos,
			t.id_documento AS t_id_documento,
			t.id_expediente AS t_id_expediente,
			query.id_documento AS id_documento,
			query.id_expediente AS id_expediente
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos AS t
		FULL JOIN query on ((query.id_documento=t.id_documento OR (query.id_documento IS NULL AND t.id_documento IS NULL)) AND (query.id_expediente=t.id_expediente OR (query.id_expediente IS NULL AND t.id_expediente IS NULL)))
		WHERE 
			id_dim_documentos IS NULL OR
			cc IS NULL OR
			(t.id_documento<>query.id_documento OR (t.id_documento IS NULL AND query.id_documento IS NOT NULL)
                                                  OR (t.id_documento IS NOT NULL AND query.id_documento IS NULL)
				OR t.id_expediente<>query.id_expediente OR (t.id_expediente IS NULL AND query.id_expediente IS NOT NULL)
                                                  OR (t.id_expediente IS NOT NULL AND query.id_expediente IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_documentos
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_documentos where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_documentos_1')
			ALTER INDEX IX_tbn1_mi_159_dim_documentos_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_documentos_2')
			ALTER INDEX IX_tbn1_mi_159_dim_documentos_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos
			SET
				id_documento=s.id_documento,
				id_expediente=s.id_expediente
		FROM (
			SELECT
				id_documento,
				id_expediente
			FROM #tmp_mi_159_dim_documentos
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos.id_documento=s.id_documento OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos.id_documento IS NULL AND s.id_documento IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos.id_expediente=s.id_expediente OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos.id_expediente IS NULL AND s.id_expediente IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos AS tbn1_mi_159_dim_documentos
		INNER JOIN #tmp_mi_159_dim_documentos AS tmp
		ON ((tbn1_mi_159_dim_documentos.id_documento=tmp.t_id_documento OR (tbn1_mi_159_dim_documentos.id_documento IS NULL AND tmp.t_id_documento IS NULL)) AND (tbn1_mi_159_dim_documentos.id_expediente=tmp.t_id_expediente OR (tbn1_mi_159_dim_documentos.id_expediente IS NULL AND tmp.t_id_expediente IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_documentos_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_documentos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos WITH(TABLOCK) (id_documento,id_expediente)
		SELECT
			id_documento,
			id_expediente
			FROM #tmp_mi_159_dim_documentos
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_documentos_1')
			ALTER INDEX IX_tbn1_mi_159_dim_documentos_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_documentos_2')
			ALTER INDEX IX_tbn1_mi_159_dim_documentos_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_documentos_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_documentos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_declarantes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_declarantes;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_declarantes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_declarantes'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_declarantes') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_declarantes
		CREATE table #tmp_mi_159_dim_declarantes(
			rr_mode varchar(1),
			cc int,
			id_dim_declarantes int,
			t_id_mae_no_id_declarante int,
			t_nif_declarante_159 varchar(12),
			t_id_contribuyente_declarante int,
			t_telefono varchar(10),
			t_razon_social varchar(40),
			t_cod_presentador_colectivo int,
			t_cod_banco_espania varchar(4),
			id_mae_no_id_declarante int,
			nif_declarante_159 varchar(12),
			id_contribuyente_declarante int,
			telefono varchar(10),
			razon_social varchar(40),
			cod_presentador_colectivo int,
			cod_banco_espania varchar(4)
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.id_mae_no_id_declarante AS id_mae_no_id_declarante,
		st.nif_declarante_159 AS nif_declarante_159,
		st.id_contribuyente_declarante AS id_contribuyente_declarante,
		st.telefono AS telefono,
		st.razon_social AS razon_social,
		st.cod_presentador_colectivo AS cod_presentador_colectivo,
		st.cod_banco_espania AS cod_banco_espania
	FROM (SELECT
		id_mae_no_id_declarante,
		nif_declarante_159,
		id_contribuyente_declarante,
		telefono,
		razon_social,
		cod_presentador_colectivo,
		cod_banco_espania
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		id_mae_no_id_declarante,
		nif_declarante_159,
		id_contribuyente_declarante,
		telefono,
		razon_social,
		cod_presentador_colectivo,
		cod_banco_espania
	) st

	GROUP BY
		st.id_mae_no_id_declarante,
		st.nif_declarante_159,
		st.id_contribuyente_declarante,
		st.telefono,
		st.razon_social,
		st.cod_presentador_colectivo,
		st.cod_banco_espania
		)
		INSERT INTO #tmp_mi_159_dim_declarantes (rr_mode,cc,id_dim_declarantes,t_id_mae_no_id_declarante,t_nif_declarante_159,t_id_contribuyente_declarante,t_telefono,t_razon_social,t_cod_presentador_colectivo,t_cod_banco_espania,id_mae_no_id_declarante,nif_declarante_159,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_declarantes IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_declarantes AS id_dim_declarantes,
			t.id_mae_no_id_declarante AS t_id_mae_no_id_declarante,
			t.nif_declarante_159 AS t_nif_declarante_159,
			t.id_contribuyente_declarante AS t_id_contribuyente_declarante,
			t.telefono AS t_telefono,
			t.razon_social AS t_razon_social,
			t.cod_presentador_colectivo AS t_cod_presentador_colectivo,
			t.cod_banco_espania AS t_cod_banco_espania,
			query.id_mae_no_id_declarante AS id_mae_no_id_declarante,
			query.nif_declarante_159 AS nif_declarante_159,
			query.id_contribuyente_declarante AS id_contribuyente_declarante,
			query.telefono AS telefono,
			query.razon_social AS razon_social,
			query.cod_presentador_colectivo AS cod_presentador_colectivo,
			query.cod_banco_espania AS cod_banco_espania
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes AS t
		FULL JOIN query on ((query.id_mae_no_id_declarante=t.id_mae_no_id_declarante OR (query.id_mae_no_id_declarante IS NULL AND t.id_mae_no_id_declarante IS NULL)) AND (query.nif_declarante_159=t.nif_declarante_159 OR (query.nif_declarante_159 IS NULL AND t.nif_declarante_159 IS NULL)) AND (query.id_contribuyente_declarante=t.id_contribuyente_declarante OR (query.id_contribuyente_declarante IS NULL AND t.id_contribuyente_declarante IS NULL)) AND (query.telefono=t.telefono OR (query.telefono IS NULL AND t.telefono IS NULL)) AND (query.razon_social=t.razon_social OR (query.razon_social IS NULL AND t.razon_social IS NULL)) AND (query.cod_presentador_colectivo=t.cod_presentador_colectivo OR (query.cod_presentador_colectivo IS NULL AND t.cod_presentador_colectivo IS NULL)) AND (query.cod_banco_espania=t.cod_banco_espania OR (query.cod_banco_espania IS NULL AND t.cod_banco_espania IS NULL)))
		WHERE 
			id_dim_declarantes IS NULL OR
			cc IS NULL OR
			(t.id_mae_no_id_declarante<>query.id_mae_no_id_declarante OR (t.id_mae_no_id_declarante IS NULL AND query.id_mae_no_id_declarante IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarante IS NOT NULL AND query.id_mae_no_id_declarante IS NULL)
				OR t.nif_declarante_159<>query.nif_declarante_159 OR (t.nif_declarante_159 IS NULL AND query.nif_declarante_159 IS NOT NULL)
                                                  OR (t.nif_declarante_159 IS NOT NULL AND query.nif_declarante_159 IS NULL)
				OR t.id_contribuyente_declarante<>query.id_contribuyente_declarante OR (t.id_contribuyente_declarante IS NULL AND query.id_contribuyente_declarante IS NOT NULL)
                                                  OR (t.id_contribuyente_declarante IS NOT NULL AND query.id_contribuyente_declarante IS NULL)
				OR t.telefono<>query.telefono OR (t.telefono IS NULL AND query.telefono IS NOT NULL)
                                                  OR (t.telefono IS NOT NULL AND query.telefono IS NULL)
				OR t.razon_social<>query.razon_social OR (t.razon_social IS NULL AND query.razon_social IS NOT NULL)
                                                  OR (t.razon_social IS NOT NULL AND query.razon_social IS NULL)
				OR t.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (t.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL)
                                                  OR (t.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
				OR t.cod_banco_espania<>query.cod_banco_espania OR (t.cod_banco_espania IS NULL AND query.cod_banco_espania IS NOT NULL)
                                                  OR (t.cod_banco_espania IS NOT NULL AND query.cod_banco_espania IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_declarantes
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_declarantes where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarantes_1')
			ALTER INDEX IX_tbn1_mi_159_dim_declarantes_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarantes_2')
			ALTER INDEX IX_tbn1_mi_159_dim_declarantes_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes
			SET
				id_mae_no_id_declarante=s.id_mae_no_id_declarante,
				nif_declarante_159=s.nif_declarante_159,
				id_contribuyente_declarante=s.id_contribuyente_declarante,
				telefono=s.telefono,
				razon_social=s.razon_social,
				cod_presentador_colectivo=s.cod_presentador_colectivo,
				cod_banco_espania=s.cod_banco_espania
		FROM (
			SELECT
				id_mae_no_id_declarante,
				nif_declarante_159,
				id_contribuyente_declarante,
				telefono,
				razon_social,
				cod_presentador_colectivo,
				cod_banco_espania
			FROM #tmp_mi_159_dim_declarantes
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.id_mae_no_id_declarante=s.id_mae_no_id_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.id_mae_no_id_declarante IS NULL AND s.id_mae_no_id_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.nif_declarante_159=s.nif_declarante_159 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.nif_declarante_159 IS NULL AND s.nif_declarante_159 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.id_contribuyente_declarante=s.id_contribuyente_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.id_contribuyente_declarante IS NULL AND s.id_contribuyente_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.telefono=s.telefono OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.telefono IS NULL AND s.telefono IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.razon_social=s.razon_social OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.razon_social IS NULL AND s.razon_social IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.cod_presentador_colectivo=s.cod_presentador_colectivo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.cod_presentador_colectivo IS NULL AND s.cod_presentador_colectivo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.cod_banco_espania=s.cod_banco_espania OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes.cod_banco_espania IS NULL AND s.cod_banco_espania IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes AS tbn1_mi_159_dim_declarantes
		INNER JOIN #tmp_mi_159_dim_declarantes AS tmp
		ON ((tbn1_mi_159_dim_declarantes.id_mae_no_id_declarante=tmp.t_id_mae_no_id_declarante OR (tbn1_mi_159_dim_declarantes.id_mae_no_id_declarante IS NULL AND tmp.t_id_mae_no_id_declarante IS NULL)) AND (tbn1_mi_159_dim_declarantes.nif_declarante_159=tmp.t_nif_declarante_159 OR (tbn1_mi_159_dim_declarantes.nif_declarante_159 IS NULL AND tmp.t_nif_declarante_159 IS NULL)) AND (tbn1_mi_159_dim_declarantes.id_contribuyente_declarante=tmp.t_id_contribuyente_declarante OR (tbn1_mi_159_dim_declarantes.id_contribuyente_declarante IS NULL AND tmp.t_id_contribuyente_declarante IS NULL)) AND (tbn1_mi_159_dim_declarantes.telefono=tmp.t_telefono OR (tbn1_mi_159_dim_declarantes.telefono IS NULL AND tmp.t_telefono IS NULL)) AND (tbn1_mi_159_dim_declarantes.razon_social=tmp.t_razon_social OR (tbn1_mi_159_dim_declarantes.razon_social IS NULL AND tmp.t_razon_social IS NULL)) AND (tbn1_mi_159_dim_declarantes.cod_presentador_colectivo=tmp.t_cod_presentador_colectivo OR (tbn1_mi_159_dim_declarantes.cod_presentador_colectivo IS NULL AND tmp.t_cod_presentador_colectivo IS NULL)) AND (tbn1_mi_159_dim_declarantes.cod_banco_espania=tmp.t_cod_banco_espania OR (tbn1_mi_159_dim_declarantes.cod_banco_espania IS NULL AND tmp.t_cod_banco_espania IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarantes_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_declarantes_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes WITH(TABLOCK) (id_mae_no_id_declarante,nif_declarante_159,id_contribuyente_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania)
		SELECT
			id_mae_no_id_declarante,
			nif_declarante_159,
			id_contribuyente_declarante,
			telefono,
			razon_social,
			cod_presentador_colectivo,
			cod_banco_espania
			FROM #tmp_mi_159_dim_declarantes
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarantes_1')
			ALTER INDEX IX_tbn1_mi_159_dim_declarantes_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarantes_2')
			ALTER INDEX IX_tbn1_mi_159_dim_declarantes_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarantes_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_declarantes_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_declarados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_declarados;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_declarados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_declarados'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_declarados') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_declarados
		CREATE table #tmp_mi_159_dim_declarados(
			rr_mode varchar(1),
			cc int,
			id_dim_declarados int,
			t_id_mae_no_id_declarado int,
			t_nif_declarado_159 varchar(12),
			t_secuencia varchar(9),
			t_id_contribuyente_declarado int,
			t_codigo_iban varchar(4),
			t_codigo_entidad varchar(4),
			t_codigo_sucursal varchar(4),
			t_digito_control varchar(2),
			t_numero_cuenta varchar(10),
			t_identificacion_extranjero varchar(15),
			t_contrato_suministro varchar(12),
			t_cups_num_libre_asignacion varchar(12),
			t_cups_digito_control varchar(2),
			t_referencia_catastral varchar(20),
			id_mae_no_id_declarado int,
			nif_declarado_159 varchar(12),
			secuencia varchar(9),
			id_contribuyente_declarado int,
			codigo_iban varchar(4),
			codigo_entidad varchar(4),
			codigo_sucursal varchar(4),
			digito_control varchar(2),
			numero_cuenta varchar(10),
			identificacion_extranjero varchar(15),
			contrato_suministro varchar(12),
			cups_num_libre_asignacion varchar(12),
			cups_digito_control varchar(2),
			referencia_catastral varchar(20)
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.id_mae_no_id_declarado AS id_mae_no_id_declarado,
		st.nif_declarado_159 AS nif_declarado_159,
		st.secuencia AS secuencia,
		st.id_contribuyente_declarado AS id_contribuyente_declarado,
		st.codigo_iban AS codigo_iban,
		st.codigo_entidad AS codigo_entidad,
		st.codigo_sucursal AS codigo_sucursal,
		st.digito_control AS digito_control,
		st.numero_cuenta AS numero_cuenta,
		st.identificacion_extranjero AS identificacion_extranjero,
		st.contrato_suministro AS contrato_suministro,
		st.cups_num_libre_asignacion AS cups_num_libre_asignacion,
		st.cups_digito_control AS cups_digito_control,
		st.referencia_catastral AS referencia_catastral
	FROM (SELECT
		id_mae_no_id_declarado,
		nif_declarado_159,
		secuencia,
		id_contribuyente_declarado,
		codigo_iban,
		codigo_entidad,
		codigo_sucursal,
		digito_control,
		numero_cuenta,
		identificacion_extranjero,
		contrato_suministro,
		cups_num_libre_asignacion,
		cups_digito_control,
		referencia_catastral
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		id_mae_no_id_declarado,
		nif_declarado_159,
		secuencia,
		id_contribuyente_declarado,
		codigo_iban,
		codigo_entidad,
		codigo_sucursal,
		digito_control,
		numero_cuenta,
		identificacion_extranjero,
		contrato_suministro,
		cups_num_libre_asignacion,
		cups_digito_control,
		referencia_catastral
	) st

	GROUP BY
		st.id_mae_no_id_declarado,
		st.nif_declarado_159,
		st.secuencia,
		st.id_contribuyente_declarado,
		st.codigo_iban,
		st.codigo_entidad,
		st.codigo_sucursal,
		st.digito_control,
		st.numero_cuenta,
		st.identificacion_extranjero,
		st.contrato_suministro,
		st.cups_num_libre_asignacion,
		st.cups_digito_control,
		st.referencia_catastral
		)
		INSERT INTO #tmp_mi_159_dim_declarados (rr_mode,cc,id_dim_declarados,t_id_mae_no_id_declarado,t_nif_declarado_159,t_secuencia,t_id_contribuyente_declarado,t_codigo_iban,t_codigo_entidad,t_codigo_sucursal,t_digito_control,t_numero_cuenta,t_identificacion_extranjero,t_contrato_suministro,t_cups_num_libre_asignacion,t_cups_digito_control,t_referencia_catastral,id_mae_no_id_declarado,nif_declarado_159,secuencia,id_contribuyente_declarado,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,numero_cuenta,identificacion_extranjero,contrato_suministro,cups_num_libre_asignacion,cups_digito_control,referencia_catastral)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_declarados IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_declarados AS id_dim_declarados,
			t.id_mae_no_id_declarado AS t_id_mae_no_id_declarado,
			t.nif_declarado_159 AS t_nif_declarado_159,
			t.secuencia AS t_secuencia,
			t.id_contribuyente_declarado AS t_id_contribuyente_declarado,
			t.codigo_iban AS t_codigo_iban,
			t.codigo_entidad AS t_codigo_entidad,
			t.codigo_sucursal AS t_codigo_sucursal,
			t.digito_control AS t_digito_control,
			t.numero_cuenta AS t_numero_cuenta,
			t.identificacion_extranjero AS t_identificacion_extranjero,
			t.contrato_suministro AS t_contrato_suministro,
			t.cups_num_libre_asignacion AS t_cups_num_libre_asignacion,
			t.cups_digito_control AS t_cups_digito_control,
			t.referencia_catastral AS t_referencia_catastral,
			query.id_mae_no_id_declarado AS id_mae_no_id_declarado,
			query.nif_declarado_159 AS nif_declarado_159,
			query.secuencia AS secuencia,
			query.id_contribuyente_declarado AS id_contribuyente_declarado,
			query.codigo_iban AS codigo_iban,
			query.codigo_entidad AS codigo_entidad,
			query.codigo_sucursal AS codigo_sucursal,
			query.digito_control AS digito_control,
			query.numero_cuenta AS numero_cuenta,
			query.identificacion_extranjero AS identificacion_extranjero,
			query.contrato_suministro AS contrato_suministro,
			query.cups_num_libre_asignacion AS cups_num_libre_asignacion,
			query.cups_digito_control AS cups_digito_control,
			query.referencia_catastral AS referencia_catastral
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados AS t
		FULL JOIN query on ((query.id_mae_no_id_declarado=t.id_mae_no_id_declarado OR (query.id_mae_no_id_declarado IS NULL AND t.id_mae_no_id_declarado IS NULL)) AND (query.nif_declarado_159=t.nif_declarado_159 OR (query.nif_declarado_159 IS NULL AND t.nif_declarado_159 IS NULL)) AND (query.secuencia=t.secuencia OR (query.secuencia IS NULL AND t.secuencia IS NULL)) AND (query.id_contribuyente_declarado=t.id_contribuyente_declarado OR (query.id_contribuyente_declarado IS NULL AND t.id_contribuyente_declarado IS NULL)) AND (query.codigo_iban=t.codigo_iban OR (query.codigo_iban IS NULL AND t.codigo_iban IS NULL)) AND (query.codigo_entidad=t.codigo_entidad OR (query.codigo_entidad IS NULL AND t.codigo_entidad IS NULL)) AND (query.codigo_sucursal=t.codigo_sucursal OR (query.codigo_sucursal IS NULL AND t.codigo_sucursal IS NULL)) AND (query.digito_control=t.digito_control OR (query.digito_control IS NULL AND t.digito_control IS NULL)) AND (query.numero_cuenta=t.numero_cuenta OR (query.numero_cuenta IS NULL AND t.numero_cuenta IS NULL)) AND (query.identificacion_extranjero=t.identificacion_extranjero OR (query.identificacion_extranjero IS NULL AND t.identificacion_extranjero IS NULL)) AND (query.contrato_suministro=t.contrato_suministro OR (query.contrato_suministro IS NULL AND t.contrato_suministro IS NULL)) AND (query.cups_num_libre_asignacion=t.cups_num_libre_asignacion OR (query.cups_num_libre_asignacion IS NULL AND t.cups_num_libre_asignacion IS NULL)) AND (query.cups_digito_control=t.cups_digito_control OR (query.cups_digito_control IS NULL AND t.cups_digito_control IS NULL)) AND (query.referencia_catastral=t.referencia_catastral OR (query.referencia_catastral IS NULL AND t.referencia_catastral IS NULL)))
		WHERE 
			id_dim_declarados IS NULL OR
			cc IS NULL OR
			(t.id_mae_no_id_declarado<>query.id_mae_no_id_declarado OR (t.id_mae_no_id_declarado IS NULL AND query.id_mae_no_id_declarado IS NOT NULL)
                                                  OR (t.id_mae_no_id_declarado IS NOT NULL AND query.id_mae_no_id_declarado IS NULL)
				OR t.nif_declarado_159<>query.nif_declarado_159 OR (t.nif_declarado_159 IS NULL AND query.nif_declarado_159 IS NOT NULL)
                                                  OR (t.nif_declarado_159 IS NOT NULL AND query.nif_declarado_159 IS NULL)
				OR t.secuencia<>query.secuencia OR (t.secuencia IS NULL AND query.secuencia IS NOT NULL)
                                                  OR (t.secuencia IS NOT NULL AND query.secuencia IS NULL)
				OR t.id_contribuyente_declarado<>query.id_contribuyente_declarado OR (t.id_contribuyente_declarado IS NULL AND query.id_contribuyente_declarado IS NOT NULL)
                                                  OR (t.id_contribuyente_declarado IS NOT NULL AND query.id_contribuyente_declarado IS NULL)
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
				OR t.identificacion_extranjero<>query.identificacion_extranjero OR (t.identificacion_extranjero IS NULL AND query.identificacion_extranjero IS NOT NULL)
                                                  OR (t.identificacion_extranjero IS NOT NULL AND query.identificacion_extranjero IS NULL)
				OR t.contrato_suministro<>query.contrato_suministro OR (t.contrato_suministro IS NULL AND query.contrato_suministro IS NOT NULL)
                                                  OR (t.contrato_suministro IS NOT NULL AND query.contrato_suministro IS NULL)
				OR t.cups_num_libre_asignacion<>query.cups_num_libre_asignacion OR (t.cups_num_libre_asignacion IS NULL AND query.cups_num_libre_asignacion IS NOT NULL)
                                                  OR (t.cups_num_libre_asignacion IS NOT NULL AND query.cups_num_libre_asignacion IS NULL)
				OR t.cups_digito_control<>query.cups_digito_control OR (t.cups_digito_control IS NULL AND query.cups_digito_control IS NOT NULL)
                                                  OR (t.cups_digito_control IS NOT NULL AND query.cups_digito_control IS NULL)
				OR t.referencia_catastral<>query.referencia_catastral OR (t.referencia_catastral IS NULL AND query.referencia_catastral IS NOT NULL)
                                                  OR (t.referencia_catastral IS NOT NULL AND query.referencia_catastral IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_declarados
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_declarados where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarados_1')
			ALTER INDEX IX_tbn1_mi_159_dim_declarados_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarados_2')
			ALTER INDEX IX_tbn1_mi_159_dim_declarados_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados
			SET
				id_mae_no_id_declarado=s.id_mae_no_id_declarado,
				nif_declarado_159=s.nif_declarado_159,
				secuencia=s.secuencia,
				id_contribuyente_declarado=s.id_contribuyente_declarado,
				codigo_iban=s.codigo_iban,
				codigo_entidad=s.codigo_entidad,
				codigo_sucursal=s.codigo_sucursal,
				digito_control=s.digito_control,
				numero_cuenta=s.numero_cuenta,
				identificacion_extranjero=s.identificacion_extranjero,
				contrato_suministro=s.contrato_suministro,
				cups_num_libre_asignacion=s.cups_num_libre_asignacion,
				cups_digito_control=s.cups_digito_control,
				referencia_catastral=s.referencia_catastral
		FROM (
			SELECT
				id_mae_no_id_declarado,
				nif_declarado_159,
				secuencia,
				id_contribuyente_declarado,
				codigo_iban,
				codigo_entidad,
				codigo_sucursal,
				digito_control,
				numero_cuenta,
				identificacion_extranjero,
				contrato_suministro,
				cups_num_libre_asignacion,
				cups_digito_control,
				referencia_catastral
			FROM #tmp_mi_159_dim_declarados
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.id_mae_no_id_declarado=s.id_mae_no_id_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.id_mae_no_id_declarado IS NULL AND s.id_mae_no_id_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.nif_declarado_159=s.nif_declarado_159 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.nif_declarado_159 IS NULL AND s.nif_declarado_159 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.secuencia=s.secuencia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.secuencia IS NULL AND s.secuencia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.id_contribuyente_declarado=s.id_contribuyente_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.id_contribuyente_declarado IS NULL AND s.id_contribuyente_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.codigo_iban=s.codigo_iban OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.codigo_iban IS NULL AND s.codigo_iban IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.codigo_entidad=s.codigo_entidad OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.codigo_entidad IS NULL AND s.codigo_entidad IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.codigo_sucursal=s.codigo_sucursal OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.codigo_sucursal IS NULL AND s.codigo_sucursal IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.digito_control=s.digito_control OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.digito_control IS NULL AND s.digito_control IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.numero_cuenta=s.numero_cuenta OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.numero_cuenta IS NULL AND s.numero_cuenta IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.identificacion_extranjero=s.identificacion_extranjero OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.identificacion_extranjero IS NULL AND s.identificacion_extranjero IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.contrato_suministro=s.contrato_suministro OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.contrato_suministro IS NULL AND s.contrato_suministro IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.cups_num_libre_asignacion=s.cups_num_libre_asignacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.cups_num_libre_asignacion IS NULL AND s.cups_num_libre_asignacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.cups_digito_control=s.cups_digito_control OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.cups_digito_control IS NULL AND s.cups_digito_control IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.referencia_catastral=s.referencia_catastral OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados.referencia_catastral IS NULL AND s.referencia_catastral IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados AS tbn1_mi_159_dim_declarados
		INNER JOIN #tmp_mi_159_dim_declarados AS tmp
		ON ((tbn1_mi_159_dim_declarados.id_mae_no_id_declarado=tmp.t_id_mae_no_id_declarado OR (tbn1_mi_159_dim_declarados.id_mae_no_id_declarado IS NULL AND tmp.t_id_mae_no_id_declarado IS NULL)) AND (tbn1_mi_159_dim_declarados.nif_declarado_159=tmp.t_nif_declarado_159 OR (tbn1_mi_159_dim_declarados.nif_declarado_159 IS NULL AND tmp.t_nif_declarado_159 IS NULL)) AND (tbn1_mi_159_dim_declarados.secuencia=tmp.t_secuencia OR (tbn1_mi_159_dim_declarados.secuencia IS NULL AND tmp.t_secuencia IS NULL)) AND (tbn1_mi_159_dim_declarados.id_contribuyente_declarado=tmp.t_id_contribuyente_declarado OR (tbn1_mi_159_dim_declarados.id_contribuyente_declarado IS NULL AND tmp.t_id_contribuyente_declarado IS NULL)) AND (tbn1_mi_159_dim_declarados.codigo_iban=tmp.t_codigo_iban OR (tbn1_mi_159_dim_declarados.codigo_iban IS NULL AND tmp.t_codigo_iban IS NULL)) AND (tbn1_mi_159_dim_declarados.codigo_entidad=tmp.t_codigo_entidad OR (tbn1_mi_159_dim_declarados.codigo_entidad IS NULL AND tmp.t_codigo_entidad IS NULL)) AND (tbn1_mi_159_dim_declarados.codigo_sucursal=tmp.t_codigo_sucursal OR (tbn1_mi_159_dim_declarados.codigo_sucursal IS NULL AND tmp.t_codigo_sucursal IS NULL)) AND (tbn1_mi_159_dim_declarados.digito_control=tmp.t_digito_control OR (tbn1_mi_159_dim_declarados.digito_control IS NULL AND tmp.t_digito_control IS NULL)) AND (tbn1_mi_159_dim_declarados.numero_cuenta=tmp.t_numero_cuenta OR (tbn1_mi_159_dim_declarados.numero_cuenta IS NULL AND tmp.t_numero_cuenta IS NULL)) AND (tbn1_mi_159_dim_declarados.identificacion_extranjero=tmp.t_identificacion_extranjero OR (tbn1_mi_159_dim_declarados.identificacion_extranjero IS NULL AND tmp.t_identificacion_extranjero IS NULL)) AND (tbn1_mi_159_dim_declarados.contrato_suministro=tmp.t_contrato_suministro OR (tbn1_mi_159_dim_declarados.contrato_suministro IS NULL AND tmp.t_contrato_suministro IS NULL)) AND (tbn1_mi_159_dim_declarados.cups_num_libre_asignacion=tmp.t_cups_num_libre_asignacion OR (tbn1_mi_159_dim_declarados.cups_num_libre_asignacion IS NULL AND tmp.t_cups_num_libre_asignacion IS NULL)) AND (tbn1_mi_159_dim_declarados.cups_digito_control=tmp.t_cups_digito_control OR (tbn1_mi_159_dim_declarados.cups_digito_control IS NULL AND tmp.t_cups_digito_control IS NULL)) AND (tbn1_mi_159_dim_declarados.referencia_catastral=tmp.t_referencia_catastral OR (tbn1_mi_159_dim_declarados.referencia_catastral IS NULL AND tmp.t_referencia_catastral IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarados_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_declarados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados WITH(TABLOCK) (id_mae_no_id_declarado,nif_declarado_159,secuencia,id_contribuyente_declarado,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,numero_cuenta,identificacion_extranjero,contrato_suministro,cups_num_libre_asignacion,cups_digito_control,referencia_catastral)
		SELECT
			id_mae_no_id_declarado,
			nif_declarado_159,
			secuencia,
			id_contribuyente_declarado,
			codigo_iban,
			codigo_entidad,
			codigo_sucursal,
			digito_control,
			numero_cuenta,
			identificacion_extranjero,
			contrato_suministro,
			cups_num_libre_asignacion,
			cups_digito_control,
			referencia_catastral
			FROM #tmp_mi_159_dim_declarados
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarados_1')
			ALTER INDEX IX_tbn1_mi_159_dim_declarados_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarados_2')
			ALTER INDEX IX_tbn1_mi_159_dim_declarados_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_declarados_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_declarados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_periodos_doc' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_periodos_doc;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_periodos_doc(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_periodos_doc'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_periodos_doc') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_periodos_doc
		CREATE table #tmp_mi_159_dim_periodos_doc(
			rr_mode varchar(1),
			cc int,
			id_dim_periodos_doc int,
			t_ejercicio smallint,
			t_fecha_presentacion date,
			t_mes_presentacion int,
			t_anyo_presentacion int,
			t_fecha_alta date,
			t_mes_alta int,
			t_anyo_alta int,
			ejercicio smallint,
			fecha_presentacion date,
			mes_presentacion int,
			anyo_presentacion int,
			fecha_alta date,
			mes_alta int,
			anyo_alta int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.ejercicio AS ejercicio,
		st.fecha_presentacion AS fecha_presentacion,
		st.mes_presentacion AS mes_presentacion,
		st.anyo_presentacion AS anyo_presentacion,
		st.fecha_alta AS fecha_alta,
		st.mes_alta AS mes_alta,
		st.anyo_alta AS anyo_alta
	FROM (SELECT
		ejercicio,
		fecha_presentacion,
		mes_presentacion,
		anyo_presentacion,
		fecha_alta,
		mes_alta,
		anyo_alta
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		ejercicio,
		fecha_presentacion,
		mes_presentacion,
		anyo_presentacion,
		fecha_alta,
		mes_alta,
		anyo_alta
	) st

	GROUP BY
		st.ejercicio,
		st.fecha_presentacion,
		st.mes_presentacion,
		st.anyo_presentacion,
		st.fecha_alta,
		st.mes_alta,
		st.anyo_alta
		)
		INSERT INTO #tmp_mi_159_dim_periodos_doc (rr_mode,cc,id_dim_periodos_doc,t_ejercicio,t_fecha_presentacion,t_mes_presentacion,t_anyo_presentacion,t_fecha_alta,t_mes_alta,t_anyo_alta,ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_periodos_doc IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_periodos_doc AS id_dim_periodos_doc,
			t.ejercicio AS t_ejercicio,
			t.fecha_presentacion AS t_fecha_presentacion,
			t.mes_presentacion AS t_mes_presentacion,
			t.anyo_presentacion AS t_anyo_presentacion,
			t.fecha_alta AS t_fecha_alta,
			t.mes_alta AS t_mes_alta,
			t.anyo_alta AS t_anyo_alta,
			query.ejercicio AS ejercicio,
			query.fecha_presentacion AS fecha_presentacion,
			query.mes_presentacion AS mes_presentacion,
			query.anyo_presentacion AS anyo_presentacion,
			query.fecha_alta AS fecha_alta,
			query.mes_alta AS mes_alta,
			query.anyo_alta AS anyo_alta
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc AS t
		FULL JOIN query on ((query.ejercicio=t.ejercicio OR (query.ejercicio IS NULL AND t.ejercicio IS NULL)) AND (query.fecha_presentacion=t.fecha_presentacion OR (query.fecha_presentacion IS NULL AND t.fecha_presentacion IS NULL)) AND (query.mes_presentacion=t.mes_presentacion OR (query.mes_presentacion IS NULL AND t.mes_presentacion IS NULL)) AND (query.anyo_presentacion=t.anyo_presentacion OR (query.anyo_presentacion IS NULL AND t.anyo_presentacion IS NULL)) AND (query.fecha_alta=t.fecha_alta OR (query.fecha_alta IS NULL AND t.fecha_alta IS NULL)) AND (query.mes_alta=t.mes_alta OR (query.mes_alta IS NULL AND t.mes_alta IS NULL)) AND (query.anyo_alta=t.anyo_alta OR (query.anyo_alta IS NULL AND t.anyo_alta IS NULL)))
		WHERE 
			id_dim_periodos_doc IS NULL OR
			cc IS NULL OR
			(t.ejercicio<>query.ejercicio OR (t.ejercicio IS NULL AND query.ejercicio IS NOT NULL)
                                                  OR (t.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
				OR t.fecha_presentacion<>query.fecha_presentacion OR (t.fecha_presentacion IS NULL AND query.fecha_presentacion IS NOT NULL)
                                                  OR (t.fecha_presentacion IS NOT NULL AND query.fecha_presentacion IS NULL)
				OR t.mes_presentacion<>query.mes_presentacion OR (t.mes_presentacion IS NULL AND query.mes_presentacion IS NOT NULL)
                                                  OR (t.mes_presentacion IS NOT NULL AND query.mes_presentacion IS NULL)
				OR t.anyo_presentacion<>query.anyo_presentacion OR (t.anyo_presentacion IS NULL AND query.anyo_presentacion IS NOT NULL)
                                                  OR (t.anyo_presentacion IS NOT NULL AND query.anyo_presentacion IS NULL)
				OR t.fecha_alta<>query.fecha_alta OR (t.fecha_alta IS NULL AND query.fecha_alta IS NOT NULL)
                                                  OR (t.fecha_alta IS NOT NULL AND query.fecha_alta IS NULL)
				OR t.mes_alta<>query.mes_alta OR (t.mes_alta IS NULL AND query.mes_alta IS NOT NULL)
                                                  OR (t.mes_alta IS NOT NULL AND query.mes_alta IS NULL)
				OR t.anyo_alta<>query.anyo_alta OR (t.anyo_alta IS NULL AND query.anyo_alta IS NOT NULL)
                                                  OR (t.anyo_alta IS NOT NULL AND query.anyo_alta IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_periodos_doc
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_periodos_doc where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc
			SET
				ejercicio=s.ejercicio,
				fecha_presentacion=s.fecha_presentacion,
				mes_presentacion=s.mes_presentacion,
				anyo_presentacion=s.anyo_presentacion,
				fecha_alta=s.fecha_alta,
				mes_alta=s.mes_alta,
				anyo_alta=s.anyo_alta
		FROM (
			SELECT
				ejercicio,
				fecha_presentacion,
				mes_presentacion,
				anyo_presentacion,
				fecha_alta,
				mes_alta,
				anyo_alta
			FROM #tmp_mi_159_dim_periodos_doc
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.ejercicio=s.ejercicio OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.ejercicio IS NULL AND s.ejercicio IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.fecha_presentacion=s.fecha_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.fecha_presentacion IS NULL AND s.fecha_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.mes_presentacion=s.mes_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.mes_presentacion IS NULL AND s.mes_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.anyo_presentacion=s.anyo_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.anyo_presentacion IS NULL AND s.anyo_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.fecha_alta=s.fecha_alta OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.fecha_alta IS NULL AND s.fecha_alta IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.mes_alta=s.mes_alta OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.mes_alta IS NULL AND s.mes_alta IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.anyo_alta=s.anyo_alta OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc.anyo_alta IS NULL AND s.anyo_alta IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc AS tbn1_mi_159_dim_periodos_doc
		INNER JOIN #tmp_mi_159_dim_periodos_doc AS tmp
		ON ((tbn1_mi_159_dim_periodos_doc.ejercicio=tmp.t_ejercicio OR (tbn1_mi_159_dim_periodos_doc.ejercicio IS NULL AND tmp.t_ejercicio IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.fecha_presentacion=tmp.t_fecha_presentacion OR (tbn1_mi_159_dim_periodos_doc.fecha_presentacion IS NULL AND tmp.t_fecha_presentacion IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.mes_presentacion=tmp.t_mes_presentacion OR (tbn1_mi_159_dim_periodos_doc.mes_presentacion IS NULL AND tmp.t_mes_presentacion IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.anyo_presentacion=tmp.t_anyo_presentacion OR (tbn1_mi_159_dim_periodos_doc.anyo_presentacion IS NULL AND tmp.t_anyo_presentacion IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.fecha_alta=tmp.t_fecha_alta OR (tbn1_mi_159_dim_periodos_doc.fecha_alta IS NULL AND tmp.t_fecha_alta IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.mes_alta=tmp.t_mes_alta OR (tbn1_mi_159_dim_periodos_doc.mes_alta IS NULL AND tmp.t_mes_alta IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.anyo_alta=tmp.t_anyo_alta OR (tbn1_mi_159_dim_periodos_doc.anyo_alta IS NULL AND tmp.t_anyo_alta IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_periodos_doc_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_periodos_doc_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc WITH(TABLOCK) (ejercicio,fecha_presentacion,mes_presentacion,anyo_presentacion,fecha_alta,mes_alta,anyo_alta)
		SELECT
			ejercicio,
			fecha_presentacion,
			mes_presentacion,
			anyo_presentacion,
			fecha_alta,
			mes_alta,
			anyo_alta
			FROM #tmp_mi_159_dim_periodos_doc
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_periodos_doc_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_periodos_doc_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_datos_caratula' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_caratula;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_caratula(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_caratula'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_datos_caratula') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_datos_caratula
		CREATE table #tmp_mi_159_dim_datos_caratula(
			rr_mode varchar(1),
			cc int,
			id_dim_datos_caratula int,
			t_modelo varchar(3),
			t_regimen_fiscal_deducciones varchar(1),
			t_administracion_declarante varchar(1),
			t_cod_tipo_presentacion varchar(1),
			t_cod_tipo_declaracion varchar(1),
			t_id_administracion int,
			t_id_tipo_presentacion int,
			t_id_tipo_declaracion int,
			modelo varchar(3),
			regimen_fiscal_deducciones varchar(1),
			administracion_declarante varchar(1),
			cod_tipo_presentacion varchar(1),
			cod_tipo_declaracion varchar(1),
			id_administracion int,
			id_tipo_presentacion int,
			id_tipo_declaracion int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.modelo AS modelo,
		st.regimen_fiscal_deducciones AS regimen_fiscal_deducciones,
		st.administracion_declarante AS administracion_declarante,
		st.cod_tipo_presentacion AS cod_tipo_presentacion,
		st.cod_tipo_declaracion AS cod_tipo_declaracion,
		tbn1_dim_mi_administracion_hacienda_id_administracion.id_administracion AS id_administracion,
		tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.id_tipo_presentacion AS id_tipo_presentacion,
		tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion
	FROM (SELECT
		modelo,
		regimen_fiscal_deducciones,
		administracion_declarante,
		cod_tipo_presentacion,
		cod_tipo_declaracion
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		modelo,
		regimen_fiscal_deducciones,
		administracion_declarante,
		cod_tipo_presentacion,
		cod_tipo_declaracion
	) st
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda AS tbn1_dim_mi_administracion_hacienda_id_administracion ON (tbn1_dim_mi_administracion_hacienda_id_administracion.cod_administracion=st.administracion_declarante OR (tbn1_dim_mi_administracion_hacienda_id_administracion.cod_administracion IS NULL AND st.administracion_declarante IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion AS tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion ON (tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.cod_tipo_presentacion=st.cod_tipo_presentacion OR (tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.cod_tipo_presentacion IS NULL AND st.cod_tipo_presentacion IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion AS tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion ON (tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.cod_tipo_declaracion=st.cod_tipo_declaracion OR (tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.cod_tipo_declaracion IS NULL AND st.cod_tipo_declaracion IS NULL))
	GROUP BY
		st.modelo,
		st.regimen_fiscal_deducciones,
		st.administracion_declarante,
		st.cod_tipo_presentacion,
		st.cod_tipo_declaracion,
		tbn1_dim_mi_administracion_hacienda_id_administracion.id_administracion,
		tbn1_dim_mi_tipo_presentacion_id_tipo_presentacion.id_tipo_presentacion,
		tbn1_dim_mi_tipo_declaracion_id_tipo_declaracion.id_tipo_declaracion
		)
		INSERT INTO #tmp_mi_159_dim_datos_caratula (rr_mode,cc,id_dim_datos_caratula,t_modelo,t_regimen_fiscal_deducciones,t_administracion_declarante,t_cod_tipo_presentacion,t_cod_tipo_declaracion,t_id_administracion,t_id_tipo_presentacion,t_id_tipo_declaracion,modelo,regimen_fiscal_deducciones,administracion_declarante,cod_tipo_presentacion,cod_tipo_declaracion,id_administracion,id_tipo_presentacion,id_tipo_declaracion)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_datos_caratula IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_datos_caratula AS id_dim_datos_caratula,
			t.modelo AS t_modelo,
			t.regimen_fiscal_deducciones AS t_regimen_fiscal_deducciones,
			t.administracion_declarante AS t_administracion_declarante,
			t.cod_tipo_presentacion AS t_cod_tipo_presentacion,
			t.cod_tipo_declaracion AS t_cod_tipo_declaracion,
			t.id_administracion AS t_id_administracion,
			t.id_tipo_presentacion AS t_id_tipo_presentacion,
			t.id_tipo_declaracion AS t_id_tipo_declaracion,
			query.modelo AS modelo,
			query.regimen_fiscal_deducciones AS regimen_fiscal_deducciones,
			query.administracion_declarante AS administracion_declarante,
			query.cod_tipo_presentacion AS cod_tipo_presentacion,
			query.cod_tipo_declaracion AS cod_tipo_declaracion,
			query.id_administracion AS id_administracion,
			query.id_tipo_presentacion AS id_tipo_presentacion,
			query.id_tipo_declaracion AS id_tipo_declaracion
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula AS t
		FULL JOIN query on ((query.modelo=t.modelo OR (query.modelo IS NULL AND t.modelo IS NULL)) AND (query.regimen_fiscal_deducciones=t.regimen_fiscal_deducciones OR (query.regimen_fiscal_deducciones IS NULL AND t.regimen_fiscal_deducciones IS NULL)) AND (query.administracion_declarante=t.administracion_declarante OR (query.administracion_declarante IS NULL AND t.administracion_declarante IS NULL)) AND (query.cod_tipo_presentacion=t.cod_tipo_presentacion OR (query.cod_tipo_presentacion IS NULL AND t.cod_tipo_presentacion IS NULL)) AND (query.cod_tipo_declaracion=t.cod_tipo_declaracion OR (query.cod_tipo_declaracion IS NULL AND t.cod_tipo_declaracion IS NULL)) AND (query.id_administracion=t.id_administracion OR (query.id_administracion IS NULL AND t.id_administracion IS NULL)) AND (query.id_tipo_presentacion=t.id_tipo_presentacion OR (query.id_tipo_presentacion IS NULL AND t.id_tipo_presentacion IS NULL)) AND (query.id_tipo_declaracion=t.id_tipo_declaracion OR (query.id_tipo_declaracion IS NULL AND t.id_tipo_declaracion IS NULL)))
		WHERE 
			id_dim_datos_caratula IS NULL OR
			cc IS NULL OR
			(t.modelo<>query.modelo OR (t.modelo IS NULL AND query.modelo IS NOT NULL)
                                                  OR (t.modelo IS NOT NULL AND query.modelo IS NULL)
				OR t.regimen_fiscal_deducciones<>query.regimen_fiscal_deducciones OR (t.regimen_fiscal_deducciones IS NULL AND query.regimen_fiscal_deducciones IS NOT NULL)
                                                  OR (t.regimen_fiscal_deducciones IS NOT NULL AND query.regimen_fiscal_deducciones IS NULL)
				OR t.administracion_declarante<>query.administracion_declarante OR (t.administracion_declarante IS NULL AND query.administracion_declarante IS NOT NULL)
                                                  OR (t.administracion_declarante IS NOT NULL AND query.administracion_declarante IS NULL)
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
		SELECT @count_all = count(*) from #tmp_mi_159_dim_datos_caratula
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_datos_caratula where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_2')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_3')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula
			SET
				modelo=s.modelo,
				regimen_fiscal_deducciones=s.regimen_fiscal_deducciones,
				administracion_declarante=s.administracion_declarante,
				cod_tipo_presentacion=s.cod_tipo_presentacion,
				cod_tipo_declaracion=s.cod_tipo_declaracion,
				id_administracion=s.id_administracion,
				id_tipo_presentacion=s.id_tipo_presentacion,
				id_tipo_declaracion=s.id_tipo_declaracion
		FROM (
			SELECT
				modelo,
				regimen_fiscal_deducciones,
				administracion_declarante,
				cod_tipo_presentacion,
				cod_tipo_declaracion,
				id_administracion,
				id_tipo_presentacion,
				id_tipo_declaracion
			FROM #tmp_mi_159_dim_datos_caratula
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.modelo=s.modelo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.modelo IS NULL AND s.modelo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.regimen_fiscal_deducciones=s.regimen_fiscal_deducciones OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.regimen_fiscal_deducciones IS NULL AND s.regimen_fiscal_deducciones IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.administracion_declarante=s.administracion_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.administracion_declarante IS NULL AND s.administracion_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.cod_tipo_presentacion=s.cod_tipo_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.cod_tipo_presentacion IS NULL AND s.cod_tipo_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.cod_tipo_declaracion=s.cod_tipo_declaracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.cod_tipo_declaracion IS NULL AND s.cod_tipo_declaracion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.id_administracion=s.id_administracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.id_administracion IS NULL AND s.id_administracion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.id_tipo_presentacion=s.id_tipo_presentacion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.id_tipo_presentacion IS NULL AND s.id_tipo_presentacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.id_tipo_declaracion=s.id_tipo_declaracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula.id_tipo_declaracion IS NULL AND s.id_tipo_declaracion IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula AS tbn1_mi_159_dim_datos_caratula
		INNER JOIN #tmp_mi_159_dim_datos_caratula AS tmp
		ON ((tbn1_mi_159_dim_datos_caratula.modelo=tmp.t_modelo OR (tbn1_mi_159_dim_datos_caratula.modelo IS NULL AND tmp.t_modelo IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.regimen_fiscal_deducciones=tmp.t_regimen_fiscal_deducciones OR (tbn1_mi_159_dim_datos_caratula.regimen_fiscal_deducciones IS NULL AND tmp.t_regimen_fiscal_deducciones IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.administracion_declarante=tmp.t_administracion_declarante OR (tbn1_mi_159_dim_datos_caratula.administracion_declarante IS NULL AND tmp.t_administracion_declarante IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.cod_tipo_presentacion=tmp.t_cod_tipo_presentacion OR (tbn1_mi_159_dim_datos_caratula.cod_tipo_presentacion IS NULL AND tmp.t_cod_tipo_presentacion IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.cod_tipo_declaracion=tmp.t_cod_tipo_declaracion OR (tbn1_mi_159_dim_datos_caratula.cod_tipo_declaracion IS NULL AND tmp.t_cod_tipo_declaracion IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.id_administracion=tmp.t_id_administracion OR (tbn1_mi_159_dim_datos_caratula.id_administracion IS NULL AND tmp.t_id_administracion IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.id_tipo_presentacion=tmp.t_id_tipo_presentacion OR (tbn1_mi_159_dim_datos_caratula.id_tipo_presentacion IS NULL AND tmp.t_id_tipo_presentacion IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.id_tipo_declaracion=tmp.t_id_tipo_declaracion OR (tbn1_mi_159_dim_datos_caratula.id_tipo_declaracion IS NULL AND tmp.t_id_tipo_declaracion IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula WITH(TABLOCK) (modelo,regimen_fiscal_deducciones,administracion_declarante,cod_tipo_presentacion,cod_tipo_declaracion,id_administracion,id_tipo_presentacion,id_tipo_declaracion)
		SELECT
			modelo,
			regimen_fiscal_deducciones,
			administracion_declarante,
			cod_tipo_presentacion,
			cod_tipo_declaracion,
			id_administracion,
			id_tipo_presentacion,
			id_tipo_declaracion
			FROM #tmp_mi_159_dim_datos_caratula
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_2')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_3')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_caratula_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_caratula_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_marcas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_marcas'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_marcas') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_marcas
		CREATE table #tmp_mi_159_dim_marcas(
			rr_mode varchar(1),
			cc int,
			id_dim_marcas int,
			t_es_externo_declarante bit,
			t_es_identificado_declarante bit,
			t_es_externo_declarado bit,
			t_es_identificado_declarado bit,
			t_es_erroneo_declarado bit,
			es_externo_declarante bit,
			es_identificado_declarante bit,
			es_externo_declarado bit,
			es_identificado_declarado bit,
			es_erroneo_declarado bit
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.es_externo_declarante AS es_externo_declarante,
		st.es_identificado_declarante AS es_identificado_declarante,
		st.es_externo_declarado AS es_externo_declarado,
		st.es_identificado_declarado AS es_identificado_declarado,
		st.es_erroneo_declarado AS es_erroneo_declarado
	FROM (SELECT
		es_externo_declarante,
		es_identificado_declarante,
		es_externo_declarado,
		es_identificado_declarado,
		es_erroneo_declarado
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		es_externo_declarante,
		es_identificado_declarante,
		es_externo_declarado,
		es_identificado_declarado,
		es_erroneo_declarado
	) st

	GROUP BY
		st.es_externo_declarante,
		st.es_identificado_declarante,
		st.es_externo_declarado,
		st.es_identificado_declarado,
		st.es_erroneo_declarado
		)
		INSERT INTO #tmp_mi_159_dim_marcas (rr_mode,cc,id_dim_marcas,t_es_externo_declarante,t_es_identificado_declarante,t_es_externo_declarado,t_es_identificado_declarado,t_es_erroneo_declarado,es_externo_declarante,es_identificado_declarante,es_externo_declarado,es_identificado_declarado,es_erroneo_declarado)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_marcas IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_marcas AS id_dim_marcas,
			t.es_externo_declarante AS t_es_externo_declarante,
			t.es_identificado_declarante AS t_es_identificado_declarante,
			t.es_externo_declarado AS t_es_externo_declarado,
			t.es_identificado_declarado AS t_es_identificado_declarado,
			t.es_erroneo_declarado AS t_es_erroneo_declarado,
			query.es_externo_declarante AS es_externo_declarante,
			query.es_identificado_declarante AS es_identificado_declarante,
			query.es_externo_declarado AS es_externo_declarado,
			query.es_identificado_declarado AS es_identificado_declarado,
			query.es_erroneo_declarado AS es_erroneo_declarado
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas AS t
		FULL JOIN query on ((query.es_externo_declarante=t.es_externo_declarante OR (query.es_externo_declarante IS NULL AND t.es_externo_declarante IS NULL)) AND (query.es_identificado_declarante=t.es_identificado_declarante OR (query.es_identificado_declarante IS NULL AND t.es_identificado_declarante IS NULL)) AND (query.es_externo_declarado=t.es_externo_declarado OR (query.es_externo_declarado IS NULL AND t.es_externo_declarado IS NULL)) AND (query.es_identificado_declarado=t.es_identificado_declarado OR (query.es_identificado_declarado IS NULL AND t.es_identificado_declarado IS NULL)) AND (query.es_erroneo_declarado=t.es_erroneo_declarado OR (query.es_erroneo_declarado IS NULL AND t.es_erroneo_declarado IS NULL)))
		WHERE 
			id_dim_marcas IS NULL OR
			cc IS NULL OR
			(t.es_externo_declarante<>query.es_externo_declarante OR (t.es_externo_declarante IS NULL AND query.es_externo_declarante IS NOT NULL)
                                                  OR (t.es_externo_declarante IS NOT NULL AND query.es_externo_declarante IS NULL)
				OR t.es_identificado_declarante<>query.es_identificado_declarante OR (t.es_identificado_declarante IS NULL AND query.es_identificado_declarante IS NOT NULL)
                                                  OR (t.es_identificado_declarante IS NOT NULL AND query.es_identificado_declarante IS NULL)
				OR t.es_externo_declarado<>query.es_externo_declarado OR (t.es_externo_declarado IS NULL AND query.es_externo_declarado IS NOT NULL)
                                                  OR (t.es_externo_declarado IS NOT NULL AND query.es_externo_declarado IS NULL)
				OR t.es_identificado_declarado<>query.es_identificado_declarado OR (t.es_identificado_declarado IS NULL AND query.es_identificado_declarado IS NOT NULL)
                                                  OR (t.es_identificado_declarado IS NOT NULL AND query.es_identificado_declarado IS NULL)
				OR t.es_erroneo_declarado<>query.es_erroneo_declarado OR (t.es_erroneo_declarado IS NULL AND query.es_erroneo_declarado IS NOT NULL)
                                                  OR (t.es_erroneo_declarado IS NOT NULL AND query.es_erroneo_declarado IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_marcas
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_marcas where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas
			SET
				es_externo_declarante=s.es_externo_declarante,
				es_identificado_declarante=s.es_identificado_declarante,
				es_externo_declarado=s.es_externo_declarado,
				es_identificado_declarado=s.es_identificado_declarado,
				es_erroneo_declarado=s.es_erroneo_declarado
		FROM (
			SELECT
				es_externo_declarante,
				es_identificado_declarante,
				es_externo_declarado,
				es_identificado_declarado,
				es_erroneo_declarado
			FROM #tmp_mi_159_dim_marcas
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_externo_declarante=s.es_externo_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_externo_declarante IS NULL AND s.es_externo_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_identificado_declarante=s.es_identificado_declarante OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_identificado_declarante IS NULL AND s.es_identificado_declarante IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_externo_declarado=s.es_externo_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_externo_declarado IS NULL AND s.es_externo_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_identificado_declarado=s.es_identificado_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_identificado_declarado IS NULL AND s.es_identificado_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_erroneo_declarado=s.es_erroneo_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas.es_erroneo_declarado IS NULL AND s.es_erroneo_declarado IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas AS tbn1_mi_159_dim_marcas
		INNER JOIN #tmp_mi_159_dim_marcas AS tmp
		ON ((tbn1_mi_159_dim_marcas.es_externo_declarante=tmp.t_es_externo_declarante OR (tbn1_mi_159_dim_marcas.es_externo_declarante IS NULL AND tmp.t_es_externo_declarante IS NULL)) AND (tbn1_mi_159_dim_marcas.es_identificado_declarante=tmp.t_es_identificado_declarante OR (tbn1_mi_159_dim_marcas.es_identificado_declarante IS NULL AND tmp.t_es_identificado_declarante IS NULL)) AND (tbn1_mi_159_dim_marcas.es_externo_declarado=tmp.t_es_externo_declarado OR (tbn1_mi_159_dim_marcas.es_externo_declarado IS NULL AND tmp.t_es_externo_declarado IS NULL)) AND (tbn1_mi_159_dim_marcas.es_identificado_declarado=tmp.t_es_identificado_declarado OR (tbn1_mi_159_dim_marcas.es_identificado_declarado IS NULL AND tmp.t_es_identificado_declarado IS NULL)) AND (tbn1_mi_159_dim_marcas.es_erroneo_declarado=tmp.t_es_erroneo_declarado OR (tbn1_mi_159_dim_marcas.es_erroneo_declarado IS NULL AND tmp.t_es_erroneo_declarado IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_marcas_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_marcas_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas WITH(TABLOCK) (es_externo_declarante,es_identificado_declarante,es_externo_declarado,es_identificado_declarado,es_erroneo_declarado)
		SELECT
			es_externo_declarante,
			es_identificado_declarante,
			es_externo_declarado,
			es_identificado_declarado,
			es_erroneo_declarado
			FROM #tmp_mi_159_dim_marcas
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_marcas_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_marcas_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_datos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_detalle(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_detalle'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_datos_detalle') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_datos_detalle
		CREATE table #tmp_mi_159_dim_datos_detalle(
			rr_mode varchar(1),
			cc int,
			id_dim_datos_detalle int,
			t_potencia_maxima_contratada varchar(6),
			t_administracion_declarado varchar(1),
			t_cod_clave_tipo_codigo varchar(1),
			t_cod_tipo_bien varchar(1),
			t_cod_situacion_inmueble varchar(1),
			t_cod_unidad_consumo varchar(1),
			t_cod_unidad_potencia varchar(1),
			t_cod_tipo_importe varchar(2),
			t_id_administracion int,
			t_id_clave_tipo_codigo int,
			t_id_mae_tipo_bien int,
			t_id_mae_situacion_inmueble int,
			t_id_mae_unidad_consumo int,
			t_id_mae_unidad_potencia int,
			t_id_mae_tipo_importe int,
			potencia_maxima_contratada varchar(6),
			administracion_declarado varchar(1),
			cod_clave_tipo_codigo varchar(1),
			cod_tipo_bien varchar(1),
			cod_situacion_inmueble varchar(1),
			cod_unidad_consumo varchar(1),
			cod_unidad_potencia varchar(1),
			cod_tipo_importe varchar(2),
			id_administracion int,
			id_clave_tipo_codigo int,
			id_mae_tipo_bien int,
			id_mae_situacion_inmueble int,
			id_mae_unidad_consumo int,
			id_mae_unidad_potencia int,
			id_mae_tipo_importe int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.potencia_maxima_contratada AS potencia_maxima_contratada,
		st.administracion_declarado AS administracion_declarado,
		st.cod_clave_tipo_codigo AS cod_clave_tipo_codigo,
		st.cod_tipo_bien AS cod_tipo_bien,
		st.cod_situacion_inmueble AS cod_situacion_inmueble,
		st.cod_unidad_consumo AS cod_unidad_consumo,
		st.cod_unidad_potencia AS cod_unidad_potencia,
		st.cod_tipo_importe AS cod_tipo_importe,
		tbn1_dim_mi_administracion_hacienda_id_administracion.id_administracion AS id_administracion,
		tbn1_dim_mi_clave_tipo_codigo_id_clave_tipo_codigo.id_clave_tipo_codigo AS id_clave_tipo_codigo,
		tbn1_mae_tipo_bien_id_mae_tipo_bien.id_mae_tipo_bien AS id_mae_tipo_bien,
		tbn1_mae_situacion_inmueble_id_mae_situacion_inmueble.id_mae_situacion_inmueble AS id_mae_situacion_inmueble,
		tbn1_mae_unidad_consumo_id_mae_unidad_consumo.id_mae_unidad_consumo AS id_mae_unidad_consumo,
		tbn1_mae_unidad_potencia_id_mae_unidad_potencia.id_mae_unidad_potencia AS id_mae_unidad_potencia,
		tbn1_mae_tipo_importe_id_mae_tipo_importe.id_mae_tipo_importe AS id_mae_tipo_importe
	FROM (SELECT
		potencia_maxima_contratada,
		administracion_declarado,
		cod_clave_tipo_codigo,
		cod_tipo_bien,
		cod_situacion_inmueble,
		cod_unidad_consumo,
		cod_unidad_potencia,
		cod_tipo_importe
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		potencia_maxima_contratada,
		administracion_declarado,
		cod_clave_tipo_codigo,
		cod_tipo_bien,
		cod_situacion_inmueble,
		cod_unidad_consumo,
		cod_unidad_potencia,
		cod_tipo_importe
	) st
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda AS tbn1_dim_mi_administracion_hacienda_id_administracion ON (tbn1_dim_mi_administracion_hacienda_id_administracion.cod_administracion=st.administracion_declarado OR (tbn1_dim_mi_administracion_hacienda_id_administracion.cod_administracion IS NULL AND st.administracion_declarado IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo AS tbn1_dim_mi_clave_tipo_codigo_id_clave_tipo_codigo ON (tbn1_dim_mi_clave_tipo_codigo_id_clave_tipo_codigo.cod_clave_tipo_codigo=st.cod_clave_tipo_codigo OR (tbn1_dim_mi_clave_tipo_codigo_id_clave_tipo_codigo.cod_clave_tipo_codigo IS NULL AND st.cod_clave_tipo_codigo IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien AS tbn1_mae_tipo_bien_id_mae_tipo_bien ON (tbn1_mae_tipo_bien_id_mae_tipo_bien.cod_tipo_bien=st.cod_tipo_bien OR (tbn1_mae_tipo_bien_id_mae_tipo_bien.cod_tipo_bien IS NULL AND st.cod_tipo_bien IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble AS tbn1_mae_situacion_inmueble_id_mae_situacion_inmueble ON (tbn1_mae_situacion_inmueble_id_mae_situacion_inmueble.cod_situacion_inmueble=st.cod_situacion_inmueble OR (tbn1_mae_situacion_inmueble_id_mae_situacion_inmueble.cod_situacion_inmueble IS NULL AND st.cod_situacion_inmueble IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo AS tbn1_mae_unidad_consumo_id_mae_unidad_consumo ON (tbn1_mae_unidad_consumo_id_mae_unidad_consumo.cod_unidad_consumo=st.cod_unidad_consumo OR (tbn1_mae_unidad_consumo_id_mae_unidad_consumo.cod_unidad_consumo IS NULL AND st.cod_unidad_consumo IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia AS tbn1_mae_unidad_potencia_id_mae_unidad_potencia ON (tbn1_mae_unidad_potencia_id_mae_unidad_potencia.cod_unidad_potencia=st.cod_unidad_potencia OR (tbn1_mae_unidad_potencia_id_mae_unidad_potencia.cod_unidad_potencia IS NULL AND st.cod_unidad_potencia IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe AS tbn1_mae_tipo_importe_id_mae_tipo_importe ON (tbn1_mae_tipo_importe_id_mae_tipo_importe.cod_tipo_importe=st.cod_tipo_importe OR (tbn1_mae_tipo_importe_id_mae_tipo_importe.cod_tipo_importe IS NULL AND st.cod_tipo_importe IS NULL))
	GROUP BY
		st.potencia_maxima_contratada,
		st.administracion_declarado,
		st.cod_clave_tipo_codigo,
		st.cod_tipo_bien,
		st.cod_situacion_inmueble,
		st.cod_unidad_consumo,
		st.cod_unidad_potencia,
		st.cod_tipo_importe,
		tbn1_dim_mi_administracion_hacienda_id_administracion.id_administracion,
		tbn1_dim_mi_clave_tipo_codigo_id_clave_tipo_codigo.id_clave_tipo_codigo,
		tbn1_mae_tipo_bien_id_mae_tipo_bien.id_mae_tipo_bien,
		tbn1_mae_situacion_inmueble_id_mae_situacion_inmueble.id_mae_situacion_inmueble,
		tbn1_mae_unidad_consumo_id_mae_unidad_consumo.id_mae_unidad_consumo,
		tbn1_mae_unidad_potencia_id_mae_unidad_potencia.id_mae_unidad_potencia,
		tbn1_mae_tipo_importe_id_mae_tipo_importe.id_mae_tipo_importe
		)
		INSERT INTO #tmp_mi_159_dim_datos_detalle (rr_mode,cc,id_dim_datos_detalle,t_potencia_maxima_contratada,t_administracion_declarado,t_cod_clave_tipo_codigo,t_cod_tipo_bien,t_cod_situacion_inmueble,t_cod_unidad_consumo,t_cod_unidad_potencia,t_cod_tipo_importe,t_id_administracion,t_id_clave_tipo_codigo,t_id_mae_tipo_bien,t_id_mae_situacion_inmueble,t_id_mae_unidad_consumo,t_id_mae_unidad_potencia,t_id_mae_tipo_importe,potencia_maxima_contratada,administracion_declarado,cod_clave_tipo_codigo,cod_tipo_bien,cod_situacion_inmueble,cod_unidad_consumo,cod_unidad_potencia,cod_tipo_importe,id_administracion,id_clave_tipo_codigo,id_mae_tipo_bien,id_mae_situacion_inmueble,id_mae_unidad_consumo,id_mae_unidad_potencia,id_mae_tipo_importe)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_datos_detalle IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_datos_detalle AS id_dim_datos_detalle,
			t.potencia_maxima_contratada AS t_potencia_maxima_contratada,
			t.administracion_declarado AS t_administracion_declarado,
			t.cod_clave_tipo_codigo AS t_cod_clave_tipo_codigo,
			t.cod_tipo_bien AS t_cod_tipo_bien,
			t.cod_situacion_inmueble AS t_cod_situacion_inmueble,
			t.cod_unidad_consumo AS t_cod_unidad_consumo,
			t.cod_unidad_potencia AS t_cod_unidad_potencia,
			t.cod_tipo_importe AS t_cod_tipo_importe,
			t.id_administracion AS t_id_administracion,
			t.id_clave_tipo_codigo AS t_id_clave_tipo_codigo,
			t.id_mae_tipo_bien AS t_id_mae_tipo_bien,
			t.id_mae_situacion_inmueble AS t_id_mae_situacion_inmueble,
			t.id_mae_unidad_consumo AS t_id_mae_unidad_consumo,
			t.id_mae_unidad_potencia AS t_id_mae_unidad_potencia,
			t.id_mae_tipo_importe AS t_id_mae_tipo_importe,
			query.potencia_maxima_contratada AS potencia_maxima_contratada,
			query.administracion_declarado AS administracion_declarado,
			query.cod_clave_tipo_codigo AS cod_clave_tipo_codigo,
			query.cod_tipo_bien AS cod_tipo_bien,
			query.cod_situacion_inmueble AS cod_situacion_inmueble,
			query.cod_unidad_consumo AS cod_unidad_consumo,
			query.cod_unidad_potencia AS cod_unidad_potencia,
			query.cod_tipo_importe AS cod_tipo_importe,
			query.id_administracion AS id_administracion,
			query.id_clave_tipo_codigo AS id_clave_tipo_codigo,
			query.id_mae_tipo_bien AS id_mae_tipo_bien,
			query.id_mae_situacion_inmueble AS id_mae_situacion_inmueble,
			query.id_mae_unidad_consumo AS id_mae_unidad_consumo,
			query.id_mae_unidad_potencia AS id_mae_unidad_potencia,
			query.id_mae_tipo_importe AS id_mae_tipo_importe
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle AS t
		FULL JOIN query on ((query.potencia_maxima_contratada=t.potencia_maxima_contratada OR (query.potencia_maxima_contratada IS NULL AND t.potencia_maxima_contratada IS NULL)) AND (query.administracion_declarado=t.administracion_declarado OR (query.administracion_declarado IS NULL AND t.administracion_declarado IS NULL)) AND (query.cod_clave_tipo_codigo=t.cod_clave_tipo_codigo OR (query.cod_clave_tipo_codigo IS NULL AND t.cod_clave_tipo_codigo IS NULL)) AND (query.cod_tipo_bien=t.cod_tipo_bien OR (query.cod_tipo_bien IS NULL AND t.cod_tipo_bien IS NULL)) AND (query.cod_situacion_inmueble=t.cod_situacion_inmueble OR (query.cod_situacion_inmueble IS NULL AND t.cod_situacion_inmueble IS NULL)) AND (query.cod_unidad_consumo=t.cod_unidad_consumo OR (query.cod_unidad_consumo IS NULL AND t.cod_unidad_consumo IS NULL)) AND (query.cod_unidad_potencia=t.cod_unidad_potencia OR (query.cod_unidad_potencia IS NULL AND t.cod_unidad_potencia IS NULL)) AND (query.cod_tipo_importe=t.cod_tipo_importe OR (query.cod_tipo_importe IS NULL AND t.cod_tipo_importe IS NULL)) AND (query.id_administracion=t.id_administracion OR (query.id_administracion IS NULL AND t.id_administracion IS NULL)) AND (query.id_clave_tipo_codigo=t.id_clave_tipo_codigo OR (query.id_clave_tipo_codigo IS NULL AND t.id_clave_tipo_codigo IS NULL)) AND (query.id_mae_tipo_bien=t.id_mae_tipo_bien OR (query.id_mae_tipo_bien IS NULL AND t.id_mae_tipo_bien IS NULL)) AND (query.id_mae_situacion_inmueble=t.id_mae_situacion_inmueble OR (query.id_mae_situacion_inmueble IS NULL AND t.id_mae_situacion_inmueble IS NULL)) AND (query.id_mae_unidad_consumo=t.id_mae_unidad_consumo OR (query.id_mae_unidad_consumo IS NULL AND t.id_mae_unidad_consumo IS NULL)) AND (query.id_mae_unidad_potencia=t.id_mae_unidad_potencia OR (query.id_mae_unidad_potencia IS NULL AND t.id_mae_unidad_potencia IS NULL)) AND (query.id_mae_tipo_importe=t.id_mae_tipo_importe OR (query.id_mae_tipo_importe IS NULL AND t.id_mae_tipo_importe IS NULL)))
		WHERE 
			id_dim_datos_detalle IS NULL OR
			cc IS NULL OR
			(t.potencia_maxima_contratada<>query.potencia_maxima_contratada OR (t.potencia_maxima_contratada IS NULL AND query.potencia_maxima_contratada IS NOT NULL)
                                                  OR (t.potencia_maxima_contratada IS NOT NULL AND query.potencia_maxima_contratada IS NULL)
				OR t.administracion_declarado<>query.administracion_declarado OR (t.administracion_declarado IS NULL AND query.administracion_declarado IS NOT NULL)
                                                  OR (t.administracion_declarado IS NOT NULL AND query.administracion_declarado IS NULL)
				OR t.cod_clave_tipo_codigo<>query.cod_clave_tipo_codigo OR (t.cod_clave_tipo_codigo IS NULL AND query.cod_clave_tipo_codigo IS NOT NULL)
                                                  OR (t.cod_clave_tipo_codigo IS NOT NULL AND query.cod_clave_tipo_codigo IS NULL)
				OR t.cod_tipo_bien<>query.cod_tipo_bien OR (t.cod_tipo_bien IS NULL AND query.cod_tipo_bien IS NOT NULL)
                                                  OR (t.cod_tipo_bien IS NOT NULL AND query.cod_tipo_bien IS NULL)
				OR t.cod_situacion_inmueble<>query.cod_situacion_inmueble OR (t.cod_situacion_inmueble IS NULL AND query.cod_situacion_inmueble IS NOT NULL)
                                                  OR (t.cod_situacion_inmueble IS NOT NULL AND query.cod_situacion_inmueble IS NULL)
				OR t.cod_unidad_consumo<>query.cod_unidad_consumo OR (t.cod_unidad_consumo IS NULL AND query.cod_unidad_consumo IS NOT NULL)
                                                  OR (t.cod_unidad_consumo IS NOT NULL AND query.cod_unidad_consumo IS NULL)
				OR t.cod_unidad_potencia<>query.cod_unidad_potencia OR (t.cod_unidad_potencia IS NULL AND query.cod_unidad_potencia IS NOT NULL)
                                                  OR (t.cod_unidad_potencia IS NOT NULL AND query.cod_unidad_potencia IS NULL)
				OR t.cod_tipo_importe<>query.cod_tipo_importe OR (t.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL)
                                                  OR (t.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
				OR t.id_administracion<>query.id_administracion OR (t.id_administracion IS NULL AND query.id_administracion IS NOT NULL)
                                                  OR (t.id_administracion IS NOT NULL AND query.id_administracion IS NULL)
				OR t.id_clave_tipo_codigo<>query.id_clave_tipo_codigo OR (t.id_clave_tipo_codigo IS NULL AND query.id_clave_tipo_codigo IS NOT NULL)
                                                  OR (t.id_clave_tipo_codigo IS NOT NULL AND query.id_clave_tipo_codigo IS NULL)
				OR t.id_mae_tipo_bien<>query.id_mae_tipo_bien OR (t.id_mae_tipo_bien IS NULL AND query.id_mae_tipo_bien IS NOT NULL)
                                                  OR (t.id_mae_tipo_bien IS NOT NULL AND query.id_mae_tipo_bien IS NULL)
				OR t.id_mae_situacion_inmueble<>query.id_mae_situacion_inmueble OR (t.id_mae_situacion_inmueble IS NULL AND query.id_mae_situacion_inmueble IS NOT NULL)
                                                  OR (t.id_mae_situacion_inmueble IS NOT NULL AND query.id_mae_situacion_inmueble IS NULL)
				OR t.id_mae_unidad_consumo<>query.id_mae_unidad_consumo OR (t.id_mae_unidad_consumo IS NULL AND query.id_mae_unidad_consumo IS NOT NULL)
                                                  OR (t.id_mae_unidad_consumo IS NOT NULL AND query.id_mae_unidad_consumo IS NULL)
				OR t.id_mae_unidad_potencia<>query.id_mae_unidad_potencia OR (t.id_mae_unidad_potencia IS NULL AND query.id_mae_unidad_potencia IS NOT NULL)
                                                  OR (t.id_mae_unidad_potencia IS NOT NULL AND query.id_mae_unidad_potencia IS NULL)
				OR t.id_mae_tipo_importe<>query.id_mae_tipo_importe OR (t.id_mae_tipo_importe IS NULL AND query.id_mae_tipo_importe IS NOT NULL)
                                                  OR (t.id_mae_tipo_importe IS NOT NULL AND query.id_mae_tipo_importe IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_datos_detalle
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_datos_detalle where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_2')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_3')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_4')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_5')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_6')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_7')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle
			SET
				potencia_maxima_contratada=s.potencia_maxima_contratada,
				administracion_declarado=s.administracion_declarado,
				cod_clave_tipo_codigo=s.cod_clave_tipo_codigo,
				cod_tipo_bien=s.cod_tipo_bien,
				cod_situacion_inmueble=s.cod_situacion_inmueble,
				cod_unidad_consumo=s.cod_unidad_consumo,
				cod_unidad_potencia=s.cod_unidad_potencia,
				cod_tipo_importe=s.cod_tipo_importe,
				id_administracion=s.id_administracion,
				id_clave_tipo_codigo=s.id_clave_tipo_codigo,
				id_mae_tipo_bien=s.id_mae_tipo_bien,
				id_mae_situacion_inmueble=s.id_mae_situacion_inmueble,
				id_mae_unidad_consumo=s.id_mae_unidad_consumo,
				id_mae_unidad_potencia=s.id_mae_unidad_potencia,
				id_mae_tipo_importe=s.id_mae_tipo_importe
		FROM (
			SELECT
				potencia_maxima_contratada,
				administracion_declarado,
				cod_clave_tipo_codigo,
				cod_tipo_bien,
				cod_situacion_inmueble,
				cod_unidad_consumo,
				cod_unidad_potencia,
				cod_tipo_importe,
				id_administracion,
				id_clave_tipo_codigo,
				id_mae_tipo_bien,
				id_mae_situacion_inmueble,
				id_mae_unidad_consumo,
				id_mae_unidad_potencia,
				id_mae_tipo_importe
			FROM #tmp_mi_159_dim_datos_detalle
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.potencia_maxima_contratada=s.potencia_maxima_contratada OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.potencia_maxima_contratada IS NULL AND s.potencia_maxima_contratada IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.administracion_declarado=s.administracion_declarado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.administracion_declarado IS NULL AND s.administracion_declarado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_clave_tipo_codigo=s.cod_clave_tipo_codigo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_clave_tipo_codigo IS NULL AND s.cod_clave_tipo_codigo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_tipo_bien=s.cod_tipo_bien OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_tipo_bien IS NULL AND s.cod_tipo_bien IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_situacion_inmueble=s.cod_situacion_inmueble OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_situacion_inmueble IS NULL AND s.cod_situacion_inmueble IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_unidad_consumo=s.cod_unidad_consumo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_unidad_consumo IS NULL AND s.cod_unidad_consumo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_unidad_potencia=s.cod_unidad_potencia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_unidad_potencia IS NULL AND s.cod_unidad_potencia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_tipo_importe=s.cod_tipo_importe OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.cod_tipo_importe IS NULL AND s.cod_tipo_importe IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_administracion=s.id_administracion OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_administracion IS NULL AND s.id_administracion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_clave_tipo_codigo=s.id_clave_tipo_codigo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_clave_tipo_codigo IS NULL AND s.id_clave_tipo_codigo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_tipo_bien=s.id_mae_tipo_bien OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_tipo_bien IS NULL AND s.id_mae_tipo_bien IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_situacion_inmueble=s.id_mae_situacion_inmueble OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_situacion_inmueble IS NULL AND s.id_mae_situacion_inmueble IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_unidad_consumo=s.id_mae_unidad_consumo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_unidad_consumo IS NULL AND s.id_mae_unidad_consumo IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_unidad_potencia=s.id_mae_unidad_potencia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_unidad_potencia IS NULL AND s.id_mae_unidad_potencia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_tipo_importe=s.id_mae_tipo_importe OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle.id_mae_tipo_importe IS NULL AND s.id_mae_tipo_importe IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle AS tbn1_mi_159_dim_datos_detalle
		INNER JOIN #tmp_mi_159_dim_datos_detalle AS tmp
		ON ((tbn1_mi_159_dim_datos_detalle.potencia_maxima_contratada=tmp.t_potencia_maxima_contratada OR (tbn1_mi_159_dim_datos_detalle.potencia_maxima_contratada IS NULL AND tmp.t_potencia_maxima_contratada IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.administracion_declarado=tmp.t_administracion_declarado OR (tbn1_mi_159_dim_datos_detalle.administracion_declarado IS NULL AND tmp.t_administracion_declarado IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_clave_tipo_codigo=tmp.t_cod_clave_tipo_codigo OR (tbn1_mi_159_dim_datos_detalle.cod_clave_tipo_codigo IS NULL AND tmp.t_cod_clave_tipo_codigo IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_tipo_bien=tmp.t_cod_tipo_bien OR (tbn1_mi_159_dim_datos_detalle.cod_tipo_bien IS NULL AND tmp.t_cod_tipo_bien IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_situacion_inmueble=tmp.t_cod_situacion_inmueble OR (tbn1_mi_159_dim_datos_detalle.cod_situacion_inmueble IS NULL AND tmp.t_cod_situacion_inmueble IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_unidad_consumo=tmp.t_cod_unidad_consumo OR (tbn1_mi_159_dim_datos_detalle.cod_unidad_consumo IS NULL AND tmp.t_cod_unidad_consumo IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_unidad_potencia=tmp.t_cod_unidad_potencia OR (tbn1_mi_159_dim_datos_detalle.cod_unidad_potencia IS NULL AND tmp.t_cod_unidad_potencia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_tipo_importe=tmp.t_cod_tipo_importe OR (tbn1_mi_159_dim_datos_detalle.cod_tipo_importe IS NULL AND tmp.t_cod_tipo_importe IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_administracion=tmp.t_id_administracion OR (tbn1_mi_159_dim_datos_detalle.id_administracion IS NULL AND tmp.t_id_administracion IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_clave_tipo_codigo=tmp.t_id_clave_tipo_codigo OR (tbn1_mi_159_dim_datos_detalle.id_clave_tipo_codigo IS NULL AND tmp.t_id_clave_tipo_codigo IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_mae_tipo_bien=tmp.t_id_mae_tipo_bien OR (tbn1_mi_159_dim_datos_detalle.id_mae_tipo_bien IS NULL AND tmp.t_id_mae_tipo_bien IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_mae_situacion_inmueble=tmp.t_id_mae_situacion_inmueble OR (tbn1_mi_159_dim_datos_detalle.id_mae_situacion_inmueble IS NULL AND tmp.t_id_mae_situacion_inmueble IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_mae_unidad_consumo=tmp.t_id_mae_unidad_consumo OR (tbn1_mi_159_dim_datos_detalle.id_mae_unidad_consumo IS NULL AND tmp.t_id_mae_unidad_consumo IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_mae_unidad_potencia=tmp.t_id_mae_unidad_potencia OR (tbn1_mi_159_dim_datos_detalle.id_mae_unidad_potencia IS NULL AND tmp.t_id_mae_unidad_potencia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.id_mae_tipo_importe=tmp.t_id_mae_tipo_importe OR (tbn1_mi_159_dim_datos_detalle.id_mae_tipo_importe IS NULL AND tmp.t_id_mae_tipo_importe IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle WITH(TABLOCK) (potencia_maxima_contratada,administracion_declarado,cod_clave_tipo_codigo,cod_tipo_bien,cod_situacion_inmueble,cod_unidad_consumo,cod_unidad_potencia,cod_tipo_importe,id_administracion,id_clave_tipo_codigo,id_mae_tipo_bien,id_mae_situacion_inmueble,id_mae_unidad_consumo,id_mae_unidad_potencia,id_mae_tipo_importe)
		SELECT
			potencia_maxima_contratada,
			administracion_declarado,
			cod_clave_tipo_codigo,
			cod_tipo_bien,
			cod_situacion_inmueble,
			cod_unidad_consumo,
			cod_unidad_potencia,
			cod_tipo_importe,
			id_administracion,
			id_clave_tipo_codigo,
			id_mae_tipo_bien,
			id_mae_situacion_inmueble,
			id_mae_unidad_consumo,
			id_mae_unidad_potencia,
			id_mae_tipo_importe
			FROM #tmp_mi_159_dim_datos_detalle
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_2')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_3')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_4')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_5')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_6')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_7')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_datos_detalle2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_detalle2;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_detalle2(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_detalle2'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_datos_detalle2') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_datos_detalle2
		CREATE table #tmp_mi_159_dim_datos_detalle2(
			rr_mode varchar(1),
			cc int,
			id_dim_datos_detalle2 int,
			t_cups_distribuidora varchar(4),
			t_cups_medida varchar(1),
			t_cups_suministro varchar(1),
			t_domi_municipio varchar(30),
			t_domi_codigo_municipio varchar(5),
			t_domi_codigo_postal varchar(5),
			t_cod_pais_residencia varchar(3),
			t_cod_cups_pais varchar(3),
			t_domi_codigo_provincia varchar(2),
			t_id_pais int,
			t_id_pais_cups int,
			t_id_provincia int,
			cups_distribuidora varchar(4),
			cups_medida varchar(1),
			cups_suministro varchar(1),
			domi_municipio varchar(30),
			domi_codigo_municipio varchar(5),
			domi_codigo_postal varchar(5),
			cod_pais_residencia varchar(3),
			cod_cups_pais varchar(3),
			domi_codigo_provincia varchar(2),
			id_pais int,
			id_pais_cups int,
			id_provincia int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.cups_distribuidora AS cups_distribuidora,
		st.cups_medida AS cups_medida,
		st.cups_suministro AS cups_suministro,
		st.domi_municipio AS domi_municipio,
		st.domi_codigo_municipio AS domi_codigo_municipio,
		st.domi_codigo_postal AS domi_codigo_postal,
		st.cod_pais_residencia AS cod_pais_residencia,
		st.cod_cups_pais AS cod_cups_pais,
		st.domi_codigo_provincia AS domi_codigo_provincia,
		tbn1_dim_paises_id_pais.id_pais AS id_pais,
		tbn1_dim_paises_id_pais_cups.id_pais AS id_pais_cups,
		tbn1_dim_provincias_id_provincia.id_provincia AS id_provincia
	FROM (SELECT
		cups_distribuidora,
		cups_medida,
		cups_suministro,
		domi_municipio,
		domi_codigo_municipio,
		domi_codigo_postal,
		cod_pais_residencia,
		cod_cups_pais,
		domi_codigo_provincia
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		cups_distribuidora,
		cups_medida,
		cups_suministro,
		domi_municipio,
		domi_codigo_municipio,
		domi_codigo_postal,
		cod_pais_residencia,
		cod_cups_pais,
		domi_codigo_provincia
	) st
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_paises AS tbn1_dim_paises_id_pais ON (tbn1_dim_paises_id_pais.cod_pais=st.cod_pais_residencia OR (tbn1_dim_paises_id_pais.cod_pais IS NULL AND st.cod_pais_residencia IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_paises AS tbn1_dim_paises_id_pais_cups ON (tbn1_dim_paises_id_pais_cups.cod_pais=st.cod_cups_pais OR (tbn1_dim_paises_id_pais_cups.cod_pais IS NULL AND st.cod_cups_pais IS NULL))
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_provincias AS tbn1_dim_provincias_id_provincia ON (tbn1_dim_provincias_id_provincia.cod_provincia2=st.domi_codigo_provincia OR (tbn1_dim_provincias_id_provincia.cod_provincia2 IS NULL AND st.domi_codigo_provincia IS NULL))
	GROUP BY
		st.cups_distribuidora,
		st.cups_medida,
		st.cups_suministro,
		st.domi_municipio,
		st.domi_codigo_municipio,
		st.domi_codigo_postal,
		st.cod_pais_residencia,
		st.cod_cups_pais,
		st.domi_codigo_provincia,
		tbn1_dim_paises_id_pais.id_pais,
		tbn1_dim_paises_id_pais_cups.id_pais,
		tbn1_dim_provincias_id_provincia.id_provincia
		)
		INSERT INTO #tmp_mi_159_dim_datos_detalle2 (rr_mode,cc,id_dim_datos_detalle2,t_cups_distribuidora,t_cups_medida,t_cups_suministro,t_domi_municipio,t_domi_codigo_municipio,t_domi_codigo_postal,t_cod_pais_residencia,t_cod_cups_pais,t_domi_codigo_provincia,t_id_pais,t_id_pais_cups,t_id_provincia,cups_distribuidora,cups_medida,cups_suministro,domi_municipio,domi_codigo_municipio,domi_codigo_postal,cod_pais_residencia,cod_cups_pais,domi_codigo_provincia,id_pais,id_pais_cups,id_provincia)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_datos_detalle2 IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_datos_detalle2 AS id_dim_datos_detalle2,
			t.cups_distribuidora AS t_cups_distribuidora,
			t.cups_medida AS t_cups_medida,
			t.cups_suministro AS t_cups_suministro,
			t.domi_municipio AS t_domi_municipio,
			t.domi_codigo_municipio AS t_domi_codigo_municipio,
			t.domi_codigo_postal AS t_domi_codigo_postal,
			t.cod_pais_residencia AS t_cod_pais_residencia,
			t.cod_cups_pais AS t_cod_cups_pais,
			t.domi_codigo_provincia AS t_domi_codigo_provincia,
			t.id_pais AS t_id_pais,
			t.id_pais_cups AS t_id_pais_cups,
			t.id_provincia AS t_id_provincia,
			query.cups_distribuidora AS cups_distribuidora,
			query.cups_medida AS cups_medida,
			query.cups_suministro AS cups_suministro,
			query.domi_municipio AS domi_municipio,
			query.domi_codigo_municipio AS domi_codigo_municipio,
			query.domi_codigo_postal AS domi_codigo_postal,
			query.cod_pais_residencia AS cod_pais_residencia,
			query.cod_cups_pais AS cod_cups_pais,
			query.domi_codigo_provincia AS domi_codigo_provincia,
			query.id_pais AS id_pais,
			query.id_pais_cups AS id_pais_cups,
			query.id_provincia AS id_provincia
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 AS t
		FULL JOIN query on ((query.cups_distribuidora=t.cups_distribuidora OR (query.cups_distribuidora IS NULL AND t.cups_distribuidora IS NULL)) AND (query.cups_medida=t.cups_medida OR (query.cups_medida IS NULL AND t.cups_medida IS NULL)) AND (query.cups_suministro=t.cups_suministro OR (query.cups_suministro IS NULL AND t.cups_suministro IS NULL)) AND (query.domi_municipio=t.domi_municipio OR (query.domi_municipio IS NULL AND t.domi_municipio IS NULL)) AND (query.domi_codigo_municipio=t.domi_codigo_municipio OR (query.domi_codigo_municipio IS NULL AND t.domi_codigo_municipio IS NULL)) AND (query.domi_codigo_postal=t.domi_codigo_postal OR (query.domi_codigo_postal IS NULL AND t.domi_codigo_postal IS NULL)) AND (query.cod_pais_residencia=t.cod_pais_residencia OR (query.cod_pais_residencia IS NULL AND t.cod_pais_residencia IS NULL)) AND (query.cod_cups_pais=t.cod_cups_pais OR (query.cod_cups_pais IS NULL AND t.cod_cups_pais IS NULL)) AND (query.domi_codigo_provincia=t.domi_codigo_provincia OR (query.domi_codigo_provincia IS NULL AND t.domi_codigo_provincia IS NULL)) AND (query.id_pais=t.id_pais OR (query.id_pais IS NULL AND t.id_pais IS NULL)) AND (query.id_pais_cups=t.id_pais_cups OR (query.id_pais_cups IS NULL AND t.id_pais_cups IS NULL)) AND (query.id_provincia=t.id_provincia OR (query.id_provincia IS NULL AND t.id_provincia IS NULL)))
		WHERE 
			id_dim_datos_detalle2 IS NULL OR
			cc IS NULL OR
			(t.cups_distribuidora<>query.cups_distribuidora OR (t.cups_distribuidora IS NULL AND query.cups_distribuidora IS NOT NULL)
                                                  OR (t.cups_distribuidora IS NOT NULL AND query.cups_distribuidora IS NULL)
				OR t.cups_medida<>query.cups_medida OR (t.cups_medida IS NULL AND query.cups_medida IS NOT NULL)
                                                  OR (t.cups_medida IS NOT NULL AND query.cups_medida IS NULL)
				OR t.cups_suministro<>query.cups_suministro OR (t.cups_suministro IS NULL AND query.cups_suministro IS NOT NULL)
                                                  OR (t.cups_suministro IS NOT NULL AND query.cups_suministro IS NULL)
				OR t.domi_municipio<>query.domi_municipio OR (t.domi_municipio IS NULL AND query.domi_municipio IS NOT NULL)
                                                  OR (t.domi_municipio IS NOT NULL AND query.domi_municipio IS NULL)
				OR t.domi_codigo_municipio<>query.domi_codigo_municipio OR (t.domi_codigo_municipio IS NULL AND query.domi_codigo_municipio IS NOT NULL)
                                                  OR (t.domi_codigo_municipio IS NOT NULL AND query.domi_codigo_municipio IS NULL)
				OR t.domi_codigo_postal<>query.domi_codigo_postal OR (t.domi_codigo_postal IS NULL AND query.domi_codigo_postal IS NOT NULL)
                                                  OR (t.domi_codigo_postal IS NOT NULL AND query.domi_codigo_postal IS NULL)
				OR t.cod_pais_residencia<>query.cod_pais_residencia OR (t.cod_pais_residencia IS NULL AND query.cod_pais_residencia IS NOT NULL)
                                                  OR (t.cod_pais_residencia IS NOT NULL AND query.cod_pais_residencia IS NULL)
				OR t.cod_cups_pais<>query.cod_cups_pais OR (t.cod_cups_pais IS NULL AND query.cod_cups_pais IS NOT NULL)
                                                  OR (t.cod_cups_pais IS NOT NULL AND query.cod_cups_pais IS NULL)
				OR t.domi_codigo_provincia<>query.domi_codigo_provincia OR (t.domi_codigo_provincia IS NULL AND query.domi_codigo_provincia IS NOT NULL)
                                                  OR (t.domi_codigo_provincia IS NOT NULL AND query.domi_codigo_provincia IS NULL)
				OR t.id_pais<>query.id_pais OR (t.id_pais IS NULL AND query.id_pais IS NOT NULL)
                                                  OR (t.id_pais IS NOT NULL AND query.id_pais IS NULL)
				OR t.id_pais_cups<>query.id_pais_cups OR (t.id_pais_cups IS NULL AND query.id_pais_cups IS NOT NULL)
                                                  OR (t.id_pais_cups IS NOT NULL AND query.id_pais_cups IS NULL)
				OR t.id_provincia<>query.id_provincia OR (t.id_provincia IS NULL AND query.id_provincia IS NOT NULL)
                                                  OR (t.id_provincia IS NOT NULL AND query.id_provincia IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_datos_detalle2
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_datos_detalle2 where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_2')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_3')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2
			SET
				cups_distribuidora=s.cups_distribuidora,
				cups_medida=s.cups_medida,
				cups_suministro=s.cups_suministro,
				domi_municipio=s.domi_municipio,
				domi_codigo_municipio=s.domi_codigo_municipio,
				domi_codigo_postal=s.domi_codigo_postal,
				cod_pais_residencia=s.cod_pais_residencia,
				cod_cups_pais=s.cod_cups_pais,
				domi_codigo_provincia=s.domi_codigo_provincia,
				id_pais=s.id_pais,
				id_pais_cups=s.id_pais_cups,
				id_provincia=s.id_provincia
		FROM (
			SELECT
				cups_distribuidora,
				cups_medida,
				cups_suministro,
				domi_municipio,
				domi_codigo_municipio,
				domi_codigo_postal,
				cod_pais_residencia,
				cod_cups_pais,
				domi_codigo_provincia,
				id_pais,
				id_pais_cups,
				id_provincia
			FROM #tmp_mi_159_dim_datos_detalle2
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cups_distribuidora=s.cups_distribuidora OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cups_distribuidora IS NULL AND s.cups_distribuidora IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cups_medida=s.cups_medida OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cups_medida IS NULL AND s.cups_medida IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cups_suministro=s.cups_suministro OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cups_suministro IS NULL AND s.cups_suministro IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_municipio=s.domi_municipio OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_municipio IS NULL AND s.domi_municipio IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_codigo_municipio=s.domi_codigo_municipio OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_codigo_municipio IS NULL AND s.domi_codigo_municipio IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_codigo_postal=s.domi_codigo_postal OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_codigo_postal IS NULL AND s.domi_codigo_postal IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cod_pais_residencia=s.cod_pais_residencia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cod_pais_residencia IS NULL AND s.cod_pais_residencia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cod_cups_pais=s.cod_cups_pais OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.cod_cups_pais IS NULL AND s.cod_cups_pais IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_codigo_provincia=s.domi_codigo_provincia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.domi_codigo_provincia IS NULL AND s.domi_codigo_provincia IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.id_pais=s.id_pais OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.id_pais IS NULL AND s.id_pais IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.id_pais_cups=s.id_pais_cups OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.id_pais_cups IS NULL AND s.id_pais_cups IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.id_provincia=s.id_provincia OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2.id_provincia IS NULL AND s.id_provincia IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 AS tbn1_mi_159_dim_datos_detalle2
		INNER JOIN #tmp_mi_159_dim_datos_detalle2 AS tmp
		ON ((tbn1_mi_159_dim_datos_detalle2.cups_distribuidora=tmp.t_cups_distribuidora OR (tbn1_mi_159_dim_datos_detalle2.cups_distribuidora IS NULL AND tmp.t_cups_distribuidora IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cups_medida=tmp.t_cups_medida OR (tbn1_mi_159_dim_datos_detalle2.cups_medida IS NULL AND tmp.t_cups_medida IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cups_suministro=tmp.t_cups_suministro OR (tbn1_mi_159_dim_datos_detalle2.cups_suministro IS NULL AND tmp.t_cups_suministro IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_municipio=tmp.t_domi_municipio OR (tbn1_mi_159_dim_datos_detalle2.domi_municipio IS NULL AND tmp.t_domi_municipio IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_codigo_municipio=tmp.t_domi_codigo_municipio OR (tbn1_mi_159_dim_datos_detalle2.domi_codigo_municipio IS NULL AND tmp.t_domi_codigo_municipio IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_codigo_postal=tmp.t_domi_codigo_postal OR (tbn1_mi_159_dim_datos_detalle2.domi_codigo_postal IS NULL AND tmp.t_domi_codigo_postal IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cod_pais_residencia=tmp.t_cod_pais_residencia OR (tbn1_mi_159_dim_datos_detalle2.cod_pais_residencia IS NULL AND tmp.t_cod_pais_residencia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cod_cups_pais=tmp.t_cod_cups_pais OR (tbn1_mi_159_dim_datos_detalle2.cod_cups_pais IS NULL AND tmp.t_cod_cups_pais IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_codigo_provincia=tmp.t_domi_codigo_provincia OR (tbn1_mi_159_dim_datos_detalle2.domi_codigo_provincia IS NULL AND tmp.t_domi_codigo_provincia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.id_pais=tmp.t_id_pais OR (tbn1_mi_159_dim_datos_detalle2.id_pais IS NULL AND tmp.t_id_pais IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.id_pais_cups=tmp.t_id_pais_cups OR (tbn1_mi_159_dim_datos_detalle2.id_pais_cups IS NULL AND tmp.t_id_pais_cups IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.id_provincia=tmp.t_id_provincia OR (tbn1_mi_159_dim_datos_detalle2.id_provincia IS NULL AND tmp.t_id_provincia IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 WITH(TABLOCK) (cups_distribuidora,cups_medida,cups_suministro,domi_municipio,domi_codigo_municipio,domi_codigo_postal,cod_pais_residencia,cod_cups_pais,domi_codigo_provincia,id_pais,id_pais_cups,id_provincia)
		SELECT
			cups_distribuidora,
			cups_medida,
			cups_suministro,
			domi_municipio,
			domi_codigo_municipio,
			domi_codigo_postal,
			cod_pais_residencia,
			cod_cups_pais,
			domi_codigo_provincia,
			id_pais,
			id_pais_cups,
			id_provincia
			FROM #tmp_mi_159_dim_datos_detalle2
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_2')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_3')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_detalle2_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_detalle2_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_periodos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_periodos;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_periodos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_periodos'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_periodos') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_periodos
		CREATE table #tmp_mi_159_dim_periodos(
			rr_mode varchar(1),
			cc int,
			id_dim_periodos int,
			t_fecha_alta_contrato date,
			t_anyo_alta_contrato int,
			t_mes_alta_contrato int,
			t_fecha_baja_contrato date,
			t_mes_baja_contrato int,
			t_anyo_baja_contrato int,
			fecha_alta_contrato date,
			anyo_alta_contrato int,
			mes_alta_contrato int,
			fecha_baja_contrato date,
			mes_baja_contrato int,
			anyo_baja_contrato int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.fecha_alta_contrato AS fecha_alta_contrato,
		st.anyo_alta_contrato AS anyo_alta_contrato,
		st.mes_alta_contrato AS mes_alta_contrato,
		st.fecha_baja_contrato AS fecha_baja_contrato,
		st.mes_baja_contrato AS mes_baja_contrato,
		st.anyo_baja_contrato AS anyo_baja_contrato
	FROM (SELECT
		fecha_alta_contrato,
		anyo_alta_contrato,
		mes_alta_contrato,
		fecha_baja_contrato,
		mes_baja_contrato,
		anyo_baja_contrato
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		fecha_alta_contrato,
		anyo_alta_contrato,
		mes_alta_contrato,
		fecha_baja_contrato,
		mes_baja_contrato,
		anyo_baja_contrato
	) st

	GROUP BY
		st.fecha_alta_contrato,
		st.anyo_alta_contrato,
		st.mes_alta_contrato,
		st.fecha_baja_contrato,
		st.mes_baja_contrato,
		st.anyo_baja_contrato
		)
		INSERT INTO #tmp_mi_159_dim_periodos (rr_mode,cc,id_dim_periodos,t_fecha_alta_contrato,t_anyo_alta_contrato,t_mes_alta_contrato,t_fecha_baja_contrato,t_mes_baja_contrato,t_anyo_baja_contrato,fecha_alta_contrato,anyo_alta_contrato,mes_alta_contrato,fecha_baja_contrato,mes_baja_contrato,anyo_baja_contrato)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_periodos IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_periodos AS id_dim_periodos,
			t.fecha_alta_contrato AS t_fecha_alta_contrato,
			t.anyo_alta_contrato AS t_anyo_alta_contrato,
			t.mes_alta_contrato AS t_mes_alta_contrato,
			t.fecha_baja_contrato AS t_fecha_baja_contrato,
			t.mes_baja_contrato AS t_mes_baja_contrato,
			t.anyo_baja_contrato AS t_anyo_baja_contrato,
			query.fecha_alta_contrato AS fecha_alta_contrato,
			query.anyo_alta_contrato AS anyo_alta_contrato,
			query.mes_alta_contrato AS mes_alta_contrato,
			query.fecha_baja_contrato AS fecha_baja_contrato,
			query.mes_baja_contrato AS mes_baja_contrato,
			query.anyo_baja_contrato AS anyo_baja_contrato
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos AS t
		FULL JOIN query on ((query.fecha_alta_contrato=t.fecha_alta_contrato OR (query.fecha_alta_contrato IS NULL AND t.fecha_alta_contrato IS NULL)) AND (query.anyo_alta_contrato=t.anyo_alta_contrato OR (query.anyo_alta_contrato IS NULL AND t.anyo_alta_contrato IS NULL)) AND (query.mes_alta_contrato=t.mes_alta_contrato OR (query.mes_alta_contrato IS NULL AND t.mes_alta_contrato IS NULL)) AND (query.fecha_baja_contrato=t.fecha_baja_contrato OR (query.fecha_baja_contrato IS NULL AND t.fecha_baja_contrato IS NULL)) AND (query.mes_baja_contrato=t.mes_baja_contrato OR (query.mes_baja_contrato IS NULL AND t.mes_baja_contrato IS NULL)) AND (query.anyo_baja_contrato=t.anyo_baja_contrato OR (query.anyo_baja_contrato IS NULL AND t.anyo_baja_contrato IS NULL)))
		WHERE 
			id_dim_periodos IS NULL OR
			cc IS NULL OR
			(t.fecha_alta_contrato<>query.fecha_alta_contrato OR (t.fecha_alta_contrato IS NULL AND query.fecha_alta_contrato IS NOT NULL)
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
                                                  OR (t.anyo_baja_contrato IS NOT NULL AND query.anyo_baja_contrato IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_periodos
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_periodos where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN
		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos
			SET
				fecha_alta_contrato=s.fecha_alta_contrato,
				anyo_alta_contrato=s.anyo_alta_contrato,
				mes_alta_contrato=s.mes_alta_contrato,
				fecha_baja_contrato=s.fecha_baja_contrato,
				mes_baja_contrato=s.mes_baja_contrato,
				anyo_baja_contrato=s.anyo_baja_contrato
		FROM (
			SELECT
				fecha_alta_contrato,
				anyo_alta_contrato,
				mes_alta_contrato,
				fecha_baja_contrato,
				mes_baja_contrato,
				anyo_baja_contrato
			FROM #tmp_mi_159_dim_periodos
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.fecha_alta_contrato=s.fecha_alta_contrato OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.fecha_alta_contrato IS NULL AND s.fecha_alta_contrato IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.anyo_alta_contrato=s.anyo_alta_contrato OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.anyo_alta_contrato IS NULL AND s.anyo_alta_contrato IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.mes_alta_contrato=s.mes_alta_contrato OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.mes_alta_contrato IS NULL AND s.mes_alta_contrato IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.fecha_baja_contrato=s.fecha_baja_contrato OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.fecha_baja_contrato IS NULL AND s.fecha_baja_contrato IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.mes_baja_contrato=s.mes_baja_contrato OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.mes_baja_contrato IS NULL AND s.mes_baja_contrato IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.anyo_baja_contrato=s.anyo_baja_contrato OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos.anyo_baja_contrato IS NULL AND s.anyo_baja_contrato IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos AS tbn1_mi_159_dim_periodos
		INNER JOIN #tmp_mi_159_dim_periodos AS tmp
		ON ((tbn1_mi_159_dim_periodos.fecha_alta_contrato=tmp.t_fecha_alta_contrato OR (tbn1_mi_159_dim_periodos.fecha_alta_contrato IS NULL AND tmp.t_fecha_alta_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.anyo_alta_contrato=tmp.t_anyo_alta_contrato OR (tbn1_mi_159_dim_periodos.anyo_alta_contrato IS NULL AND tmp.t_anyo_alta_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.mes_alta_contrato=tmp.t_mes_alta_contrato OR (tbn1_mi_159_dim_periodos.mes_alta_contrato IS NULL AND tmp.t_mes_alta_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.fecha_baja_contrato=tmp.t_fecha_baja_contrato OR (tbn1_mi_159_dim_periodos.fecha_baja_contrato IS NULL AND tmp.t_fecha_baja_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.mes_baja_contrato=tmp.t_mes_baja_contrato OR (tbn1_mi_159_dim_periodos.mes_baja_contrato IS NULL AND tmp.t_mes_baja_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.anyo_baja_contrato=tmp.t_anyo_baja_contrato OR (tbn1_mi_159_dim_periodos.anyo_baja_contrato IS NULL AND tmp.t_anyo_baja_contrato IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_periodos_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_periodos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos WITH(TABLOCK) (fecha_alta_contrato,anyo_alta_contrato,mes_alta_contrato,fecha_baja_contrato,mes_baja_contrato,anyo_baja_contrato)
		SELECT
			fecha_alta_contrato,
			anyo_alta_contrato,
			mes_alta_contrato,
			fecha_baja_contrato,
			mes_baja_contrato,
			anyo_baja_contrato
			FROM #tmp_mi_159_dim_periodos
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN
		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_periodos_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_periodos_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_dim_datos_consumo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_consumo;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_dim_datos_consumo(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_consumo'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_dim_datos_consumo') IS NOT NULL
			DROP TABLE #tmp_mi_159_dim_datos_consumo
		CREATE table #tmp_mi_159_dim_datos_consumo(
			rr_mode varchar(1),
			cc int,
			id_dim_datos_consumo int,
			t_cod_periodo_facturado varchar(2),
			t_cod_tipo_lectura varchar(1),
			t_id_mae_tipo_lectura int,
			cod_periodo_facturado varchar(2),
			cod_tipo_lectura varchar(1),
			id_mae_tipo_lectura int
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		st.cod_periodo_facturado AS cod_periodo_facturado,
		st.cod_tipo_lectura AS cod_tipo_lectura,
		tbn1_mae_tipo_lectura_id_mae_tipo_lectura.id_mae_tipo_lectura AS id_mae_tipo_lectura
	FROM (SELECT
		cod_periodo_facturado,
		cod_tipo_lectura
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica
	GROUP BY
		cod_periodo_facturado,
		cod_tipo_lectura
	) st
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_lectura AS tbn1_mae_tipo_lectura_id_mae_tipo_lectura ON (tbn1_mae_tipo_lectura_id_mae_tipo_lectura.cod_tipo_lectura=st.cod_tipo_lectura OR (tbn1_mae_tipo_lectura_id_mae_tipo_lectura.cod_tipo_lectura IS NULL AND st.cod_tipo_lectura IS NULL))
	GROUP BY
		st.cod_periodo_facturado,
		st.cod_tipo_lectura,
		tbn1_mae_tipo_lectura_id_mae_tipo_lectura.id_mae_tipo_lectura
		)
		INSERT INTO #tmp_mi_159_dim_datos_consumo (rr_mode,cc,id_dim_datos_consumo,t_cod_periodo_facturado,t_cod_tipo_lectura,t_id_mae_tipo_lectura,cod_periodo_facturado,cod_tipo_lectura,id_mae_tipo_lectura)
		SELECT
			rr_mode=
				CASE
					WHEN t.id_dim_datos_consumo IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id_dim_datos_consumo AS id_dim_datos_consumo,
			t.cod_periodo_facturado AS t_cod_periodo_facturado,
			t.cod_tipo_lectura AS t_cod_tipo_lectura,
			t.id_mae_tipo_lectura AS t_id_mae_tipo_lectura,
			query.cod_periodo_facturado AS cod_periodo_facturado,
			query.cod_tipo_lectura AS cod_tipo_lectura,
			query.id_mae_tipo_lectura AS id_mae_tipo_lectura
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo AS t
		FULL JOIN query on ((query.cod_periodo_facturado=t.cod_periodo_facturado OR (query.cod_periodo_facturado IS NULL AND t.cod_periodo_facturado IS NULL)) AND (query.cod_tipo_lectura=t.cod_tipo_lectura OR (query.cod_tipo_lectura IS NULL AND t.cod_tipo_lectura IS NULL)) AND (query.id_mae_tipo_lectura=t.id_mae_tipo_lectura OR (query.id_mae_tipo_lectura IS NULL AND t.id_mae_tipo_lectura IS NULL)))
		WHERE 
			id_dim_datos_consumo IS NULL OR
			cc IS NULL OR
			(t.cod_periodo_facturado<>query.cod_periodo_facturado OR (t.cod_periodo_facturado IS NULL AND query.cod_periodo_facturado IS NOT NULL)
                                                  OR (t.cod_periodo_facturado IS NOT NULL AND query.cod_periodo_facturado IS NULL)
				OR t.cod_tipo_lectura<>query.cod_tipo_lectura OR (t.cod_tipo_lectura IS NULL AND query.cod_tipo_lectura IS NOT NULL)
                                                  OR (t.cod_tipo_lectura IS NOT NULL AND query.cod_tipo_lectura IS NULL)
				OR t.id_mae_tipo_lectura<>query.id_mae_tipo_lectura OR (t.id_mae_tipo_lectura IS NULL AND query.id_mae_tipo_lectura IS NOT NULL)
                                                  OR (t.id_mae_tipo_lectura IS NOT NULL AND query.id_mae_tipo_lectura IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_dim_datos_consumo
		SELECT @count_ins = count(*) from #tmp_mi_159_dim_datos_consumo where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_consumo_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_consumo_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo
			SET
				cod_periodo_facturado=s.cod_periodo_facturado,
				cod_tipo_lectura=s.cod_tipo_lectura,
				id_mae_tipo_lectura=s.id_mae_tipo_lectura
		FROM (
			SELECT
				cod_periodo_facturado,
				cod_tipo_lectura,
				id_mae_tipo_lectura
			FROM #tmp_mi_159_dim_datos_consumo
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo.cod_periodo_facturado=s.cod_periodo_facturado OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo.cod_periodo_facturado IS NULL AND s.cod_periodo_facturado IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo.cod_tipo_lectura=s.cod_tipo_lectura OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo.cod_tipo_lectura IS NULL AND s.cod_tipo_lectura IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo.id_mae_tipo_lectura=s.id_mae_tipo_lectura OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo.id_mae_tipo_lectura IS NULL AND s.id_mae_tipo_lectura IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo AS tbn1_mi_159_dim_datos_consumo
		INNER JOIN #tmp_mi_159_dim_datos_consumo AS tmp
		ON ((tbn1_mi_159_dim_datos_consumo.cod_periodo_facturado=tmp.t_cod_periodo_facturado OR (tbn1_mi_159_dim_datos_consumo.cod_periodo_facturado IS NULL AND tmp.t_cod_periodo_facturado IS NULL)) AND (tbn1_mi_159_dim_datos_consumo.cod_tipo_lectura=tmp.t_cod_tipo_lectura OR (tbn1_mi_159_dim_datos_consumo.cod_tipo_lectura IS NULL AND tmp.t_cod_tipo_lectura IS NULL)) AND (tbn1_mi_159_dim_datos_consumo.id_mae_tipo_lectura=tmp.t_id_mae_tipo_lectura OR (tbn1_mi_159_dim_datos_consumo.id_mae_tipo_lectura IS NULL AND tmp.t_id_mae_tipo_lectura IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_consumo_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo WITH(TABLOCK) (cod_periodo_facturado,cod_tipo_lectura,id_mae_tipo_lectura)
		SELECT
			cod_periodo_facturado,
			cod_tipo_lectura,
			id_mae_tipo_lectura
			FROM #tmp_mi_159_dim_datos_consumo
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_consumo_1')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_consumo_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_dim_datos_consumo_unique')
			ALTER INDEX IX_tbn1_mi_159_dim_datos_consumo_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_159_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_159_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_159_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_fact'
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

		IF OBJECT_ID('tempdb..#tmp_mi_159_fact') IS NOT NULL
			DROP TABLE #tmp_mi_159_fact
		CREATE table #tmp_mi_159_fact(
			rr_mode varchar(1),
			cc int,
			id int,
			t_id_dim_documentos int,
			t_id_dim_declarantes int,
			t_id_dim_declarados int,
			t_id_dim_periodos_doc int,
			t_id_dim_datos_caratula int,
			t_id_dim_marcas int,
			t_id_dim_datos_detalle int,
			t_id_dim_datos_detalle2 int,
			t_id_dim_periodos int,
			t_id_dim_datos_consumo int,
			id_dim_documentos int,
			id_dim_declarantes int,
			id_dim_declarados int,
			id_dim_periodos_doc int,
			id_dim_datos_caratula int,
			id_dim_marcas int,
			id_dim_datos_detalle int,
			id_dim_datos_detalle2 int,
			id_dim_periodos int,
			id_dim_datos_consumo int,
			importe decimal(18,2),
			consumo_facturado decimal(4,0)
		);

		;WITH
		query AS (
	SELECT
		1 AS cc,
		tbn1_mi_159_dim_documentos.id_dim_documentos AS id_dim_documentos,
		tbn1_mi_159_dim_declarantes.id_dim_declarantes AS id_dim_declarantes,
		tbn1_mi_159_dim_declarados.id_dim_declarados AS id_dim_declarados,
		tbn1_mi_159_dim_periodos_doc.id_dim_periodos_doc AS id_dim_periodos_doc,
		tbn1_mi_159_dim_datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
		tbn1_mi_159_dim_marcas.id_dim_marcas AS id_dim_marcas,
		tbn1_mi_159_dim_datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
		tbn1_mi_159_dim_datos_detalle2.id_dim_datos_detalle2 AS id_dim_datos_detalle2,
		tbn1_mi_159_dim_periodos.id_dim_periodos AS id_dim_periodos,
		tbn1_mi_159_dim_datos_consumo.id_dim_datos_consumo AS id_dim_datos_consumo,
		sum(st.importe) AS importe,
		sum(st.consumo_facturado) AS consumo_facturado
	FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_159_consumo_energia_electrica st
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos AS tbn1_mi_159_dim_documentos ON ((tbn1_mi_159_dim_documentos.id_documento=st.id_documento OR (tbn1_mi_159_dim_documentos.id_documento IS NULL AND st.id_documento IS NULL)) AND (tbn1_mi_159_dim_documentos.id_expediente=st.id_expediente OR (tbn1_mi_159_dim_documentos.id_expediente IS NULL AND st.id_expediente IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes AS tbn1_mi_159_dim_declarantes ON ((tbn1_mi_159_dim_declarantes.id_mae_no_id_declarante=st.id_mae_no_id_declarante OR (tbn1_mi_159_dim_declarantes.id_mae_no_id_declarante IS NULL AND st.id_mae_no_id_declarante IS NULL)) AND (tbn1_mi_159_dim_declarantes.nif_declarante_159=st.nif_declarante_159 OR (tbn1_mi_159_dim_declarantes.nif_declarante_159 IS NULL AND st.nif_declarante_159 IS NULL)) AND (tbn1_mi_159_dim_declarantes.id_contribuyente_declarante=st.id_contribuyente_declarante OR (tbn1_mi_159_dim_declarantes.id_contribuyente_declarante IS NULL AND st.id_contribuyente_declarante IS NULL)) AND (tbn1_mi_159_dim_declarantes.telefono=st.telefono OR (tbn1_mi_159_dim_declarantes.telefono IS NULL AND st.telefono IS NULL)) AND (tbn1_mi_159_dim_declarantes.razon_social=st.razon_social OR (tbn1_mi_159_dim_declarantes.razon_social IS NULL AND st.razon_social IS NULL)) AND (tbn1_mi_159_dim_declarantes.cod_presentador_colectivo=st.cod_presentador_colectivo OR (tbn1_mi_159_dim_declarantes.cod_presentador_colectivo IS NULL AND st.cod_presentador_colectivo IS NULL)) AND (tbn1_mi_159_dim_declarantes.cod_banco_espania=st.cod_banco_espania OR (tbn1_mi_159_dim_declarantes.cod_banco_espania IS NULL AND st.cod_banco_espania IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados AS tbn1_mi_159_dim_declarados ON ((tbn1_mi_159_dim_declarados.id_mae_no_id_declarado=st.id_mae_no_id_declarado OR (tbn1_mi_159_dim_declarados.id_mae_no_id_declarado IS NULL AND st.id_mae_no_id_declarado IS NULL)) AND (tbn1_mi_159_dim_declarados.nif_declarado_159=st.nif_declarado_159 OR (tbn1_mi_159_dim_declarados.nif_declarado_159 IS NULL AND st.nif_declarado_159 IS NULL)) AND (tbn1_mi_159_dim_declarados.secuencia=st.secuencia OR (tbn1_mi_159_dim_declarados.secuencia IS NULL AND st.secuencia IS NULL)) AND (tbn1_mi_159_dim_declarados.id_contribuyente_declarado=st.id_contribuyente_declarado OR (tbn1_mi_159_dim_declarados.id_contribuyente_declarado IS NULL AND st.id_contribuyente_declarado IS NULL)) AND (tbn1_mi_159_dim_declarados.codigo_iban=st.codigo_iban OR (tbn1_mi_159_dim_declarados.codigo_iban IS NULL AND st.codigo_iban IS NULL)) AND (tbn1_mi_159_dim_declarados.codigo_entidad=st.codigo_entidad OR (tbn1_mi_159_dim_declarados.codigo_entidad IS NULL AND st.codigo_entidad IS NULL)) AND (tbn1_mi_159_dim_declarados.codigo_sucursal=st.codigo_sucursal OR (tbn1_mi_159_dim_declarados.codigo_sucursal IS NULL AND st.codigo_sucursal IS NULL)) AND (tbn1_mi_159_dim_declarados.digito_control=st.digito_control OR (tbn1_mi_159_dim_declarados.digito_control IS NULL AND st.digito_control IS NULL)) AND (tbn1_mi_159_dim_declarados.numero_cuenta=st.numero_cuenta OR (tbn1_mi_159_dim_declarados.numero_cuenta IS NULL AND st.numero_cuenta IS NULL)) AND (tbn1_mi_159_dim_declarados.identificacion_extranjero=st.identificacion_extranjero OR (tbn1_mi_159_dim_declarados.identificacion_extranjero IS NULL AND st.identificacion_extranjero IS NULL)) AND (tbn1_mi_159_dim_declarados.contrato_suministro=st.contrato_suministro OR (tbn1_mi_159_dim_declarados.contrato_suministro IS NULL AND st.contrato_suministro IS NULL)) AND (tbn1_mi_159_dim_declarados.cups_num_libre_asignacion=st.cups_num_libre_asignacion OR (tbn1_mi_159_dim_declarados.cups_num_libre_asignacion IS NULL AND st.cups_num_libre_asignacion IS NULL)) AND (tbn1_mi_159_dim_declarados.cups_digito_control=st.cups_digito_control OR (tbn1_mi_159_dim_declarados.cups_digito_control IS NULL AND st.cups_digito_control IS NULL)) AND (tbn1_mi_159_dim_declarados.referencia_catastral=st.referencia_catastral OR (tbn1_mi_159_dim_declarados.referencia_catastral IS NULL AND st.referencia_catastral IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc AS tbn1_mi_159_dim_periodos_doc ON ((tbn1_mi_159_dim_periodos_doc.ejercicio=st.ejercicio OR (tbn1_mi_159_dim_periodos_doc.ejercicio IS NULL AND st.ejercicio IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.fecha_presentacion=st.fecha_presentacion OR (tbn1_mi_159_dim_periodos_doc.fecha_presentacion IS NULL AND st.fecha_presentacion IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.mes_presentacion=st.mes_presentacion OR (tbn1_mi_159_dim_periodos_doc.mes_presentacion IS NULL AND st.mes_presentacion IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.anyo_presentacion=st.anyo_presentacion OR (tbn1_mi_159_dim_periodos_doc.anyo_presentacion IS NULL AND st.anyo_presentacion IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.fecha_alta=st.fecha_alta OR (tbn1_mi_159_dim_periodos_doc.fecha_alta IS NULL AND st.fecha_alta IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.mes_alta=st.mes_alta OR (tbn1_mi_159_dim_periodos_doc.mes_alta IS NULL AND st.mes_alta IS NULL)) AND (tbn1_mi_159_dim_periodos_doc.anyo_alta=st.anyo_alta OR (tbn1_mi_159_dim_periodos_doc.anyo_alta IS NULL AND st.anyo_alta IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula AS tbn1_mi_159_dim_datos_caratula ON ((tbn1_mi_159_dim_datos_caratula.modelo=st.modelo OR (tbn1_mi_159_dim_datos_caratula.modelo IS NULL AND st.modelo IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.administracion_declarante=st.administracion_declarante OR (tbn1_mi_159_dim_datos_caratula.administracion_declarante IS NULL AND st.administracion_declarante IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.cod_tipo_presentacion=st.cod_tipo_presentacion OR (tbn1_mi_159_dim_datos_caratula.cod_tipo_presentacion IS NULL AND st.cod_tipo_presentacion IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.cod_tipo_declaracion=st.cod_tipo_declaracion OR (tbn1_mi_159_dim_datos_caratula.cod_tipo_declaracion IS NULL AND st.cod_tipo_declaracion IS NULL)) AND (tbn1_mi_159_dim_datos_caratula.regimen_fiscal_deducciones=st.regimen_fiscal_deducciones OR (tbn1_mi_159_dim_datos_caratula.regimen_fiscal_deducciones IS NULL AND st.regimen_fiscal_deducciones IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas AS tbn1_mi_159_dim_marcas ON ((tbn1_mi_159_dim_marcas.es_externo_declarante=st.es_externo_declarante OR (tbn1_mi_159_dim_marcas.es_externo_declarante IS NULL AND st.es_externo_declarante IS NULL)) AND (tbn1_mi_159_dim_marcas.es_identificado_declarante=st.es_identificado_declarante OR (tbn1_mi_159_dim_marcas.es_identificado_declarante IS NULL AND st.es_identificado_declarante IS NULL)) AND (tbn1_mi_159_dim_marcas.es_externo_declarado=st.es_externo_declarado OR (tbn1_mi_159_dim_marcas.es_externo_declarado IS NULL AND st.es_externo_declarado IS NULL)) AND (tbn1_mi_159_dim_marcas.es_identificado_declarado=st.es_identificado_declarado OR (tbn1_mi_159_dim_marcas.es_identificado_declarado IS NULL AND st.es_identificado_declarado IS NULL)) AND (tbn1_mi_159_dim_marcas.es_erroneo_declarado=st.es_erroneo_declarado OR (tbn1_mi_159_dim_marcas.es_erroneo_declarado IS NULL AND st.es_erroneo_declarado IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle AS tbn1_mi_159_dim_datos_detalle ON ((tbn1_mi_159_dim_datos_detalle.administracion_declarado=st.administracion_declarado OR (tbn1_mi_159_dim_datos_detalle.administracion_declarado IS NULL AND st.administracion_declarado IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_clave_tipo_codigo=st.cod_clave_tipo_codigo OR (tbn1_mi_159_dim_datos_detalle.cod_clave_tipo_codigo IS NULL AND st.cod_clave_tipo_codigo IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_tipo_bien=st.cod_tipo_bien OR (tbn1_mi_159_dim_datos_detalle.cod_tipo_bien IS NULL AND st.cod_tipo_bien IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_situacion_inmueble=st.cod_situacion_inmueble OR (tbn1_mi_159_dim_datos_detalle.cod_situacion_inmueble IS NULL AND st.cod_situacion_inmueble IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_unidad_consumo=st.cod_unidad_consumo OR (tbn1_mi_159_dim_datos_detalle.cod_unidad_consumo IS NULL AND st.cod_unidad_consumo IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_unidad_potencia=st.cod_unidad_potencia OR (tbn1_mi_159_dim_datos_detalle.cod_unidad_potencia IS NULL AND st.cod_unidad_potencia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.potencia_maxima_contratada=st.potencia_maxima_contratada OR (tbn1_mi_159_dim_datos_detalle.potencia_maxima_contratada IS NULL AND st.potencia_maxima_contratada IS NULL)) AND (tbn1_mi_159_dim_datos_detalle.cod_tipo_importe=st.cod_tipo_importe OR (tbn1_mi_159_dim_datos_detalle.cod_tipo_importe IS NULL AND st.cod_tipo_importe IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 AS tbn1_mi_159_dim_datos_detalle2 ON ((tbn1_mi_159_dim_datos_detalle2.cod_pais_residencia=st.cod_pais_residencia OR (tbn1_mi_159_dim_datos_detalle2.cod_pais_residencia IS NULL AND st.cod_pais_residencia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cod_cups_pais=st.cod_cups_pais OR (tbn1_mi_159_dim_datos_detalle2.cod_cups_pais IS NULL AND st.cod_cups_pais IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cups_distribuidora=st.cups_distribuidora OR (tbn1_mi_159_dim_datos_detalle2.cups_distribuidora IS NULL AND st.cups_distribuidora IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cups_medida=st.cups_medida OR (tbn1_mi_159_dim_datos_detalle2.cups_medida IS NULL AND st.cups_medida IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.cups_suministro=st.cups_suministro OR (tbn1_mi_159_dim_datos_detalle2.cups_suministro IS NULL AND st.cups_suministro IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_municipio=st.domi_municipio OR (tbn1_mi_159_dim_datos_detalle2.domi_municipio IS NULL AND st.domi_municipio IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_codigo_municipio=st.domi_codigo_municipio OR (tbn1_mi_159_dim_datos_detalle2.domi_codigo_municipio IS NULL AND st.domi_codigo_municipio IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_codigo_provincia=st.domi_codigo_provincia OR (tbn1_mi_159_dim_datos_detalle2.domi_codigo_provincia IS NULL AND st.domi_codigo_provincia IS NULL)) AND (tbn1_mi_159_dim_datos_detalle2.domi_codigo_postal=st.domi_codigo_postal OR (tbn1_mi_159_dim_datos_detalle2.domi_codigo_postal IS NULL AND st.domi_codigo_postal IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos AS tbn1_mi_159_dim_periodos ON ((tbn1_mi_159_dim_periodos.fecha_alta_contrato=st.fecha_alta_contrato OR (tbn1_mi_159_dim_periodos.fecha_alta_contrato IS NULL AND st.fecha_alta_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.anyo_alta_contrato=st.anyo_alta_contrato OR (tbn1_mi_159_dim_periodos.anyo_alta_contrato IS NULL AND st.anyo_alta_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.mes_alta_contrato=st.mes_alta_contrato OR (tbn1_mi_159_dim_periodos.mes_alta_contrato IS NULL AND st.mes_alta_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.fecha_baja_contrato=st.fecha_baja_contrato OR (tbn1_mi_159_dim_periodos.fecha_baja_contrato IS NULL AND st.fecha_baja_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.mes_baja_contrato=st.mes_baja_contrato OR (tbn1_mi_159_dim_periodos.mes_baja_contrato IS NULL AND st.mes_baja_contrato IS NULL)) AND (tbn1_mi_159_dim_periodos.anyo_baja_contrato=st.anyo_baja_contrato OR (tbn1_mi_159_dim_periodos.anyo_baja_contrato IS NULL AND st.anyo_baja_contrato IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo AS tbn1_mi_159_dim_datos_consumo ON ((tbn1_mi_159_dim_datos_consumo.cod_periodo_facturado=st.cod_periodo_facturado OR (tbn1_mi_159_dim_datos_consumo.cod_periodo_facturado IS NULL AND st.cod_periodo_facturado IS NULL)) AND (tbn1_mi_159_dim_datos_consumo.cod_tipo_lectura=st.cod_tipo_lectura OR (tbn1_mi_159_dim_datos_consumo.cod_tipo_lectura IS NULL AND st.cod_tipo_lectura IS NULL)))
	GROUP BY
	id_dim_documentos,
	id_dim_declarantes,
	id_dim_declarados,
	id_dim_periodos_doc,
	id_dim_datos_caratula,
	id_dim_marcas,
	id_dim_datos_detalle,
	id_dim_datos_detalle2,
	id_dim_periodos,
	id_dim_datos_consumo
		)
		INSERT INTO #tmp_mi_159_fact (rr_mode,cc,id,t_id_dim_documentos,t_id_dim_declarantes,t_id_dim_declarados,t_id_dim_periodos_doc,t_id_dim_datos_caratula,t_id_dim_marcas,t_id_dim_datos_detalle,t_id_dim_datos_detalle2,t_id_dim_periodos,t_id_dim_datos_consumo,id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos_doc,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,id_dim_datos_detalle2,id_dim_periodos,id_dim_datos_consumo,importe,consumo_facturado)
		SELECT
			rr_mode=
				CASE
					WHEN t.id IS NULL THEN 'I'
					WHEN cc IS NULL THEN 'D'
					ELSE 'U' END,
			cc AS cc,
			t.id AS id,
			t.id_dim_documentos AS t_id_dim_documentos,
			t.id_dim_declarantes AS t_id_dim_declarantes,
			t.id_dim_declarados AS t_id_dim_declarados,
			t.id_dim_periodos_doc AS t_id_dim_periodos_doc,
			t.id_dim_datos_caratula AS t_id_dim_datos_caratula,
			t.id_dim_marcas AS t_id_dim_marcas,
			t.id_dim_datos_detalle AS t_id_dim_datos_detalle,
			t.id_dim_datos_detalle2 AS t_id_dim_datos_detalle2,
			t.id_dim_periodos AS t_id_dim_periodos,
			t.id_dim_datos_consumo AS t_id_dim_datos_consumo,
			query.id_dim_documentos AS id_dim_documentos,
			query.id_dim_declarantes AS id_dim_declarantes,
			query.id_dim_declarados AS id_dim_declarados,
			query.id_dim_periodos_doc AS id_dim_periodos_doc,
			query.id_dim_datos_caratula AS id_dim_datos_caratula,
			query.id_dim_marcas AS id_dim_marcas,
			query.id_dim_datos_detalle AS id_dim_datos_detalle,
			query.id_dim_datos_detalle2 AS id_dim_datos_detalle2,
			query.id_dim_periodos AS id_dim_periodos,
			query.id_dim_datos_consumo AS id_dim_datos_consumo,
			query.importe AS importe,
			query.consumo_facturado AS consumo_facturado
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact AS t
		FULL JOIN query on ((query.id_dim_documentos=t.id_dim_documentos OR (query.id_dim_documentos IS NULL AND t.id_dim_documentos IS NULL)) AND (query.id_dim_declarantes=t.id_dim_declarantes OR (query.id_dim_declarantes IS NULL AND t.id_dim_declarantes IS NULL)) AND (query.id_dim_declarados=t.id_dim_declarados OR (query.id_dim_declarados IS NULL AND t.id_dim_declarados IS NULL)) AND (query.id_dim_periodos_doc=t.id_dim_periodos_doc OR (query.id_dim_periodos_doc IS NULL AND t.id_dim_periodos_doc IS NULL)) AND (query.id_dim_datos_caratula=t.id_dim_datos_caratula OR (query.id_dim_datos_caratula IS NULL AND t.id_dim_datos_caratula IS NULL)) AND (query.id_dim_marcas=t.id_dim_marcas OR (query.id_dim_marcas IS NULL AND t.id_dim_marcas IS NULL)) AND (query.id_dim_datos_detalle=t.id_dim_datos_detalle OR (query.id_dim_datos_detalle IS NULL AND t.id_dim_datos_detalle IS NULL)) AND (query.id_dim_datos_detalle2=t.id_dim_datos_detalle2 OR (query.id_dim_datos_detalle2 IS NULL AND t.id_dim_datos_detalle2 IS NULL)) AND (query.id_dim_periodos=t.id_dim_periodos OR (query.id_dim_periodos IS NULL AND t.id_dim_periodos IS NULL)) AND (query.id_dim_datos_consumo=t.id_dim_datos_consumo OR (query.id_dim_datos_consumo IS NULL AND t.id_dim_datos_consumo IS NULL)))
		WHERE 
			id IS NULL OR
			cc IS NULL OR
			(t.id_dim_documentos<>query.id_dim_documentos OR (t.id_dim_documentos IS NULL AND query.id_dim_documentos IS NOT NULL)
                                                  OR (t.id_dim_documentos IS NOT NULL AND query.id_dim_documentos IS NULL)
				OR t.id_dim_declarantes<>query.id_dim_declarantes OR (t.id_dim_declarantes IS NULL AND query.id_dim_declarantes IS NOT NULL)
                                                  OR (t.id_dim_declarantes IS NOT NULL AND query.id_dim_declarantes IS NULL)
				OR t.id_dim_declarados<>query.id_dim_declarados OR (t.id_dim_declarados IS NULL AND query.id_dim_declarados IS NOT NULL)
                                                  OR (t.id_dim_declarados IS NOT NULL AND query.id_dim_declarados IS NULL)
				OR t.id_dim_periodos_doc<>query.id_dim_periodos_doc OR (t.id_dim_periodos_doc IS NULL AND query.id_dim_periodos_doc IS NOT NULL)
                                                  OR (t.id_dim_periodos_doc IS NOT NULL AND query.id_dim_periodos_doc IS NULL)
				OR t.id_dim_datos_caratula<>query.id_dim_datos_caratula OR (t.id_dim_datos_caratula IS NULL AND query.id_dim_datos_caratula IS NOT NULL)
                                                  OR (t.id_dim_datos_caratula IS NOT NULL AND query.id_dim_datos_caratula IS NULL)
				OR t.id_dim_marcas<>query.id_dim_marcas OR (t.id_dim_marcas IS NULL AND query.id_dim_marcas IS NOT NULL)
                                                  OR (t.id_dim_marcas IS NOT NULL AND query.id_dim_marcas IS NULL)
				OR t.id_dim_datos_detalle<>query.id_dim_datos_detalle OR (t.id_dim_datos_detalle IS NULL AND query.id_dim_datos_detalle IS NOT NULL)
                                                  OR (t.id_dim_datos_detalle IS NOT NULL AND query.id_dim_datos_detalle IS NULL)
				OR t.id_dim_datos_detalle2<>query.id_dim_datos_detalle2 OR (t.id_dim_datos_detalle2 IS NULL AND query.id_dim_datos_detalle2 IS NOT NULL)
                                                  OR (t.id_dim_datos_detalle2 IS NOT NULL AND query.id_dim_datos_detalle2 IS NULL)
				OR t.id_dim_periodos<>query.id_dim_periodos OR (t.id_dim_periodos IS NULL AND query.id_dim_periodos IS NOT NULL)
                                                  OR (t.id_dim_periodos IS NOT NULL AND query.id_dim_periodos IS NULL)
				OR t.id_dim_datos_consumo<>query.id_dim_datos_consumo OR (t.id_dim_datos_consumo IS NULL AND query.id_dim_datos_consumo IS NOT NULL)
                                                  OR (t.id_dim_datos_consumo IS NOT NULL AND query.id_dim_datos_consumo IS NULL)
				OR t.importe<>query.importe OR (t.importe IS NULL AND query.importe IS NOT NULL)
                                                  OR (t.importe IS NOT NULL AND query.importe IS NULL)
				OR t.consumo_facturado<>query.consumo_facturado OR (t.consumo_facturado IS NULL AND query.consumo_facturado IS NOT NULL)
                                                  OR (t.consumo_facturado IS NOT NULL AND query.consumo_facturado IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mi_159_fact
		SELECT @count_ins = count(*) from #tmp_mi_159_fact where rr_mode='I'

		IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_1')
			ALTER INDEX IX_tbn1_mi_159_fact_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_2')
			ALTER INDEX IX_tbn1_mi_159_fact_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_3')
			ALTER INDEX IX_tbn1_mi_159_fact_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_4')
			ALTER INDEX IX_tbn1_mi_159_fact_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_5')
			ALTER INDEX IX_tbn1_mi_159_fact_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_6')
			ALTER INDEX IX_tbn1_mi_159_fact_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_7')
			ALTER INDEX IX_tbn1_mi_159_fact_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_8')
			ALTER INDEX IX_tbn1_mi_159_fact_8 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_9')
			ALTER INDEX IX_tbn1_mi_159_fact_9 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_10')
			ALTER INDEX IX_tbn1_mi_159_fact_10 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
		END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact
			SET
				id_dim_documentos=s.id_dim_documentos,
				id_dim_declarantes=s.id_dim_declarantes,
				id_dim_declarados=s.id_dim_declarados,
				id_dim_periodos_doc=s.id_dim_periodos_doc,
				id_dim_datos_caratula=s.id_dim_datos_caratula,
				id_dim_marcas=s.id_dim_marcas,
				id_dim_datos_detalle=s.id_dim_datos_detalle,
				id_dim_datos_detalle2=s.id_dim_datos_detalle2,
				id_dim_periodos=s.id_dim_periodos,
				id_dim_datos_consumo=s.id_dim_datos_consumo,
				importe=s.importe,
				consumo_facturado=s.consumo_facturado
		FROM (
			SELECT
				id_dim_documentos,
				id_dim_declarantes,
				id_dim_declarados,
				id_dim_periodos_doc,
				id_dim_datos_caratula,
				id_dim_marcas,
				id_dim_datos_detalle,
				id_dim_datos_detalle2,
				id_dim_periodos,
				id_dim_datos_consumo,
				importe,
				consumo_facturado
			FROM #tmp_mi_159_fact
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_documentos=s.id_dim_documentos OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_documentos IS NULL AND s.id_dim_documentos IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_declarantes=s.id_dim_declarantes OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_declarantes IS NULL AND s.id_dim_declarantes IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_declarados=s.id_dim_declarados OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_declarados IS NULL AND s.id_dim_declarados IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_periodos_doc=s.id_dim_periodos_doc OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_periodos_doc IS NULL AND s.id_dim_periodos_doc IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_caratula=s.id_dim_datos_caratula OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_caratula IS NULL AND s.id_dim_datos_caratula IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_marcas=s.id_dim_marcas OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_marcas IS NULL AND s.id_dim_marcas IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_detalle=s.id_dim_datos_detalle OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_detalle IS NULL AND s.id_dim_datos_detalle IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_detalle2=s.id_dim_datos_detalle2 OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_detalle2 IS NULL AND s.id_dim_datos_detalle2 IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_periodos=s.id_dim_periodos OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_periodos IS NULL AND s.id_dim_periodos IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_consumo=s.id_dim_datos_consumo OR (dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact.id_dim_datos_consumo IS NULL AND s.id_dim_datos_consumo IS NULL));
		SET @rc=@@ROWCOUNT;

		DELETE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact
		FROM dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact AS tbn1_mi_159_fact
		INNER JOIN #tmp_mi_159_fact AS tmp
		ON ((tbn1_mi_159_fact.id_dim_documentos=tmp.t_id_dim_documentos OR (tbn1_mi_159_fact.id_dim_documentos IS NULL AND tmp.t_id_dim_documentos IS NULL)) AND (tbn1_mi_159_fact.id_dim_declarantes=tmp.t_id_dim_declarantes OR (tbn1_mi_159_fact.id_dim_declarantes IS NULL AND tmp.t_id_dim_declarantes IS NULL)) AND (tbn1_mi_159_fact.id_dim_declarados=tmp.t_id_dim_declarados OR (tbn1_mi_159_fact.id_dim_declarados IS NULL AND tmp.t_id_dim_declarados IS NULL)) AND (tbn1_mi_159_fact.id_dim_periodos_doc=tmp.t_id_dim_periodos_doc OR (tbn1_mi_159_fact.id_dim_periodos_doc IS NULL AND tmp.t_id_dim_periodos_doc IS NULL)) AND (tbn1_mi_159_fact.id_dim_datos_caratula=tmp.t_id_dim_datos_caratula OR (tbn1_mi_159_fact.id_dim_datos_caratula IS NULL AND tmp.t_id_dim_datos_caratula IS NULL)) AND (tbn1_mi_159_fact.id_dim_marcas=tmp.t_id_dim_marcas OR (tbn1_mi_159_fact.id_dim_marcas IS NULL AND tmp.t_id_dim_marcas IS NULL)) AND (tbn1_mi_159_fact.id_dim_datos_detalle=tmp.t_id_dim_datos_detalle OR (tbn1_mi_159_fact.id_dim_datos_detalle IS NULL AND tmp.t_id_dim_datos_detalle IS NULL)) AND (tbn1_mi_159_fact.id_dim_datos_detalle2=tmp.t_id_dim_datos_detalle2 OR (tbn1_mi_159_fact.id_dim_datos_detalle2 IS NULL AND tmp.t_id_dim_datos_detalle2 IS NULL)) AND (tbn1_mi_159_fact.id_dim_periodos=tmp.t_id_dim_periodos OR (tbn1_mi_159_fact.id_dim_periodos IS NULL AND tmp.t_id_dim_periodos IS NULL)) AND (tbn1_mi_159_fact.id_dim_datos_consumo=tmp.t_id_dim_datos_consumo OR (tbn1_mi_159_fact.id_dim_datos_consumo IS NULL AND tmp.t_id_dim_datos_consumo IS NULL))
		)
		WHERE tmp.rr_mode = 'D'
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_unique')
			ALTER INDEX IX_tbn1_mi_159_fact_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact WITH(TABLOCK) (id_dim_documentos,id_dim_declarantes,id_dim_declarados,id_dim_periodos_doc,id_dim_datos_caratula,id_dim_marcas,id_dim_datos_detalle,id_dim_datos_detalle2,id_dim_periodos,id_dim_datos_consumo,importe,consumo_facturado)
		SELECT
			id_dim_documentos,
			id_dim_declarantes,
			id_dim_declarados,
			id_dim_periodos_doc,
			id_dim_datos_caratula,
			id_dim_marcas,
			id_dim_datos_detalle,
			id_dim_datos_detalle2,
			id_dim_periodos,
			id_dim_datos_consumo,
			importe,
			consumo_facturado
			FROM #tmp_mi_159_fact
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_1')
			ALTER INDEX IX_tbn1_mi_159_fact_1 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_2')
			ALTER INDEX IX_tbn1_mi_159_fact_2 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_3')
			ALTER INDEX IX_tbn1_mi_159_fact_3 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_4')
			ALTER INDEX IX_tbn1_mi_159_fact_4 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_5')
			ALTER INDEX IX_tbn1_mi_159_fact_5 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_6')
			ALTER INDEX IX_tbn1_mi_159_fact_6 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_7')
			ALTER INDEX IX_tbn1_mi_159_fact_7 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_8')
			ALTER INDEX IX_tbn1_mi_159_fact_8 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_9')
			ALTER INDEX IX_tbn1_mi_159_fact_9 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_10')
			ALTER INDEX IX_tbn1_mi_159_fact_10 ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
		END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mi_159_fact_unique')
			ALTER INDEX IX_tbn1_mi_159_fact_unique ON dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact REBUILD
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
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dm_mi_159' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dm_mi_159;
GO

CREATE PROCEDURE dbo.spn1_cargar_dm_mi_159(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dm_mi_159'
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

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo NOCHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact NOCHECK CONSTRAINT ALL
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_documentos @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_declarantes @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_declarados @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_periodos_doc @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_caratula @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_marcas @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_detalle @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_detalle2 @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_periodos @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_dim_datos_consumo @logpadre;
EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_mi_159_fact @logpadre;
		SET @rc=@@ROWCOUNT;

ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_documentos WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarantes WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_declarados WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos_doc WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_caratula WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_marcas WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_detalle2 WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_periodos WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_dim_datos_consumo WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_159_fact WITH CHECK CHECK CONSTRAINT ALL
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
