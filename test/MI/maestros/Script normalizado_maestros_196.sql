PRINT 'normalizado_maestros_196.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta(
  id_clave_alta int IDENTITY(1,1),
  cod_clave_alta varchar(1),
  clave_alta varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_clave_alta UNIQUE (cod_clave_alta),
  CONSTRAINT PK_tbn1_mi_clave_alta PRIMARY KEY CLUSTERED (id_clave_alta)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='id_clave_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD id_clave_alta int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='cod_clave_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD cod_clave_alta varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='clave_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD clave_alta varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_ALTA_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='id_clave_alta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN id_clave_alta int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='cod_clave_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN cod_clave_alta varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='clave_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN clave_alta varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_alta' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta ADD CONSTRAINT PK_tbn1_mi_clave_alta PRIMARY KEY CLUSTERED (id_clave_alta)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_alta,'Indefinido' AS clave_alta
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta AS tbn1_mi_clave_alta
USING query ON query.es_indefinido=tbn1_mi_clave_alta.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_alta.cod_clave_alta<>query.cod_clave_alta OR (tbn1_mi_clave_alta.cod_clave_alta IS NULL AND query.cod_clave_alta IS NOT NULL) OR  (tbn1_mi_clave_alta.cod_clave_alta IS NOT NULL AND query.cod_clave_alta IS NULL)
                  OR tbn1_mi_clave_alta.clave_alta<>query.clave_alta OR (tbn1_mi_clave_alta.clave_alta IS NULL AND query.clave_alta IS NOT NULL) OR  (tbn1_mi_clave_alta.clave_alta IS NOT NULL AND query.clave_alta IS NULL))) THEN
  UPDATE SET
    cod_clave_alta=query.cod_clave_alta,
    clave_alta=query.clave_alta
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_alta,clave_alta) VALUES (
    query.es_indefinido,
    query.cod_clave_alta,
    query.clave_alta);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor(
  id_clave_perceptor int IDENTITY(1,1),
  cod_clave_perceptor varchar(1),
  clave_perceptor varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_clave_perceptor UNIQUE (cod_clave_perceptor),
  CONSTRAINT PK_tbn1_mi_clave_perceptor PRIMARY KEY CLUSTERED (id_clave_perceptor)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='id_clave_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD id_clave_perceptor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='cod_clave_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD cod_clave_perceptor varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='clave_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD clave_perceptor varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_PERCEPTOR_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='id_clave_perceptor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN id_clave_perceptor int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='cod_clave_perceptor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN cod_clave_perceptor varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='clave_perceptor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN clave_perceptor varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_perceptor' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_perceptor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor ADD CONSTRAINT PK_tbn1_mi_clave_perceptor PRIMARY KEY CLUSTERED (id_clave_perceptor)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_clave_perceptor,'Indefinido' AS clave_perceptor
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor AS tbn1_mi_clave_perceptor
USING query ON query.es_indefinido=tbn1_mi_clave_perceptor.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_perceptor.cod_clave_perceptor<>query.cod_clave_perceptor OR (tbn1_mi_clave_perceptor.cod_clave_perceptor IS NULL AND query.cod_clave_perceptor IS NOT NULL) OR  (tbn1_mi_clave_perceptor.cod_clave_perceptor IS NOT NULL AND query.cod_clave_perceptor IS NULL)
                  OR tbn1_mi_clave_perceptor.clave_perceptor<>query.clave_perceptor OR (tbn1_mi_clave_perceptor.clave_perceptor IS NULL AND query.clave_perceptor IS NOT NULL) OR  (tbn1_mi_clave_perceptor.clave_perceptor IS NOT NULL AND query.clave_perceptor IS NULL))) THEN
  UPDATE SET
    cod_clave_perceptor=query.cod_clave_perceptor,
    clave_perceptor=query.clave_perceptor
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_perceptor,clave_perceptor) VALUES (
    query.es_indefinido,
    query.cod_clave_perceptor,
    query.clave_perceptor);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta(
  id_tipo_cuenta int IDENTITY(1,1),
  cod_tipo_cuenta varchar(1),
  tipo_cuenta varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_tipo_cuenta UNIQUE (cod_tipo_cuenta),
  CONSTRAINT PK_tbn1_mi_tipo_cuenta PRIMARY KEY CLUSTERED (id_tipo_cuenta)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='id_tipo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD id_tipo_cuenta int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='cod_tipo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD cod_tipo_cuenta varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='tipo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD tipo_cuenta varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_CUENTA_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='id_tipo_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN id_tipo_cuenta int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='cod_tipo_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN cod_tipo_cuenta varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='tipo_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN tipo_cuenta varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_cuenta' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta ADD CONSTRAINT PK_tbn1_mi_tipo_cuenta PRIMARY KEY CLUSTERED (id_tipo_cuenta)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_cuenta,'Indefinido' AS tipo_cuenta
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta AS tbn1_mi_tipo_cuenta
USING query ON query.es_indefinido=tbn1_mi_tipo_cuenta.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_cuenta.cod_tipo_cuenta<>query.cod_tipo_cuenta OR (tbn1_mi_tipo_cuenta.cod_tipo_cuenta IS NULL AND query.cod_tipo_cuenta IS NOT NULL) OR  (tbn1_mi_tipo_cuenta.cod_tipo_cuenta IS NOT NULL AND query.cod_tipo_cuenta IS NULL)
                  OR tbn1_mi_tipo_cuenta.tipo_cuenta<>query.tipo_cuenta OR (tbn1_mi_tipo_cuenta.tipo_cuenta IS NULL AND query.tipo_cuenta IS NOT NULL) OR  (tbn1_mi_tipo_cuenta.tipo_cuenta IS NOT NULL AND query.tipo_cuenta IS NULL))) THEN
  UPDATE SET
    cod_tipo_cuenta=query.cod_tipo_cuenta,
    tipo_cuenta=query.tipo_cuenta
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_cuenta,tipo_cuenta) VALUES (
    query.es_indefinido,
    query.cod_tipo_cuenta,
    query.tipo_cuenta);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_alta' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_alta;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_alta(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_alta'
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
      CAST(cod_clave_alta AS varchar) AS cod_clave_alta,
      descripcion_clave_alta AS clave_alta
    FROM
      (SELECT 0 cod_clave_alta,'Antigua' descripcion_clave_alta
       UNION ALL SELECT 1,'Alta en ejercicio'
       UNION ALL SELECT 2,'Baja en ejercicio'
       UNION ALL SELECT 3,'Alta y baja en ejercicio') clave_alta
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_alta AS tbn1_mi_clave_alta
  USING query ON query.cod_clave_alta=tbn1_mi_clave_alta.cod_clave_alta
  WHEN MATCHED AND ((tbn1_mi_clave_alta.clave_alta<>query.clave_alta OR (tbn1_mi_clave_alta.clave_alta IS NULL AND query.clave_alta IS NOT NULL) OR  (tbn1_mi_clave_alta.clave_alta IS NOT NULL AND query.clave_alta IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_alta=query.clave_alta,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_alta,clave_alta,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_alta,
      query.clave_alta,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_perceptor' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_perceptor;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_perceptor(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_perceptor'
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
      cod_clave_perceptor,
      descripcion_clave_perceptor AS clave_perceptor
    FROM
      (SELECT 'N' cod_clave_perceptor,'NIF no comunicado' descripcion_clave_perceptor
       UNION ALL SELECT 'T','Titular'
       UNION ALL SELECT 'U','Usufructuario'
       UNION ALL SELECT 'O','Nudopropietario'
       UNION ALL SELECT 'B','Otro beneficiario'
	   UNION ALL SELECT 'A','Autorizado') clave_perceptor
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_perceptor AS tbn1_mi_clave_perceptor
  USING query ON query.cod_clave_perceptor=tbn1_mi_clave_perceptor.cod_clave_perceptor
  WHEN MATCHED AND ((tbn1_mi_clave_perceptor.clave_perceptor<>query.clave_perceptor OR (tbn1_mi_clave_perceptor.clave_perceptor IS NULL AND query.clave_perceptor IS NOT NULL) OR  (tbn1_mi_clave_perceptor.clave_perceptor IS NOT NULL AND query.clave_perceptor IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_perceptor=query.clave_perceptor,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_perceptor,clave_perceptor,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_perceptor,
      query.clave_perceptor,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_cuenta' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_cuenta;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_cuenta(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_cuenta'
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
      cod_tipo_cuenta,
      descripcion_tipo_cuenta AS tipo_cuenta
    FROM
      (SELECT 1 cod_tipo_cuenta,'Corriente' descripcion_tipo_cuenta
       UNION ALL SELECT 2,'Ahorro'
       UNION ALL SELECT 3,'Imposición a plazo'
       UNION ALL SELECT 4,'Financiera'
       UNION ALL SELECT 5,'Crédito'
       UNION ALL SELECT 6,'Contrato financiero atípico') tipo_cuenta
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_cuenta AS tbn1_mi_tipo_cuenta
  USING query ON query.cod_tipo_cuenta=tbn1_mi_tipo_cuenta.cod_tipo_cuenta
  WHEN MATCHED AND ((tbn1_mi_tipo_cuenta.tipo_cuenta<>query.tipo_cuenta OR (tbn1_mi_tipo_cuenta.tipo_cuenta IS NULL AND query.tipo_cuenta IS NOT NULL) OR  (tbn1_mi_tipo_cuenta.tipo_cuenta IS NOT NULL AND query.tipo_cuenta IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_cuenta=query.tipo_cuenta,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_cuenta,tipo_cuenta,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_cuenta,
      query.tipo_cuenta,
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

