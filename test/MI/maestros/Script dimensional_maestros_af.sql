PRINT 'dimensional_maestros_af.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo(
  id_tipo_codigo int NOT NULL,
  cod_tipo_codigo varchar(1),
  tipo_codigo varchar(60),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_tipo_codigo PRIMARY KEY CLUSTERED (id_tipo_codigo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='id_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ADD id_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ADD cod_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ADD tipo_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_TIPO_CODIGO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='id_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ALTER COLUMN id_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='cod_tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ALTER COLUMN cod_tipo_codigo varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ALTER COLUMN tipo_codigo varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_tipo_codigo' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo ADD CONSTRAINT PK_tbn1_dim_mi_tipo_codigo PRIMARY KEY CLUSTERED (id_tipo_codigo)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_tipo_codigo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_codigo;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_tipo_codigo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_codigo'
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
      id_tipo_codigo,
      cod_tipo_codigo,
      tipo_codigo,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_tipo_codigo AS tbn1_dim_mi_tipo_codigo
  USING query ON query.id_tipo_codigo=tbn1_dim_mi_tipo_codigo.id_tipo_codigo
  WHEN MATCHED AND ((tbn1_dim_mi_tipo_codigo.cod_tipo_codigo<>query.cod_tipo_codigo OR (tbn1_dim_mi_tipo_codigo.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL) OR  (tbn1_dim_mi_tipo_codigo.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
                    OR tbn1_dim_mi_tipo_codigo.tipo_codigo<>query.tipo_codigo OR (tbn1_dim_mi_tipo_codigo.tipo_codigo IS NULL AND query.tipo_codigo IS NOT NULL) OR  (tbn1_dim_mi_tipo_codigo.tipo_codigo IS NOT NULL AND query.tipo_codigo IS NULL)
                    OR tbn1_dim_mi_tipo_codigo.origen<>query.origen OR (tbn1_dim_mi_tipo_codigo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_tipo_codigo.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_tipo_codigo=query.cod_tipo_codigo,
      tipo_codigo=query.tipo_codigo,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_tipo_codigo,cod_tipo_codigo,tipo_codigo,origen) VALUES (
      query.id_tipo_codigo,
      query.cod_tipo_codigo,
      query.tipo_codigo,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo(
  id_clave_identificacion_fondo int NOT NULL,
  cod_clave_identificacion_fondo int,
  clave_identificacion_fondo varchar(25),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_identificacion_fondo PRIMARY KEY CLUSTERED (id_clave_identificacion_fondo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='id_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ADD id_clave_identificacion_fondo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='cod_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ADD cod_clave_identificacion_fondo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ADD clave_identificacion_fondo varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_IDENTIFICACION_FONDO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='id_clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ALTER COLUMN id_clave_identificacion_fondo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='cod_clave_identificacion_fondo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ALTER COLUMN cod_clave_identificacion_fondo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='clave_identificacion_fondo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ALTER COLUMN clave_identificacion_fondo varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_identificacion_fondo' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo ADD CONSTRAINT PK_tbn1_dim_mi_clave_identificacion_fondo PRIMARY KEY CLUSTERED (id_clave_identificacion_fondo)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_identificacion_fondo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_identificacion_fondo;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_identificacion_fondo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_identificacion_fondo'
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
      id_clave_identificacion_fondo,
      cod_clave_identificacion_fondo,
      clave_identificacion_fondo,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_identificacion_fondo AS tbn1_dim_mi_clave_identificacion_fondo
  USING query ON query.id_clave_identificacion_fondo=tbn1_dim_mi_clave_identificacion_fondo.id_clave_identificacion_fondo
  WHEN MATCHED AND ((tbn1_dim_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo<>query.cod_clave_identificacion_fondo OR (tbn1_dim_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo IS NULL AND query.cod_clave_identificacion_fondo IS NOT NULL) OR  (tbn1_dim_mi_clave_identificacion_fondo.cod_clave_identificacion_fondo IS NOT NULL AND query.cod_clave_identificacion_fondo IS NULL)
                    OR tbn1_dim_mi_clave_identificacion_fondo.clave_identificacion_fondo<>query.clave_identificacion_fondo OR (tbn1_dim_mi_clave_identificacion_fondo.clave_identificacion_fondo IS NULL AND query.clave_identificacion_fondo IS NOT NULL) OR  (tbn1_dim_mi_clave_identificacion_fondo.clave_identificacion_fondo IS NOT NULL AND query.clave_identificacion_fondo IS NULL)
                    OR tbn1_dim_mi_clave_identificacion_fondo.origen<>query.origen OR (tbn1_dim_mi_clave_identificacion_fondo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_identificacion_fondo.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_identificacion_fondo=query.cod_clave_identificacion_fondo,
      clave_identificacion_fondo=query.clave_identificacion_fondo,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_identificacion_fondo,cod_clave_identificacion_fondo,clave_identificacion_fondo,origen) VALUES (
      query.id_clave_identificacion_fondo,
      query.cod_clave_identificacion_fondo,
      query.clave_identificacion_fondo,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen(
  id_clave_origen int NOT NULL,
  cod_clave_origen varchar(1),
  clave_origen varchar(50),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_origen PRIMARY KEY CLUSTERED (id_clave_origen)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='id_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ADD id_clave_origen int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='cod_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ADD cod_clave_origen varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ADD clave_origen varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_ORIGEN_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='id_clave_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ALTER COLUMN id_clave_origen int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='cod_clave_origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ALTER COLUMN cod_clave_origen varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='clave_origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ALTER COLUMN clave_origen varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_origen' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen ADD CONSTRAINT PK_tbn1_dim_mi_clave_origen PRIMARY KEY CLUSTERED (id_clave_origen)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_origen' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_origen;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_origen(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_origen'
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
      id_clave_origen,
      cod_clave_origen,
      clave_origen,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_origen AS tbn1_dim_mi_clave_origen
  USING query ON query.id_clave_origen=tbn1_dim_mi_clave_origen.id_clave_origen
  WHEN MATCHED AND ((tbn1_dim_mi_clave_origen.cod_clave_origen<>query.cod_clave_origen OR (tbn1_dim_mi_clave_origen.cod_clave_origen IS NULL AND query.cod_clave_origen IS NOT NULL) OR  (tbn1_dim_mi_clave_origen.cod_clave_origen IS NOT NULL AND query.cod_clave_origen IS NULL)
                    OR tbn1_dim_mi_clave_origen.clave_origen<>query.clave_origen OR (tbn1_dim_mi_clave_origen.clave_origen IS NULL AND query.clave_origen IS NOT NULL) OR  (tbn1_dim_mi_clave_origen.clave_origen IS NOT NULL AND query.clave_origen IS NULL)
                    OR tbn1_dim_mi_clave_origen.origen<>query.origen OR (tbn1_dim_mi_clave_origen.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_origen.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_origen=query.cod_clave_origen,
      clave_origen=query.clave_origen,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_origen,cod_clave_origen,clave_origen,origen) VALUES (
      query.id_clave_origen,
      query.cod_clave_origen,
      query.clave_origen,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198(
  id_clave_operacion_198 int NOT NULL,
  cod_clave_operacion_198 varchar(1),
  clave_operacion_198 varchar(300),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_operacion_198 PRIMARY KEY CLUSTERED (id_clave_operacion_198)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='id_clave_operacion_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ADD id_clave_operacion_198 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='cod_clave_operacion_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ADD cod_clave_operacion_198 varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='clave_operacion_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ADD clave_operacion_198 varchar(300)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_OPERACION_198_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='id_clave_operacion_198' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ALTER COLUMN id_clave_operacion_198 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='cod_clave_operacion_198' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ALTER COLUMN cod_clave_operacion_198 varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='clave_operacion_198' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ALTER COLUMN clave_operacion_198 varchar(300) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_operacion_198' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_operacion_198')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 ADD CONSTRAINT PK_tbn1_dim_mi_clave_operacion_198 PRIMARY KEY CLUSTERED (id_clave_operacion_198)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_operacion_198' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_198;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_198(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_198'
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
      id_clave_operacion_198,
      cod_clave_operacion_198,
      clave_operacion_198,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_operacion_198 AS tbn1_dim_mi_clave_operacion_198
  USING query ON query.id_clave_operacion_198=tbn1_dim_mi_clave_operacion_198.id_clave_operacion_198
  WHEN MATCHED AND ((tbn1_dim_mi_clave_operacion_198.cod_clave_operacion_198<>query.cod_clave_operacion_198 OR (tbn1_dim_mi_clave_operacion_198.cod_clave_operacion_198 IS NULL AND query.cod_clave_operacion_198 IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion_198.cod_clave_operacion_198 IS NOT NULL AND query.cod_clave_operacion_198 IS NULL)
                    OR tbn1_dim_mi_clave_operacion_198.clave_operacion_198<>query.clave_operacion_198 OR (tbn1_dim_mi_clave_operacion_198.clave_operacion_198 IS NULL AND query.clave_operacion_198 IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion_198.clave_operacion_198 IS NOT NULL AND query.clave_operacion_198 IS NULL)
                    OR tbn1_dim_mi_clave_operacion_198.origen<>query.origen OR (tbn1_dim_mi_clave_operacion_198.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_operacion_198.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_operacion_198=query.cod_clave_operacion_198,
      clave_operacion_198=query.clave_operacion_198,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_operacion_198,cod_clave_operacion_198,clave_operacion_198,origen) VALUES (
      query.id_clave_operacion_198,
      query.cod_clave_operacion_198,
      query.clave_operacion_198,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor(
  id_clave_valor int NOT NULL,
  cod_clave_valor varchar(1),
  clave_valor varchar(300),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_clave_valor PRIMARY KEY CLUSTERED (id_clave_valor)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='id_clave_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ADD id_clave_valor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='cod_clave_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ADD cod_clave_valor varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='clave_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ADD clave_valor varchar(300)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_CLAVE_VALOR_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='id_clave_valor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ALTER COLUMN id_clave_valor int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='cod_clave_valor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ALTER COLUMN cod_clave_valor varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='clave_valor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ALTER COLUMN clave_valor varchar(300) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_clave_valor' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_clave_valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor ADD CONSTRAINT PK_tbn1_dim_mi_clave_valor PRIMARY KEY CLUSTERED (id_clave_valor)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_clave_valor' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_valor;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_clave_valor(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_valor'
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
      id_clave_valor,
      cod_clave_valor,
      clave_valor,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_clave_valor
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_clave_valor AS tbn1_dim_mi_clave_valor
  USING query ON query.id_clave_valor=tbn1_dim_mi_clave_valor.id_clave_valor
  WHEN MATCHED AND ((tbn1_dim_mi_clave_valor.cod_clave_valor<>query.cod_clave_valor OR (tbn1_dim_mi_clave_valor.cod_clave_valor IS NULL AND query.cod_clave_valor IS NOT NULL) OR  (tbn1_dim_mi_clave_valor.cod_clave_valor IS NOT NULL AND query.cod_clave_valor IS NULL)
                    OR tbn1_dim_mi_clave_valor.clave_valor<>query.clave_valor OR (tbn1_dim_mi_clave_valor.clave_valor IS NULL AND query.clave_valor IS NOT NULL) OR  (tbn1_dim_mi_clave_valor.clave_valor IS NOT NULL AND query.clave_valor IS NULL)
                    OR tbn1_dim_mi_clave_valor.origen<>query.origen OR (tbn1_dim_mi_clave_valor.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_clave_valor.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_clave_valor=query.cod_clave_valor,
      clave_valor=query.clave_valor,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_clave_valor,cod_clave_valor,clave_valor,origen) VALUES (
      query.id_clave_valor,
      query.cod_clave_valor,
      query.clave_valor,
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda(
  id_administracion int NOT NULL,
  cod_administracion varchar(1),
  cod_provincia int,
  administracion varchar(50),
  origen varchar(10) NOT NULL,
  CONSTRAINT PK_tbn1_dim_mi_administracion_hacienda PRIMARY KEY CLUSTERED (id_administracion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='id_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ADD id_administracion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='cod_administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ADD cod_administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ADD administracion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ADD CONSTRAINT DF_DBO_TBN1_DIM_MI_ADMINISTRACION_HACIENDA_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='id_administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ALTER COLUMN id_administracion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='cod_administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ALTER COLUMN cod_administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ALTER COLUMN administracion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_mi_administracion_hacienda' AND CONSTRAINT_NAME='PK_tbn1_dim_mi_administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda ADD CONSTRAINT PK_tbn1_dim_mi_administracion_hacienda PRIMARY KEY CLUSTERED (id_administracion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_mi_administracion_hacienda' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_administracion_hacienda;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_mi_administracion_hacienda(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_administracion_hacienda'
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
      id_administracion,
      cod_administracion,
	  cod_provincia,
      administracion,
      origen
    FROM dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_mi_administracion_hacienda AS tbn1_dim_mi_administracion_hacienda
  USING query ON query.id_administracion=tbn1_dim_mi_administracion_hacienda.id_administracion
  WHEN MATCHED AND ((tbn1_dim_mi_administracion_hacienda.cod_administracion<>query.cod_administracion OR (tbn1_dim_mi_administracion_hacienda.cod_administracion IS NULL AND query.cod_administracion IS NOT NULL) OR  (tbn1_dim_mi_administracion_hacienda.cod_administracion IS NOT NULL AND query.cod_administracion IS NULL)
                    OR tbn1_dim_mi_administracion_hacienda.cod_provincia<>query.cod_provincia OR (tbn1_dim_mi_administracion_hacienda.cod_provincia IS NULL AND query.cod_provincia IS NOT NULL) OR  (tbn1_dim_mi_administracion_hacienda.cod_provincia IS NOT NULL AND query.cod_provincia IS NULL)  
                    OR tbn1_dim_mi_administracion_hacienda.administracion<>query.administracion OR (tbn1_dim_mi_administracion_hacienda.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_dim_mi_administracion_hacienda.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_dim_mi_administracion_hacienda.origen<>query.origen OR (tbn1_dim_mi_administracion_hacienda.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_dim_mi_administracion_hacienda.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      cod_administracion=query.cod_administracion,
      cod_provincia=query.cod_provincia,	  
      administracion=query.administracion,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_administracion,cod_administracion,cod_provincia,administracion,origen) VALUES (
      query.id_administracion,
      query.cod_administracion,
	  query.cod_provincia,
      query.administracion,
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


/****************************/
/*tbn1_mae_claves_residencia*/
/****************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_residencia')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_residencia(
	  id_clave_residencia	int NOT NULL,
	  cod_clave_residencia	varchar(1),
	  clave_residencia		varchar(100),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mae_claves_residencia PRIMARY KEY CLUSTERED (id_clave_residencia)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_claves_residencia' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_residencia;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_residencia(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_residencia'
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
			SELECT	id_clave_residencia,
					cod_clave_residencia,
					clave_residencia,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_claves_residencia
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_residencia AS destino
		USING query ON query.id_clave_residencia = destino.id_clave_residencia
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_residencia<>query.cod_clave_residencia OR (destino.cod_clave_residencia IS NULL AND query.cod_clave_residencia IS NOT NULL) OR (destino.cod_clave_residencia IS NOT NULL AND query.cod_clave_residencia IS NULL)
			OR	destino.clave_residencia<>query.clave_residencia OR (destino.clave_residencia IS NULL AND query.clave_residencia IS NOT NULL) OR (destino.clave_residencia IS NOT NULL AND query.clave_residencia IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_residencia = query.cod_clave_residencia,
					clave_residencia = query.clave_residencia,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_residencia,
				cod_clave_residencia,
				clave_residencia,
				origen
			) 
			VALUES 
			(
				query.id_clave_residencia,
				query.cod_clave_residencia,
				query.clave_residencia,
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

/****************************/
/*tbn1_mae_claves_declarante*/
/****************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_claves_declarante')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_declarante(
	  id_clave_declarante	int NOT NULL,
	  cod_clave_declarante	varchar(1),
	  clave_declarante		varchar(150),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mae_claves_declarante PRIMARY KEY CLUSTERED (id_clave_declarante)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_claves_declarante' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_declarante;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_declarante(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_declarante'
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
			SELECT	id_clave_declarante,
					cod_clave_declarante,
					clave_declarante,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_claves_declarante
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mae_claves_declarante AS destino
		USING query ON query.id_clave_declarante = destino.id_clave_declarante
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_declarante<>query.cod_clave_declarante OR (destino.cod_clave_declarante IS NULL AND query.cod_clave_declarante IS NOT NULL) OR (destino.cod_clave_declarante IS NOT NULL AND query.cod_clave_declarante IS NULL)
			OR	destino.clave_declarante<>query.clave_declarante OR (destino.clave_declarante IS NULL AND query.clave_declarante IS NOT NULL) OR (destino.clave_declarante IS NOT NULL AND query.clave_declarante IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_declarante = query.cod_clave_declarante,
					clave_declarante = query.clave_declarante,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_declarante,
				cod_clave_declarante,
				clave_declarante,
				origen
			) 
			VALUES 
			(
				query.id_clave_declarante,
				query.cod_clave_declarante,
				query.clave_declarante,
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

/*********************************/
/*tbn1_mi_mae_tipos_operacion_192*/
/*********************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_tipos_operacion_192')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_operacion_192(
	  id_tipo_operacion_192		int NOT NULL,
	  cod_tipo_operacion_192	varchar(2),
	  tipo_operacion_192		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_tipos_operacion_192 PRIMARY KEY CLUSTERED (id_tipo_operacion_192)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_tipos_operacion_192' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_tipos_operacion_192;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_tipos_operacion_192(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_tipos_operacion_192'
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
			SELECT	id_tipo_operacion_192,
					cod_tipo_operacion_192,
					tipo_operacion_192,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipos_operacion_192
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_tipos_operacion_192 AS destino
		USING query ON query.id_tipo_operacion_192 = destino.id_tipo_operacion_192
		
		WHEN MATCHED 
		AND (
				destino.cod_tipo_operacion_192<>query.cod_tipo_operacion_192 OR (destino.cod_tipo_operacion_192 IS NULL AND query.cod_tipo_operacion_192 IS NOT NULL) OR (destino.cod_tipo_operacion_192 IS NOT NULL AND query.cod_tipo_operacion_192 IS NULL)
			OR	destino.tipo_operacion_192<>query.tipo_operacion_192 OR (destino.tipo_operacion_192 IS NULL AND query.tipo_operacion_192 IS NOT NULL) OR (destino.tipo_operacion_192 IS NOT NULL AND query.tipo_operacion_192 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_tipo_operacion_192 = query.cod_tipo_operacion_192,
					tipo_operacion_192 = query.tipo_operacion_192,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_tipo_operacion_192,
				cod_tipo_operacion_192,
				tipo_operacion_192,
				origen
			) 
			VALUES 
			(
				query.id_tipo_operacion_192,
				query.cod_tipo_operacion_192,
				query.tipo_operacion_192,
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

/*****************************/
/*tbn1_mi_mae_claves_traspaso*/
/*****************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_claves_traspaso')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_traspaso(
	  id_clave_traspaso		int NOT NULL,
	  cod_clave_traspaso	varchar(1),
	  clave_traspaso		varchar(100),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_claves_traspaso PRIMARY KEY CLUSTERED (id_clave_traspaso)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_claves_traspaso' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_traspaso;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_traspaso(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_traspaso'
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
			SELECT	id_clave_traspaso,
					cod_clave_traspaso,
					clave_traspaso,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_claves_traspaso
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_traspaso AS destino
		USING query ON query.id_clave_traspaso = destino.id_clave_traspaso
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_traspaso<>query.cod_clave_traspaso OR (destino.cod_clave_traspaso IS NULL AND query.cod_clave_traspaso IS NOT NULL) OR (destino.cod_clave_traspaso IS NOT NULL AND query.cod_clave_traspaso IS NULL)
			OR	destino.clave_traspaso<>query.clave_traspaso OR (destino.clave_traspaso IS NULL AND query.clave_traspaso IS NOT NULL) OR (destino.clave_traspaso IS NOT NULL AND query.clave_traspaso IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_traspaso = query.cod_clave_traspaso,
					clave_traspaso = query.clave_traspaso,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_traspaso,
				cod_clave_traspaso,
				clave_traspaso,
				origen
			) 
			VALUES 
			(
				query.id_clave_traspaso,
				query.cod_clave_traspaso,
				query.clave_traspaso,
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

/**********************************/
/*tbn1_mi_mae_claves_operacion_192*/
/*********************************/
--TABLA--
USE dbn1_dmr_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_mae_claves_operacion_192')
	CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_operacion_192(
	  id_clave_operacion_192	int NOT NULL,
	  cod_clave_operacion_192	varchar(1),
	  clave_operacion_192		varchar(100),
	  origen					varchar(10) NOT NULL,
	  CONSTRAINT PK_tbn1_mi_mae_claves_operacion_192 PRIMARY KEY CLUSTERED (id_clave_operacion_192)
	)
GO

--SP CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_mae_claves_operacion_192' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_operacion_192;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_mae_claves_operacion_192(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_operacion_192'
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
			SELECT	id_clave_operacion_192,
					cod_clave_operacion_192,
					clave_operacion_192,
					origen
			FROM	dbn1_norm_dhyf.dbo.tbn1_mi_claves_operacion_192
		)
		MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_mae_claves_operacion_192 AS destino
		USING query ON query.id_clave_operacion_192 = destino.id_clave_operacion_192
		
		WHEN MATCHED 
		AND (
				destino.cod_clave_operacion_192<>query.cod_clave_operacion_192 OR (destino.cod_clave_operacion_192 IS NULL AND query.cod_clave_operacion_192 IS NOT NULL) OR (destino.cod_clave_operacion_192 IS NOT NULL AND query.cod_clave_operacion_192 IS NULL)
			OR	destino.clave_operacion_192<>query.clave_operacion_192 OR (destino.clave_operacion_192 IS NULL AND query.clave_operacion_192 IS NOT NULL) OR (destino.clave_operacion_192 IS NOT NULL AND query.clave_operacion_192 IS NULL)
			OR	destino.origen<>query.origen OR (destino.origen IS NULL AND query.origen IS NOT NULL) OR (destino.origen IS NOT NULL AND query.origen IS NULL)
			)
		THEN
			UPDATE 
			SET		cod_clave_operacion_192 = query.cod_clave_operacion_192,
					clave_operacion_192 = query.clave_operacion_192,
					origen = query.origen
		
		WHEN NOT MATCHED THEN
			INSERT
			(
				id_clave_operacion_192,
				cod_clave_operacion_192,
				clave_operacion_192,
				origen
			) 
			VALUES 
			(
				query.id_clave_operacion_192,
				query.cod_clave_operacion_192,
				query.clave_operacion_192,
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

/******************************/
/*SP PADRE CON LAS EJECUCIONES*/
/******************************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_maestros_af' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_maestros_af;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_maestros_af(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_maestros_af'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_tipo_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_identificacion_fondo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_origen @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_operacion_198 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_clave_valor @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_mi_administracion_hacienda @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_residencia @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_declarante @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_tipos_operacion_192 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_traspaso @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_mae_claves_operacion_192 @log;

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

