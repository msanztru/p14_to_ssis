PRINT 'normalizado_maestros_182.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion(
  id_clave_donacion int IDENTITY(1,1),
  cod_clave_donacion varchar(1),
  clave_donacion varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL DEFAULT 'MAESTRO',
  CONSTRAINT uk_mi_clave_donacion UNIQUE (cod_clave_donacion),
  CONSTRAINT PK_tbn1_mi_clave_donacion PRIMARY KEY CLUSTERED (id_clave_donacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='id_clave_donacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD id_clave_donacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='cod_clave_donacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD cod_clave_donacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='clave_donacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD clave_donacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_DONACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_DONACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO


IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='id_clave_donacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN id_clave_donacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='cod_clave_donacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN cod_clave_donacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='clave_donacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN clave_donacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_donacion' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_donacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion ADD CONSTRAINT PK_tbn1_mi_clave_donacion PRIMARY KEY CLUSTERED (id_clave_donacion)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_donacion,'Indefinido' AS clave_donacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion AS tbn1_mi_clave_donacion
USING query ON query.es_indefinido=tbn1_mi_clave_donacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_donacion.cod_clave_donacion<>query.cod_clave_donacion OR (tbn1_mi_clave_donacion.cod_clave_donacion IS NULL AND query.cod_clave_donacion IS NOT NULL) OR  (tbn1_mi_clave_donacion.cod_clave_donacion IS NOT NULL AND query.cod_clave_donacion IS NULL)
                  OR tbn1_mi_clave_donacion.clave_donacion<>query.clave_donacion OR (tbn1_mi_clave_donacion.clave_donacion IS NULL AND query.clave_donacion IS NOT NULL) OR  (tbn1_mi_clave_donacion.clave_donacion IS NOT NULL AND query.clave_donacion IS NULL))) THEN
  UPDATE SET
    cod_clave_donacion=query.cod_clave_donacion,
    clave_donacion=query.clave_donacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_donacion,clave_donacion) VALUES (
    query.es_indefinido,
    query.cod_clave_donacion,
    query.clave_donacion);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_donacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_donacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_donacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_donacion'
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
      cod_clave_donacion,
      descripcion_clave_donacion AS clave_donacion,
      'MAESTRO' AS origen
    FROM
      (SELECT 'A' cod_clave_donacion,'No incluido' descripcion_clave_donacion
       UNION ALL SELECT 'B','Incluido'
       UNION ALL SELECT 'C','Aportación patrimonio'
       UNION ALL SELECT 'D','Disposición patrimonio'
       UNION ALL SELECT 'E','Incluido'
       UNION ALL SELECT 'F','Aportación cuota sindical'
       UNION ALL SELECT 'G','Aportación cargo político'
       UNION ALL SELECT 'H','Cuota afiliación') clave_donacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_donacion AS tbn1_mi_clave_donacion
  USING query ON query.cod_clave_donacion=tbn1_mi_clave_donacion.cod_clave_donacion
  WHEN MATCHED AND ((tbn1_mi_clave_donacion.clave_donacion<>query.clave_donacion OR (tbn1_mi_clave_donacion.clave_donacion IS NULL AND query.clave_donacion IS NOT NULL) OR  (tbn1_mi_clave_donacion.clave_donacion IS NOT NULL AND query.clave_donacion IS NULL)
                    OR tbn1_mi_clave_donacion.origen<>query.origen OR (tbn1_mi_clave_donacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_donacion.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_donacion=query.clave_donacion,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_donacion,clave_donacion,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_donacion,
      query.clave_donacion,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien(
  id_tipo_bien int IDENTITY(1,1),
  cod_tipo_bien varchar(1),
  tipo_bien varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_tipo_bien UNIQUE (cod_tipo_bien),
  CONSTRAINT PK_tbn1_mi_tipo_bien PRIMARY KEY CLUSTERED (id_tipo_bien)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='id_tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD id_tipo_bien int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='cod_tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD cod_tipo_bien varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD tipo_bien varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_BIEN_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='id_tipo_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN id_tipo_bien int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='cod_tipo_bien' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN cod_tipo_bien varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='tipo_bien' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN tipo_bien varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_bien' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien ADD CONSTRAINT PK_tbn1_mi_tipo_bien PRIMARY KEY CLUSTERED (id_tipo_bien)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_bien,'Indefinido' AS tipo_bien
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien AS tbn1_mi_tipo_bien
USING query ON query.es_indefinido=tbn1_mi_tipo_bien.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_bien.cod_tipo_bien<>query.cod_tipo_bien OR (tbn1_mi_tipo_bien.cod_tipo_bien IS NULL AND query.cod_tipo_bien IS NOT NULL) OR  (tbn1_mi_tipo_bien.cod_tipo_bien IS NOT NULL AND query.cod_tipo_bien IS NULL)
                  OR tbn1_mi_tipo_bien.tipo_bien<>query.tipo_bien OR (tbn1_mi_tipo_bien.tipo_bien IS NULL AND query.tipo_bien IS NOT NULL) OR  (tbn1_mi_tipo_bien.tipo_bien IS NOT NULL AND query.tipo_bien IS NULL))) THEN
  UPDATE SET
    cod_tipo_bien=query.cod_tipo_bien,
    tipo_bien=query.tipo_bien
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_bien,tipo_bien) VALUES (
    query.es_indefinido,
    query.cod_tipo_bien,
    query.tipo_bien);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_bien' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_bien;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_bien(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_bien'
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
      cod_tipo_bien,
      descripcion_tipo_bien AS tipo_bien
    FROM
      (SELECT 'I' cod_tipo_bien,'Inmueble' descripcion_tipo_bien
       UNION ALL SELECT 'V','Valores mobiliarios'
       UNION ALL SELECT 'O','Otros') tipo_bien
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_bien AS tbn1_mi_tipo_bien
  USING query ON query.cod_tipo_bien=tbn1_mi_tipo_bien.cod_tipo_bien
  WHEN MATCHED AND ((tbn1_mi_tipo_bien.tipo_bien<>query.tipo_bien OR (tbn1_mi_tipo_bien.tipo_bien IS NULL AND query.tipo_bien IS NOT NULL) OR  (tbn1_mi_tipo_bien.tipo_bien IS NOT NULL AND query.tipo_bien IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_bien=query.tipo_bien,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_bien,tipo_bien,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_bien,
      query.tipo_bien,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(
  id_tipo_importe int IDENTITY(1,1),
  cod_tipo_importe varchar(2),
  tipo_importe varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_importe UNIQUE (cod_tipo_importe),
  CONSTRAINT PK_tbn1_mi_tipo_importe PRIMARY KEY CLUSTERED (id_tipo_importe)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD id_tipo_importe int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD cod_tipo_importe varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD tipo_importe varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_IMPORTE_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_IMPORTE_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN id_tipo_importe int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='cod_tipo_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN cod_tipo_importe varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='tipo_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN tipo_importe varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_importe' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ADD CONSTRAINT PK_tbn1_mi_tipo_importe PRIMARY KEY CLUSTERED (id_tipo_importe)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_importe,'Indefinido' AS tipo_importe
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe AS tbn1_mi_tipo_importe
USING query ON query.es_indefinido=tbn1_mi_tipo_importe.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_importe.cod_tipo_importe<>query.cod_tipo_importe OR (tbn1_mi_tipo_importe.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL) OR  (tbn1_mi_tipo_importe.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
                  OR tbn1_mi_tipo_importe.tipo_importe<>query.tipo_importe OR (tbn1_mi_tipo_importe.tipo_importe IS NULL AND query.tipo_importe IS NOT NULL) OR  (tbn1_mi_tipo_importe.tipo_importe IS NOT NULL AND query.tipo_importe IS NULL))) THEN
  UPDATE SET
    cod_tipo_importe=query.cod_tipo_importe,
    tipo_importe=query.tipo_importe
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_importe,tipo_importe) VALUES (
    query.es_indefinido,
    query.cod_tipo_importe,
    query.tipo_importe);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe'
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
      cod_tipo_importe,
      descripcion_tipo_importe AS tipo_importe,
      'MAESTRO' AS origen
    FROM
      (SELECT 'ZZ' cod_tipo_importe,'Valor introducido para que coja el campo como carácter' descripcion_tipo_importe
       UNION ALL SELECT '01','Importe donativo, aportación o disposición'
       UNION ALL SELECT '02','Código 02, pendiente definir'
       UNION ALL SELECT '03','Código 03, pendiente definir'
       UNION ALL SELECT '04','Código 04, pendiente definir') tipo_importe
    WHERE cod_tipo_importe<>'ZZ'
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe AS tbn1_mi_tipo_importe
  USING query ON query.cod_tipo_importe=tbn1_mi_tipo_importe.cod_tipo_importe
  WHEN MATCHED AND ((tbn1_mi_tipo_importe.tipo_importe<>query.tipo_importe OR (tbn1_mi_tipo_importe.tipo_importe IS NULL AND query.tipo_importe IS NOT NULL) OR  (tbn1_mi_tipo_importe.tipo_importe IS NOT NULL AND query.tipo_importe IS NULL)
                    OR tbn1_mi_tipo_importe.origen<>query.origen OR (tbn1_mi_tipo_importe.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipo_importe.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_importe=query.tipo_importe,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_importe,tipo_importe,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_importe,
      query.tipo_importe,
      query.origen,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();
	  
	---- incluir registro -1
	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe
		WHERE	id_tipo_importe = -1
	)

		INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe
		(
			id_tipo_importe,
			cod_tipo_importe,
			tipo_importe,
			origen
		)
		VALUES
		(
			-1,
			'',
			'',
			'MAESTRO'
		)

	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe OFF	  
	---- incluir registro -1 (fin)
	
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe_integridad_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_189'
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
      mfim89_tipo AS cod_tipo_importe,
      'TIPO FALTANTE MAESTRO' AS tipo_importe,
      'MODELO 189' AS origen
    FROM dbo.tbn1im89_mf
    GROUP BY mfim89_tipo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON (tbn1_mi_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mi_tipo_importe.cod_tipo_importe IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe_integridad_170' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_170;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_170(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_170'
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
      mfim70_tipo AS cod_tipo_importe,
      'TIPO FALTANTE MAESTRO' AS tipo_importe,
      'MODELO 170' AS origen
    FROM dbo.tbn1im70_mf
    GROUP BY mfim70_tipo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON (tbn1_mi_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mi_tipo_importe.cod_tipo_importe IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe_integridad_171' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_171;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_171(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_171'
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
      mfim71_tipo AS cod_tipo_importe,
      'TIPO FALTANTE MAESTRO' AS tipo_importe,
      'MODELO 171' AS origen
    FROM dbo.tbn1im71_mf
    GROUP BY mfim71_tipo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON (tbn1_mi_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mi_tipo_importe.cod_tipo_importe IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe_integridad_199' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_199;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_199(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_199'
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
      im99_tipo AS cod_tipo_importe,
      'TIPO FALTANTE MAESTRO' AS tipo_importe,
      'MODELO 199' AS origen
    FROM dbo.tbn1im99_mf
    GROUP BY im99_tipo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON (tbn1_mi_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mi_tipo_importe.cod_tipo_importe IS NULL;

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



-------


USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_importe_integridad_346' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_346;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_346(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_346'
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
      im46_tipo AS cod_tipo_importe,
      'TIPO FALTANTE MAESTRO' AS tipo_importe,
      'MODELO 346' AS origen
    FROM dbo.tbn1im46_mf
    GROUP BY im46_tipo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe(cod_tipo_importe,tipo_importe,origen)
  SELECT
    query.cod_tipo_importe,
    query.tipo_importe,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe ON (tbn1_mi_tipo_importe.cod_tipo_importe=query.cod_tipo_importe)
  WHERE tbn1_mi_tipo_importe.cod_tipo_importe IS NULL;

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
