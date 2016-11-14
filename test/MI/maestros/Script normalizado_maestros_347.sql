PRINT 'normalizado_maestros_347.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura(
  id_tipo_operacion_fact int IDENTITY(1,1),
  cod_tipo_operacion_fact varchar(1),
  tipo_operacion_fact varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_mi_tipo_operacion_fact UNIQUE (cod_tipo_operacion_fact),
  CONSTRAINT PK_tbn1_mi_tipo_operacion_factura PRIMARY KEY CLUSTERED (id_tipo_operacion_fact)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='id_tipo_operacion_fact')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD id_tipo_operacion_fact int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='cod_tipo_operacion_fact')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD cod_tipo_operacion_fact varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='tipo_operacion_fact')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD tipo_operacion_fact varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_OPERACION_FACTURA_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='id_tipo_operacion_fact' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN id_tipo_operacion_fact int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='cod_tipo_operacion_fact' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN cod_tipo_operacion_fact varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='tipo_operacion_fact' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN tipo_operacion_fact varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_operacion_factura' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_operacion_factura')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura ADD CONSTRAINT PK_tbn1_mi_tipo_operacion_factura PRIMARY KEY CLUSTERED (id_tipo_operacion_fact)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS cod_tipo_operacion_fact,'Indefinido' AS tipo_operacion_fact
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura AS tbn1_mi_tipo_operacion_factura
USING query ON query.es_indefinido=tbn1_mi_tipo_operacion_factura.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_operacion_factura.cod_tipo_operacion_fact<>query.cod_tipo_operacion_fact OR (tbn1_mi_tipo_operacion_factura.cod_tipo_operacion_fact IS NULL AND query.cod_tipo_operacion_fact IS NOT NULL) OR  (tbn1_mi_tipo_operacion_factura.cod_tipo_operacion_fact IS NOT NULL AND query.cod_tipo_operacion_fact IS NULL)
                  OR tbn1_mi_tipo_operacion_factura.tipo_operacion_fact<>query.tipo_operacion_fact OR (tbn1_mi_tipo_operacion_factura.tipo_operacion_fact IS NULL AND query.tipo_operacion_fact IS NOT NULL) OR  (tbn1_mi_tipo_operacion_factura.tipo_operacion_fact IS NOT NULL AND query.tipo_operacion_fact IS NULL))) THEN
  UPDATE SET
    cod_tipo_operacion_fact=query.cod_tipo_operacion_fact,
    tipo_operacion_fact=query.tipo_operacion_fact
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_operacion_fact,tipo_operacion_fact) VALUES (
    query.es_indefinido,
    query.cod_tipo_operacion_fact,
    query.tipo_operacion_fact);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_operacion_factura' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_operacion_factura;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_operacion_factura(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_operacion_factura'
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
      cod_tipo_operacion AS cod_tipo_operacion_fact,
      descripcion_tipo_operacion AS tipo_operacion_fact
    FROM
      (SELECT 'C' cod_tipo_operacion,'Compras' descripcion_tipo_operacion
       UNION ALL SELECT 'V','Ventas'
       UNION ALL SELECT 'M','Mediación'
       UNION ALL SELECT 'P','Adquisición'
       UNION ALL SELECT 'S','Subvención') tipo_operacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion_factura AS tbn1_mi_tipo_operacion_factura
  USING query ON query.cod_tipo_operacion_fact=tbn1_mi_tipo_operacion_factura.cod_tipo_operacion_fact
  WHEN MATCHED AND ((tbn1_mi_tipo_operacion_factura.tipo_operacion_fact<>query.tipo_operacion_fact OR (tbn1_mi_tipo_operacion_factura.tipo_operacion_fact IS NULL AND query.tipo_operacion_fact IS NOT NULL) OR  (tbn1_mi_tipo_operacion_factura.tipo_operacion_fact IS NOT NULL AND query.tipo_operacion_fact IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_operacion_fact=query.tipo_operacion_fact,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_operacion_fact,tipo_operacion_fact,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_operacion_fact,
      query.tipo_operacion_fact,
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

