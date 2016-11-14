PRINT 'normalizado_maestros_modelos_informativos.sql'
GO

/*********************************/
/*tbn1_mi_administracion_hacienda*/
/*********************************/

--TABLA--
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(
  id_administracion int IDENTITY(1,1),
  cod_administracion varchar(1),
  cod_provincia int,
  administracion varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_administracion_hacienda UNIQUE (cod_administracion),
  CONSTRAINT PK_tbn1_mi_administracion_hacienda PRIMARY KEY CLUSTERED (id_administracion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD id_administracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='cod_administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD cod_administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD administracion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD CONSTRAINT DF_DBO_TBN1_MI_ADMINISTRACION_HACIENDA_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD CONSTRAINT DF_DBO_TBN1_MI_ADMINISTRACION_HACIENDA_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN id_administracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='cod_administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN cod_administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN administracion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_administracion_hacienda' AND CONSTRAINT_NAME='PK_tbn1_mi_administracion_hacienda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ADD CONSTRAINT PK_tbn1_mi_administracion_hacienda PRIMARY KEY CLUSTERED (id_administracion)

GO

--INDEFINIDO--
;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_administracion,'Indefinido' AS administracion, 1 AS cod_provincia
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda AS tbn1_mi_administracion_hacienda
USING query ON query.es_indefinido=tbn1_mi_administracion_hacienda.es_indefinido
WHEN MATCHED AND ((tbn1_mi_administracion_hacienda.cod_administracion<>query.cod_administracion OR (tbn1_mi_administracion_hacienda.cod_administracion IS NULL AND query.cod_administracion IS NOT NULL) OR  (tbn1_mi_administracion_hacienda.cod_administracion IS NOT NULL AND query.cod_administracion IS NULL)
                  OR tbn1_mi_administracion_hacienda.administracion<>query.administracion OR (tbn1_mi_administracion_hacienda.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_mi_administracion_hacienda.administracion IS NOT NULL AND query.administracion IS NULL))) THEN
  UPDATE SET
    cod_administracion=query.cod_administracion,
    administracion=query.administracion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_administracion,administracion) VALUES (
    query.es_indefinido,
    query.cod_administracion,
    query.administracion);
GO


/***************************/
/*tbn1_mi_tipo_presentacion*/
/***************************/

--TABLA
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(
  id_tipo_presentacion int IDENTITY(1,1),
  cod_tipo_presentacion varchar(1),
  tipo_presentacion varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_presentacion UNIQUE (cod_tipo_presentacion),
  CONSTRAINT PK_tbn1_mi_tipo_presentacion PRIMARY KEY CLUSTERED (id_tipo_presentacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_PRESENTACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_PRESENTACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN cod_tipo_presentacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN tipo_presentacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_presentacion' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ADD CONSTRAINT PK_tbn1_mi_tipo_presentacion PRIMARY KEY CLUSTERED (id_tipo_presentacion)

GO

--INDEFINIDO--
;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_tipo_presentacion,'Indefinido' AS tipo_presentacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion AS tbn1_mi_tipo_presentacion
USING query ON query.es_indefinido=tbn1_mi_tipo_presentacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_presentacion.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_mi_tipo_presentacion.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_mi_tipo_presentacion.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                  OR tbn1_mi_tipo_presentacion.tipo_presentacion<>query.tipo_presentacion OR (tbn1_mi_tipo_presentacion.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_mi_tipo_presentacion.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL))) THEN
  UPDATE SET
    cod_tipo_presentacion=query.cod_tipo_presentacion,
    tipo_presentacion=query.tipo_presentacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_presentacion,tipo_presentacion) VALUES (
    query.es_indefinido,
    query.cod_tipo_presentacion,
    query.tipo_presentacion);
GO




IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza(
  id_naturaleza int IDENTITY(1,1),
  cod_naturaleza varchar(1),
  naturaleza varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_naturaleza UNIQUE (cod_naturaleza),
  CONSTRAINT PK_tbn1_mi_naturaleza PRIMARY KEY CLUSTERED (id_naturaleza)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='id_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD id_naturaleza int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='cod_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD cod_naturaleza varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD naturaleza varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD CONSTRAINT DF_DBO_TBN1_MI_NATURALEZA_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='id_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN id_naturaleza int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='cod_naturaleza' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN cod_naturaleza varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='naturaleza' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN naturaleza varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza' AND CONSTRAINT_NAME='PK_tbn1_mi_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza ADD CONSTRAINT PK_tbn1_mi_naturaleza PRIMARY KEY CLUSTERED (id_naturaleza)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_naturaleza,'Indefinido' AS naturaleza
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza AS tbn1_mi_naturaleza
USING query ON query.es_indefinido=tbn1_mi_naturaleza.es_indefinido
WHEN MATCHED AND ((tbn1_mi_naturaleza.cod_naturaleza<>query.cod_naturaleza OR (tbn1_mi_naturaleza.cod_naturaleza IS NULL AND query.cod_naturaleza IS NOT NULL) OR  (tbn1_mi_naturaleza.cod_naturaleza IS NOT NULL AND query.cod_naturaleza IS NULL)
                  OR tbn1_mi_naturaleza.naturaleza<>query.naturaleza OR (tbn1_mi_naturaleza.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_mi_naturaleza.naturaleza IS NOT NULL AND query.naturaleza IS NULL))) THEN
  UPDATE SET
    cod_naturaleza=query.cod_naturaleza,
    naturaleza=query.naturaleza
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_naturaleza,naturaleza) VALUES (
    query.es_indefinido,
    query.cod_naturaleza,
    query.naturaleza);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193(
  id_naturaleza int IDENTITY(1,1),
  cod_clave varchar(1),
  cod_naturaleza varchar(2),
  naturaleza varchar(150),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_naturaleza_193 UNIQUE (cod_clave,cod_naturaleza),
  CONSTRAINT PK_tbn1_mi_naturaleza_193 PRIMARY KEY CLUSTERED (id_naturaleza)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='id_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD id_naturaleza int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='cod_clave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD cod_clave varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='cod_naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD cod_naturaleza varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='naturaleza')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD naturaleza varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD CONSTRAINT DF_DBO_TBN1_MI_NATURALEZA_193_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='id_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN id_naturaleza int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='cod_clave' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN cod_clave varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='cod_naturaleza' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN cod_naturaleza varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='naturaleza' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN naturaleza varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_naturaleza_193' AND CONSTRAINT_NAME='PK_tbn1_mi_naturaleza_193')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 ADD CONSTRAINT PK_tbn1_mi_naturaleza_193 PRIMARY KEY CLUSTERED (id_naturaleza)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_naturaleza,'Indefinido' AS naturaleza
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 AS tbn1_mi_naturaleza_193
USING query ON query.es_indefinido=tbn1_mi_naturaleza_193.es_indefinido
WHEN MATCHED AND ((tbn1_mi_naturaleza_193.cod_naturaleza<>query.cod_naturaleza OR (tbn1_mi_naturaleza_193.cod_naturaleza IS NULL AND query.cod_naturaleza IS NOT NULL) OR  (tbn1_mi_naturaleza_193.cod_naturaleza IS NOT NULL AND query.cod_naturaleza IS NULL)
                  OR tbn1_mi_naturaleza_193.naturaleza<>query.naturaleza OR (tbn1_mi_naturaleza_193.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_mi_naturaleza_193.naturaleza IS NOT NULL AND query.naturaleza IS NULL))) THEN
  UPDATE SET
    cod_naturaleza=query.cod_naturaleza,
    naturaleza=query.naturaleza
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_naturaleza,naturaleza) VALUES (
    query.es_indefinido,
    query.cod_naturaleza,
    query.naturaleza);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_naturaleza_193' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_naturaleza_193;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_naturaleza_193(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza_193'
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
    SELECT
      cod_clave,
      cod_naturaleza,
      descripcion_naturaleza AS naturaleza
    FROM
	  (SELECT 'A' cod_clave,'01' cod_naturaleza,'01   Primas por asistencia a juntas.…' descripcion_naturaleza
       UNION ALL SELECT 'A','02','02   Dividendos y participaciones en cualquie…'
       UNION ALL SELECT 'A','03','03   Rendimientos o rentas procedentes de cua…'
       UNION ALL SELECT 'A','04','04   Rendimientos o rentas que se deriven de …'
       UNION ALL SELECT 'A','05','05   Cualquier otra utilidad, distinta de las…'
       UNION ALL SELECT 'A','06','06   Rendimientos exentos.…'
       UNION ALL SELECT 'A','07','07   Dividendos y beneficios distribuidos por…'
       UNION ALL SELECT 'A','09','09   Intereses de la aportación satisfechos a…'
       UNION ALL SELECT 'B','01','01   Intereses de obligaciones, bonos, certif…'
       UNION ALL SELECT 'B','02','02   Intereses de obligaciones, bonos, cédula…'
       UNION ALL SELECT 'B','03','03   Intereses de préstamos no bancarios.…'
       UNION ALL SELECT 'B','04','04   Rendimientos o rentas que disfruten de u…'
       UNION ALL SELECT 'B','05','05   Rendimientos o rentas satisfechos por un…'
       UNION ALL SELECT 'B','06','06   Otros rendimientos de capital mobiliario…'
       UNION ALL SELECT 'B','07','07   Rendimientos exentos.…'
       UNION ALL SELECT 'D','01','01   Intereses de obligaciones, bonos, certif…'
       UNION ALL SELECT 'D','02','02   Intereses de obligaciones, bonos, cédula…'
       UNION ALL SELECT 'D','03','03   Intereses de préstamos no bancarios.…'
       UNION ALL SELECT 'D','04','04   Rendimientos o rentas que disfruten de u…'
       UNION ALL SELECT 'D','05','05   Rendimientos o rentas satisfechos por un…'
       UNION ALL SELECT 'D','06','06   Otros rendimientos de capital mobiliario…'
       UNION ALL SELECT 'D','07','07   Rendimientos exentos.…'
       UNION ALL SELECT 'C','01','01   Rendimientos o rentas procedentes de la …'
       UNION ALL SELECT 'C','02','02   Rendimientos o rentas procedentes de la …'
       UNION ALL SELECT 'C','03','03   Rendimientos o rentas procedentes de la…'
       UNION ALL SELECT 'C','04','04   Rendimientos o rentas procedentes del ar…'
       UNION ALL SELECT 'C','05','05   Rentas vitalicias o temporales que teng…'
       UNION ALL SELECT 'C','06','06   Rendimientos procedentes de la cesión d…'
       UNION ALL SELECT 'C','07','07   Rendimientos procedentes del subarrendam…'
       UNION ALL SELECT 'C','08','08   Rentas procedentes de la cesión del der…'
       UNION ALL SELECT 'C','09','09   Rentas obtenidas como consecuencia de pr…'
       UNION ALL SELECT 'C','10','10   Contraprestaciones obtenidas como conse…'
       UNION ALL SELECT 'C','11','11   Rendimientos exentos.…'
       UNION ALL SELECT 'C','12','12   Otros rendimientos de capital mobiliario…') naturaleza
	/*
      (SELECT 'A' cod_clave,1 cod_naturaleza,'01   Primas por asistencia a juntas.…' descripcion_naturaleza
       UNION ALL SELECT 'A',2,'02   Dividendos y participaciones en cualquie…'
       UNION ALL SELECT 'A',3,'03   Rendimientos o rentas procedentes de cua…'
       UNION ALL SELECT 'A',4,'04   Rendimientos o rentas que se deriven de …'
       UNION ALL SELECT 'A',5,'05   Cualquier otra utilidad, distinta de las…'
       UNION ALL SELECT 'A',6,'06   Rendimientos exentos.…'
       UNION ALL SELECT 'A',7,'07   Dividendos y beneficios distribuidos por…'
       UNION ALL SELECT 'A',9,'09   Intereses de la aportación satisfechos a…'
       UNION ALL SELECT 'B',1,'01   Intereses de obligaciones, bonos, certif…'
       UNION ALL SELECT 'B',2,'02   Intereses de obligaciones, bonos, cédula…'
       UNION ALL SELECT 'B',3,'03   Intereses de préstamos no bancarios.…'
       UNION ALL SELECT 'B',4,'04   Rendimientos o rentas que disfruten de u…'
       UNION ALL SELECT 'B',5,'05   Rendimientos o rentas satisfechos por un…'
       UNION ALL SELECT 'B',6,'06   Otros rendimientos de capital mobiliario…'
       UNION ALL SELECT 'B',7,'07    Rendimientos exentos.…'
       UNION ALL SELECT 'D',1,'01   Intereses de obligaciones, bonos, certif…'
       UNION ALL SELECT 'D',2,'02   Intereses de obligaciones, bonos, cédula…'
       UNION ALL SELECT 'D',3,'03   Intereses de préstamos no bancarios.…'
       UNION ALL SELECT 'D',4,'04   Rendimientos o rentas que disfruten de u…'
       UNION ALL SELECT 'D',5,'05   Rendimientos o rentas satisfechos por un…'
       UNION ALL SELECT 'D',6,'06   Otros rendimientos de capital mobiliario…'
       UNION ALL SELECT 'D',7,'07    Rendimientos exentos.…'
       UNION ALL SELECT 'C',1,'01   Rendimientos o rentas procedentes de la …'
       UNION ALL SELECT 'C',2,'02   Rendimientos o rentas procedentes de la …'
       UNION ALL SELECT 'C',3,'03    Rendimientos o rentas procedentes de la…'
       UNION ALL SELECT 'C',4,'04   Rendimientos o rentas procedentes del ar…'
       UNION ALL SELECT 'C',5,'05    Rentas vitalicias o temporales que teng…'
       UNION ALL SELECT 'C',6,'06    Rendimientos procedentes de la cesión d…'
       UNION ALL SELECT 'C',7,'07   Rendimientos procedentes del subarrendam…'
       UNION ALL SELECT 'C',8,'08    Rentas procedentes de la cesión del der…'
       UNION ALL SELECT 'C',9,'09   Rentas obtenidas como consecuencia de pr…'
       UNION ALL SELECT 'C',10,'10    Contraprestaciones obtenidas como conse…'
       UNION ALL SELECT 'C',11,'11    Rendimientos exentos.…'
       UNION ALL SELECT 'C',12,'12   Otros rendimientos de capital mobiliario…') naturaleza*/
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 AS tbn1_mi_naturaleza_193
  USING query ON query.cod_clave=tbn1_mi_naturaleza_193.cod_clave AND query.cod_naturaleza=tbn1_mi_naturaleza_193.cod_naturaleza
  WHEN MATCHED AND ((tbn1_mi_naturaleza_193.naturaleza<>query.naturaleza OR (tbn1_mi_naturaleza_193.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_mi_naturaleza_193.naturaleza IS NOT NULL AND query.naturaleza IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      naturaleza=query.naturaleza,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave,cod_naturaleza,naturaleza,fec_alta,fec_modificacion) VALUES (
      query.cod_clave,
      query.cod_naturaleza,
      query.naturaleza,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad(
  id_modalidad int IDENTITY(1,1),
  cod_modalidad varchar(1),
  modalidad varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_modalidad UNIQUE (cod_modalidad),
  CONSTRAINT PK_tbn1_mi_modalidad PRIMARY KEY CLUSTERED (id_modalidad)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='id_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD id_modalidad int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='cod_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD cod_modalidad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD modalidad varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD CONSTRAINT DF_DBO_TBN1_MI_MODALIDAD_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='id_modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN id_modalidad int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='cod_modalidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN cod_modalidad varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='modalidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN modalidad varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_modalidad' AND CONSTRAINT_NAME='PK_tbn1_mi_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad ADD CONSTRAINT PK_tbn1_mi_modalidad PRIMARY KEY CLUSTERED (id_modalidad)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_modalidad,'Indefinido' AS modalidad
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad AS tbn1_mi_modalidad
USING query ON query.es_indefinido=tbn1_mi_modalidad.es_indefinido
WHEN MATCHED AND ((tbn1_mi_modalidad.cod_modalidad<>query.cod_modalidad OR (tbn1_mi_modalidad.cod_modalidad IS NULL AND query.cod_modalidad IS NOT NULL) OR  (tbn1_mi_modalidad.cod_modalidad IS NOT NULL AND query.cod_modalidad IS NULL)
                  OR tbn1_mi_modalidad.modalidad<>query.modalidad OR (tbn1_mi_modalidad.modalidad IS NULL AND query.modalidad IS NOT NULL) OR  (tbn1_mi_modalidad.modalidad IS NOT NULL AND query.modalidad IS NULL))) THEN
  UPDATE SET
    cod_modalidad=query.cod_modalidad,
    modalidad=query.modalidad
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_modalidad,modalidad) VALUES (
    query.es_indefinido,
    query.cod_modalidad,
    query.modalidad);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo(
  id_clave_codigo int IDENTITY(1,1),
  cod_clave_codigo varchar(1),
  clave_codigo varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_clave_codigo UNIQUE (cod_clave_codigo),
  CONSTRAINT PK_tbn1_mi_clave_codigo PRIMARY KEY CLUSTERED (id_clave_codigo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='id_clave_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD id_clave_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='cod_clave_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD cod_clave_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='clave_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD clave_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_CODIGO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='id_clave_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN id_clave_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='cod_clave_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN cod_clave_codigo varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='clave_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN clave_codigo varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_codigo' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo ADD CONSTRAINT PK_tbn1_mi_clave_codigo PRIMARY KEY CLUSTERED (id_clave_codigo)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_codigo,'Indefinido' AS clave_codigo
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo AS tbn1_mi_clave_codigo
USING query ON query.es_indefinido=tbn1_mi_clave_codigo.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_codigo.cod_clave_codigo<>query.cod_clave_codigo OR (tbn1_mi_clave_codigo.cod_clave_codigo IS NULL AND query.cod_clave_codigo IS NOT NULL) OR  (tbn1_mi_clave_codigo.cod_clave_codigo IS NOT NULL AND query.cod_clave_codigo IS NULL)
                  OR tbn1_mi_clave_codigo.clave_codigo<>query.clave_codigo OR (tbn1_mi_clave_codigo.clave_codigo IS NULL AND query.clave_codigo IS NOT NULL) OR  (tbn1_mi_clave_codigo.clave_codigo IS NOT NULL AND query.clave_codigo IS NULL))) THEN
  UPDATE SET
    cod_clave_codigo=query.cod_clave_codigo,
    clave_codigo=query.clave_codigo
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_codigo,clave_codigo) VALUES (
    query.es_indefinido,
    query.cod_clave_codigo,
    query.clave_codigo);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo(
  id_tipo_codigo int IDENTITY(1,1),
  cod_tipo_codigo varchar(1),
  tipo_codigo varchar(60),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_codigo UNIQUE (cod_tipo_codigo),
  CONSTRAINT PK_tbn1_mi_tipo_codigo PRIMARY KEY CLUSTERED (id_tipo_codigo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD id_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD cod_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD tipo_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_CODIGO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_CODIGO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN id_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='cod_tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN cod_tipo_codigo varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN tipo_codigo varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_codigo' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo ADD CONSTRAINT PK_tbn1_mi_tipo_codigo PRIMARY KEY CLUSTERED (id_tipo_codigo)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_tipo_codigo,'Indefinido' AS tipo_codigo
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo AS tbn1_mi_tipo_codigo
USING query ON query.es_indefinido=tbn1_mi_tipo_codigo.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_codigo.cod_tipo_codigo<>query.cod_tipo_codigo OR (tbn1_mi_tipo_codigo.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL) OR  (tbn1_mi_tipo_codigo.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
                  OR tbn1_mi_tipo_codigo.tipo_codigo<>query.tipo_codigo OR (tbn1_mi_tipo_codigo.tipo_codigo IS NULL AND query.tipo_codigo IS NOT NULL) OR  (tbn1_mi_tipo_codigo.tipo_codigo IS NOT NULL AND query.tipo_codigo IS NULL))) THEN
  UPDATE SET
    cod_tipo_codigo=query.cod_tipo_codigo,
    tipo_codigo=query.tipo_codigo
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_codigo,tipo_codigo) VALUES (
    query.es_indefinido,
    query.cod_tipo_codigo,
    query.tipo_codigo);
GO


/**************************/
/*tbn1_mi_tipo_declaracion*/
/**************************/

--TABLA--
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(
  id_tipo_declaracion int IDENTITY(1,1),
  cod_tipo_declaracion varchar(1),
  tipo_declaracion varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_declaracion UNIQUE (cod_tipo_declaracion),
  CONSTRAINT PK_tbn1_mi_tipo_declaracion PRIMARY KEY CLUSTERED (id_tipo_declaracion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD id_tipo_declaracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='cod_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD cod_tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD tipo_declaracion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_DECLARACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_DECLARACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN id_tipo_declaracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='cod_tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN cod_tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN tipo_declaracion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_declaracion' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_declaracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ADD CONSTRAINT PK_tbn1_mi_tipo_declaracion PRIMARY KEY CLUSTERED (id_tipo_declaracion)

GO

--INDEFINIDO--
;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_declaracion,'Indefinido' AS tipo_declaracion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion AS tbn1_mi_tipo_declaracion
USING query ON query.es_indefinido=tbn1_mi_tipo_declaracion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_declaracion.cod_tipo_declaracion<>query.cod_tipo_declaracion OR (tbn1_mi_tipo_declaracion.cod_tipo_declaracion IS NULL AND query.cod_tipo_declaracion IS NOT NULL) OR  (tbn1_mi_tipo_declaracion.cod_tipo_declaracion IS NOT NULL AND query.cod_tipo_declaracion IS NULL)
                  OR tbn1_mi_tipo_declaracion.tipo_declaracion<>query.tipo_declaracion OR (tbn1_mi_tipo_declaracion.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_mi_tipo_declaracion.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL))) THEN
  UPDATE SET
    cod_tipo_declaracion=query.cod_tipo_declaracion,
    tipo_declaracion=query.tipo_declaracion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_declaracion,tipo_declaracion) VALUES (
    query.es_indefinido,
    query.cod_tipo_declaracion,
    query.tipo_declaracion);
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_declaracion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion'
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
      mensaje_error='EXCLUíDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  ;WITH query AS 
  (
	SELECT	cod_tipo_declaracion,
			tipo_declaracion,
			'MAESTRO' AS origen
    FROM(
			SELECT	'C' AS cod_tipo_declaracion,
					'Declaración complementaria' AS tipo_declaracion
			UNION
			SELECT	'S' AS cod_tipo_declaracion,
					'Declaración sustitutiva' AS tipo_declaracion
			UNION
			SELECT	'' AS cod_tipo_declaracion,
					'Primera Declaración' AS tipo_declaracion
		) clave_codigo
	)
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion AS tbn1_mi_tipo_declaracion
  USING query ON query.cod_tipo_declaracion=tbn1_mi_tipo_declaracion.cod_tipo_declaracion
  WHEN MATCHED AND ((tbn1_mi_tipo_declaracion.tipo_declaracion<>query.tipo_declaracion OR (tbn1_mi_tipo_declaracion.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_mi_tipo_declaracion.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_mi_tipo_declaracion.origen<>query.origen OR (tbn1_mi_tipo_declaracion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipo_declaracion.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_declaracion=query.tipo_declaracion,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_declaracion,tipo_declaracion,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_declaracion,
      query.tipo_declaracion,
      query.origen,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

	--	  incluir registro -1
	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion
		WHERE	id_tipo_declaracion = -1
	)

		INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion
		(
			id_tipo_declaracion,
			cod_tipo_declaracion,
			tipo_declaracion,
			origen
		)
		VALUES
		(
			-1,
			'-',
			'N/A (EXTERNO)',
			'EXTERNOS'
		)

	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion OFF

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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_administracion_hacienda' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_administracion_hacienda;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_administracion_hacienda(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda'
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
    SELECT
      cod_administracion,
      descripcion_administracion AS administracion,
	  cod_provincia AS cod_provincia,
      'MAESTRO' AS origen
    FROM
      (SELECT 'B' cod_administracion,'Bizkaia' descripcion_administracion, 48 AS cod_provincia
       UNION ALL SELECT 'G','Guipuzkoa',20
       UNION ALL SELECT 'A','Araba',1
       UNION ALL SELECT 'N','Nafarroa',31
       UNION ALL SELECT 'M','Madrid',28) administracion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda AS tbn1_mi_administracion_hacienda
  USING query ON query.cod_administracion=tbn1_mi_administracion_hacienda.cod_administracion
  WHEN MATCHED AND ((tbn1_mi_administracion_hacienda.administracion<>query.administracion OR (tbn1_mi_administracion_hacienda.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_mi_administracion_hacienda.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_mi_administracion_hacienda.origen<>query.origen OR (tbn1_mi_administracion_hacienda.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_administracion_hacienda.origen IS NOT NULL AND query.origen IS NULL)
                    OR tbn1_mi_administracion_hacienda.cod_provincia<>query.cod_provincia OR (tbn1_mi_administracion_hacienda.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL) OR  (tbn1_mi_administracion_hacienda.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)					
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      origen=query.origen,
	  cod_provincia=query.cod_provincia,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_administracion,administracion,origen,cod_provincia,fec_alta,fec_modificacion) VALUES (
      query.cod_administracion,
      query.administracion,
      query.origen,
	  query.cod_provincia,
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


/***************************************************/
/*CARGAS INTEGRIDAD tbn1_mi_administracion_hacienda*/
/***************************************************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_administracion_hacienda_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_administracion_hacienda_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_administracion_hacienda_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda_integridad'
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
    SELECT
      cabe_admon AS cod_administracion,
      'ADMON. FALTANTE EN MAESTRO' AS administracion,
      'APLIC. MF' AS origen
    FROM dbo.tbn1cabe_mf
    GROUP BY cabe_admon
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda(cod_administracion,administracion,origen)
  SELECT
    query.cod_administracion,
    query.administracion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda ON (tbn1_mi_administracion_hacienda.cod_administracion=query.cod_administracion)
  WHERE tbn1_mi_administracion_hacienda.cod_administracion IS NULL;

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


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_presentacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_presentacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_presentacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion'
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
    SELECT
      cod_tipo_presentacion,
      descripcion_tipo_presentacion AS tipo_presentacion,
      'MAESTRO' AS origen
    FROM
      (SELECT 'S' cod_tipo_presentacion,'Soporte' descripcion_tipo_presentacion
       UNION ALL SELECT 'P','Papel'
       UNION ALL SELECT 'F','Pdf'
       UNION ALL SELECT 'I','Internet'
       UNION ALL SELECT 'H','Telemática >50.000 regs'
       UNION ALL SELECT 'T','Editran') tipo_presentacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion AS tbn1_mi_tipo_presentacion
  USING query ON query.cod_tipo_presentacion=tbn1_mi_tipo_presentacion.cod_tipo_presentacion
  WHEN MATCHED AND ((tbn1_mi_tipo_presentacion.tipo_presentacion<>query.tipo_presentacion OR (tbn1_mi_tipo_presentacion.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_mi_tipo_presentacion.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_mi_tipo_presentacion.origen<>query.origen OR (tbn1_mi_tipo_presentacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipo_presentacion.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_presentacion=query.tipo_presentacion,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_presentacion,tipo_presentacion,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.origen,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

	--Incluir registro -1
	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion
		WHERE	id_tipo_presentacion = -1
	)
		INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion
		(
			id_tipo_presentacion,
			cod_tipo_presentacion,
			tipo_presentacion,
			origen
		)
		VALUES
		(
			-1,
			'',
			'N/A (EXTERNO)',
			'EXTERNOS'
		)

	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion OFF

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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_naturaleza' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_naturaleza;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_naturaleza(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza'
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
    SELECT
      cod_naturaleza,
      descripcion_naturaleza AS naturaleza
    FROM
      (SELECT 'F' cod_naturaleza,'Física' descripcion_naturaleza
       UNION ALL SELECT 'J','Jurídica'
       UNION ALL SELECT 'E','Entidad en régimen de atribución de rentas') naturaleza
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza AS tbn1_mi_naturaleza
  USING query ON query.cod_naturaleza=tbn1_mi_naturaleza.cod_naturaleza
  WHEN MATCHED AND ((tbn1_mi_naturaleza.naturaleza<>query.naturaleza OR (tbn1_mi_naturaleza.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_mi_naturaleza.naturaleza IS NOT NULL AND query.naturaleza IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      naturaleza=query.naturaleza,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_naturaleza,naturaleza,fec_alta,fec_modificacion) VALUES (
      query.cod_naturaleza,
      query.naturaleza,
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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_modalidad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_modalidad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_modalidad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_modalidad'
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
    SELECT
      cod_modalidad,
      descripcion_modalidad AS modalidad
    FROM
      (SELECT 1 cod_modalidad,'Dineraria' descripcion_modalidad
       UNION ALL SELECT 2,'En especie') modalidad
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_modalidad AS tbn1_mi_modalidad
  USING query ON query.cod_modalidad=tbn1_mi_modalidad.cod_modalidad
  WHEN MATCHED AND ((tbn1_mi_modalidad.modalidad<>query.modalidad OR (tbn1_mi_modalidad.modalidad IS NULL AND query.modalidad IS NOT NULL) OR  (tbn1_mi_modalidad.modalidad IS NOT NULL AND query.modalidad IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      modalidad=query.modalidad,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_modalidad,modalidad,fec_alta,fec_modificacion) VALUES (
      query.cod_modalidad,
      query.modalidad,
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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_codigo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_codigo;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_codigo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_codigo'
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
    SELECT
      cod_clave_codigo,
      descripcion_clave_codigo AS clave_codigo
    FROM
      (SELECT 1 cod_clave_codigo,'NIF' descripcion_clave_codigo
       UNION ALL SELECT 2,'ISIN'
       UNION ALL SELECT 3,'Valor extranjero') clave_codigo
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo AS tbn1_mi_clave_codigo
  USING query ON query.cod_clave_codigo=tbn1_mi_clave_codigo.cod_clave_codigo
  WHEN MATCHED AND ((tbn1_mi_clave_codigo.clave_codigo<>query.clave_codigo OR (tbn1_mi_clave_codigo.clave_codigo IS NULL AND query.clave_codigo IS NOT NULL) OR  (tbn1_mi_clave_codigo.clave_codigo IS NOT NULL AND query.clave_codigo IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_codigo=query.clave_codigo,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_codigo,clave_codigo,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_codigo,
      query.clave_codigo,
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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_codigo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_codigo;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_codigo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_codigo'
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
    SELECT
      cod_tipo_codigo,
      descripcion_tipo_codigo AS tipo_codigo,
      'MAESTRO' AS origen
    FROM
      (SELECT 'C' cod_tipo_codigo,'Identificación código cuenta valores (CCV)' descripcion_tipo_codigo
       UNION ALL SELECT 'P','Número préstamo de valores, si CLAVE OPERACIÓN = "O"'
       UNION ALL SELECT 'O','Otra identificación') tipo_codigo   
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo AS tbn1_mi_tipo_codigo
  USING query ON query.cod_tipo_codigo=tbn1_mi_tipo_codigo.cod_tipo_codigo
  WHEN MATCHED AND ((tbn1_mi_tipo_codigo.tipo_codigo<>query.tipo_codigo OR (tbn1_mi_tipo_codigo.tipo_codigo IS NULL AND query.tipo_codigo IS NOT NULL) OR  (tbn1_mi_tipo_codigo.tipo_codigo IS NOT NULL AND query.tipo_codigo IS NULL)
                    OR tbn1_mi_tipo_codigo.origen<>query.origen OR (tbn1_mi_tipo_codigo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipo_codigo.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_codigo=query.tipo_codigo,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_codigo,tipo_codigo,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_codigo,
      query.tipo_codigo,
      query.origen,
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

/********************************************/
/*CARGAS INTEGRIDAD tbn1_mi_tipo_declaracion*/
/********************************************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf'
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
    SELECT
      cabe_tipodecl AS cod_tipo_declaracion,
      'TIPO FALTANTE EN MAESTRO' AS tipo_declaracion,
      'APLIC. MF' AS origen
    FROM dbo.tbn1cabe_mf
    GROUP BY cabe_tipodecl
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(cod_tipo_declaracion,tipo_declaracion,origen)
  SELECT
    query.cod_tipo_declaracion,
    query.tipo_declaracion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ON (tbn1_mi_tipo_declaracion.cod_tipo_declaracion=query.cod_tipo_declaracion)
  WHERE tbn1_mi_tipo_declaracion.cod_tipo_declaracion IS NULL;

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


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf_decl' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf_decl;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf_decl(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf_decl'
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
    SELECT
      mfdecl_tipodecl AS cod_tipo_declaracion,
      'TIPO FALTANTE EN MAESTRO' AS tipo_declaracion,
      'APLIC. MF' AS origen
    FROM dbo.tbn1decl_mf
    GROUP BY mfdecl_tipodecl
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion(cod_tipo_declaracion,tipo_declaracion,origen)
  SELECT
    query.cod_tipo_declaracion,
    query.tipo_declaracion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion ON (tbn1_mi_tipo_declaracion.cod_tipo_declaracion=query.cod_tipo_declaracion)
  WHERE tbn1_mi_tipo_declaracion.cod_tipo_declaracion IS NULL;

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


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf'
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
    SELECT
      cabe_tiposoporte AS cod_tipo_presentacion,
      'TIPO FALTANTE EN MAESTRO' AS tipo_presentacion,
      'APLIC. MF' AS origen
    FROM dbo.tbn1cabe_mf
    GROUP BY cabe_tiposoporte
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(cod_tipo_presentacion,tipo_presentacion,origen)
  SELECT
    query.cod_tipo_presentacion,
    query.tipo_presentacion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion ON (tbn1_mi_tipo_presentacion.cod_tipo_presentacion=query.cod_tipo_presentacion)
  WHERE tbn1_mi_tipo_presentacion.cod_tipo_presentacion IS NULL;

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