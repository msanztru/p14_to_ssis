PRINT 'dimensional_maestros_mf.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion(
  id_tipo_presentacion int NOT NULL,
  cod_tipo_presentacion varchar(1),
  tipo_presentacion varchar(50),
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_presentacion UNIQUE (cod_tipo_presentacion),
  CONSTRAINT PK_tbn1_dim_mi_tipo_presentacion PRIMARY KEY CLUSTERED (id_tipo_presentacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPO_PRESENTACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ALTER COLUMN cod_tipo_presentacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ALTER COLUMN tipo_presentacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_presentacion' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion ADD CONSTRAINT PK_tbn1_dim_mi_tipo_presentacion PRIMARY KEY CLUSTERED (id_tipo_presentacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipo_presentacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_presentacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_presentacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_presentacion'
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
      id_tipo_presentacion,
      cod_tipo_presentacion,
      tipo_presentacion,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_presentacion AS tbn1_dim_mi_tipo_presentacion
  USING query ON query.id_tipo_presentacion=tbn1_dim_mi_tipo_presentacion.id_tipo_presentacion
  WHEN MATCHED AND ((tbn1_dim_mi_tipo_presentacion.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_mi_tipo_presentacion.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_mi_tipo_presentacion.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_mi_tipo_presentacion.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_mi_tipo_presentacion.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_mi_tipo_presentacion.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_mi_tipo_presentacion.origen<>query.origen OR (tbn1_dim_mi_tipo_presentacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipo_presentacion.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_presentacion,cod_tipo_presentacion,tipo_presentacion,origen) VALUES (
      query.id_tipo_presentacion,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion(
  id_tipo_declaracion int NOT NULL,
  cod_tipo_declaracion varchar(1),
  tipo_declaracion varchar(50),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_tipo_declaracion PRIMARY KEY CLUSTERED (id_tipo_declaracion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='id_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ADD id_tipo_declaracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='cod_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ADD cod_tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ADD tipo_declaracion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPO_DECLARACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='id_tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ALTER COLUMN id_tipo_declaracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='cod_tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ALTER COLUMN cod_tipo_declaracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ALTER COLUMN tipo_declaracion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_declaracion' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion ADD CONSTRAINT PK_tbn1_dim_mi_tipo_declaracion PRIMARY KEY CLUSTERED (id_tipo_declaracion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipo_declaracion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_declaracion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_declaracion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_declaracion'
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
      id_tipo_declaracion,
      cod_tipo_declaracion,
      tipo_declaracion,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_declaracion AS tbn1_dim_mi_tipo_declaracion
  USING query ON query.id_tipo_declaracion=tbn1_dim_mi_tipo_declaracion.id_tipo_declaracion
  WHEN MATCHED AND ((tbn1_dim_mi_tipo_declaracion.cod_tipo_declaracion<>query.cod_tipo_declaracion OR (tbn1_dim_mi_tipo_declaracion.cod_tipo_declaracion IS NULL AND query.cod_tipo_declaracion IS NOT NULL) OR  (tbn1_dim_mi_tipo_declaracion.cod_tipo_declaracion IS NOT NULL AND query.cod_tipo_declaracion IS NULL)
                    OR tbn1_dim_mi_tipo_declaracion.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_mi_tipo_declaracion.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_mi_tipo_declaracion.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_mi_tipo_declaracion.origen<>query.origen OR (tbn1_dim_mi_tipo_declaracion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipo_declaracion.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_declaracion=query.cod_tipo_declaracion,
      tipo_declaracion=query.tipo_declaracion,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_declaracion,cod_tipo_declaracion,tipo_declaracion,origen) VALUES (
      query.id_tipo_declaracion,
      query.cod_tipo_declaracion,
      query.tipo_declaracion,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja(
  id_tipo_hoja int NOT NULL,
  cod_tipo_hoja varchar(1) NOT NULL,
  tipo_hoja varchar(25),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_tipo_hoja PRIMARY KEY CLUSTERED (id_tipo_hoja)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='id_tipo_hoja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ADD id_tipo_hoja int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='cod_tipo_hoja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ADD cod_tipo_hoja varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='tipo_hoja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ADD tipo_hoja varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPO_HOJA_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='id_tipo_hoja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ALTER COLUMN id_tipo_hoja int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='cod_tipo_hoja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ALTER COLUMN cod_tipo_hoja varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='tipo_hoja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ALTER COLUMN tipo_hoja varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_hoja' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipo_hoja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja ADD CONSTRAINT PK_tbn1_dim_mi_tipo_hoja PRIMARY KEY CLUSTERED (id_tipo_hoja)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipo_hoja' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_hoja;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_hoja(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_hoja'
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
      id_tipo_hoja,
      cod_tipo_hoja,
      tipo_hoja,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_hoja AS tbn1_dim_mi_tipo_hoja
  USING query ON query.id_tipo_hoja=tbn1_dim_mi_tipo_hoja.id_tipo_hoja
  WHEN MATCHED AND ((tbn1_dim_mi_tipo_hoja.cod_tipo_hoja<>query.cod_tipo_hoja OR (tbn1_dim_mi_tipo_hoja.cod_tipo_hoja IS NULL AND query.cod_tipo_hoja IS NOT NULL) OR  (tbn1_dim_mi_tipo_hoja.cod_tipo_hoja IS NOT NULL AND query.cod_tipo_hoja IS NULL)
                    OR tbn1_dim_mi_tipo_hoja.tipo_hoja<>query.tipo_hoja OR (tbn1_dim_mi_tipo_hoja.tipo_hoja IS NULL AND query.tipo_hoja IS NOT NULL) OR  (tbn1_dim_mi_tipo_hoja.tipo_hoja IS NOT NULL AND query.tipo_hoja IS NULL)
                    OR tbn1_dim_mi_tipo_hoja.origen<>query.origen OR (tbn1_dim_mi_tipo_hoja.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipo_hoja.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_hoja=query.cod_tipo_hoja,
      tipo_hoja=query.tipo_hoja,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_hoja,cod_tipo_hoja,tipo_hoja,origen) VALUES (
      query.id_tipo_hoja,
      query.cod_tipo_hoja,
      query.tipo_hoja,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo(
  id_clave_tipo_codigo int NOT NULL,
  cod_clave_tipo_codigo varchar(1),
  clave_tipo_codigo varchar(55),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_tipo_codigo PRIMARY KEY CLUSTERED (id_clave_tipo_codigo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='id_clave_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ADD id_clave_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='cod_clave_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ADD cod_clave_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='clave_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ADD clave_tipo_codigo varchar(55)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_TIPO_CODIGO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='id_clave_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ALTER COLUMN id_clave_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='cod_clave_tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ALTER COLUMN cod_clave_tipo_codigo varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='clave_tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ALTER COLUMN clave_tipo_codigo varchar(55) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_tipo_codigo' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo ADD CONSTRAINT PK_tbn1_dim_mi_clave_tipo_codigo PRIMARY KEY CLUSTERED (id_clave_tipo_codigo)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_tipo_codigo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_tipo_codigo;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_tipo_codigo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_tipo_codigo'
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
      id_clave_tipo_codigo,
      cod_clave_tipo_codigo,
      clave_tipo_codigo,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_tipo_codigo AS tbn1_dim_mi_clave_tipo_codigo
  USING query ON query.id_clave_tipo_codigo=tbn1_dim_mi_clave_tipo_codigo.id_clave_tipo_codigo
  WHEN MATCHED AND ((tbn1_dim_mi_clave_tipo_codigo.cod_clave_tipo_codigo<>query.cod_clave_tipo_codigo OR (tbn1_dim_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NULL AND query.cod_clave_tipo_codigo IS NOT NULL) OR  (tbn1_dim_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NOT NULL AND query.cod_clave_tipo_codigo IS NULL)
                    OR tbn1_dim_mi_clave_tipo_codigo.clave_tipo_codigo<>query.clave_tipo_codigo OR (tbn1_dim_mi_clave_tipo_codigo.clave_tipo_codigo IS NULL AND query.clave_tipo_codigo IS NOT NULL) OR  (tbn1_dim_mi_clave_tipo_codigo.clave_tipo_codigo IS NOT NULL AND query.clave_tipo_codigo IS NULL)
                    OR tbn1_dim_mi_clave_tipo_codigo.origen<>query.origen OR (tbn1_dim_mi_clave_tipo_codigo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_tipo_codigo.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_tipo_codigo=query.cod_clave_tipo_codigo,
      clave_tipo_codigo=query.clave_tipo_codigo,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_tipo_codigo,cod_clave_tipo_codigo,clave_tipo_codigo,origen) VALUES (
      query.id_clave_tipo_codigo,
      query.cod_clave_tipo_codigo,
      query.clave_tipo_codigo,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion(
  id_tipo_identificacion int NOT NULL,
  cod_tipo_identificacion varchar(1),
  tipo_identificacion varchar(50),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_tipo_identificacion PRIMARY KEY CLUSTERED (id_tipo_identificacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='id_tipo_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ADD id_tipo_identificacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='cod_tipo_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ADD cod_tipo_identificacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='tipo_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ADD tipo_identificacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPO_IDENTIFICACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='id_tipo_identificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ALTER COLUMN id_tipo_identificacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='cod_tipo_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ALTER COLUMN cod_tipo_identificacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='tipo_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ALTER COLUMN tipo_identificacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_identificacion' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipo_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion ADD CONSTRAINT PK_tbn1_dim_mi_tipo_identificacion PRIMARY KEY CLUSTERED (id_tipo_identificacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipo_identificacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_identificacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_identificacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_identificacion'
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
      id_tipo_identificacion,
      cod_tipo_identificacion,
      tipo_identificacion,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_identificacion AS tbn1_dim_mi_tipo_identificacion
  USING query ON query.id_tipo_identificacion=tbn1_dim_mi_tipo_identificacion.id_tipo_identificacion
  WHEN MATCHED AND ((tbn1_dim_mi_tipo_identificacion.cod_tipo_identificacion<>query.cod_tipo_identificacion OR (tbn1_dim_mi_tipo_identificacion.cod_tipo_identificacion IS NULL AND query.cod_tipo_identificacion IS NOT NULL) OR  (tbn1_dim_mi_tipo_identificacion.cod_tipo_identificacion IS NOT NULL AND query.cod_tipo_identificacion IS NULL)
                    OR tbn1_dim_mi_tipo_identificacion.tipo_identificacion<>query.tipo_identificacion OR (tbn1_dim_mi_tipo_identificacion.tipo_identificacion IS NULL AND query.tipo_identificacion IS NOT NULL) OR  (tbn1_dim_mi_tipo_identificacion.tipo_identificacion IS NOT NULL AND query.tipo_identificacion IS NULL)
                    OR tbn1_dim_mi_tipo_identificacion.origen<>query.origen OR (tbn1_dim_mi_tipo_identificacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipo_identificacion.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_identificacion=query.cod_tipo_identificacion,
      tipo_identificacion=query.tipo_identificacion,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_identificacion,cod_tipo_identificacion,tipo_identificacion,origen) VALUES (
      query.id_tipo_identificacion,
      query.cod_tipo_identificacion,
      query.tipo_identificacion,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado(
  id_clave_declarado int NOT NULL,
  cod_clave_declarado varchar(1),
  clave_declarado varchar(300),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_declarado PRIMARY KEY CLUSTERED (id_clave_declarado)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='id_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ADD id_clave_declarado int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='cod_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ADD cod_clave_declarado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ADD clave_declarado varchar(300)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_DECLARADO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='id_clave_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ALTER COLUMN id_clave_declarado int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='cod_clave_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ALTER COLUMN cod_clave_declarado varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='clave_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ALTER COLUMN clave_declarado varchar(300) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_declarado' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado ADD CONSTRAINT PK_tbn1_dim_mi_clave_declarado PRIMARY KEY CLUSTERED (id_clave_declarado)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_declarado' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_declarado;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_declarado(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_declarado'
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
      id_clave_declarado,
      cod_clave_declarado,
      clave_declarado,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_declarado AS tbn1_dim_mi_clave_declarado
  USING query ON query.id_clave_declarado=tbn1_dim_mi_clave_declarado.id_clave_declarado
  WHEN MATCHED AND ((tbn1_dim_mi_clave_declarado.cod_clave_declarado<>query.cod_clave_declarado OR (tbn1_dim_mi_clave_declarado.cod_clave_declarado IS NULL AND query.cod_clave_declarado IS NOT NULL) OR  (tbn1_dim_mi_clave_declarado.cod_clave_declarado IS NOT NULL AND query.cod_clave_declarado IS NULL)
                    OR tbn1_dim_mi_clave_declarado.clave_declarado<>query.clave_declarado OR (tbn1_dim_mi_clave_declarado.clave_declarado IS NULL AND query.clave_declarado IS NOT NULL) OR  (tbn1_dim_mi_clave_declarado.clave_declarado IS NOT NULL AND query.clave_declarado IS NULL)
                    OR tbn1_dim_mi_clave_declarado.origen<>query.origen OR (tbn1_dim_mi_clave_declarado.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_declarado.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_declarado=query.cod_clave_declarado,
      clave_declarado=query.clave_declarado,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_declarado,cod_clave_declarado,clave_declarado,origen) VALUES (
      query.id_clave_declarado,
      query.cod_clave_declarado,
      query.clave_declarado,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion(
  id_clave_operacion int NOT NULL,
  cod_clave_operacion varchar(1),
  clave_operacion varchar(25),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_operacion PRIMARY KEY CLUSTERED (id_clave_operacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='id_clave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ADD id_clave_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='cod_clave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ADD cod_clave_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='clave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ADD clave_operacion varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_OPERACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='id_clave_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ALTER COLUMN id_clave_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='cod_clave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ALTER COLUMN cod_clave_operacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='clave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ALTER COLUMN clave_operacion varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion ADD CONSTRAINT PK_tbn1_dim_mi_clave_operacion PRIMARY KEY CLUSTERED (id_clave_operacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_operacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_operacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_operacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_operacion'
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
      id_clave_operacion,
      cod_clave_operacion,
      clave_operacion,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion AS tbn1_dim_mi_clave_operacion
  USING query ON query.id_clave_operacion=tbn1_dim_mi_clave_operacion.id_clave_operacion
  WHEN MATCHED AND ((tbn1_dim_mi_clave_operacion.cod_clave_operacion<>query.cod_clave_operacion OR (tbn1_dim_mi_clave_operacion.cod_clave_operacion IS NULL AND query.cod_clave_operacion IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion.cod_clave_operacion IS NOT NULL AND query.cod_clave_operacion IS NULL)
                    OR tbn1_dim_mi_clave_operacion.clave_operacion<>query.clave_operacion OR (tbn1_dim_mi_clave_operacion.clave_operacion IS NULL AND query.clave_operacion IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion.clave_operacion IS NOT NULL AND query.clave_operacion IS NULL)
                    OR tbn1_dim_mi_clave_operacion.origen<>query.origen OR (tbn1_dim_mi_clave_operacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_operacion=query.cod_clave_operacion,
      clave_operacion=query.clave_operacion,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_operacion,cod_clave_operacion,clave_operacion,origen) VALUES (
      query.id_clave_operacion,
      query.cod_clave_operacion,
      query.clave_operacion,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque(
  id_clave_operacion_cheque int NOT NULL,
  cod_clave_operacion_cheque varchar(2),
  clave_operacion_cheque varchar(150),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_operacion_cheque PRIMARY KEY CLUSTERED (id_clave_operacion_cheque)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='id_clave_operacion_cheque')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ADD id_clave_operacion_cheque int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='cod_clave_operacion_cheque')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ADD cod_clave_operacion_cheque varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='clave_operacion_cheque')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ADD clave_operacion_cheque varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_OPERACION_CHEQUE_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='id_clave_operacion_cheque' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ALTER COLUMN id_clave_operacion_cheque int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='cod_clave_operacion_cheque' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ALTER COLUMN cod_clave_operacion_cheque varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='clave_operacion_cheque' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ALTER COLUMN clave_operacion_cheque varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_cheque' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_operacion_cheque')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque ADD CONSTRAINT PK_tbn1_dim_mi_clave_operacion_cheque PRIMARY KEY CLUSTERED (id_clave_operacion_cheque)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_operacion_cheque' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_cheque;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_cheque(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_cheque'
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
      id_clave_operacion_cheque,
      cod_clave_operacion_cheque,
      clave_operacion_cheque,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_cheque AS tbn1_dim_mi_clave_operacion_cheque
  USING query ON query.id_clave_operacion_cheque=tbn1_dim_mi_clave_operacion_cheque.id_clave_operacion_cheque
  WHEN MATCHED AND ((tbn1_dim_mi_clave_operacion_cheque.cod_clave_operacion_cheque<>query.cod_clave_operacion_cheque OR (tbn1_dim_mi_clave_operacion_cheque.cod_clave_operacion_cheque IS NULL AND query.cod_clave_operacion_cheque IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion_cheque.cod_clave_operacion_cheque IS NOT NULL AND query.cod_clave_operacion_cheque IS NULL)
                    OR tbn1_dim_mi_clave_operacion_cheque.clave_operacion_cheque<>query.clave_operacion_cheque OR (tbn1_dim_mi_clave_operacion_cheque.clave_operacion_cheque IS NULL AND query.clave_operacion_cheque IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion_cheque.clave_operacion_cheque IS NOT NULL AND query.clave_operacion_cheque IS NULL)
                    OR tbn1_dim_mi_clave_operacion_cheque.origen<>query.origen OR (tbn1_dim_mi_clave_operacion_cheque.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion_cheque.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_operacion_cheque=query.cod_clave_operacion_cheque,
      clave_operacion_cheque=query.clave_operacion_cheque,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_operacion_cheque,cod_clave_operacion_cheque,clave_operacion_cheque,origen) VALUES (
      query.id_clave_operacion_cheque,
      query.cod_clave_operacion_cheque,
      query.clave_operacion_cheque,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189(
  id_clave_identificacion_189 int NOT NULL,
  cod_clave_identificacion_189 varchar(1),
  clave_identificacion_189 varchar(25),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_claves_identificacion_189 PRIMARY KEY CLUSTERED (id_clave_identificacion_189)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='id_clave_identificacion_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ADD id_clave_identificacion_189 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='cod_clave_identificacion_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ADD cod_clave_identificacion_189 varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='clave_identificacion_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ADD clave_identificacion_189 varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVES_IDENTIFICACION_189_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='id_clave_identificacion_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ALTER COLUMN id_clave_identificacion_189 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='cod_clave_identificacion_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ALTER COLUMN cod_clave_identificacion_189 varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='clave_identificacion_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ALTER COLUMN clave_identificacion_189 varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_identificacion_189' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_claves_identificacion_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 ADD CONSTRAINT PK_tbn1_dim_mi_claves_identificacion_189 PRIMARY KEY CLUSTERED (id_clave_identificacion_189)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_claves_identificacion_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_identificacion_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_identificacion_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_identificacion_189'
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
      id_clave_identificacion_189,
      cod_clave_identificacion_189,
      clave_identificacion_189,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_identificacion_189 AS tbn1_dim_mi_claves_identificacion_189
  USING query ON query.id_clave_identificacion_189=tbn1_dim_mi_claves_identificacion_189.id_clave_identificacion_189
  WHEN MATCHED AND ((tbn1_dim_mi_claves_identificacion_189.cod_clave_identificacion_189<>query.cod_clave_identificacion_189 OR (tbn1_dim_mi_claves_identificacion_189.cod_clave_identificacion_189 IS NULL AND query.cod_clave_identificacion_189 IS NOT NULL) OR  (tbn1_dim_mi_claves_identificacion_189.cod_clave_identificacion_189 IS NOT NULL AND query.cod_clave_identificacion_189 IS NULL)
                    OR tbn1_dim_mi_claves_identificacion_189.clave_identificacion_189<>query.clave_identificacion_189 OR (tbn1_dim_mi_claves_identificacion_189.clave_identificacion_189 IS NULL AND query.clave_identificacion_189 IS NOT NULL) OR  (tbn1_dim_mi_claves_identificacion_189.clave_identificacion_189 IS NOT NULL AND query.clave_identificacion_189 IS NULL)
                    OR tbn1_dim_mi_claves_identificacion_189.origen<>query.origen OR (tbn1_dim_mi_claves_identificacion_189.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_claves_identificacion_189.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_identificacion_189=query.cod_clave_identificacion_189,
      clave_identificacion_189=query.clave_identificacion_189,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_identificacion_189,cod_clave_identificacion_189,clave_identificacion_189,origen) VALUES (
      query.id_clave_identificacion_189,
      query.cod_clave_identificacion_189,
      query.clave_identificacion_189,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189(
  id_clave_valor_189 int NOT NULL,
  cod_clave_valor_189 varchar(1),
  clave_valor_189 varchar(150),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_claves_valor_189 PRIMARY KEY CLUSTERED (id_clave_valor_189)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='id_clave_valor_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ADD id_clave_valor_189 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='cod_clave_valor_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ADD cod_clave_valor_189 varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='clave_valor_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ADD clave_valor_189 varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVES_VALOR_189_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='id_clave_valor_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ALTER COLUMN id_clave_valor_189 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='cod_clave_valor_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ALTER COLUMN cod_clave_valor_189 varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='clave_valor_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ALTER COLUMN clave_valor_189 varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_valor_189' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_claves_valor_189')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 ADD CONSTRAINT PK_tbn1_dim_mi_claves_valor_189 PRIMARY KEY CLUSTERED (id_clave_valor_189)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_claves_valor_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_valor_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_valor_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_valor_189'
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
      id_clave_valor_189,
      cod_clave_valor_189,
      clave_valor_189,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_valor_189 AS tbn1_dim_mi_claves_valor_189
  USING query ON query.id_clave_valor_189=tbn1_dim_mi_claves_valor_189.id_clave_valor_189
  WHEN MATCHED AND ((tbn1_dim_mi_claves_valor_189.cod_clave_valor_189<>query.cod_clave_valor_189 OR (tbn1_dim_mi_claves_valor_189.cod_clave_valor_189 IS NULL AND query.cod_clave_valor_189 IS NOT NULL) OR  (tbn1_dim_mi_claves_valor_189.cod_clave_valor_189 IS NOT NULL AND query.cod_clave_valor_189 IS NULL)
                    OR tbn1_dim_mi_claves_valor_189.clave_valor_189<>query.clave_valor_189 OR (tbn1_dim_mi_claves_valor_189.clave_valor_189 IS NULL AND query.clave_valor_189 IS NOT NULL) OR  (tbn1_dim_mi_claves_valor_189.clave_valor_189 IS NOT NULL AND query.clave_valor_189 IS NULL)
                    OR tbn1_dim_mi_claves_valor_189.origen<>query.origen OR (tbn1_dim_mi_claves_valor_189.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_claves_valor_189.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_valor_189=query.cod_clave_valor_189,
      clave_valor_189=query.clave_valor_189,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_valor_189,cod_clave_valor_189,clave_valor_189,origen) VALUES (
      query.id_clave_valor_189,
      query.cod_clave_valor_189,
      query.clave_valor_189,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado(
  id_clave_mercado int NOT NULL,
  cod_clave_mercado varchar(1),
  clave_mercado varchar(150),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_claves_mercado PRIMARY KEY CLUSTERED (id_clave_mercado)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='id_clave_mercado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ADD id_clave_mercado int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='cod_clave_mercado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ADD cod_clave_mercado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='clave_mercado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ADD clave_mercado varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVES_MERCADO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='id_clave_mercado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ALTER COLUMN id_clave_mercado int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='cod_clave_mercado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ALTER COLUMN cod_clave_mercado varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='clave_mercado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ALTER COLUMN clave_mercado varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_mercado' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_claves_mercado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado ADD CONSTRAINT PK_tbn1_dim_mi_claves_mercado PRIMARY KEY CLUSTERED (id_clave_mercado)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_claves_mercado' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_mercado;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_mercado(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_mercado'
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
      id_clave_mercado,
      cod_clave_mercado,
      clave_mercado,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_mercado AS tbn1_dim_mi_claves_mercado
  USING query ON query.id_clave_mercado=tbn1_dim_mi_claves_mercado.id_clave_mercado
  WHEN MATCHED AND ((tbn1_dim_mi_claves_mercado.cod_clave_mercado<>query.cod_clave_mercado OR (tbn1_dim_mi_claves_mercado.cod_clave_mercado IS NULL AND query.cod_clave_mercado IS NOT NULL) OR  (tbn1_dim_mi_claves_mercado.cod_clave_mercado IS NOT NULL AND query.cod_clave_mercado IS NULL)
                    OR tbn1_dim_mi_claves_mercado.clave_mercado<>query.clave_mercado OR (tbn1_dim_mi_claves_mercado.clave_mercado IS NULL AND query.clave_mercado IS NOT NULL) OR  (tbn1_dim_mi_claves_mercado.clave_mercado IS NOT NULL AND query.clave_mercado IS NULL)
                    OR tbn1_dim_mi_claves_mercado.origen<>query.origen OR (tbn1_dim_mi_claves_mercado.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_claves_mercado.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_mercado=query.cod_clave_mercado,
      clave_mercado=query.clave_mercado,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_mercado,cod_clave_mercado,clave_mercado,origen) VALUES (
      query.id_clave_mercado,
      query.cod_clave_mercado,
      query.clave_mercado,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion(
  id_clave_representacion int NOT NULL,
  cod_clave_representacion varchar(1),
  clave_representacion varchar(25),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_claves_representacion PRIMARY KEY CLUSTERED (id_clave_representacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ADD id_clave_representacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='cod_clave_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ADD cod_clave_representacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='clave_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ADD clave_representacion varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVES_REPRESENTACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='id_clave_representacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ALTER COLUMN id_clave_representacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='cod_clave_representacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ALTER COLUMN cod_clave_representacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='clave_representacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ALTER COLUMN clave_representacion varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_claves_representacion' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_claves_representacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion ADD CONSTRAINT PK_tbn1_dim_mi_claves_representacion PRIMARY KEY CLUSTERED (id_clave_representacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_claves_representacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_representacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_claves_representacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_representacion'
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
      id_clave_representacion,
      cod_clave_representacion,
      clave_representacion,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_claves_representacion AS tbn1_dim_mi_claves_representacion
  USING query ON query.id_clave_representacion=tbn1_dim_mi_claves_representacion.id_clave_representacion
  WHEN MATCHED AND ((tbn1_dim_mi_claves_representacion.cod_clave_representacion<>query.cod_clave_representacion OR (tbn1_dim_mi_claves_representacion.cod_clave_representacion IS NULL AND query.cod_clave_representacion IS NOT NULL) OR  (tbn1_dim_mi_claves_representacion.cod_clave_representacion IS NOT NULL AND query.cod_clave_representacion IS NULL)
                    OR tbn1_dim_mi_claves_representacion.clave_representacion<>query.clave_representacion OR (tbn1_dim_mi_claves_representacion.clave_representacion IS NULL AND query.clave_representacion IS NOT NULL) OR  (tbn1_dim_mi_claves_representacion.clave_representacion IS NOT NULL AND query.clave_representacion IS NULL)
                    OR tbn1_dim_mi_claves_representacion.origen<>query.origen OR (tbn1_dim_mi_claves_representacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_claves_representacion.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_representacion=query.cod_clave_representacion,
      clave_representacion=query.clave_representacion,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_representacion,cod_clave_representacion,clave_representacion,origen) VALUES (
      query.id_clave_representacion,
      query.cod_clave_representacion,
      query.clave_representacion,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte(
  id_tipo_soporte int NOT NULL,
  cod_tipo_soporte varchar(1),
  tipo_soporte varchar(25),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_tipos_soporte PRIMARY KEY CLUSTERED (id_tipo_soporte)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ADD id_tipo_soporte int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='cod_tipo_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ADD cod_tipo_soporte varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='tipo_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ADD tipo_soporte varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPOS_SOPORTE_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ALTER COLUMN id_tipo_soporte int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='cod_tipo_soporte' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ALTER COLUMN cod_tipo_soporte varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='tipo_soporte' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ALTER COLUMN tipo_soporte varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipos_soporte' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipos_soporte')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte ADD CONSTRAINT PK_tbn1_dim_mi_tipos_soporte PRIMARY KEY CLUSTERED (id_tipo_soporte)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipos_soporte' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipos_soporte;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipos_soporte(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipos_soporte'
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
      id_tipo_soporte,
      cod_tipo_soporte,
      tipo_soporte,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipos_soporte AS tbn1_dim_mi_tipos_soporte
  USING query ON query.id_tipo_soporte=tbn1_dim_mi_tipos_soporte.id_tipo_soporte
  WHEN MATCHED AND ((tbn1_dim_mi_tipos_soporte.cod_tipo_soporte<>query.cod_tipo_soporte OR (tbn1_dim_mi_tipos_soporte.cod_tipo_soporte IS NULL AND query.cod_tipo_soporte IS NOT NULL) OR  (tbn1_dim_mi_tipos_soporte.cod_tipo_soporte IS NOT NULL AND query.cod_tipo_soporte IS NULL)
                    OR tbn1_dim_mi_tipos_soporte.tipo_soporte<>query.tipo_soporte OR (tbn1_dim_mi_tipos_soporte.tipo_soporte IS NULL AND query.tipo_soporte IS NOT NULL) OR  (tbn1_dim_mi_tipos_soporte.tipo_soporte IS NOT NULL AND query.tipo_soporte IS NULL)
                    OR tbn1_dim_mi_tipos_soporte.origen<>query.origen OR (tbn1_dim_mi_tipos_soporte.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipos_soporte.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_soporte=query.cod_tipo_soporte,
      tipo_soporte=query.tipo_soporte,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_soporte,cod_tipo_soporte,tipo_soporte,origen) VALUES (
      query.id_tipo_soporte,
      query.cod_tipo_soporte,
      query.tipo_soporte,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe(
  id_tipo_importe int NOT NULL,
  cod_tipo_importe varchar(2),
  tipo_importe varchar(50),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_tipo_importe PRIMARY KEY CLUSTERED (id_tipo_importe)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='id_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ADD id_tipo_importe int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='cod_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ADD cod_tipo_importe varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ADD tipo_importe varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPO_IMPORTE_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='id_tipo_importe' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ALTER COLUMN id_tipo_importe int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='cod_tipo_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ALTER COLUMN cod_tipo_importe varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='tipo_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ALTER COLUMN tipo_importe varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_importe' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipo_importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe ADD CONSTRAINT PK_tbn1_dim_mi_tipo_importe PRIMARY KEY CLUSTERED (id_tipo_importe)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipo_importe' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_importe;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_importe(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_importe'
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
      id_tipo_importe,
      cod_tipo_importe,
      tipo_importe,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_importe AS tbn1_dim_mi_tipo_importe
  USING query ON query.id_tipo_importe=tbn1_dim_mi_tipo_importe.id_tipo_importe
  WHEN MATCHED AND ((tbn1_dim_mi_tipo_importe.cod_tipo_importe<>query.cod_tipo_importe OR (tbn1_dim_mi_tipo_importe.cod_tipo_importe IS NULL AND query.cod_tipo_importe IS NOT NULL) OR  (tbn1_dim_mi_tipo_importe.cod_tipo_importe IS NOT NULL AND query.cod_tipo_importe IS NULL)
                    OR tbn1_dim_mi_tipo_importe.tipo_importe<>query.tipo_importe OR (tbn1_dim_mi_tipo_importe.tipo_importe IS NULL AND query.tipo_importe IS NOT NULL) OR  (tbn1_dim_mi_tipo_importe.tipo_importe IS NOT NULL AND query.tipo_importe IS NULL)
                    OR tbn1_dim_mi_tipo_importe.origen<>query.origen OR (tbn1_dim_mi_tipo_importe.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipo_importe.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_importe=query.cod_tipo_importe,
      tipo_importe=query.tipo_importe,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_importe,cod_tipo_importe,tipo_importe,origen) VALUES (
      query.id_tipo_importe,
      query.cod_tipo_importe,
      query.tipo_importe,
      query.origen)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

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





/*******************************/
/*tbn1_mi_mae_claves_percepcion*/
/*******************************/

--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_claves_percepcion')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_percepcion(
	  id_clave_percepcion	int NOT NULL,
	  cod_clave_percepcion	varchar(1),
	  clave_percepcion		varchar(100),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_claves_percepcion PRIMARY KEY CLUSTERED (id_clave_percepcion)
	)
GO


--CARGA--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_claves_percepcion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_percepcion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_percepcion(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_percepcion'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_clave_percepcion,
					cod_clave_percepcion,
					clave_percepcion,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_percepcion AS destino
		USING query ON query.id_clave_percepcion = destino.id_clave_percepcion
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_percepcion<>query.cod_clave_percepcion OR (destino.cod_clave_percepcion IS NULL AND query.cod_clave_percepcion IS NOT NULL) OR (destino.cod_clave_percepcion IS NOT NULL AND query.cod_clave_percepcion IS NULL)
			OR	destino.clave_percepcion<>query.clave_percepcion OR (destino.clave_percepcion IS NULL AND query.clave_percepcion IS NOT NULL) OR (destino.clave_percepcion IS NOT NULL AND query.clave_percepcion IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_percepcion = query.cod_clave_percepcion,
					clave_percepcion = query.clave_percepcion,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_percepcion,
				cod_clave_percepcion,
				clave_percepcion,
				origen
			) 
			VALUES 
			(
				query.id_clave_percepcion,
				query.cod_clave_percepcion,
				query.clave_percepcion,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO


/*************************************/
/*FIN - tbn1_mi_mae_claves_percepcion*/
/*************************************/




/******************************/
/*tbn1_mi_mae_tipos_percepcion*/
/******************************/


--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_tipos_percepcion')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_percepcion(
	  id_tipo_percepcion	int NOT NULL,
	  cod_tipo_percepcion	varchar(1),
	  tipo_percepcion		varchar(300),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_tipos_percepcion PRIMARY KEY CLUSTERED (id_tipo_percepcion)
	)
GO

--CARGA--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_tipos_percepcion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_tipos_percepcion;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_tipos_percepcion(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_tipos_percepcion'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS(
										SELECT	1 AS expr1
										FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
										WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento = @procedure_name
										AND		excluido = 1
										)
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH
		query AS
		(
			SELECT	id_tipo_percepcion,
					cod_tipo_percepcion,
					tipo_percepcion,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_percepcion AS destino
		USING query ON query.id_tipo_percepcion = destino.id_tipo_percepcion
		
		WHEN MATCHED 
		AND (
				destino.cod_tipo_percepcion<>query.cod_tipo_percepcion OR (destino.cod_tipo_percepcion IS NULL AND query.cod_tipo_percepcion IS NOT NULL) OR (destino.cod_tipo_percepcion IS NOT NULL AND query.cod_tipo_percepcion IS NULL)
			OR	destino.tipo_percepcion<>query.tipo_percepcion OR (destino.tipo_percepcion IS NULL AND query.tipo_percepcion IS NOT NULL) OR (destino.tipo_percepcion IS NOT NULL AND query.tipo_percepcion IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_tipo_percepcion = query.cod_tipo_percepcion,
					tipo_percepcion = query.tipo_percepcion,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_tipo_percepcion,
				cod_tipo_percepcion,
				tipo_percepcion,
				origen
			) 
			VALUES 
			(
				query.id_tipo_percepcion,
				query.cod_tipo_percepcion,
				query.tipo_percepcion,
				query.origen
			)
		
		WHEN NOT MATCHED BY SOURCE THEN DELETE;

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

GO


/************************************/
/*FIN - tbn1_mi_mae_tipos_percepcion*/
/************************************/



/*****************/
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_maestros_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_maestros_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_maestros_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_maestros_mf'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_presentacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_declaracion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_hoja @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_tipo_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_identificacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_declarado @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_cheque @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipos_soporte @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_identificacion_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_valor_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_mercado @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_claves_representacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_importe @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_percepcion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_tipos_percepcion @log;

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

/***********************/
/*FIN - SP CON LAS EXEC*/
/***********************/

