PRINT 'normalizado_maestros_193.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago(
  id_pago int IDENTITY(1,1),
  cod_pago varchar(1),
  pago varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_pago UNIQUE (cod_pago),
  CONSTRAINT PK_tbn1_mi_pago PRIMARY KEY CLUSTERED (id_pago)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='id_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD id_pago int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='cod_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD cod_pago varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD pago varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD CONSTRAINT DF_DBO_TBN1_MI_PAGO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='id_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN id_pago int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='cod_pago' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN cod_pago varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='pago' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN pago varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_pago' AND CONSTRAINT_NAME='PK_tbn1_mi_pago')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_pago ADD CONSTRAINT PK_tbn1_mi_pago PRIMARY KEY CLUSTERED (id_pago)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_pago,'Indefinido' AS pago
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_pago AS tbn1_mi_pago
USING query ON query.es_indefinido=tbn1_mi_pago.es_indefinido
WHEN MATCHED AND ((tbn1_mi_pago.cod_pago<>query.cod_pago OR (tbn1_mi_pago.cod_pago IS NULL AND query.cod_pago IS NOT NULL) OR  (tbn1_mi_pago.cod_pago IS NOT NULL AND query.cod_pago IS NULL)
                  OR tbn1_mi_pago.pago<>query.pago OR (tbn1_mi_pago.pago IS NULL AND query.pago IS NOT NULL) OR  (tbn1_mi_pago.pago IS NOT NULL AND query.pago IS NULL))) THEN
  UPDATE SET
    cod_pago=query.cod_pago,
    pago=query.pago
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_pago,pago) VALUES (
    query.es_indefinido,
    query.cod_pago,
    query.pago);
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro(
  id_tipo_registro int IDENTITY(1,1),
  cod_tipo_registro varchar(1),
  tipo_registro varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_tipo_registro UNIQUE (cod_tipo_registro),
  CONSTRAINT PK_tbn1_mi_tipo_registro PRIMARY KEY CLUSTERED (id_tipo_registro)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='id_tipo_registro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD id_tipo_registro int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='cod_tipo_registro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD cod_tipo_registro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='tipo_registro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD tipo_registro varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_REGISTRO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='id_tipo_registro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN id_tipo_registro int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='cod_tipo_registro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN cod_tipo_registro varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='tipo_registro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN tipo_registro varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_registro' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_registro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro ADD CONSTRAINT PK_tbn1_mi_tipo_registro PRIMARY KEY CLUSTERED (id_tipo_registro)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_tipo_registro,'Indefinido' AS tipo_registro
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro AS tbn1_mi_tipo_registro
USING query ON query.es_indefinido=tbn1_mi_tipo_registro.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_registro.cod_tipo_registro<>query.cod_tipo_registro OR (tbn1_mi_tipo_registro.cod_tipo_registro IS NULL AND query.cod_tipo_registro IS NOT NULL) OR  (tbn1_mi_tipo_registro.cod_tipo_registro IS NOT NULL AND query.cod_tipo_registro IS NULL)
                  OR tbn1_mi_tipo_registro.tipo_registro<>query.tipo_registro OR (tbn1_mi_tipo_registro.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_mi_tipo_registro.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL))) THEN
  UPDATE SET
    cod_tipo_registro=query.cod_tipo_registro,
    tipo_registro=query.tipo_registro
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_registro,tipo_registro) VALUES (
    query.es_indefinido,
    query.cod_tipo_registro,
    query.tipo_registro);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_pago' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_pago;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_pago(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_pago'
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
      cod_pago,
      descripcion_pago AS pago
    FROM
      (SELECT 1 cod_pago,'Emisor' descripcion_pago
       UNION ALL SELECT 2,'Mediador') pago
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_pago AS tbn1_mi_pago
  USING query ON query.cod_pago=tbn1_mi_pago.cod_pago
  WHEN MATCHED AND ((tbn1_mi_pago.pago<>query.pago OR (tbn1_mi_pago.pago IS NULL AND query.pago IS NOT NULL) OR  (tbn1_mi_pago.pago IS NOT NULL AND query.pago IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      pago=query.pago,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_pago,pago,fec_alta,fec_modificacion) VALUES (
      query.cod_pago,
      query.pago,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_registro' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_registro;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_registro(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_registro'
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
      cod_tipo_registro,
      descripcion_tipo_registro AS tipo_registro
    FROM
      (SELECT 'I' cod_tipo_registro,'Percepción' descripcion_tipo_registro
       UNION ALL SELECT 'G','Gastos') tipo_registro
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro AS tbn1_mi_tipo_registro
  USING query ON query.cod_tipo_registro=tbn1_mi_tipo_registro.cod_tipo_registro
  WHEN MATCHED AND ((tbn1_mi_tipo_registro.tipo_registro<>query.tipo_registro OR (tbn1_mi_tipo_registro.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_mi_tipo_registro.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_registro=query.tipo_registro,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_registro,tipo_registro,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_registro,
      query.tipo_registro,
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

