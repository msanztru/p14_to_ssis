PRINT 'normalizado_maestros_180.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180(
  id_origen_180 int IDENTITY(1,1),
  cod_origen_180 varchar(2),
  origen_180 varchar(65),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_origen_180 UNIQUE (cod_origen_180),
  CONSTRAINT PK_tbn1_mi_origen_180 PRIMARY KEY CLUSTERED (id_origen_180)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='id_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD id_origen_180 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='cod_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD cod_origen_180 varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD origen_180 varchar(65)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD CONSTRAINT DF_DBO_TBN1_MI_ORIGEN_180_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='id_origen_180' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN id_origen_180 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='cod_origen_180' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN cod_origen_180 varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='origen_180' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN origen_180 varchar(65) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_180' AND CONSTRAINT_NAME='PK_tbn1_mi_origen_180')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 ADD CONSTRAINT PK_tbn1_mi_origen_180 PRIMARY KEY CLUSTERED (id_origen_180)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_origen_180,'Indefinido' AS origen_180
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 AS tbn1_mi_origen_180
USING query ON query.es_indefinido=tbn1_mi_origen_180.es_indefinido
WHEN MATCHED AND ((tbn1_mi_origen_180.cod_origen_180<>query.cod_origen_180 OR (tbn1_mi_origen_180.cod_origen_180 IS NULL AND query.cod_origen_180 IS NOT NULL) OR  (tbn1_mi_origen_180.cod_origen_180 IS NOT NULL AND query.cod_origen_180 IS NULL)
                  OR tbn1_mi_origen_180.origen_180<>query.origen_180 OR (tbn1_mi_origen_180.origen_180 IS NULL AND query.origen_180 IS NOT NULL) OR  (tbn1_mi_origen_180.origen_180 IS NOT NULL AND query.origen_180 IS NULL))) THEN
  UPDATE SET
    cod_origen_180=query.cod_origen_180,
    origen_180=query.origen_180
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_origen_180,origen_180) VALUES (
    query.es_indefinido,
    query.cod_origen_180,
    query.origen_180);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_origen_180' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_180;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_180(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_180'
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
      cod_origen_180,
      descripcion_origen_180 AS origen_180
    FROM
      (SELECT '' cod_origen_180,'Presentación en Bizkaia o intercambio otras Administraciones' descripcion_origen_180
       UNION ALL SELECT 'PD','Liquid. sin vb difer.180-10T'
       UNION ALL SELECT 'LD','Liqu. Dif. 180-10I') origen_180
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen_180 AS tbn1_mi_origen_180
  USING query ON query.cod_origen_180=tbn1_mi_origen_180.cod_origen_180
  WHEN MATCHED AND ((tbn1_mi_origen_180.origen_180<>query.origen_180 OR (tbn1_mi_origen_180.origen_180 IS NULL AND query.origen_180 IS NOT NULL) OR  (tbn1_mi_origen_180.origen_180 IS NOT NULL AND query.origen_180 IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      origen_180=query.origen_180,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_origen_180,origen_180,fec_alta,fec_modificacion) VALUES (
      query.cod_origen_180,
      query.origen_180,
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

