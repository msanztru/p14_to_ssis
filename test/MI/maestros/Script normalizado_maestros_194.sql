PRINT 'normalizado_maestros_194.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion(
  id_origen_operacion int IDENTITY(1,1),
  cod_origen_operacion varchar(1),
  origen_operacion varchar(70),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_origen_operacion UNIQUE (cod_origen_operacion),
  CONSTRAINT PK_tbn1_mi_origen_operacion PRIMARY KEY CLUSTERED (id_origen_operacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='id_origen_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD id_origen_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='cod_origen_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD cod_origen_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='origen_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD origen_operacion varchar(70)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD CONSTRAINT DF_DBO_TBN1_MI_ORIGEN_OPERACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='id_origen_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN id_origen_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='cod_origen_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN cod_origen_operacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='origen_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN origen_operacion varchar(70) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_origen_operacion' AND CONSTRAINT_NAME='PK_tbn1_mi_origen_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion ADD CONSTRAINT PK_tbn1_mi_origen_operacion PRIMARY KEY CLUSTERED (id_origen_operacion)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_origen_operacion,'Indefinido' AS origen_operacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion AS tbn1_mi_origen_operacion
USING query ON query.es_indefinido=tbn1_mi_origen_operacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_origen_operacion.cod_origen_operacion<>query.cod_origen_operacion OR (tbn1_mi_origen_operacion.cod_origen_operacion IS NULL AND query.cod_origen_operacion IS NOT NULL) OR  (tbn1_mi_origen_operacion.cod_origen_operacion IS NOT NULL AND query.cod_origen_operacion IS NULL)
                  OR tbn1_mi_origen_operacion.origen_operacion<>query.origen_operacion OR (tbn1_mi_origen_operacion.origen_operacion IS NULL AND query.origen_operacion IS NOT NULL) OR  (tbn1_mi_origen_operacion.origen_operacion IS NOT NULL AND query.origen_operacion IS NULL))) THEN
  UPDATE SET
    cod_origen_operacion=query.cod_origen_operacion,
    origen_operacion=query.origen_operacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_origen_operacion,origen_operacion) VALUES (
    query.es_indefinido,
    query.cod_origen_operacion,
    query.origen_operacion);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_origen_operacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_origen_operacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion'
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
      cod_origen_operacion,
      descripcion_origen_operacion AS origen_operacion
    FROM
      (SELECT 'A' cod_origen_operacion,'Transmisión' descripcion_origen_operacion
       UNION ALL SELECT 'B','Amortización'
       UNION ALL SELECT 'C','Canje'
       UNION ALL SELECT 'D','Trans.30 días antes vto cupón'
       UNION ALL SELECT 'E','Cesión temporal'
       UNION ALL SELECT 'U','Cooperativas: Reembolso de aportaciones'
       UNION ALL SELECT 'V','Cooperativas: Transmisión «inter vivos» de aportaciones'
       UNION ALL SELECT 'X','Cooperativas: Transmisión «mortis causa» de aportaciones'
       UNION ALL SELECT 'Y','Cooperativas: Traslado a otra cooperativa de aportaciones'
       UNION ALL SELECT 'Z','Cooperativas: Aportaciones: Constitución o cesión de derechos reales') origen_operacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion AS tbn1_mi_origen_operacion
  USING query ON query.cod_origen_operacion=tbn1_mi_origen_operacion.cod_origen_operacion
  WHEN MATCHED AND ((tbn1_mi_origen_operacion.origen_operacion<>query.origen_operacion OR (tbn1_mi_origen_operacion.origen_operacion IS NULL AND query.origen_operacion IS NOT NULL) OR  (tbn1_mi_origen_operacion.origen_operacion IS NOT NULL AND query.origen_operacion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      origen_operacion=query.origen_operacion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_origen_operacion,origen_operacion,fec_alta,fec_modificacion) VALUES (
      query.cod_origen_operacion,
      query.origen_operacion,
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

