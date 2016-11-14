PRINT 'normalizado_maestros_187.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo(
  id_clave_identificacion_fondo int IDENTITY(1,1),
  cod_clave_identificacion_fondo int,
  clave_identificacion_fondo varchar(25),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_identificacion_fondo UNIQUE (cod_clave_identificacion_fondo),
  CONSTRAINT PK_tbn1_mi_clave_identificacion_fondo PRIMARY KEY CLUSTERED (id_clave_identificacion_fondo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='id_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD id_clave_identificacion_fondo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='cod_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD cod_clave_identificacion_fondo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD clave_identificacion_fondo varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_IDENTIFICACION_FONDO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_IDENTIFICACION_FONDO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='id_clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN id_clave_identificacion_fondo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='cod_clave_identificacion_fondo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN cod_clave_identificacion_fondo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='clave_identificacion_fondo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN clave_identificacion_fondo varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_identificacion_fondo' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_identificacion_fondo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo ADD CONSTRAINT PK_tbn1_mi_clave_identificacion_fondo PRIMARY KEY CLUSTERED (id_clave_identificacion_fondo)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_identificacion_fondo,'Indefinido' AS clave_identificacion_fondo
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo AS tbn1_mi_clave_identificacion_fondo
USING query ON query.es_indefinido=tbn1_mi_clave_identificacion_fondo.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo<>query.cod_clave_identificacion_fondo OR (tbn1_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo IS NULL AND query.cod_clave_identificacion_fondo IS NOT NULL) OR  (tbn1_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo IS NOT NULL AND query.cod_clave_identificacion_fondo IS NULL)
                  OR tbn1_mi_clave_identificacion_fondo.clave_identificacion_fondo<>query.clave_identificacion_fondo OR (tbn1_mi_clave_identificacion_fondo.clave_identificacion_fondo IS NULL AND query.clave_identificacion_fondo IS NOT NULL) OR  (tbn1_mi_clave_identificacion_fondo.clave_identificacion_fondo IS NOT NULL AND query.clave_identificacion_fondo IS NULL))) THEN
  UPDATE SET
    cod_clave_identificacion_fondo=query.cod_clave_identificacion_fondo,
    clave_identificacion_fondo=query.clave_identificacion_fondo
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_identificacion_fondo,clave_identificacion_fondo) VALUES (
    query.es_indefinido,
    query.cod_clave_identificacion_fondo,
    query.clave_identificacion_fondo);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion(
  id_tipo_operacion int IDENTITY(1,1),
  cod_tipo_operacion varchar(1),
  tipo_operacion varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_tipo_operacion UNIQUE (cod_tipo_operacion),
  CONSTRAINT PK_tbn1_mi_tipo_operacion PRIMARY KEY CLUSTERED (id_tipo_operacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='id_tipo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD id_tipo_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='cod_tipo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD cod_tipo_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='tipo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD tipo_operacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_OPERACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='id_tipo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN id_tipo_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='cod_tipo_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN cod_tipo_operacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='tipo_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN tipo_operacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion ADD CONSTRAINT PK_tbn1_mi_tipo_operacion PRIMARY KEY CLUSTERED (id_tipo_operacion)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_tipo_operacion,'Indefinido' AS tipo_operacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion AS tbn1_mi_tipo_operacion
USING query ON query.es_indefinido=tbn1_mi_tipo_operacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_operacion.cod_tipo_operacion<>query.cod_tipo_operacion OR (tbn1_mi_tipo_operacion.cod_tipo_operacion IS NULL AND query.cod_tipo_operacion IS NOT NULL) OR  (tbn1_mi_tipo_operacion.cod_tipo_operacion IS NOT NULL AND query.cod_tipo_operacion IS NULL)
                  OR tbn1_mi_tipo_operacion.tipo_operacion<>query.tipo_operacion OR (tbn1_mi_tipo_operacion.tipo_operacion IS NULL AND query.tipo_operacion IS NOT NULL) OR  (tbn1_mi_tipo_operacion.tipo_operacion IS NOT NULL AND query.tipo_operacion IS NULL))) THEN
  UPDATE SET
    cod_tipo_operacion=query.cod_tipo_operacion,
    tipo_operacion=query.tipo_operacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_operacion,tipo_operacion) VALUES (
    query.es_indefinido,
    query.cod_tipo_operacion,
    query.tipo_operacion);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio(
  id_tipo_socio int IDENTITY(1,1),
  cod_tipo_socio varchar(1),
  tipo_socio varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_tipo_socio UNIQUE (cod_tipo_socio),
  CONSTRAINT PK_tbn1_mi_tipo_socio PRIMARY KEY CLUSTERED (id_tipo_socio)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='id_tipo_socio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD id_tipo_socio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='cod_tipo_socio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD cod_tipo_socio varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='tipo_socio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD tipo_socio varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_SOCIO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='id_tipo_socio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN id_tipo_socio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='cod_tipo_socio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN cod_tipo_socio varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='tipo_socio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN tipo_socio varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_socio' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_socio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio ADD CONSTRAINT PK_tbn1_mi_tipo_socio PRIMARY KEY CLUSTERED (id_tipo_socio)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_tipo_socio,'Indefinido' AS tipo_socio
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio AS tbn1_mi_tipo_socio
USING query ON query.es_indefinido=tbn1_mi_tipo_socio.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_socio.cod_tipo_socio<>query.cod_tipo_socio OR (tbn1_mi_tipo_socio.cod_tipo_socio IS NULL AND query.cod_tipo_socio IS NOT NULL) OR  (tbn1_mi_tipo_socio.cod_tipo_socio IS NOT NULL AND query.cod_tipo_socio IS NULL)
                  OR tbn1_mi_tipo_socio.tipo_socio<>query.tipo_socio OR (tbn1_mi_tipo_socio.tipo_socio IS NULL AND query.tipo_socio IS NOT NULL) OR  (tbn1_mi_tipo_socio.tipo_socio IS NOT NULL AND query.tipo_socio IS NULL))) THEN
  UPDATE SET
    cod_tipo_socio=query.cod_tipo_socio,
    tipo_socio=query.tipo_socio
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_socio,tipo_socio) VALUES (
    query.es_indefinido,
    query.cod_tipo_socio,
    query.tipo_socio);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_identificacion_fondo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo'
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
      cod_clave_identificacion AS cod_clave_identificacion_fondo,
      descripcion_clave_identificacion AS clave_identificacion_fondo,
      'MAESTRO' AS origen
    FROM
      (SELECT 1 cod_clave_identificacion,3 cod_clave_identificacion_189,'Nif' descripcion_clave_identificacion
       UNION ALL SELECT 2,1,'ISIN'
       UNION ALL SELECT 3,2,'Valor extranjero') clave_identificacion_fondo
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo AS tbn1_mi_clave_identificacion_fondo
  USING query ON query.cod_clave_identificacion_fondo=tbn1_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo
  WHEN MATCHED AND ((tbn1_mi_clave_identificacion_fondo.clave_identificacion_fondo<>query.clave_identificacion_fondo OR (tbn1_mi_clave_identificacion_fondo.clave_identificacion_fondo IS NULL AND query.clave_identificacion_fondo IS NOT NULL) OR  (tbn1_mi_clave_identificacion_fondo.clave_identificacion_fondo IS NOT NULL AND query.clave_identificacion_fondo IS NULL)
                    OR tbn1_mi_clave_identificacion_fondo.origen<>query.origen OR (tbn1_mi_clave_identificacion_fondo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_identificacion_fondo.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_identificacion_fondo=query.clave_identificacion_fondo,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_identificacion_fondo,clave_identificacion_fondo,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_identificacion_fondo,
      query.clave_identificacion_fondo,
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


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_operacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_operacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_operacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_operacion'
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
      cod_tipo_operacion,
      descripcion_tipo_operacion AS tipo_operacion
    FROM
      (SELECT 'A' cod_tipo_operacion,'Adquisicion' descripcion_tipo_operacion
       UNION ALL SELECT 'B','Adq.Reinversión'
       UNION ALL SELECT 'E','Enajenacion'
       UNION ALL SELECT 'F','Enaj.No computa'
       UNION ALL SELECT 'C','Enaj.Art 49 rgto IIC'
       UNION ALL SELECT 'G','Trans.sin retención'
       UNION ALL SELECT 'H','Trans.con retención') tipo_operacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion AS tbn1_mi_tipo_operacion
  USING query ON query.cod_tipo_operacion=tbn1_mi_tipo_operacion.cod_tipo_operacion
  WHEN MATCHED AND ((tbn1_mi_tipo_operacion.tipo_operacion<>query.tipo_operacion OR (tbn1_mi_tipo_operacion.tipo_operacion IS NULL AND query.tipo_operacion IS NOT NULL) OR  (tbn1_mi_tipo_operacion.tipo_operacion IS NOT NULL AND query.tipo_operacion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_operacion=query.tipo_operacion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_operacion,tipo_operacion,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_operacion,
      query.tipo_operacion,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_socio' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_socio;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_socio(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_socio'
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
      cod_tipo_socio,
      descripcion_tipo_socio AS tipo_socio
    FROM
      (SELECT 'R' cod_tipo_socio,'Residente' descripcion_tipo_socio
       UNION ALL SELECT 'N','No residente'
       UNION ALL SELECT 'E','Contribuyente'
       UNION ALL SELECT 'C','Entidad art 20 rgto IIC') tipo_socio
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio AS tbn1_mi_tipo_socio
  USING query ON query.cod_tipo_socio=tbn1_mi_tipo_socio.cod_tipo_socio
  WHEN MATCHED AND ((tbn1_mi_tipo_socio.tipo_socio<>query.tipo_socio OR (tbn1_mi_tipo_socio.tipo_socio IS NULL AND query.tipo_socio IS NOT NULL) OR  (tbn1_mi_tipo_socio.tipo_socio IS NOT NULL AND query.tipo_socio IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_socio=query.tipo_socio,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_socio,tipo_socio,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_socio,
      query.tipo_socio,
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

