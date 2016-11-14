PRINT 'normalizado_maestros_190.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves(
  id_clave int IDENTITY(1,1),
  ejercicio varchar(15),
  cod_clave varchar(15),
  clave varchar(100),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_claves UNIQUE (ejercicio,cod_clave),
  CONSTRAINT PK_tbn1_mi_claves PRIMARY KEY CLUSTERED (id_clave)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='id_clave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD id_clave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD ejercicio varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='cod_clave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD cod_clave varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='clave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD clave varchar(100)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVES_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='id_clave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN id_clave int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN ejercicio varchar(15) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='cod_clave' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN cod_clave varchar(15) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='clave' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN clave varchar(100) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves' AND CONSTRAINT_NAME='PK_tbn1_mi_claves')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves ADD CONSTRAINT PK_tbn1_mi_claves PRIMARY KEY CLUSTERED (id_clave)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'Indefinido' AS ejercicio,'Indefinido' AS cod_clave,'Indefinido' AS clave
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves AS tbn1_mi_claves
USING query ON query.es_indefinido=tbn1_mi_claves.es_indefinido
WHEN MATCHED AND ((tbn1_mi_claves.ejercicio<>query.ejercicio OR (tbn1_mi_claves.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_mi_claves.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                  OR tbn1_mi_claves.cod_clave<>query.cod_clave OR (tbn1_mi_claves.cod_clave IS NULL AND query.cod_clave IS NOT NULL) OR  (tbn1_mi_claves.cod_clave IS NOT NULL AND query.cod_clave IS NULL)
                  OR tbn1_mi_claves.clave<>query.clave OR (tbn1_mi_claves.clave IS NULL AND query.clave IS NOT NULL) OR  (tbn1_mi_claves.clave IS NOT NULL AND query.clave IS NULL))) THEN
  UPDATE SET
    ejercicio=query.ejercicio,
    cod_clave=query.cod_clave,
    clave=query.clave
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,ejercicio,cod_clave,clave) VALUES (
    query.es_indefinido,
    query.ejercicio,
    query.cod_clave,
    query.clave);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves(
  id_subclave int IDENTITY(1,1),
  id_clave int,
  cod_subclave int,
  subclave varchar(150),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_subclaves UNIQUE (id_clave,cod_subclave),
  CONSTRAINT PK_tbn1_mi_subclaves PRIMARY KEY CLUSTERED (id_subclave),
  CONSTRAINT FK_tbn1_mi_subclaves_tbn1_mi_claves FOREIGN KEY (id_clave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_claves(id_clave)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='id_subclave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD id_subclave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='id_clave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD id_clave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='cod_subclave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD cod_subclave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='subclave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD subclave varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD CONSTRAINT DF_DBO_TBN1_MI_SUBCLAVES_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='id_subclave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN id_subclave int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='id_clave' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN id_clave int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='cod_subclave' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN cod_subclave int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='subclave' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN subclave varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND CONSTRAINT_NAME='PK_tbn1_mi_subclaves')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD CONSTRAINT PK_tbn1_mi_subclaves PRIMARY KEY CLUSTERED (id_subclave)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_subclaves' AND CONSTRAINT_NAME='FK_tbn1_mi_subclaves_tbn1_mi_claves')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves ADD CONSTRAINT FK_tbn1_mi_subclaves_tbn1_mi_claves FOREIGN KEY (id_clave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_claves(id_clave)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS id_clave,1 AS cod_subclave,'Indefinido' AS subclave
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves AS tbn1_mi_subclaves
USING query ON query.es_indefinido=tbn1_mi_subclaves.es_indefinido
WHEN MATCHED AND ((tbn1_mi_subclaves.id_clave<>query.id_clave OR (tbn1_mi_subclaves.id_clave IS NULL AND query.id_clave IS NOT NULL) OR  (tbn1_mi_subclaves.id_clave IS NOT NULL AND query.id_clave IS NULL)
                  OR tbn1_mi_subclaves.cod_subclave<>query.cod_subclave OR (tbn1_mi_subclaves.cod_subclave IS NULL AND query.cod_subclave IS NOT NULL) OR  (tbn1_mi_subclaves.cod_subclave IS NOT NULL AND query.cod_subclave IS NULL)
                  OR tbn1_mi_subclaves.subclave<>query.subclave OR (tbn1_mi_subclaves.subclave IS NULL AND query.subclave IS NOT NULL) OR  (tbn1_mi_subclaves.subclave IS NOT NULL AND query.subclave IS NULL))) THEN
  UPDATE SET
    id_clave=query.id_clave,
    cod_subclave=query.cod_subclave,
    subclave=query.subclave
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,id_clave,cod_subclave,subclave) VALUES (
    query.es_indefinido,
    query.id_clave,
    query.cod_subclave,
    query.subclave);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen(
  id_origen int IDENTITY(1,1),
  cod_origen varchar(2),
  origen varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_origen UNIQUE (cod_origen),
  CONSTRAINT PK_tbn1_mi_origen PRIMARY KEY CLUSTERED (id_origen)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='id_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD id_origen int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='cod_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD cod_origen varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD origen varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD CONSTRAINT DF_DBO_TBN1_MI_ORIGEN_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='id_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN id_origen int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='cod_origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN cod_origen varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN origen varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen' AND CONSTRAINT_NAME='PK_tbn1_mi_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen ADD CONSTRAINT PK_tbn1_mi_origen PRIMARY KEY CLUSTERED (id_origen)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_origen,'Indefinido' AS origen
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen AS tbn1_mi_origen
USING query ON query.es_indefinido=tbn1_mi_origen.es_indefinido
WHEN MATCHED AND ((tbn1_mi_origen.cod_origen<>query.cod_origen OR (tbn1_mi_origen.cod_origen IS NULL AND query.cod_origen IS NOT NULL) OR  (tbn1_mi_origen.cod_origen IS NOT NULL AND query.cod_origen IS NULL)
                  OR tbn1_mi_origen.origen<>query.origen OR (tbn1_mi_origen.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_origen.origen IS NOT NULL AND query.origen IS NULL))) THEN
  UPDATE SET
    cod_origen=query.cod_origen,
    origen=query.origen
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_origen,origen) VALUES (
    query.es_indefinido,
    query.cod_origen,
    query.origen);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves'
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
      CAST(ejercicio AS char) AS ejercicio,
      cod_clave,
      descripcion AS clave
    FROM
      (SELECT 1991 ejercicio,'A' cod_clave,'' cod_subclave,'Cuenta ajena' descripcion
       UNION ALL SELECT 1991,'B','','Actividades profesionales'
       UNION ALL SELECT 1991,'C','','Comisionistas'
       UNION ALL SELECT 1991,'D','','Pensiones'
       UNION ALL SELECT 1991,'E','','Trabajos de temporada'
       UNION ALL SELECT 1991,'F','','Consejeros'
       UNION ALL SELECT 1991,'G','','Residentes en el extranjero'
       UNION ALL SELECT 1991,'H','','Rendimientos irregulares'
       UNION ALL SELECT 1991,'I','','Percepciones exentas de retención'
       UNION ALL SELECT 1992,'A','','Cuenta ajena'
       UNION ALL SELECT 1992,'B','','Pensiones y haberes pasivos'
       UNION ALL SELECT 1992,'C','','Consejeros'
       UNION ALL SELECT 1992,'D','','Rendimientos irregulares'
       UNION ALL SELECT 1992,'E','','Percepciones exentas de retención'
       UNION ALL SELECT 1992,'F','','Retribuciones en especie'
       UNION ALL SELECT 1992,'G','','Actividades profesionales'
       UNION ALL SELECT 1992,'H','','Retribuciones en especie'
       UNION ALL SELECT 1992,'I','','Premios (en metálico)'
       UNION ALL SELECT 1992,'J','','Retribuciones en especie'
       UNION ALL SELECT 1992,'L','','Residentes en el extranjero'
       UNION ALL SELECT 1995,'A','','Cuenta ajena'
       UNION ALL SELECT 1995,'B','','Pensiones y haberes pasivos'
       UNION ALL SELECT 1995,'C','','Consejeros'
       UNION ALL SELECT 1995,'D','','Rendimientos irregulares'
       UNION ALL SELECT 1995,'E','','Percepciones exentas de retención'
       UNION ALL SELECT 1995,'F','','Retribuciones en especie'
       UNION ALL SELECT 1995,'G','','Actividades profesionales'
       UNION ALL SELECT 1995,'H','','Retribuciones en especie'
       UNION ALL SELECT 1995,'I','','Premios (en metálico)'
       UNION ALL SELECT 1995,'J','','Retribuciones en especie'
       UNION ALL SELECT 1995,'K','','Actividades agrícolasy ganaderas'
       UNION ALL SELECT 1995,'L','','Retribuciones en especie'
       UNION ALL SELECT 1995,'M','','Residentes en el extranjero'
       UNION ALL SELECT 1997,'A','','Cuenta ajena'
       UNION ALL SELECT 1997,'B','','Pensiones y haberes pasivos'
       UNION ALL SELECT 1997,'C','','Consejeros'
       UNION ALL SELECT 1997,'D','','Rendimientos irregulares'
       UNION ALL SELECT 1997,'E','','Percepciones exentas de retención'
       UNION ALL SELECT 1997,'F','','Retribuciones en especie'
       UNION ALL SELECT 1997,'G','','Actividades profesionales'
       UNION ALL SELECT 1997,'H','','Retribuciones en especie'
       UNION ALL SELECT 1997,'I','','Premios (en metálico)'
       UNION ALL SELECT 1997,'J','','Retribuciones en especie'
       UNION ALL SELECT 1997,'K','','Actividades agrícolasy ganaderas'
       UNION ALL SELECT 1997,'L','','Retribuciones en especie'
       UNION ALL SELECT 1997,'M','','Préstamos desempleo (pago único)'
       UNION ALL SELECT 1999,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 1999,'B','','Pensionistas y perceptores haberes pasivos'
       UNION ALL SELECT 1999,'B','01','Pensiones y haberes pasivos régimen Seg.Social/C.Pasivas'
       UNION ALL SELECT 1999,'B','02','Pensiones y haberes pasivos (no régimen Seg.Social/C.Pasivas)'
       UNION ALL SELECT 1999,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 1999,'D','','Capitalización desempleo'
       UNION ALL SELECT 1999,'E','','Consejeros y administradores'
       UNION ALL SELECT 1999,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cient.'
       UNION ALL SELECT 1999,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 1999,'F','02','Cursos,conferencias,seminarios'
       UNION ALL SELECT 1999,'G','','Actividad profesional'
       UNION ALL SELECT 1999,'G','01','Actividad profesionalsujeta al tipo del art.13.1 DF 3/99'
       UNION ALL SELECT 1999,'G','02','Act.profesional(rep.Tabacalera,recaud.municip.,agentes seguros'
       UNION ALL SELECT 1999,'H','','Actividades agrícolas, ganaderas y forestales'
       UNION ALL SELECT 1999,'H','01','Actividad agrícola o ganadera'
       UNION ALL SELECT 1999,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 1999,'H','03','Actividad forestal'
       UNION ALL SELECT 1999,'I','','Actividad económica. Rtos. comprendidos en art.3.2b)DF 3/99'
       UNION ALL SELECT 1999,'J','','Cesión derechos imagen'
       UNION ALL SELECT 1999,'K','','Premios por participar en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 1999,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 1999,'L','01','Rentas exentas. Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 1999,'L','02','Rentas exentas. Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 1999,'L','03','Rentas exentas. Ayudas afectados por VIH'
       UNION ALL SELECT 1999,'L','04','Rentas exentas. Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 1999,'L','05','Rentas exentas. Indemnización por despido/cese'
       UNION ALL SELECT 1999,'L','06','Rentas exentas. Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 1999,'L','07','Rentas exentas. Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 1999,'L','08','Rentas exentas. Prestaciones familiares S.S. por hijo a cargo'
       UNION ALL SELECT 1999,'L','09','Rentas exentas. Acogimiento personas'
       UNION ALL SELECT 1999,'L','10','Rentas exentas. Becaspúblicas para estudios'
       UNION ALL SELECT 1999,'L','11','Rentas exentas. Premios literarios, artísticos o científicos'
       UNION ALL SELECT 1999,'L','12','Rentas exentas. Deportistas alto nivel'
       UNION ALL SELECT 1999,'L','13','Rentas exentas. Desempleo modalidad pago único'
       UNION ALL SELECT 1999,'L','14','Rentas exentas. Gratificaciones extraordinarias Misiones Paz'
       UNION ALL SELECT 1999,'L','15','Rentas exentas. Trabajos realizados en el extranjero'
       UNION ALL SELECT 1999,'L','16','Rentas exentas'
       UNION ALL SELECT 1999,'L','17','Rentas exentas. Incapacidad permanente o total'
       UNION ALL SELECT 2003,'G','01','Actividad profesionalsujeta al tipo del art.108.1 DF 132/2002'
       UNION ALL SELECT 2003,'I','','Actividad económica. Rtos. comprendidos art.95.2b)DF 132/2002'
       UNION ALL SELECT 2003,'L','16','Rentas exentas. Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2003,'L','18','Otras rentas exentas'
       UNION ALL SELECT 2003,'L','19','Rentas exentas. Incapacidad permanente o total'
       UNION ALL SELECT 2003,'L','20','Rentas exentas. Pensión inutilidad/incapacidad permanente'
       UNION ALL SELECT 2003,'L','21','Rentas exentas. Prestación mejora protección familiar'
       UNION ALL SELECT 2004,'G','03','Actividad profesionalsujeta al tipo del art.108.5 DF 132/2002'
       UNION ALL SELECT 2004,'I','01','Actividad económica. Cesión derecho explotación imagen'
       UNION ALL SELECT 2004,'I','02','Actividad económica. Rendimientos distintos subclave 01'
       UNION ALL SELECT 2004,'L','08','Rentas exentas. Prestaciones y mejoras familiares Sesg.Social'
       UNION ALL SELECT 2004,'L','10','Rentas exentas. Becas'
       UNION ALL SELECT 2004,'L','19','Rentas exentas. Incapacidad permanente total'
       UNION ALL SELECT 2004,'L','20','Rentas exentas. Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2004,'M','','Rendimientos régimen especial "Copa América 2007"'
       UNION ALL SELECT 2007,'H','','Activ.agrícolas,ganaderas,forestales empresariales est.objeti'
       UNION ALL SELECT 2007,'H','04','Actividad empresarialen estimación objetiva'
       UNION ALL SELECT 2007,'K','01','Premios por participar en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2007,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2007,'L','17','Rentas exentas. Ayudas afectados hepatitis C'
       UNION ALL SELECT 2007,'L','18','Rentas exentas. Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2007,'L','19','Rentas exentas. Prestaciones atención personas dependientes'
       UNION ALL SELECT 2007,'L','20','Otras rentas exentas'
       UNION ALL SELECT 2007,'L','21','Rentas exentas. Incapacidad permanente total cualificada'
       UNION ALL SELECT 2007,'L','22','Rentas exentas. Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2008,'L','20',''
       UNION ALL SELECT 2008,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2008,'L','22','Rentas exentas. Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2008,'L','23','Rentas exentas. Incapacidad permanente total cualificada'
       UNION ALL SELECT 2008,'M','','Rendimientos régimen especial "33ª Copa América"'
       UNION ALL SELECT 2009,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 2009,'B','','Pensionistas y perceptores haberes pasivos'
       UNION ALL SELECT 2009,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
       UNION ALL SELECT 2009,'B','02','Pensiones y haberes pasivos distintos subclave 01'
       UNION ALL SELECT 2009,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 2009,'E','','Consejeros y administradores'
       UNION ALL SELECT 2009,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
       UNION ALL SELECT 2009,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 2009,'F','02','Percepciones clave F distintas subclave 01'
       UNION ALL SELECT 2009,'G','','Actividades profesionales'
       UNION ALL SELECT 2009,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
       UNION ALL SELECT 2009,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
       UNION ALL SELECT 2009,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
       UNION ALL SELECT 2009,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
       UNION ALL SELECT 2009,'H','01','Actividad agrícola o ganadera distinta subclave 02'
       UNION ALL SELECT 2009,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 2009,'H','03','Actividad forestal'
       UNION ALL SELECT 2009,'H','04','Actividad empresarial en estimación objetiva'
       UNION ALL SELECT 2009,'I','','Otras actividades económicas'
       UNION ALL SELECT 2009,'I','01','Cesión derecho explotación derecho imagen'
       UNION ALL SELECT 2009,'I','02','Actividades económicas distintas subclave 01'
       UNION ALL SELECT 2009,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2009,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
       UNION ALL SELECT 2009,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2009,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 2009,'L','01','Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 2009,'L','02','Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 2009,'L','03','Ayudas a afectados por VIH'
       UNION ALL SELECT 2009,'L','04','Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 2009,'L','05','Indemnización por despido/cese'
       UNION ALL SELECT 2009,'L','06','Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 2009,'L','07','Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 2009,'L','08','Prestación y mejora familiar Seguridad Social'
       UNION ALL SELECT 2009,'L','09','Acogimiento personas'
       UNION ALL SELECT 2009,'L','10','Becas'
       UNION ALL SELECT 2009,'L','11','Premios literarios, artísticos o científicos'
       UNION ALL SELECT 2009,'L','12','Deportistas alto nivel'
       UNION ALL SELECT 2009,'L','13','Desempleo modalidad pago único'
       UNION ALL SELECT 2009,'L','14','Gratificaciones extraordinarias Misiones de Paz'
       UNION ALL SELECT 2009,'L','15','Trabajos realizados en el extranjero'
       UNION ALL SELECT 2009,'L','16','Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2009,'L','17','Ayudas a afectados hepatitis C'
       UNION ALL SELECT 2009,'L','18','Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2009,'L','19','Prestaciones atención personas en situación dependencia'
       UNION ALL SELECT 2009,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2009,'L','22','Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2009,'L','23','Incapacidad permanente total cualificada'
       UNION ALL SELECT 2010,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 2010,'B','','Pensionistas y perceptores haberes pasivos'
       UNION ALL SELECT 2010,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
       UNION ALL SELECT 2010,'B','02','Pensiones y haberes pasivos distintos subclave 01'
       UNION ALL SELECT 2010,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 2010,'E','','Consejeros y administradores'
       UNION ALL SELECT 2010,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
       UNION ALL SELECT 2010,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 2010,'F','02','Percepciones clave F distintas subclave 01'
       UNION ALL SELECT 2010,'G','','Actividades profesionales'
       UNION ALL SELECT 2010,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
       UNION ALL SELECT 2010,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
       UNION ALL SELECT 2010,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
       UNION ALL SELECT 2010,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
       UNION ALL SELECT 2010,'H','01','Actividad agrícola o ganadera distinta subclave 02'
       UNION ALL SELECT 2010,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 2010,'H','03','Actividad forestal'
       UNION ALL SELECT 2010,'H','04','Actividad empresarial en estimación objetiva'
       UNION ALL SELECT 2010,'I','','Otras actividades económicas'
       UNION ALL SELECT 2010,'I','01','Cesión derecho explotación derecho imagen'
       UNION ALL SELECT 2010,'I','02','Actividades económicas distintas subclave 01'
       UNION ALL SELECT 2010,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2010,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
       UNION ALL SELECT 2010,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2010,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 2010,'L','01','Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 2010,'L','02','Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 2010,'L','03','Ayudas a afectados por VIH'
       UNION ALL SELECT 2010,'L','04','Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 2010,'L','05','Indemnización por despido/cese'
       UNION ALL SELECT 2010,'L','06','Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 2010,'L','07','Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 2010,'L','08','Prestación y mejora familiar Seguridad Social'
       UNION ALL SELECT 2010,'L','09','Acogimiento personas'
       UNION ALL SELECT 2010,'L','10','Becas'
       UNION ALL SELECT 2010,'L','11','Premios literarios, artísticos o científicos'
       UNION ALL SELECT 2010,'L','12','Deportistas alto nivel'
       UNION ALL SELECT 2010,'L','13','Desempleo modalidad pago único'
       UNION ALL SELECT 2010,'L','14','Gratificaciones extraordinarias Misiones de Paz'
       UNION ALL SELECT 2010,'L','15','Trabajos realizados en el extranjero'
       UNION ALL SELECT 2010,'L','16','Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2010,'L','17','Ayudas a afectados hepatitis C'
       UNION ALL SELECT 2010,'L','18','Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2010,'L','19','Prestaciones atención personas en situación dependencia'
       UNION ALL SELECT 2010,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2010,'L','22','Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2010,'L','23','Incapacidad permanente total cualificada'
       UNION ALL SELECT 2010,'M','','Rendimientos régimen especial: "33ª Copa América"'
       UNION ALL SELECT 2011,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 2011,'B','','Pensionistas y perceptores haberes pasivos'
       UNION ALL SELECT 2011,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
       UNION ALL SELECT 2011,'B','02','Pensiones y haberes pasivos distintos subclave 01'
       UNION ALL SELECT 2011,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 2011,'E','','Consejeros y administradores'
       UNION ALL SELECT 2011,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
       UNION ALL SELECT 2011,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 2011,'F','02','Percepciones clave F distintas subclave 01'
       UNION ALL SELECT 2011,'G','','Actividades profesionales'
       UNION ALL SELECT 2011,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
       UNION ALL SELECT 2011,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
       UNION ALL SELECT 2011,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
       UNION ALL SELECT 2011,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
       UNION ALL SELECT 2011,'H','01','Actividad agrícola o ganadera distinta subclave 02'
       UNION ALL SELECT 2011,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 2011,'H','03','Actividad forestal'
       UNION ALL SELECT 2011,'H','04','Actividad empresarial en estimación objetiva'
       UNION ALL SELECT 2011,'I','','Otras actividades económicas'
       UNION ALL SELECT 2011,'I','01','Cesión derecho explotación derecho imagen'
       UNION ALL SELECT 2011,'I','02','Actividades económicas distintas subclave 01'
       UNION ALL SELECT 2011,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2011,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
       UNION ALL SELECT 2011,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2011,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 2011,'L','01','Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 2011,'L','02','Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 2011,'L','03','Ayudas a afectados por VIH'
       UNION ALL SELECT 2011,'L','04','Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 2011,'L','05','Indemnización por despido/cese'
       UNION ALL SELECT 2011,'L','06','Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 2011,'L','07','Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 2011,'L','08','Prestación y mejora familiar Seguridad Social'
       UNION ALL SELECT 2011,'L','09','Acogimiento personas'
       UNION ALL SELECT 2011,'L','10','Becas'
       UNION ALL SELECT 2011,'L','11','Premios literarios, artísticos o científicos'
       UNION ALL SELECT 2011,'L','12','Deportistas alto nivel'
       UNION ALL SELECT 2011,'L','13','Desempleo modalidad pago único'
       UNION ALL SELECT 2011,'L','14','Gratificaciones extraordinarias Misiones de Paz'
       UNION ALL SELECT 2011,'L','15','Trabajos realizados en el extranjero'
       UNION ALL SELECT 2011,'L','16','Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2011,'L','17','Ayudas a afectados hepatitis C'
       UNION ALL SELECT 2011,'L','18','Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2011,'L','19','Prestaciones atención personas en situación dependencia'
       UNION ALL SELECT 2011,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2011,'L','22','Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2011,'L','23','Incapacidad permanente total cualificada'
       UNION ALL SELECT 2011,'M','','Rendimientos régimen especial: "33ª Copa América"'
       UNION ALL SELECT 2012,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 2012,'B','','Pensionistas y perceptores haberes pasivos'
       UNION ALL SELECT 2012,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
       UNION ALL SELECT 2012,'B','02','Pensiones y haberes pasivos distintos subclave 01'
       UNION ALL SELECT 2012,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 2012,'E','','Consejeros y administradores'
       UNION ALL SELECT 2012,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
       UNION ALL SELECT 2012,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 2012,'F','02','Percepciones clave F distintas subclave 01'
       UNION ALL SELECT 2012,'G','','Actividades profesionales'
       UNION ALL SELECT 2012,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
       UNION ALL SELECT 2012,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
       UNION ALL SELECT 2012,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
       UNION ALL SELECT 2012,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
       UNION ALL SELECT 2012,'H','01','Actividad agrícola o ganadera distinta subclave 02'
       UNION ALL SELECT 2012,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 2012,'H','03','Actividad forestal'
       UNION ALL SELECT 2012,'H','04','Actividad empresarial en estimación objetiva'
       UNION ALL SELECT 2012,'I','','Otras actividades económicas'
       UNION ALL SELECT 2012,'I','01','Cesión derecho explotación derecho imagen'
       UNION ALL SELECT 2012,'I','02','Actividades económicas distintas subclave 01'
       UNION ALL SELECT 2012,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2012,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
       UNION ALL SELECT 2012,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2012,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 2012,'L','01','Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 2012,'L','02','Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 2012,'L','03','Ayudas a afectados por VIH'
       UNION ALL SELECT 2012,'L','04','Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 2012,'L','05','Indemnización por despido/cese'
       UNION ALL SELECT 2012,'L','06','Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 2012,'L','07','Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 2012,'L','08','Prestación y mejora familiar Seguridad Social'
       UNION ALL SELECT 2012,'L','09','Acogimiento personas'
       UNION ALL SELECT 2012,'L','10','Becas'
       UNION ALL SELECT 2012,'L','11','Premios literarios, artísticos o científicos'
       UNION ALL SELECT 2012,'L','12','Deportistas alto nivel'
       UNION ALL SELECT 2012,'L','13','Desempleo modalidad pago único'
       UNION ALL SELECT 2012,'L','14','Gratificaciones extraordinarias Misiones de Paz'
       UNION ALL SELECT 2012,'L','15','Trabajos realizados en el extranjero'
       UNION ALL SELECT 2012,'L','16','Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2012,'L','17','Ayudas a afectados hepatitis C'
       UNION ALL SELECT 2012,'L','18','Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2012,'L','19','Prestaciones atención personas en situación dependencia'
       UNION ALL SELECT 2012,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2012,'L','22','Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2012,'L','23','Incapacidad permanente total cualificada'
       UNION ALL SELECT 2012,'M','','Rendimientos régimen especial: "33ª Copa América"'
       UNION ALL SELECT 2013,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 2013,'B','','Pensionistas y perceptores haberes pasivos'
       UNION ALL SELECT 2013,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
       UNION ALL SELECT 2013,'B','02','Pensiones y haberes pasivos distintos subclave 01'
       UNION ALL SELECT 2013,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 2013,'E','','Consejeros y administradores'
       UNION ALL SELECT 2013,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
       UNION ALL SELECT 2013,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 2013,'F','02','Percepciones clave F distintas subclave 01'
       UNION ALL SELECT 2013,'G','','Actividades profesionales'
       UNION ALL SELECT 2013,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
       UNION ALL SELECT 2013,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
       UNION ALL SELECT 2013,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
       UNION ALL SELECT 2013,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
       UNION ALL SELECT 2013,'H','01','Actividad agrícola o ganadera distinta subclave 02'
       UNION ALL SELECT 2013,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 2013,'H','03','Actividad forestal'
       UNION ALL SELECT 2013,'H','04','Actividad empresarial en estimación objetiva'
       UNION ALL SELECT 2013,'I','','Otras actividades económicas'
       UNION ALL SELECT 2013,'I','01','Cesión derecho explotación derecho imagen'
       UNION ALL SELECT 2013,'I','02','Actividades económicas distintas subclave 01'
       UNION ALL SELECT 2013,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2013,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
       UNION ALL SELECT 2013,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2013,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 2013,'L','01','Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 2013,'L','02','Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 2013,'L','03','Ayudas a afectados por VIH'
       UNION ALL SELECT 2013,'L','04','Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 2013,'L','05','Indemnización por despido/cese'
       UNION ALL SELECT 2013,'L','06','Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 2013,'L','07','Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 2013,'L','08','Prestación y mejora familiar Seguridad Social'
       UNION ALL SELECT 2013,'L','09','Acogimiento personas'
       UNION ALL SELECT 2013,'L','10','Becas'
       UNION ALL SELECT 2013,'L','11','Premios literarios, artísticos o científicos'
       UNION ALL SELECT 2013,'L','12','Deportistas alto nivel'
       UNION ALL SELECT 2013,'L','13','Desempleo modalidad pago único'
       UNION ALL SELECT 2013,'L','14','Gratificaciones extraordinarias Misiones de Paz'
       UNION ALL SELECT 2013,'L','15','Trabajos realizados en el extranjero'
       UNION ALL SELECT 2013,'L','16','Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2013,'L','17','Ayudas a afectados hepatitis C'
       UNION ALL SELECT 2013,'L','18','Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2013,'L','19','Prestaciones atención personas en situación dependencia'
       UNION ALL SELECT 2013,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2013,'L','22','Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2013,'L','23','Incapacidad permanente total cualificada'
       UNION ALL SELECT 2013,'M','','Rendimientos régimen especial: "33ª Copa América"'
       UNION ALL SELECT 2014,'A','','Empleados por cuenta ajena'
       UNION ALL SELECT 2014,'B','','Haberes pasivos y otras prestaciones'
       UNION ALL SELECT 2014,'B','01','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación ordinaria'
       UNION ALL SELECT 2014,'B','02','Percepciones distintas de las incluidas en el resto de subclaves de la clave B'
       UNION ALL SELECT 2014,'B','04','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Incapacidad total mayores de 55 años'
       UNION ALL SELECT 2014,'B','05','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Incapacidad temporal'
       UNION ALL SELECT 2014,'B','06','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Incapacidad total menores de 55 años'
       UNION ALL SELECT 2014,'B','07','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación parcial'
       UNION ALL SELECT 2014,'B','08','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación anticipada'
       UNION ALL SELECT 2014,'B','09','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Pensión de viudedad'
       UNION ALL SELECT 2014,'B','20','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Baja voluntaria'
       UNION ALL SELECT 2014,'B','21','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Jubilación'
       UNION ALL SELECT 2014,'B','22','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Incapacidad'
       UNION ALL SELECT 2014,'B','23','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Fallecimiento'
       UNION ALL SELECT 2014,'B','24','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Dependencia'
       UNION ALL SELECT 2014,'B','25','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Desempleo de larga duración'
       UNION ALL SELECT 2014,'B','26','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Enfermedad grave'
       UNION ALL SELECT 2014,'C','','Prestaciones o subsidios desempleo'
       UNION ALL SELECT 2014,'E','','Consejeros y administradores'
       UNION ALL SELECT 2014,'E','01','Consejeros/Administradores en régimen Seguridad Social'
       UNION ALL SELECT 2014,'E','02','Percepciones distintas subclave 01'
       UNION ALL SELECT 2014,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
       UNION ALL SELECT 2014,'F','01','Premios literarios,artísticos,científicos no exentos'
       UNION ALL SELECT 2014,'F','02','Percepciones clave F distintas subclave 01'
       UNION ALL SELECT 2014,'G','','Actividades profesionales'
       UNION ALL SELECT 2014,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
       UNION ALL SELECT 2014,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
       UNION ALL SELECT 2014,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
       UNION ALL SELECT 2014,'G','04','Percepciones D.A. sexta D.F. 47/2014 Reglam.IRPF'
       UNION ALL SELECT 2014,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
       UNION ALL SELECT 2014,'H','01','Actividad agrícola o ganadera distinta subclave 02'
       UNION ALL SELECT 2014,'H','02','Actividad ganadera engorde porcino y avicultura'
       UNION ALL SELECT 2014,'H','03','Actividad forestal'
       UNION ALL SELECT 2014,'H','04','Actividad empresarial en estimación objetiva'
       UNION ALL SELECT 2014,'I','','Otras actividades económicas'
       UNION ALL SELECT 2014,'I','01','Cesión derecho explotación derecho imagen'
       UNION ALL SELECT 2014,'I','02','Actividades económicas distintas subclave 01'
       UNION ALL SELECT 2014,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
       UNION ALL SELECT 2014,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
       UNION ALL SELECT 2014,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
       UNION ALL SELECT 2014,'L','','Rentas exentas y dietas exceptuadas de gravamen'
       UNION ALL SELECT 2014,'L','01','Dietas y asignaciones para gastos viaje'
       UNION ALL SELECT 2014,'L','02','Prestaciones públicas actos terrorismo'
       UNION ALL SELECT 2014,'L','03','Ayudas a afectados por VIH'
       UNION ALL SELECT 2014,'L','04','Pensión por lesión/mutilación Guerra Civil'
       UNION ALL SELECT 2014,'L','05','Indemnización por despido/cese'
       UNION ALL SELECT 2014,'L','06','Incapacidad permanente absoluta/gran invalidez'
       UNION ALL SELECT 2014,'L','07','Inutilidad/incapacidad permanente c.pasivas'
       UNION ALL SELECT 2014,'L','08','Prestación y mejora familiar Seguridad Social'
       UNION ALL SELECT 2014,'L','09','Acogimiento personas'
       UNION ALL SELECT 2014,'L','10','Becas'
       UNION ALL SELECT 2014,'L','11','Premios literarios, artísticos o científicos'
       UNION ALL SELECT 2014,'L','12','Deportistas alto nivel'
       UNION ALL SELECT 2014,'L','13','Desempleo modalidad pago único'
       UNION ALL SELECT 2014,'L','14','Gratificaciones extraordinarias Misiones de Paz'
       UNION ALL SELECT 2014,'L','15','Trabajos realizados en el extranjero'
       UNION ALL SELECT 2014,'L','16','Prestaciones por entierro o sepelio'
       UNION ALL SELECT 2014,'L','17','Ayudas a afectados hepatitis C'
       UNION ALL SELECT 2014,'L','18','Rendimientos trabajo personas con discapacidad'
       UNION ALL SELECT 2014,'L','19','Prestaciones atención personas en situación dependencia'
       UNION ALL SELECT 2014,'L','21','Otras rentas exentas'
       UNION ALL SELECT 2014,'L','22','Pensiones no incluidas en subclave 07'
       UNION ALL SELECT 2014,'L','23','Incapacidad permanente total cualificada'
       UNION ALL SELECT 2014,'M','','Rendimientos régimen especial: "33ª Copa América"'
	   UNION ALL SELECT 2015,'A','','Empleados por cuenta ajena'
	   UNION ALL SELECT 2015,'A','01','Empleados por cuenta ajena'
	   UNION ALL SELECT 2015,'A','02','Percepciones en concepto de incapacidad laboral abonadas directamente por la o el empleador a la o al trabajador'
	   UNION ALL SELECT 2015,'B','','Haberes pasivos y otras prestaciones'
	   UNION ALL SELECT 2015,'B','01','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación ordinaria'
	   UNION ALL SELECT 2015,'B','02','Percepciones distintas de las incluidas en el resto de subclaves de la clave B'
	   UNION ALL SELECT 2015,'B','04','Percepciones de la clave E distintas de las que deban relacionarse bajo la subclave 01'
	   UNION ALL SELECT 2015,'B','10','Incapacidad total de mayores de 55 años'
	   UNION ALL SELECT 2015,'B','11','Incapacidad total de menores de 55 años'
	   UNION ALL SELECT 2015,'B','12','Jubilación parcial'
	   UNION ALL SELECT 2015,'B','13','Jubilación anticipada'
	   UNION ALL SELECT 2015,'B','14','Pensión de viudedad'
	   UNION ALL SELECT 2015,'B','20','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Baja voluntaria'
	   UNION ALL SELECT 2015,'B','21','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Jubilación'
	   UNION ALL SELECT 2015,'B','22','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Incapacidad'
	   UNION ALL SELECT 2015,'B','23','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Fallecimiento'
	   UNION ALL SELECT 2015,'B','24','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Dependencia'
	   UNION ALL SELECT 2015,'B','25','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Desempleo de larga duración'
	   UNION ALL SELECT 2015,'B','26','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Enfermedad grave'
	   UNION ALL SELECT 2015,'C','','Prestaciones o subsidios desempleo'
	   UNION ALL SELECT 2015,'E','','Consejeros y administradores'
	   UNION ALL SELECT 2015,'E','01','Consejeros/Administradores en régimen Seguridad Social'
	   UNION ALL SELECT 2015,'E','04','Percepciones de la clave E distintas de las que deban relacionarse bajo la subclave 01'
	   UNION ALL SELECT 2015,'F','','Cursos, conferencias, seminarios, elab.obras liter., artíst.cientif.'
	   UNION ALL SELECT 2015,'F','01','Premios literarios, artísticos, científicos no exentos'
	   UNION ALL SELECT 2015,'F','02','Percepciones clave F distintas subclave 01'
	   UNION ALL SELECT 2015,'G','','Actividades profesionales'
	   UNION ALL SELECT 2015,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
	   UNION ALL SELECT 2015,'G','02','Recaud.municip., mediadores seguros, deleg.comerciales Loterías'
	   UNION ALL SELECT 2015,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
	   UNION ALL SELECT 2015,'G','04','Percepciones D.A. sexta D.F. 47/2014 Reglam.IRPF'
	   UNION ALL SELECT 2015,'H','','Actividades agrícolas, ganaderas, forestales, empresariales est.obj'
	   UNION ALL SELECT 2015,'H','01','Actividad agrícola o ganadera distinta subclave 02'
	   UNION ALL SELECT 2015,'H','02','Actividad ganadera engorde porcino y avicultura'
	   UNION ALL SELECT 2015,'H','03','Actividad forestal'
	   UNION ALL SELECT 2015,'H','04','Actividad empresarial en estimación objetiva'
	   UNION ALL SELECT 2015,'I','','Otras actividades económicas'
	   UNION ALL SELECT 2015,'I','01','Cesión derecho explotación derecho imagen'
	   UNION ALL SELECT 2015,'I','02','Actividades económicas distintas subclave 01'
	   UNION ALL SELECT 2015,'K','','Premios por particip.en juegos, concursos, rifas o comb.aleat.'
	   UNION ALL SELECT 2015,'K','01','Premios por particip.en juegos, concursos, rifas o comb.aleator.'
	   UNION ALL SELECT 2015,'K','03','Premios por la participación en concursos o combinaciones aleatorias con fines publicitarios'
	   UNION ALL SELECT 2015,'L','','Rentas exentas y dietas exceptuadas de gravamen'
	   UNION ALL SELECT 2015,'L','01','Dietas y asignaciones para gastos viaje'
	   UNION ALL SELECT 2015,'L','02','Prestaciones públicas actos terrorismo'
	   UNION ALL SELECT 2015,'L','03','Ayudas a afectados por VIH'
	   UNION ALL SELECT 2015,'L','04','Pensión por lesión/mutilación Guerra Civil'
	   UNION ALL SELECT 2015,'L','05','Indemnización por despido/cese'
	   UNION ALL SELECT 2015,'L','06','Incapacidad permanente absoluta/gran invalidez'
	   UNION ALL SELECT 2015,'L','07','Inutilidad/incapacidad permanente c.pasivas'
	   UNION ALL SELECT 2015,'L','08','Prestación y mejora familiar Seguridad Social'
	   UNION ALL SELECT 2015,'L','09','Acogimiento personas'
	   UNION ALL SELECT 2015,'L','10','Becas'
	   UNION ALL SELECT 2015,'L','11','Premios literarios, artísticos o científicos'
	   UNION ALL SELECT 2015,'L','12','Deportistas alto nivel'
	   UNION ALL SELECT 2015,'L','13','Desempleo modalidad pago único'
	   UNION ALL SELECT 2015,'L','14','Gratificaciones extraordinarias Misiones de Paz'
	   UNION ALL SELECT 2015,'L','15','Trabajos realizados en el extranjero'
	   UNION ALL SELECT 2015,'L','16','Prestaciones por entierro o sepelio'
	   UNION ALL SELECT 2015,'L','17','Ayudas a afectados hepatitis C'
	   UNION ALL SELECT 2015,'L','18','Rendimientos trabajo personas con discapacidad'
	   UNION ALL SELECT 2015,'L','19','Prestaciones atención personas en situación dependencia'
	   UNION ALL SELECT 2015,'L','22','Pensiones no incluidas en subclave 07'
	   UNION ALL SELECT 2015,'L','23','Incapacidad permanente total cualificada'
	   UNION ALL SELECT 2015,'L','25','Otras rentas exentas'
	   UNION ALL SELECT 2015,'L','40','Pensiones no incluidas en la subclave 07'
	   UNION ALL SELECT 2015,'L','41','Prestaciones por incapacidad permanente total percibidas por contribuyentes del IRPF de edad superior a 55 años'
	   UNION ALL SELECT 2015,'M','','Rendimientos régimen especial: "33ª Copa América"') claves   
    WHERE cod_subclave=''
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves AS tbn1_mi_claves
  USING query ON query.ejercicio=tbn1_mi_claves.ejercicio AND query.cod_clave=tbn1_mi_claves.cod_clave
  WHEN MATCHED AND ((tbn1_mi_claves.clave<>query.clave OR (tbn1_mi_claves.clave IS NULL AND query.clave IS NOT NULL) OR  (tbn1_mi_claves.clave IS NOT NULL AND query.clave IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave=query.clave,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (ejercicio,cod_clave,clave,fec_alta,fec_modificacion) VALUES (
      query.ejercicio,
      query.cod_clave,
      query.clave,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_subclaves' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_subclaves;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_subclaves(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclaves'
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
      c.id_clave AS id_clave,
      CAST(v.cod_subclave AS int) AS cod_subclave,
      v.descripcion AS subclave
    FROM (SELECT 1991 ejercicio,'A' cod_clave,'' cod_subclave,'Cuenta ajena' descripcion
          UNION ALL SELECT 1991,'B','','Actividades profesionales'
          UNION ALL SELECT 1991,'C','','Comisionistas'
          UNION ALL SELECT 1991,'D','','Pensiones'
          UNION ALL SELECT 1991,'E','','Trabajos de temporada'
          UNION ALL SELECT 1991,'F','','Consejeros'
          UNION ALL SELECT 1991,'G','','Residentes en el extranjero'
          UNION ALL SELECT 1991,'H','','Rendimientos irregulares'
          UNION ALL SELECT 1991,'I','','Percepciones exentas de retención'
          UNION ALL SELECT 1992,'A','','Cuenta ajena'
          UNION ALL SELECT 1992,'B','','Pensiones y haberes pasivos'
          UNION ALL SELECT 1992,'C','','Consejeros'
          UNION ALL SELECT 1992,'D','','Rendimientos irregulares'
          UNION ALL SELECT 1992,'E','','Percepciones exentas de retención'
          UNION ALL SELECT 1992,'F','','Retribuciones en especie'
          UNION ALL SELECT 1992,'G','','Actividades profesionales'
          UNION ALL SELECT 1992,'H','','Retribuciones en especie'
          UNION ALL SELECT 1992,'I','','Premios (en metálico)'
          UNION ALL SELECT 1992,'J','','Retribuciones en especie'
          UNION ALL SELECT 1992,'L','','Residentes en el extranjero'
          UNION ALL SELECT 1995,'A','','Cuenta ajena'
          UNION ALL SELECT 1995,'B','','Pensiones y haberes pasivos'
          UNION ALL SELECT 1995,'C','','Consejeros'
          UNION ALL SELECT 1995,'D','','Rendimientos irregulares'
          UNION ALL SELECT 1995,'E','','Percepciones exentas de retención'
          UNION ALL SELECT 1995,'F','','Retribuciones en especie'
          UNION ALL SELECT 1995,'G','','Actividades profesionales'
          UNION ALL SELECT 1995,'H','','Retribuciones en especie'
          UNION ALL SELECT 1995,'I','','Premios (en metálico)'
          UNION ALL SELECT 1995,'J','','Retribuciones en especie'
          UNION ALL SELECT 1995,'K','','Actividades agrícolasy ganaderas'
          UNION ALL SELECT 1995,'L','','Retribuciones en especie'
          UNION ALL SELECT 1995,'M','','Residentes en el extranjero'
          UNION ALL SELECT 1997,'A','','Cuenta ajena'
          UNION ALL SELECT 1997,'B','','Pensiones y haberes pasivos'
          UNION ALL SELECT 1997,'C','','Consejeros'
          UNION ALL SELECT 1997,'D','','Rendimientos irregulares'
          UNION ALL SELECT 1997,'E','','Percepciones exentas de retención'
          UNION ALL SELECT 1997,'F','','Retribuciones en especie'
          UNION ALL SELECT 1997,'G','','Actividades profesionales'
          UNION ALL SELECT 1997,'H','','Retribuciones en especie'
          UNION ALL SELECT 1997,'I','','Premios (en metálico)'
          UNION ALL SELECT 1997,'J','','Retribuciones en especie'
          UNION ALL SELECT 1997,'K','','Actividades agrícolasy ganaderas'
          UNION ALL SELECT 1997,'L','','Retribuciones en especie'
          UNION ALL SELECT 1997,'M','','Préstamos desempleo (pago único)'
          UNION ALL SELECT 1999,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 1999,'B','','Pensionistas y perceptores haberes pasivos'
          UNION ALL SELECT 1999,'B','01','Pensiones y haberes pasivos régimen Seg.Social/C.Pasivas'
          UNION ALL SELECT 1999,'B','02','Pensiones y haberes pasivos (no régimen Seg.Social/C.Pasivas)'
          UNION ALL SELECT 1999,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 1999,'D','','Capitalización desempleo'
          UNION ALL SELECT 1999,'E','','Consejeros y administradores'
          UNION ALL SELECT 1999,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cient.'
          UNION ALL SELECT 1999,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 1999,'F','02','Cursos,conferencias,seminarios'
          UNION ALL SELECT 1999,'G','','Actividad profesional'
          UNION ALL SELECT 1999,'G','01','Actividad profesionalsujeta al tipo del art.13.1 DF 3/99'
          UNION ALL SELECT 1999,'G','02','Act.profesional(rep.Tabacalera,recaud.municip.,agentes seguros'
          UNION ALL SELECT 1999,'H','','Actividades agrícolas, ganaderas y forestales'
          UNION ALL SELECT 1999,'H','01','Actividad agrícola o ganadera'
          UNION ALL SELECT 1999,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 1999,'H','03','Actividad forestal'
          UNION ALL SELECT 1999,'I','','Actividad económica. Rtos. comprendidos en art.3.2b)DF 3/99'
          UNION ALL SELECT 1999,'J','','Cesión derechos imagen'
          UNION ALL SELECT 1999,'K','','Premios por participar en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 1999,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 1999,'L','01','Rentas exentas. Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 1999,'L','02','Rentas exentas. Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 1999,'L','03','Rentas exentas. Ayudas afectados por VIH'
          UNION ALL SELECT 1999,'L','04','Rentas exentas. Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 1999,'L','05','Rentas exentas. Indemnización por despido/cese'
          UNION ALL SELECT 1999,'L','06','Rentas exentas. Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 1999,'L','07','Rentas exentas. Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 1999,'L','08','Rentas exentas. Prestaciones familiares S.S. por hijo a cargo'
          UNION ALL SELECT 1999,'L','09','Rentas exentas. Acogimiento personas'
          UNION ALL SELECT 1999,'L','10','Rentas exentas. Becaspúblicas para estudios'
          UNION ALL SELECT 1999,'L','11','Rentas exentas. Premios literarios, artísticos o científicos'
          UNION ALL SELECT 1999,'L','12','Rentas exentas. Deportistas alto nivel'
          UNION ALL SELECT 1999,'L','13','Rentas exentas. Desempleo modalidad pago único'
          UNION ALL SELECT 1999,'L','14','Rentas exentas. Gratificaciones extraordinarias Misiones Paz'
          UNION ALL SELECT 1999,'L','15','Rentas exentas. Trabajos realizados en el extranjero'
          UNION ALL SELECT 1999,'L','16','Rentas exentas'
          UNION ALL SELECT 1999,'L','17','Rentas exentas. Incapacidad permanente o total'
          UNION ALL SELECT 2003,'G','01','Actividad profesionalsujeta al tipo del art.108.1 DF 132/2002'
          UNION ALL SELECT 2003,'I','','Actividad económica. Rtos. comprendidos art.95.2b)DF 132/2002'
          UNION ALL SELECT 2003,'L','16','Rentas exentas. Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2003,'L','18','Otras rentas exentas'
          UNION ALL SELECT 2003,'L','19','Rentas exentas. Incapacidad permanente o total'
          UNION ALL SELECT 2003,'L','20','Rentas exentas. Pensión inutilidad/incapacidad permanente'
          UNION ALL SELECT 2003,'L','21','Rentas exentas. Prestación mejora protección familiar'
          UNION ALL SELECT 2004,'G','03','Actividad profesionalsujeta al tipo del art.108.5 DF 132/2002'
          UNION ALL SELECT 2004,'I','01','Actividad económica. Cesión derecho explotación imagen'
          UNION ALL SELECT 2004,'I','02','Actividad económica. Rendimientos distintos subclave 01'
          UNION ALL SELECT 2004,'L','08','Rentas exentas. Prestaciones y mejoras familiares Sesg.Social'
          UNION ALL SELECT 2004,'L','10','Rentas exentas. Becas'
          UNION ALL SELECT 2004,'L','19','Rentas exentas. Incapacidad permanente total'
          UNION ALL SELECT 2004,'L','20','Rentas exentas. Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2004,'M','','Rendimientos régimen especial "Copa América 2007"'
          UNION ALL SELECT 2007,'H','','Activ.agrícolas,ganaderas,forestales empresariales est.objeti'
          UNION ALL SELECT 2007,'H','04','Actividad empresarialen estimación objetiva'
          UNION ALL SELECT 2007,'K','01','Premios por participar en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2007,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2007,'L','17','Rentas exentas. Ayudas afectados hepatitis C'
          UNION ALL SELECT 2007,'L','18','Rentas exentas. Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2007,'L','19','Rentas exentas. Prestaciones atención personas dependientes'
          UNION ALL SELECT 2007,'L','20','Otras rentas exentas'
          UNION ALL SELECT 2007,'L','21','Rentas exentas. Incapacidad permanente total cualificada'
          UNION ALL SELECT 2007,'L','22','Rentas exentas. Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2008,'L','20',''
          UNION ALL SELECT 2008,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2008,'L','22','Rentas exentas. Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2008,'L','23','Rentas exentas. Incapacidad permanente total cualificada'
          UNION ALL SELECT 2008,'M','','Rendimientos régimen especial "33ª Copa América"'
          UNION ALL SELECT 2009,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2009,'B','','Pensionistas y perceptores haberes pasivos'
          UNION ALL SELECT 2009,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
          UNION ALL SELECT 2009,'B','02','Pensiones y haberes pasivos distintos subclave 01'
          UNION ALL SELECT 2009,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2009,'E','','Consejeros y administradores'
          UNION ALL SELECT 2009,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
          UNION ALL SELECT 2009,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 2009,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2009,'G','','Actividades profesionales'
          UNION ALL SELECT 2009,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2009,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
          UNION ALL SELECT 2009,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2009,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
          UNION ALL SELECT 2009,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2009,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2009,'H','03','Actividad forestal'
          UNION ALL SELECT 2009,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2009,'I','','Otras actividades económicas'
          UNION ALL SELECT 2009,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2009,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2009,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2009,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
          UNION ALL SELECT 2009,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2009,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2009,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2009,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2009,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2009,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2009,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2009,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2009,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2009,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2009,'L','09','Acogimiento personas'
          UNION ALL SELECT 2009,'L','10','Becas'
          UNION ALL SELECT 2009,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2009,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2009,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2009,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2009,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2009,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2009,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2009,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2009,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2009,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2009,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2009,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2010,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2010,'B','','Pensionistas y perceptores haberes pasivos'
          UNION ALL SELECT 2010,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
          UNION ALL SELECT 2010,'B','02','Pensiones y haberes pasivos distintos subclave 01'
          UNION ALL SELECT 2010,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2010,'E','','Consejeros y administradores'
          UNION ALL SELECT 2010,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
          UNION ALL SELECT 2010,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 2010,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2010,'G','','Actividades profesionales'
          UNION ALL SELECT 2010,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2010,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
          UNION ALL SELECT 2010,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2010,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
          UNION ALL SELECT 2010,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2010,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2010,'H','03','Actividad forestal'
          UNION ALL SELECT 2010,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2010,'I','','Otras actividades económicas'
          UNION ALL SELECT 2010,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2010,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2010,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2010,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
          UNION ALL SELECT 2010,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2010,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2010,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2010,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2010,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2010,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2010,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2010,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2010,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2010,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2010,'L','09','Acogimiento personas'
          UNION ALL SELECT 2010,'L','10','Becas'
          UNION ALL SELECT 2010,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2010,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2010,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2010,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2010,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2010,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2010,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2010,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2010,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2010,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2010,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2010,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2010,'M','','Rendimientos régimen especial: "33ª Copa América"'
          UNION ALL SELECT 2011,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2011,'B','','Pensionistas y perceptores haberes pasivos'
          UNION ALL SELECT 2011,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
          UNION ALL SELECT 2011,'B','02','Pensiones y haberes pasivos distintos subclave 01'
          UNION ALL SELECT 2011,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2011,'E','','Consejeros y administradores'
          UNION ALL SELECT 2011,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
          UNION ALL SELECT 2011,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 2011,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2011,'G','','Actividades profesionales'
          UNION ALL SELECT 2011,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2011,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
          UNION ALL SELECT 2011,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2011,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
          UNION ALL SELECT 2011,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2011,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2011,'H','03','Actividad forestal'
          UNION ALL SELECT 2011,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2011,'I','','Otras actividades económicas'
          UNION ALL SELECT 2011,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2011,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2011,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2011,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
          UNION ALL SELECT 2011,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2011,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2011,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2011,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2011,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2011,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2011,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2011,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2011,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2011,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2011,'L','09','Acogimiento personas'
          UNION ALL SELECT 2011,'L','10','Becas'
          UNION ALL SELECT 2011,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2011,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2011,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2011,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2011,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2011,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2011,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2011,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2011,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2011,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2011,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2011,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2011,'M','','Rendimientos régimen especial: "33ª Copa América"'
          UNION ALL SELECT 2012,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2012,'B','','Pensionistas y perceptores haberes pasivos'
          UNION ALL SELECT 2012,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
          UNION ALL SELECT 2012,'B','02','Pensiones y haberes pasivos distintos subclave 01'
          UNION ALL SELECT 2012,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2012,'E','','Consejeros y administradores'
          UNION ALL SELECT 2012,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
          UNION ALL SELECT 2012,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 2012,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2012,'G','','Actividades profesionales'
          UNION ALL SELECT 2012,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2012,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
          UNION ALL SELECT 2012,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2012,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
          UNION ALL SELECT 2012,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2012,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2012,'H','03','Actividad forestal'
          UNION ALL SELECT 2012,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2012,'I','','Otras actividades económicas'
          UNION ALL SELECT 2012,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2012,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2012,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2012,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
          UNION ALL SELECT 2012,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2012,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2012,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2012,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2012,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2012,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2012,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2012,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2012,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2012,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2012,'L','09','Acogimiento personas'
          UNION ALL SELECT 2012,'L','10','Becas'
          UNION ALL SELECT 2012,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2012,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2012,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2012,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2012,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2012,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2012,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2012,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2012,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2012,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2012,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2012,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2012,'M','','Rendimientos régimen especial: "33ª Copa América"'
          UNION ALL SELECT 2013,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2013,'B','','Pensionistas y perceptores haberes pasivos'
          UNION ALL SELECT 2013,'B','01','Pensiones y haberes pasivos régimen Seg.Soc/C.Pasivas'
          UNION ALL SELECT 2013,'B','02','Pensiones y haberes pasivos distintos subclave 01'
          UNION ALL SELECT 2013,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2013,'E','','Consejeros y administradores'
          UNION ALL SELECT 2013,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
          UNION ALL SELECT 2013,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 2013,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2013,'G','','Actividades profesionales'
          UNION ALL SELECT 2013,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2013,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
          UNION ALL SELECT 2013,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2013,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
          UNION ALL SELECT 2013,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2013,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2013,'H','03','Actividad forestal'
          UNION ALL SELECT 2013,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2013,'I','','Otras actividades económicas'
          UNION ALL SELECT 2013,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2013,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2013,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2013,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
          UNION ALL SELECT 2013,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2013,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2013,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2013,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2013,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2013,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2013,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2013,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2013,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2013,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2013,'L','09','Acogimiento personas'
          UNION ALL SELECT 2013,'L','10','Becas'
          UNION ALL SELECT 2013,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2013,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2013,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2013,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2013,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2013,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2013,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2013,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2013,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2013,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2013,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2013,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2013,'M','','Rendimientos régimen especial: "33ª Copa América"'
          UNION ALL SELECT 2014,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2014,'B','','Haberes pasivos y otras prestaciones'
          UNION ALL SELECT 2014,'B','01','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación ordinaria'
          UNION ALL SELECT 2014,'B','02','Percepciones distintas de las incluidas en el resto de subclaves de la clave B'
          UNION ALL SELECT 2014,'B','04','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Incapacidad total mayores de 55 años'
          UNION ALL SELECT 2014,'B','05','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Incapacidad temporal'
          UNION ALL SELECT 2014,'B','06','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Incapacidad total menores de 55 años'
          UNION ALL SELECT 2014,'B','07','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación parcial'
          UNION ALL SELECT 2014,'B','08','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación anticipada'
          UNION ALL SELECT 2014,'B','09','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Pensión de viudedad'
          UNION ALL SELECT 2014,'B','20','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Baja voluntaria'
          UNION ALL SELECT 2014,'B','21','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Jubilación'
          UNION ALL SELECT 2014,'B','22','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Incapacidad'
          UNION ALL SELECT 2014,'B','23','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Fallecimiento'
          UNION ALL SELECT 2014,'B','24','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Dependencia'
          UNION ALL SELECT 2014,'B','25','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Desempleo de larga duración'
          UNION ALL SELECT 2014,'B','26','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Enfermedad grave'
          UNION ALL SELECT 2014,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2014,'E','','Consejeros y administradores'
          UNION ALL SELECT 2014,'E','01','Consejeros/Administradores en régimen Seguridad Social'
          UNION ALL SELECT 2014,'E','02','Percepciones distintas subclave 01'
          UNION ALL SELECT 2014,'F','','Cursos,conferencias,seminarios,elab.obras liter.,artíst.cientif.'
          UNION ALL SELECT 2014,'F','01','Premios literarios,artísticos,científicos no exentos'
          UNION ALL SELECT 2014,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2014,'G','','Actividades profesionales'
          UNION ALL SELECT 2014,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2014,'G','02','Recaud.municip.,mediadores seguros,deleg.comerciales Loterías'
          UNION ALL SELECT 2014,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2014,'G','04','Percepciones D.A. sexta D.F. 47/2014 Reglam.IRPF'
          UNION ALL SELECT 2014,'H','','Actividades agrícolas,ganaderas,forestales,empresariales est.obj'
          UNION ALL SELECT 2014,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2014,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2014,'H','03','Actividad forestal'
          UNION ALL SELECT 2014,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2014,'I','','Otras actividades económicas'
          UNION ALL SELECT 2014,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2014,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2014,'K','','Premios por particip.en juegos,concursos,rifas o comb.aleat.'
          UNION ALL SELECT 2014,'K','01','Premios por particip.en juegos,concursos,rifas o comb.aleator.'
          UNION ALL SELECT 2014,'K','02','Ganancia patrimonial vecinos aprovechamiento forestal montes'
          UNION ALL SELECT 2014,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2014,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2014,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2014,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2014,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2014,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2014,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2014,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2014,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2014,'L','09','Acogimiento personas'
          UNION ALL SELECT 2014,'L','10','Becas'
          UNION ALL SELECT 2014,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2014,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2014,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2014,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2014,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2014,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2014,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2014,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2014,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2014,'L','21','Otras rentas exentas'
          UNION ALL SELECT 2014,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2014,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2014,'M','','Rendimientos régimen especial: "33ª Copa América"'
          UNION ALL SELECT 2015,'A','','Empleados por cuenta ajena'
          UNION ALL SELECT 2015,'A','01','Empleados por cuenta ajena'
          UNION ALL SELECT 2015,'A','02','Percepciones en concepto de incapacidad laboral abonadas directamente por la o el empleador a la o al trabajador'
          UNION ALL SELECT 2015,'B','','Haberes pasivos y otras prestaciones'
          UNION ALL SELECT 2015,'B','01','Prestaciones percibidas del INSS, de entidades que la sustituyan y de clase pasivas: Jubilación ordinaria'
          UNION ALL SELECT 2015,'B','02','Percepciones distintas de las incluidas en el resto de subclaves de la clave B'
          UNION ALL SELECT 2015,'B','04','Percepciones de la clave E distintas de las que deban relacionarse bajo la subclave 01'
          UNION ALL SELECT 2015,'B','10','Incapacidad total de mayores de 55 años'
          UNION ALL SELECT 2015,'B','11','Incapacidad total de menores de 55 años'
          UNION ALL SELECT 2015,'B','12','Jubilación parcial'
          UNION ALL SELECT 2015,'B','13','Jubilación anticipada'
          UNION ALL SELECT 2015,'B','14','Pensión de viudedad'
          UNION ALL SELECT 2015,'B','20','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Baja voluntaria'
          UNION ALL SELECT 2015,'B','21','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Jubilación'
          UNION ALL SELECT 2015,'B','22','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Incapacidad'
          UNION ALL SELECT 2015,'B','23','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Fallecimiento'
          UNION ALL SELECT 2015,'B','24','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Dependencia'
          UNION ALL SELECT 2015,'B','25','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Desempleo de larga duración'
          UNION ALL SELECT 2015,'B','26','Prestaciones percibidas de EPSV, PP y demás sistemas de previsión social: Enfermedad grave'
          UNION ALL SELECT 2015,'C','','Prestaciones o subsidios desempleo'
          UNION ALL SELECT 2015,'E','','Consejeros y administradores'
          UNION ALL SELECT 2015,'E','01','Consejeros/Administradores en régimen Seguridad Social'
          UNION ALL SELECT 2015,'E','04','Percepciones de la clave E distintas de las que deban relacionarse bajo la subclave 01'
          UNION ALL SELECT 2015,'F','','Cursos, conferencias, seminarios, elab.obras liter., artíst.cientif.'
          UNION ALL SELECT 2015,'F','01','Premios literarios, artísticos, científicos no exentos'
          UNION ALL SELECT 2015,'F','02','Percepciones clave F distintas subclave 01'
          UNION ALL SELECT 2015,'G','','Actividades profesionales'
          UNION ALL SELECT 2015,'G','01','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.general)'
          UNION ALL SELECT 2015,'G','02','Recaud.municip., mediadores seguros, deleg.comerciales Loterías'
          UNION ALL SELECT 2015,'G','03','Percepciones sujetas al tipo art.115.1 Reglam.IRPF(ret.reducida)'
          UNION ALL SELECT 2015,'G','04','Percepciones D.A. sexta D.F. 47/2014 Reglam.IRPF'
          UNION ALL SELECT 2015,'H','','Actividades agrícolas, ganaderas, forestales, empresariales est.obj'
          UNION ALL SELECT 2015,'H','01','Actividad agrícola o ganadera distinta subclave 02'
          UNION ALL SELECT 2015,'H','02','Actividad ganadera engorde porcino y avicultura'
          UNION ALL SELECT 2015,'H','03','Actividad forestal'
          UNION ALL SELECT 2015,'H','04','Actividad empresarial en estimación objetiva'
          UNION ALL SELECT 2015,'I','','Otras actividades económicas'
          UNION ALL SELECT 2015,'I','01','Cesión derecho explotación derecho imagen'
          UNION ALL SELECT 2015,'I','02','Actividades económicas distintas subclave 01'
          UNION ALL SELECT 2015,'K','','Premios por particip.en juegos, concursos, rifas o comb.aleat.'
          UNION ALL SELECT 2015,'K','01','Premios por particip.en juegos, concursos, rifas o comb.aleator.'
          UNION ALL SELECT 2015,'K','03','Premios por la participación en concursos o combinaciones aleatorias con fines publicitarios'
          UNION ALL SELECT 2015,'L','','Rentas exentas y dietas exceptuadas de gravamen'
          UNION ALL SELECT 2015,'L','01','Dietas y asignaciones para gastos viaje'
          UNION ALL SELECT 2015,'L','02','Prestaciones públicas actos terrorismo'
          UNION ALL SELECT 2015,'L','03','Ayudas a afectados por VIH'
          UNION ALL SELECT 2015,'L','04','Pensión por lesión/mutilación Guerra Civil'
          UNION ALL SELECT 2015,'L','05','Indemnización por despido/cese'
          UNION ALL SELECT 2015,'L','06','Incapacidad permanente absoluta/gran invalidez'
          UNION ALL SELECT 2015,'L','07','Inutilidad/incapacidad permanente c.pasivas'
          UNION ALL SELECT 2015,'L','08','Prestación y mejora familiar Seguridad Social'
          UNION ALL SELECT 2015,'L','09','Acogimiento personas'
          UNION ALL SELECT 2015,'L','10','Becas'
          UNION ALL SELECT 2015,'L','11','Premios literarios, artísticos o científicos'
          UNION ALL SELECT 2015,'L','12','Deportistas alto nivel'
          UNION ALL SELECT 2015,'L','13','Desempleo modalidad pago único'
          UNION ALL SELECT 2015,'L','14','Gratificaciones extraordinarias Misiones de Paz'
          UNION ALL SELECT 2015,'L','15','Trabajos realizados en el extranjero'
          UNION ALL SELECT 2015,'L','16','Prestaciones por entierro o sepelio'
          UNION ALL SELECT 2015,'L','17','Ayudas a afectados hepatitis C'
          UNION ALL SELECT 2015,'L','18','Rendimientos trabajo personas con discapacidad'
          UNION ALL SELECT 2015,'L','19','Prestaciones atención personas en situación dependencia'
          UNION ALL SELECT 2015,'L','22','Pensiones no incluidas en subclave 07'
          UNION ALL SELECT 2015,'L','23','Incapacidad permanente total cualificada'
          UNION ALL SELECT 2015,'L','25','Otras rentas exentas'
          UNION ALL SELECT 2015,'L','40','Pensiones no incluidas en la subclave 07'
          UNION ALL SELECT 2015,'L','41','Prestaciones por incapacidad permanente total percibidas por contribuyentes del IRPF de edad superior a 55 años'
          UNION ALL SELECT 2015,'M','','Rendimientos régimen especial: "33ª Copa América"') v
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves c ON (c.ejercicio=CAST(v.ejercicio AS char) AND c.cod_clave=v.cod_clave)
    WHERE CAST(v.cod_subclave AS int)<>''
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_subclaves AS tbn1_mi_subclaves
  USING query ON query.id_clave=tbn1_mi_subclaves.id_clave AND query.cod_subclave=tbn1_mi_subclaves.cod_subclave
  WHEN MATCHED AND ((tbn1_mi_subclaves.subclave<>query.subclave OR (tbn1_mi_subclaves.subclave IS NULL AND query.subclave IS NOT NULL) OR  (tbn1_mi_subclaves.subclave IS NOT NULL AND query.subclave IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      subclave=query.subclave,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_clave,cod_subclave,subclave,fec_alta,fec_modificacion) VALUES (
      query.id_clave,
      query.cod_subclave,
      query.subclave,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_origen' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_origen;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_origen(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen'
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
      cod_origen,
      descripcion_origen AS origen
    FROM
      (SELECT '' cod_origen,'Carga' descripcion_origen
       UNION ALL SELECT 'PD','Liquid. sin vb difer.190-10T'
       UNION ALL SELECT 'PX','Liquid. sin vb difer.190 externo-190'
       UNION ALL SELECT 'LD','Liquid. Dif. 190-10T'
       UNION ALL SELECT 'LX','Liquid.difer.190 externo-190'
       UNION ALL SELECT 'IN','Inspección') origen
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen AS tbn1_mi_origen
  USING query ON query.cod_origen=tbn1_mi_origen.cod_origen
  WHEN MATCHED AND ((tbn1_mi_origen.origen<>query.origen OR (tbn1_mi_origen.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_origen.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_origen,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_origen,
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

