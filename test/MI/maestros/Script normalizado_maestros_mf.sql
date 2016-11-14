PRINT 'normalizado_maestros_mf.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja(
  id_tipo_hoja int IDENTITY(1,1),
  cod_tipo_hoja varchar(1),
  tipo_hoja varchar(25),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_hoja UNIQUE (cod_tipo_hoja),
  CONSTRAINT PK_tbn1_mi_tipo_hoja PRIMARY KEY CLUSTERED (id_tipo_hoja)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='id_tipo_hoja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD id_tipo_hoja int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='cod_tipo_hoja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD cod_tipo_hoja varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='tipo_hoja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD tipo_hoja varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_HOJA_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_HOJA_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='id_tipo_hoja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN id_tipo_hoja int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='cod_tipo_hoja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN cod_tipo_hoja varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='tipo_hoja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN tipo_hoja varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_hoja' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_hoja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ADD CONSTRAINT PK_tbn1_mi_tipo_hoja PRIMARY KEY CLUSTERED (id_tipo_hoja)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_hoja,'Indefinido' AS tipo_hoja
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja AS tbn1_mi_tipo_hoja
USING query ON query.es_indefinido=tbn1_mi_tipo_hoja.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_hoja.cod_tipo_hoja<>query.cod_tipo_hoja OR (tbn1_mi_tipo_hoja.cod_tipo_hoja IS NULL AND query.cod_tipo_hoja IS NOT NULL) OR  (tbn1_mi_tipo_hoja.cod_tipo_hoja IS NOT NULL AND query.cod_tipo_hoja IS NULL)
                  OR tbn1_mi_tipo_hoja.tipo_hoja<>query.tipo_hoja OR (tbn1_mi_tipo_hoja.tipo_hoja IS NULL AND query.tipo_hoja IS NOT NULL) OR  (tbn1_mi_tipo_hoja.tipo_hoja IS NOT NULL AND query.tipo_hoja IS NULL))) THEN
  UPDATE SET
    cod_tipo_hoja=query.cod_tipo_hoja,
    tipo_hoja=query.tipo_hoja
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_hoja,tipo_hoja) VALUES (
    query.es_indefinido,
    query.cod_tipo_hoja,
    query.tipo_hoja);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_hoja' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_hoja;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_hoja(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_hoja'
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
      cod_tipo_hoja,
      descripcion_tipo_hoja AS tipo_hoja,
      'MAESTRO' AS origen
    FROM
      (SELECT 'I' cod_tipo_hoja,'Registro operación' descripcion_tipo_hoja
       UNION ALL SELECT 'C','Registro comercio') tipo_hoja
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja AS tbn1_mi_tipo_hoja
  USING query ON query.cod_tipo_hoja=tbn1_mi_tipo_hoja.cod_tipo_hoja
  WHEN MATCHED AND ((tbn1_mi_tipo_hoja.tipo_hoja<>query.tipo_hoja OR (tbn1_mi_tipo_hoja.tipo_hoja IS NULL AND query.tipo_hoja IS NOT NULL) OR  (tbn1_mi_tipo_hoja.tipo_hoja IS NOT NULL AND query.tipo_hoja IS NULL)
                    OR tbn1_mi_tipo_hoja.origen<>query.origen OR (tbn1_mi_tipo_hoja.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipo_hoja.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_hoja=query.tipo_hoja,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_hoja,tipo_hoja,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_hoja,
      query.tipo_hoja,
      query.origen,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

	--	  incluir registro -1
	
	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ON

IF NOT EXISTS
(
	SELECT	1
	FROM	dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja
	WHERE	id_tipo_hoja = -1
)
	INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja
	(
		id_tipo_hoja,
		cod_tipo_hoja,
		tipo_hoja,
		origen
	)
	VALUES
	(
		-1,
		'-',
		'N/A (EXTERNO)',
		'EXTERNOS'
	)

SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja OFF

	  
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_hoja_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_hoja_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_hoja_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_hoja_integridad'
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
      mfpe70_hoja AS cod_tipo_hoja,
      'CLAVE FALTANTE MAESTRO' AS tipo_hoja,
      'MODELO 170' AS origen
    FROM dbo.tbn1pe70_mf
    GROUP BY mfpe70_hoja
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja(cod_tipo_hoja,tipo_hoja,origen)
  SELECT
    query.cod_tipo_hoja,
    query.tipo_hoja,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja ON (tbn1_mi_tipo_hoja.cod_tipo_hoja=query.cod_tipo_hoja)
  WHERE tbn1_mi_tipo_hoja.cod_tipo_hoja IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(
  id_clave_tipo_codigo int IDENTITY(1,1),
  cod_clave_tipo_codigo varchar(1),
  clave_tipo_codigo varchar(55),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_tipo_codigo UNIQUE (cod_clave_tipo_codigo),
  CONSTRAINT PK_tbn1_mi_clave_tipo_codigo PRIMARY KEY CLUSTERED (id_clave_tipo_codigo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='id_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD id_clave_tipo_codigo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='cod_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD cod_clave_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD clave_tipo_codigo varchar(55)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_TIPO_CODIGO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_TIPO_CODIGO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='id_clave_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN id_clave_tipo_codigo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='cod_clave_tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN cod_clave_tipo_codigo varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='clave_tipo_codigo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN clave_tipo_codigo varchar(55) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_tipo_codigo' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_tipo_codigo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ADD CONSTRAINT PK_tbn1_mi_clave_tipo_codigo PRIMARY KEY CLUSTERED (id_clave_tipo_codigo)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_tipo_codigo,'Indefinido' AS clave_tipo_codigo
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo AS tbn1_mi_clave_tipo_codigo
USING query ON query.es_indefinido=tbn1_mi_clave_tipo_codigo.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo<>query.cod_clave_tipo_codigo OR (tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NULL AND query.cod_clave_tipo_codigo IS NOT NULL) OR  (tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NOT NULL AND query.cod_clave_tipo_codigo IS NULL)
                  OR tbn1_mi_clave_tipo_codigo.clave_tipo_codigo<>query.clave_tipo_codigo OR (tbn1_mi_clave_tipo_codigo.clave_tipo_codigo IS NULL AND query.clave_tipo_codigo IS NOT NULL) OR  (tbn1_mi_clave_tipo_codigo.clave_tipo_codigo IS NOT NULL AND query.clave_tipo_codigo IS NULL))) THEN
  UPDATE SET
    cod_clave_tipo_codigo=query.cod_clave_tipo_codigo,
    clave_tipo_codigo=query.clave_tipo_codigo
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_tipo_codigo,clave_tipo_codigo) VALUES (
    query.es_indefinido,
    query.cod_clave_tipo_codigo,
    query.clave_tipo_codigo);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_tipo_codigo' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo'
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
      cod_clave_tipo_codigo,
      descripcion_clave_tipo_codigo AS clave_tipo_codigo,
      'MAESTRO' AS origen
    FROM
      (SELECT 'C' cod_clave_tipo_codigo,'Identificación con Código Cuenta Cliente (C.C.C.)' descripcion_clave_tipo_codigo
       UNION ALL SELECT 'O','Otra identificación') clave_tipo_codigo
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo AS tbn1_mi_clave_tipo_codigo
  USING query ON query.cod_clave_tipo_codigo=tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo
  WHEN MATCHED AND ((tbn1_mi_clave_tipo_codigo.clave_tipo_codigo<>query.clave_tipo_codigo OR (tbn1_mi_clave_tipo_codigo.clave_tipo_codigo IS NULL AND query.clave_tipo_codigo IS NOT NULL) OR  (tbn1_mi_clave_tipo_codigo.clave_tipo_codigo IS NOT NULL AND query.clave_tipo_codigo IS NULL)
                    OR tbn1_mi_clave_tipo_codigo.origen<>query.origen OR (tbn1_mi_clave_tipo_codigo.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_tipo_codigo.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_tipo_codigo=query.clave_tipo_codigo,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_tipo_codigo,clave_tipo_codigo,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_tipo_codigo,
      query.clave_tipo_codigo,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_170' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_170;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_170(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_170'
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
      mfpe70_tipo_codigo AS cod_clave_tipo_codigo,
      'CLAVE FALTANTE MAESTRO' AS clave_tipo_codigo,
      'MODELO 170' AS origen
    FROM dbo.tbn1pe70_mf
    GROUP BY mfpe70_tipo_codigo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(cod_clave_tipo_codigo,clave_tipo_codigo,origen)
  SELECT
    query.cod_clave_tipo_codigo,
    query.clave_tipo_codigo,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ON (tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo=query.cod_clave_tipo_codigo)
  WHERE tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_171' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_171;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_171(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_171'
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
      mfpe71_tipo_codigo AS cod_clave_tipo_codigo,
      'CLAVE FALTANTE MAESTRO' AS clave_tipo_codigo,
      'MODELO 171' AS origen
    FROM dbo.tbn1pe71_mf
    GROUP BY mfpe71_tipo_codigo
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo(cod_clave_tipo_codigo,clave_tipo_codigo,origen)
  SELECT
    query.cod_clave_tipo_codigo,
    query.clave_tipo_codigo,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo ON (tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo=query.cod_clave_tipo_codigo)
  WHERE tbn1_mi_clave_tipo_codigo.cod_clave_tipo_codigo IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion(
  id_tipo_identificacion int IDENTITY(1,1),
  cod_tipo_identificacion varchar(1),
  tipo_identificacion varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_identificacion UNIQUE (cod_tipo_identificacion),
  CONSTRAINT PK_tbn1_mi_tipo_identificacion PRIMARY KEY CLUSTERED (id_tipo_identificacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='id_tipo_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD id_tipo_identificacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='cod_tipo_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD cod_tipo_identificacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='tipo_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD tipo_identificacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_IDENTIFICACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD CONSTRAINT DF_DBO_TBN1_MI_TIPO_IDENTIFICACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='id_tipo_identificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN id_tipo_identificacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='cod_tipo_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN cod_tipo_identificacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='tipo_identificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN tipo_identificacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipo_identificacion' AND CONSTRAINT_NAME='PK_tbn1_mi_tipo_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ADD CONSTRAINT PK_tbn1_mi_tipo_identificacion PRIMARY KEY CLUSTERED (id_tipo_identificacion)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_identificacion,'Indefinido' AS tipo_identificacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion AS tbn1_mi_tipo_identificacion
USING query ON query.es_indefinido=tbn1_mi_tipo_identificacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipo_identificacion.cod_tipo_identificacion<>query.cod_tipo_identificacion OR (tbn1_mi_tipo_identificacion.cod_tipo_identificacion IS NULL AND query.cod_tipo_identificacion IS NOT NULL) OR  (tbn1_mi_tipo_identificacion.cod_tipo_identificacion IS NOT NULL AND query.cod_tipo_identificacion IS NULL)
                  OR tbn1_mi_tipo_identificacion.tipo_identificacion<>query.tipo_identificacion OR (tbn1_mi_tipo_identificacion.tipo_identificacion IS NULL AND query.tipo_identificacion IS NOT NULL) OR  (tbn1_mi_tipo_identificacion.tipo_identificacion IS NOT NULL AND query.tipo_identificacion IS NULL))) THEN
  UPDATE SET
    cod_tipo_identificacion=query.cod_tipo_identificacion,
    tipo_identificacion=query.tipo_identificacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_identificacion,tipo_identificacion) VALUES (
    query.es_indefinido,
    query.cod_tipo_identificacion,
    query.tipo_identificacion);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_identificacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion'
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
      cod_tipo_identificacion,
      descripcion_tipo_identificacion AS tipo_identificacion,
      'MAESTRO' AS origen
    FROM
      (SELECT 1 cod_tipo_identificacion,'Pasaporte' descripcion_tipo_identificacion
       UNION ALL SELECT 2,'Documento identidad válido en país origen'
       UNION ALL SELECT 3,'Otro') tipo_identificacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion AS tbn1_mi_tipo_identificacion
  USING query ON query.cod_tipo_identificacion=tbn1_mi_tipo_identificacion.cod_tipo_identificacion
  WHEN MATCHED AND ((tbn1_mi_tipo_identificacion.tipo_identificacion<>query.tipo_identificacion OR (tbn1_mi_tipo_identificacion.tipo_identificacion IS NULL AND query.tipo_identificacion IS NOT NULL) OR  (tbn1_mi_tipo_identificacion.tipo_identificacion IS NOT NULL AND query.tipo_identificacion IS NULL)
                    OR tbn1_mi_tipo_identificacion.origen<>query.origen OR (tbn1_mi_tipo_identificacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipo_identificacion.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_identificacion=query.tipo_identificacion,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_identificacion,tipo_identificacion,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_identificacion,
      query.tipo_identificacion,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipo_identificacion_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipo_identificacion_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_integridad'
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
      mfpe71_clav_cod_iden AS cod_tipo_identificacion,
      'CLAVE FALTANTE MAESTRO' AS tipo_identificacion,
      'MODELO 171' AS origen
    FROM dbo.tbn1pe71_mf
    GROUP BY mfpe71_clav_cod_iden
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion(cod_tipo_identificacion,tipo_identificacion,origen)
  SELECT
    query.cod_tipo_identificacion,
    query.tipo_identificacion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion ON (tbn1_mi_tipo_identificacion.cod_tipo_identificacion=query.cod_tipo_identificacion)
  WHERE tbn1_mi_tipo_identificacion.cod_tipo_identificacion IS NULL;

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


/*************************/
/*tbn1_mi_clave_declarado*/
/*************************/

--TABLA--
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(
  id_clave_declarado int IDENTITY(1,1),
  cod_clave_declarado varchar(1),
  clave_declarado varchar(300),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_declarado UNIQUE (cod_clave_declarado),
  CONSTRAINT PK_tbn1_mi_clave_declarado PRIMARY KEY CLUSTERED (id_clave_declarado)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='id_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD id_clave_declarado int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='cod_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD cod_clave_declarado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD clave_declarado varchar(300)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_DECLARADO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_DECLARADO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='id_clave_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN id_clave_declarado int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='cod_clave_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN cod_clave_declarado varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='clave_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN clave_declarado varchar(300) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_declarado' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ADD CONSTRAINT PK_tbn1_mi_clave_declarado PRIMARY KEY CLUSTERED (id_clave_declarado)

GO

--CARGA INDIFINIDO--
;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_declarado,'Indefinido' AS clave_declarado
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado AS tbn1_mi_clave_declarado
USING query ON query.es_indefinido=tbn1_mi_clave_declarado.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_declarado.cod_clave_declarado<>query.cod_clave_declarado OR (tbn1_mi_clave_declarado.cod_clave_declarado IS NULL AND query.cod_clave_declarado IS NOT NULL) OR  (tbn1_mi_clave_declarado.cod_clave_declarado IS NOT NULL AND query.cod_clave_declarado IS NULL)
                  OR tbn1_mi_clave_declarado.clave_declarado<>query.clave_declarado OR (tbn1_mi_clave_declarado.clave_declarado IS NULL AND query.clave_declarado IS NOT NULL) OR  (tbn1_mi_clave_declarado.clave_declarado IS NOT NULL AND query.clave_declarado IS NULL))) THEN
  UPDATE SET
    cod_clave_declarado=query.cod_clave_declarado,
    clave_declarado=query.clave_declarado
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_declarado,clave_declarado) VALUES (
    query.es_indefinido,
    query.cod_clave_declarado,
    query.clave_declarado);
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_declarado' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado'
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

	;WITH query AS 
	(
		SELECT	cod_clave_declarado,
				descripcion_clave_declarado AS clave_declarado,
				'MAESTRO' AS origen
		FROM	(
				SELECT	'T' AS cod_clave_declarado,
						'Titular de la cuenta' AS descripcion_clave_declarado
				UNION 
				SELECT	'A' AS cod_clave_declarado,
						'Autorizado' AS descripcion_clave_declarado
				UNION 
				SELECT	'O' AS cod_clave_declarado,
						'Otros' AS descripcion_clave_declarado
				UNION
				SELECT	'N' AS cod_clave_declarado,
						'Nudo propietario' AS descripcion_clave_declarado
				UNION
				SELECT	'U' AS cod_clave_declarado,
						'Usufructuario' AS descripcion_clave_declarado
				UNION
				SELECT	'B' AS cod_clave_declarado,
						'Perceptor de los rendimientos en el caso de las participaciones preferentes u otros instrumento de deuda' AS descripcion_clave_declarado
				UNION
				SELECT	'C' AS cod_clave_declarado,
						'Tercero por cuenta de quien se perciban los rendimientos en el caso de las participaciones preferentes' AS descripcion_clave_declarado
				UNION
				SELECT	'P' AS cod_clave_declarado,
						'Prestamista en los supuestos de préstamo de valores' AS descripcion_clave_declarado
				UNION
				SELECT	'Q' AS cod_clave_declarado,
						'Prestatario en los supuestos de préstamo de valores' AS descripcion_clave_declarado
				) clave_declarado
	)
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado AS tbn1_mi_clave_declarado
  USING query ON query.cod_clave_declarado=tbn1_mi_clave_declarado.cod_clave_declarado
  WHEN MATCHED AND ((tbn1_mi_clave_declarado.clave_declarado<>query.clave_declarado OR (tbn1_mi_clave_declarado.clave_declarado IS NULL AND query.clave_declarado IS NOT NULL) OR  (tbn1_mi_clave_declarado.clave_declarado IS NOT NULL AND query.clave_declarado IS NULL)
                    OR tbn1_mi_clave_declarado.origen<>query.origen OR (tbn1_mi_clave_declarado.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_declarado.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_declarado=query.clave_declarado,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_declarado,clave_declarado,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_declarado,
      query.clave_declarado,
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

--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_declarado_integridad_171' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_171;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_171(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_171'
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
      mfpe71_clav_declarado AS cod_clave_declarado,
      'CLAVE FALTANTE MAESTRO' AS clave_declarado,
      'MODELO 171' AS origen
    FROM dbo.tbn1pe71_mf
    GROUP BY mfpe71_clav_declarado
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(cod_clave_declarado,clave_declarado,origen)
  SELECT
    query.cod_clave_declarado,
    query.clave_declarado,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ON (tbn1_mi_clave_declarado.cod_clave_declarado=query.cod_clave_declarado)
  WHERE tbn1_mi_clave_declarado.cod_clave_declarado IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_declarado_integridad_192_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_internos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_internos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_internos'
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
      da20cldeclarado AS cod_clave_declarado,
      'CLAVE FALTANTE MAESTRO' AS clave_declarado,
      'INT. M-192' AS origen
    FROM dbo.tbn120da_af
    GROUP BY da20cldeclarado
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(cod_clave_declarado,clave_declarado,origen)
  SELECT
    query.cod_clave_declarado,
    query.clave_declarado,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ON (tbn1_mi_clave_declarado.cod_clave_declarado=query.cod_clave_declarado)
  WHERE tbn1_mi_clave_declarado.cod_clave_declarado IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_declarado_integridad_192_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_externos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_externos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_externos'
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
      px20cldeclarado AS cod_clave_declarado,
      'CLAVE FALTANTE MAESTRO' AS clave_declarado,
      'EXT. M-192' AS origen
    FROM dbo.tbn12xpe_af
    GROUP BY px20cldeclarado
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado(cod_clave_declarado,clave_declarado,origen)
  SELECT
    query.cod_clave_declarado,
    query.clave_declarado,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado ON (tbn1_mi_clave_declarado.cod_clave_declarado=query.cod_clave_declarado)
  WHERE tbn1_mi_clave_declarado.cod_clave_declarado IS NULL;

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
/*FIN - tbn1_mi_clave_declarado*/
/*******************************/


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion(
  id_clave_operacion int IDENTITY(1,1),
  cod_clave_operacion varchar(1),
  clave_operacion varchar(25),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_operacion UNIQUE (cod_clave_operacion),
  CONSTRAINT PK_tbn1_mi_clave_operacion PRIMARY KEY CLUSTERED (id_clave_operacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='id_clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD id_clave_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='cod_clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD cod_clave_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD clave_operacion varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_OPERACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_OPERACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='id_clave_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN id_clave_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='cod_clave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN cod_clave_operacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='clave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN clave_operacion varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ADD CONSTRAINT PK_tbn1_mi_clave_operacion PRIMARY KEY CLUSTERED (id_clave_operacion)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_operacion,'Indefinido' AS clave_operacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion AS tbn1_mi_clave_operacion
USING query ON query.es_indefinido=tbn1_mi_clave_operacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_operacion.cod_clave_operacion<>query.cod_clave_operacion OR (tbn1_mi_clave_operacion.cod_clave_operacion IS NULL AND query.cod_clave_operacion IS NOT NULL) OR  (tbn1_mi_clave_operacion.cod_clave_operacion IS NOT NULL AND query.cod_clave_operacion IS NULL)
                  OR tbn1_mi_clave_operacion.clave_operacion<>query.clave_operacion OR (tbn1_mi_clave_operacion.clave_operacion IS NULL AND query.clave_operacion IS NOT NULL) OR  (tbn1_mi_clave_operacion.clave_operacion IS NOT NULL AND query.clave_operacion IS NULL))) THEN
  UPDATE SET
    cod_clave_operacion=query.cod_clave_operacion,
    clave_operacion=query.clave_operacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_operacion,clave_operacion) VALUES (
    query.es_indefinido,
    query.cod_clave_operacion,
    query.clave_operacion);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion'
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
      cod_clave_operacion,
      descripcion_clave_operacion AS clave_operacion,
      'MAESTRO' AS origen
    FROM
      (SELECT 'A' cod_clave_operacion,'Imposición' descripcion_clave_operacion
       UNION ALL SELECT 'B','Disposición'
       UNION ALL SELECT 'C','Cobro'
       UNION ALL SELECT 'P','Pago') clave_operacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion AS tbn1_mi_clave_operacion
  USING query ON query.cod_clave_operacion=tbn1_mi_clave_operacion.cod_clave_operacion
  WHEN MATCHED AND ((tbn1_mi_clave_operacion.clave_operacion<>query.clave_operacion OR (tbn1_mi_clave_operacion.clave_operacion IS NULL AND query.clave_operacion IS NOT NULL) OR  (tbn1_mi_clave_operacion.clave_operacion IS NOT NULL AND query.clave_operacion IS NULL)
                    OR tbn1_mi_clave_operacion.origen<>query.origen OR (tbn1_mi_clave_operacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_operacion.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_operacion=query.clave_operacion,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_operacion,clave_operacion,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_operacion,
      query.clave_operacion,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_integridad'
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
      mfpe71_clav_operacion AS cod_clave_operacion,
      'CLAVE FALTANTE MAESTRO' AS clave_operacion,
      'MODELO 171' AS origen
    FROM dbo.tbn1pe71_mf
    GROUP BY mfpe71_clav_operacion
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion(cod_clave_operacion,clave_operacion,origen)
  SELECT
    query.cod_clave_operacion,
    query.clave_operacion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion ON (tbn1_mi_clave_operacion.cod_clave_operacion=query.cod_clave_operacion)
  WHERE tbn1_mi_clave_operacion.cod_clave_operacion IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque(
  id_clave_operacion_cheque int IDENTITY(1,1),
  cod_clave_operacion_cheque varchar(2),
  clave_operacion_cheque varchar(150),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_operacion_cheque UNIQUE (cod_clave_operacion_cheque),
  CONSTRAINT PK_tbn1_mi_clave_operacion_cheque PRIMARY KEY CLUSTERED (id_clave_operacion_cheque)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='id_clave_operacion_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD id_clave_operacion_cheque int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='cod_clave_operacion_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD cod_clave_operacion_cheque varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='clave_operacion_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD clave_operacion_cheque varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_OPERACION_CHEQUE_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_OPERACION_CHEQUE_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='id_clave_operacion_cheque' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN id_clave_operacion_cheque int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='cod_clave_operacion_cheque' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN cod_clave_operacion_cheque varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='clave_operacion_cheque' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN clave_operacion_cheque varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_cheque' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_operacion_cheque')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ADD CONSTRAINT PK_tbn1_mi_clave_operacion_cheque PRIMARY KEY CLUSTERED (id_clave_operacion_cheque)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_operacion_cheque,'Indefinido' AS clave_operacion_cheque
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque AS tbn1_mi_clave_operacion_cheque
USING query ON query.es_indefinido=tbn1_mi_clave_operacion_cheque.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_operacion_cheque.cod_clave_operacion_cheque<>query.cod_clave_operacion_cheque OR (tbn1_mi_clave_operacion_cheque.cod_clave_operacion_cheque IS NULL AND query.cod_clave_operacion_cheque IS NOT NULL) OR  (tbn1_mi_clave_operacion_cheque.cod_clave_operacion_cheque IS NOT NULL AND query.cod_clave_operacion_cheque IS NULL)
                  OR tbn1_mi_clave_operacion_cheque.clave_operacion_cheque<>query.clave_operacion_cheque OR (tbn1_mi_clave_operacion_cheque.clave_operacion_cheque IS NULL AND query.clave_operacion_cheque IS NOT NULL) OR  (tbn1_mi_clave_operacion_cheque.clave_operacion_cheque IS NOT NULL AND query.clave_operacion_cheque IS NULL))) THEN
  UPDATE SET
    cod_clave_operacion_cheque=query.cod_clave_operacion_cheque,
    clave_operacion_cheque=query.clave_operacion_cheque
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_operacion_cheque,clave_operacion_cheque) VALUES (
    query.es_indefinido,
    query.cod_clave_operacion_cheque,
    query.clave_operacion_cheque);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_cheque' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque'
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
      cod_clave_operacion_cheque,
      descripcion_clave_operacion_cheque AS clave_operacion_cheque,
      'MAESTRO' AS origen
    FROM
      (SELECT 1 cod_clave_operacion_cheque,'Libramiento de cheque por la entidad de crédito exceptuando los librados contra cuenta bancaria' descripcion_clave_operacion_cheque
       UNION ALL SELECT 2,'Pago de cheque emitido por una entidad de crédito cuando el abono no se realice en una cuenta bancaria'
       UNION ALL SELECT 3,'Pago de cheques librados por persona distinta y de cuantía superior a 3.005,06 euros , cuando el abono no se realice en una cuenta bancaria') clave_operacion_cheque
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque AS tbn1_mi_clave_operacion_cheque
  USING query ON query.cod_clave_operacion_cheque=tbn1_mi_clave_operacion_cheque.cod_clave_operacion_cheque
  WHEN MATCHED AND ((tbn1_mi_clave_operacion_cheque.clave_operacion_cheque<>query.clave_operacion_cheque OR (tbn1_mi_clave_operacion_cheque.clave_operacion_cheque IS NULL AND query.clave_operacion_cheque IS NOT NULL) OR  (tbn1_mi_clave_operacion_cheque.clave_operacion_cheque IS NOT NULL AND query.clave_operacion_cheque IS NULL)
                    OR tbn1_mi_clave_operacion_cheque.origen<>query.origen OR (tbn1_mi_clave_operacion_cheque.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_operacion_cheque.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_operacion_cheque=query.clave_operacion_cheque,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_operacion_cheque,clave_operacion_cheque,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_operacion_cheque,
      query.clave_operacion_cheque,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_cheque_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque_integridad'
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
      da99_claveoper AS cod_clave_operacion_cheque,
      'CLAVE FALTANTE MAESTRO' AS clave_operacion_cheque,
      'MODELO 199' AS origen
    FROM dbo.tbn1da99_mf
    GROUP BY da99_claveoper
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque(cod_clave_operacion_cheque,clave_operacion_cheque,origen)
  SELECT
    query.cod_clave_operacion_cheque,
    query.clave_operacion_cheque,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_cheque ON (tbn1_mi_clave_operacion_cheque.cod_clave_operacion_cheque=query.cod_clave_operacion_cheque)
  WHERE tbn1_mi_clave_operacion_cheque.cod_clave_operacion_cheque IS NULL;

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

/**********************/
/*tbn1_mi_clave_origen*/
/**********************/

--TABLA--
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(
  id_clave_origen int IDENTITY(1,1),
  cod_clave_origen varchar(1),
  clave_origen varchar(50),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_origen UNIQUE (cod_clave_origen),
  CONSTRAINT PK_tbn1_mi_clave_origen PRIMARY KEY CLUSTERED (id_clave_origen)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='id_clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD id_clave_origen int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='cod_clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD cod_clave_origen varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD clave_origen varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_ORIGEN_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='id_clave_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN id_clave_origen int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='cod_clave_origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN cod_clave_origen varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='clave_origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN clave_origen varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_origen' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ADD CONSTRAINT PK_tbn1_mi_clave_origen PRIMARY KEY CLUSTERED (id_clave_origen)

GO


--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_origen' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_origen;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_origen(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_origen'
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

	;WITH query AS 
	(
		SELECT	cod_clave_origen,
				descripcion_clave_origen AS clave_origen,
				'MAESTRO' AS origen
		FROM	(
				SELECT	'A' AS cod_clave_origen,
						'Operaciones a título oneroso' AS descripcion_clave_origen
				UNION 
				SELECT	'B' AS cod_clave_origen,
						'Operaciones a título lucrativo' AS descripcion_clave_origen
				UNION 
				SELECT	'C' AS cod_clave_origen,
						'Otras operaciones de adjudicación o aplicación' AS descripcion_clave_origen
				) clave_origen
	)
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen AS t
  USING query ON query.cod_clave_origen = t.cod_clave_origen
  WHEN MATCHED AND ((t.clave_origen<>query.clave_origen OR (t.clave_origen IS NULL AND query.clave_origen IS NOT NULL) OR  (t.clave_origen IS NOT NULL AND query.clave_origen IS NULL)
                    OR t.origen<>query.origen OR (t.origen IS NULL AND query.origen IS NOT NULL) OR  (t.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_origen=query.clave_origen,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_origen,clave_origen,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_origen,
      query.clave_origen,
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


--CARGAS INTEGRIDAD--

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_origen_integridad_192_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_internos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_internos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_internos'
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
      da20clorigen AS cod_clave_origen,
      'CLAVE FALTANTE EN MAESTRO' AS clave_origen,
      'INT. M-192' AS origen
    FROM dbo.tbn120da_af
    GROUP BY da20clorigen
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(cod_clave_origen,clave_origen,origen)
  SELECT
    query.cod_clave_origen,
    query.clave_origen,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ON (tbn1_mi_clave_origen.cod_clave_origen=query.cod_clave_origen)
  WHERE tbn1_mi_clave_origen.cod_clave_origen IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_origen_integridad_192_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_externos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_externos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_externos'
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
      px20clorigen AS cod_clave_origen,
      'CLAVE FALTANTE EN MAESTRO' AS clave_origen,
      'EXT. M-192' AS origen
    FROM dbo.tbn12xpe_af
    GROUP BY px20clorigen
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen(cod_clave_origen,clave_origen,origen)
  SELECT
    query.cod_clave_origen,
    query.clave_origen,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_origen ON (tbn1_mi_clave_origen.cod_clave_origen=query.cod_clave_origen)
  WHERE tbn1_mi_clave_origen.cod_clave_origen IS NULL;

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
/*FIN - tbn1_mi_clave_origen*/
/****************************/


/*****************************/
/*tbn1_mi_clave_operacion_198*/
/*****************************/

--TABLA--
IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198(
  id_clave_operacion_198 int IDENTITY(1,1),
  cod_clave_operacion_198 varchar(1),
  clave_operacion_198 varchar(300),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_operacion_198 UNIQUE (cod_clave_operacion_198),
  CONSTRAINT PK_tbn1_mi_clave_operacion_198 PRIMARY KEY CLUSTERED (id_clave_operacion_198)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='id_clave_operacion_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD id_clave_operacion_198 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='cod_clave_operacion_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD cod_clave_operacion_198 varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='clave_operacion_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD clave_operacion_198 varchar(300)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_OPERACION_198_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='id_clave_operacion_198' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN id_clave_operacion_198 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='cod_clave_operacion_198' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN cod_clave_operacion_198 varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='clave_operacion_198' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN clave_operacion_198 varchar(300) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_operacion_198' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_operacion_198')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ADD CONSTRAINT PK_tbn1_mi_clave_operacion_198 PRIMARY KEY CLUSTERED (id_clave_operacion_198)

GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_198' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_198;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_198(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198'
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

	;WITH query AS 
	(
		SELECT	cod_clave_operacion_198,
				descripcion_clave_operacion_198 AS clave_operacion_198,
				'MAESTRO' AS origen
		FROM	(
				SELECT	'A' AS cod_clave_operacion_198,
						'Adquisición, o constitución de derechos' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'B' AS cod_clave_operacion_198,
						'Adquisición, o constitución de derechos, mediante las operaciones previstas en el art. 2 del RD 1416/1991, 27 de setiembre, sobre operaciones bursátiles especiales y sobre transmisiones extrabursátiles de valores cotizados y cambios medios ponderados' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'C' AS cod_clave_operacion_198,
						'Canje' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'D' AS cod_clave_operacion_198,
						'Conversión' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'E' AS cod_clave_operacion_198,
						'Cancelación o extinción de derechos' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'F' AS cod_clave_operacion_198,
						'Devolución de prima de emisión' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'G' AS cod_clave_operacion_198,
						'Reducción de capital' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'O' AS cod_clave_operacion_198,
						'Préstamos de valores regulados en la Disposición adicional segunda de la NF 2/2004, de Medidas Tributarias en 2004' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'P' AS cod_clave_operacion_198,
						'Constitución Préstamo de Valores' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'Q' AS cod_clave_operacion_198,
						'Extinción Préstamo de Valores' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'S' AS cod_clave_operacion_198,
						'Suscripción' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'T' AS cod_clave_operacion_198,
						'Transmisión, amortización o reembolso' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'U' AS cod_clave_operacion_198,
						'Amortización, transmisión o reembolso mediante las operaciones previstas en el art. 2 del RD 1416/1991, 27 de setiembre, sobre operaciones bursátiles especiales y sobre transmisiones extrabursátiles de valores cotizados y cambios medios ponderados' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'V' AS cod_clave_operacion_198,
						'Canje de valores amparados en el Régimen especial de las fusiones, escisiones, aportaciones de activos y canje de valores del capitulo X de la NF 3/96, del Impuesto sobre Sociedades' AS descripcion_clave_operacion_198
				UNION 
				SELECT	'W' AS cod_clave_operacion_198,
						'Otras operaciones' AS descripcion_clave_operacion_198
				) clave_operacion_198
	)
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 AS t
  USING query ON query.cod_clave_operacion_198 = t.cod_clave_operacion_198
  WHEN MATCHED AND ((t.clave_operacion_198<>query.clave_operacion_198 OR (t.clave_operacion_198 IS NULL AND query.clave_operacion_198 IS NOT NULL) OR  (t.clave_operacion_198 IS NOT NULL AND query.clave_operacion_198 IS NULL)
                    OR t.origen<>query.origen OR (t.origen IS NULL AND query.origen IS NOT NULL) OR  (t.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_operacion_198=query.clave_operacion_198,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_operacion_198,clave_operacion_198,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_operacion_198,
      query.clave_operacion_198,
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




--CARGAS INTEGRIDAD--



USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos'
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
      da20cloperacion AS cod_clave_operacion_198,
      'CLAVE FALTANTE EN MAESTRO' AS clave_operacion_198,
      'INT. M-192' AS origen
    FROM dbo.tbn120da_af
    GROUP BY da20cloperacion
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198(cod_clave_operacion_198,clave_operacion_198,origen)
  SELECT
    query.cod_clave_operacion_198,
    query.clave_operacion_198,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ON (tbn1_mi_clave_operacion_198.cod_clave_operacion_198=query.cod_clave_operacion_198)
  WHERE tbn1_mi_clave_operacion_198.cod_clave_operacion_198 IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos'
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
      px20cloperacion AS cod_clave_operacion_198,
      'CLAVE FALTANTE EN MAESTRO' AS clave_operacion_198,
      'EXT. M-192' AS origen
    FROM dbo.tbn12xpe_af
    GROUP BY px20cloperacion
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198(cod_clave_operacion_198,clave_operacion_198,origen)
  SELECT
    query.cod_clave_operacion_198,
    query.clave_operacion_198,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion_198 ON (tbn1_mi_clave_operacion_198.cod_clave_operacion_198=query.cod_clave_operacion_198)
  WHERE tbn1_mi_clave_operacion_198.cod_clave_operacion_198 IS NULL;

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

/***********************************/
/*FIN - tbn1_mi_clave_operacion_198*/
/***********************************/


IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado(
  id_clave_mercado int IDENTITY(1,1),
  cod_clave_mercado varchar(1),
  clave_mercado varchar(50),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_mercado UNIQUE (cod_clave_mercado),
  CONSTRAINT PK_tbn1_mi_clave_mercado PRIMARY KEY CLUSTERED (id_clave_mercado)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='id_clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD id_clave_mercado int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='cod_clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD cod_clave_mercado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD clave_mercado varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_MERCADO_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_MERCADO_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='id_clave_mercado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN id_clave_mercado int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='cod_clave_mercado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN cod_clave_mercado varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='clave_mercado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN clave_mercado varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_mercado' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_mercado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ADD CONSTRAINT PK_tbn1_mi_clave_mercado PRIMARY KEY CLUSTERED (id_clave_mercado)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_mercado,'Indefinido' AS clave_mercado
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado AS tbn1_mi_clave_mercado
USING query ON query.es_indefinido=tbn1_mi_clave_mercado.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_mercado.cod_clave_mercado<>query.cod_clave_mercado OR (tbn1_mi_clave_mercado.cod_clave_mercado IS NULL AND query.cod_clave_mercado IS NOT NULL) OR  (tbn1_mi_clave_mercado.cod_clave_mercado IS NOT NULL AND query.cod_clave_mercado IS NULL)
                  OR tbn1_mi_clave_mercado.clave_mercado<>query.clave_mercado OR (tbn1_mi_clave_mercado.clave_mercado IS NULL AND query.clave_mercado IS NOT NULL) OR  (tbn1_mi_clave_mercado.clave_mercado IS NOT NULL AND query.clave_mercado IS NULL))) THEN
  UPDATE SET
    cod_clave_mercado=query.cod_clave_mercado,
    clave_mercado=query.clave_mercado
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_mercado,clave_mercado) VALUES (
    query.es_indefinido,
    query.cod_clave_mercado,
    query.clave_mercado);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_mercado' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_mercado;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_mercado(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_mercado'
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
      cod_clave_mercado,
      clave_mercado,
      'MAESTRO' AS origen
    FROM
      (SELECT 'A' cod_clave_mercado,'Mercado secundario oficial de valores español' clave_mercado
       UNION ALL SELECT 'B','Mercado secundario oficial de valores extranjeros'
       UNION ALL SELECT 'C','Otros mercados nacionales'
       UNION ALL SELECT 'D','Otros mercados extranjeros'
       UNION ALL SELECT 'F','Operaciones intervenidas por fedatarios públicos'
       UNION ALL SELECT 'O','Operaciones realizadas fuera de mercado (OTC)') clave_mercado
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado AS tbn1_mi_clave_mercado
  USING query ON query.cod_clave_mercado=tbn1_mi_clave_mercado.cod_clave_mercado
  WHEN MATCHED AND ((tbn1_mi_clave_mercado.clave_mercado<>query.clave_mercado OR (tbn1_mi_clave_mercado.clave_mercado IS NULL AND query.clave_mercado IS NOT NULL) OR  (tbn1_mi_clave_mercado.clave_mercado IS NOT NULL AND query.clave_mercado IS NULL)
                    OR tbn1_mi_clave_mercado.origen<>query.origen OR (tbn1_mi_clave_mercado.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_mercado.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_mercado=query.clave_mercado,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_mercado,clave_mercado,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_mercado,
      query.clave_mercado,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_mercado_integridad_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_mercado_integridad_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_mercado_integridad_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_mercado_integridad_189'
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
      mfpe89_clv_mercado AS cod_clave_mercado,
      'CLAVE FALTANTE MAESTRO' AS clave_mercado,
      'MODELO 189' AS origen
    FROM dbo.tbn1pe89_mf
    GROUP BY mfpe89_clv_mercado
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado(cod_clave_mercado,clave_mercado,origen)
  SELECT
    query.cod_clave_mercado,
    query.clave_mercado,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado ON (tbn1_mi_clave_mercado.cod_clave_mercado=query.cod_clave_mercado)
  WHERE tbn1_mi_clave_mercado.cod_clave_mercado IS NULL;

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



IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(
  id_clave_representacion int IDENTITY(1,1),
  cod_clave_representacion varchar(1),
  clave_representacion varchar(25),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_representacion UNIQUE (cod_clave_representacion),
  CONSTRAINT PK_tbn1_mi_clave_representacion PRIMARY KEY CLUSTERED (id_clave_representacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='id_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD id_clave_representacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='cod_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD cod_clave_representacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD clave_representacion varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_REPRESENTACION_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVE_REPRESENTACION_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='id_clave_representacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN id_clave_representacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='cod_clave_representacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN cod_clave_representacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='clave_representacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN clave_representacion varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_clave_representacion' AND CONSTRAINT_NAME='PK_tbn1_mi_clave_representacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ADD CONSTRAINT PK_tbn1_mi_clave_representacion PRIMARY KEY CLUSTERED (id_clave_representacion)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_representacion,'Indefinido' AS clave_representacion
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion AS tbn1_mi_clave_representacion
USING query ON query.es_indefinido=tbn1_mi_clave_representacion.es_indefinido
WHEN MATCHED AND ((tbn1_mi_clave_representacion.cod_clave_representacion<>query.cod_clave_representacion OR (tbn1_mi_clave_representacion.cod_clave_representacion IS NULL AND query.cod_clave_representacion IS NOT NULL) OR  (tbn1_mi_clave_representacion.cod_clave_representacion IS NOT NULL AND query.cod_clave_representacion IS NULL)
                  OR tbn1_mi_clave_representacion.clave_representacion<>query.clave_representacion OR (tbn1_mi_clave_representacion.clave_representacion IS NULL AND query.clave_representacion IS NOT NULL) OR  (tbn1_mi_clave_representacion.clave_representacion IS NOT NULL AND query.clave_representacion IS NULL))) THEN
  UPDATE SET
    cod_clave_representacion=query.cod_clave_representacion,
    clave_representacion=query.clave_representacion
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_representacion,clave_representacion) VALUES (
    query.es_indefinido,
    query.cod_clave_representacion,
    query.clave_representacion);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_representacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_representacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_representacion(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_representacion'
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
      cod_clave_representacion,
      clave_representacion,
      'MAESTRO' AS origen
    FROM
      (SELECT 'A' cod_clave_representacion,'Con anotaciones en cuenta' clave_representacion
       UNION ALL SELECT 'B','Sin anotaciones en cuenta') clave_representacion
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion AS tbn1_mi_clave_representacion
  USING query ON query.cod_clave_representacion=tbn1_mi_clave_representacion.cod_clave_representacion
  WHEN MATCHED AND ((tbn1_mi_clave_representacion.clave_representacion<>query.clave_representacion OR (tbn1_mi_clave_representacion.clave_representacion IS NULL AND query.clave_representacion IS NOT NULL) OR  (tbn1_mi_clave_representacion.clave_representacion IS NOT NULL AND query.clave_representacion IS NULL)
                    OR tbn1_mi_clave_representacion.origen<>query.origen OR (tbn1_mi_clave_representacion.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_clave_representacion.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_representacion=query.clave_representacion,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_representacion,clave_representacion,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_representacion,
      query.clave_representacion,
      query.origen,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();


	--	  incluir registro -1
	
	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ON

	IF NOT EXISTS
	(
		SELECT	1
		FROM	dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion
		WHERE	id_clave_representacion = -1
	)
		INSERT INTO dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion
		(
			id_clave_representacion,
			cod_clave_representacion,
			clave_representacion,
			origen
		)
		VALUES
		(
			-1,
			'-',
			'N/A',
			'MOD. 720'
		)

	SET IDENTITY_INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion OFF


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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_representacion_integridad_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_189'
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
      mfpe89_clv_represe AS cod_clave_representacion,
      'CLAVE FALTANTE MAESTRO' AS clave_representacion,
      'MODELO 189' AS origen
    FROM dbo.tbn1pe89_mf
    GROUP BY mfpe89_clv_represe
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(cod_clave_representacion,clave_representacion,origen)
  SELECT
    query.cod_clave_representacion,
    query.clave_representacion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ON (tbn1_mi_clave_representacion.cod_clave_representacion=query.cod_clave_representacion)
  WHERE tbn1_mi_clave_representacion.cod_clave_representacion IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_clave_representacion_integridad_720' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_720;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_720(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_720'
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
      mf720v_repres_valores AS cod_clave_representacion,
      'CLAVE FALTANTE MAESTRO' AS clave_representacion,
      'MODELO 720' AS origen
    FROM dbo.tbn1720v_mf
    GROUP BY mf720v_repres_valores
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion(cod_clave_representacion,clave_representacion,origen)
  SELECT
    query.cod_clave_representacion,
    query.clave_representacion,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion ON (tbn1_mi_clave_representacion.cod_clave_representacion=query.cod_clave_representacion)
  WHERE tbn1_mi_clave_representacion.cod_clave_representacion IS NULL;

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



IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(
  id_tipo_soporte int IDENTITY(1,1),
  cod_tipo_soporte varchar(1),
  tipo_soporte varchar(25),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_tipo_soporte UNIQUE (cod_tipo_soporte),
  CONSTRAINT PK_tbn1_mi_tipos_soporte PRIMARY KEY CLUSTERED (id_tipo_soporte)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='id_tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD id_tipo_soporte int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='cod_tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD cod_tipo_soporte varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='tipo_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD tipo_soporte varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD CONSTRAINT DF_DBO_TBN1_MI_TIPOS_SOPORTE_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD CONSTRAINT DF_DBO_TBN1_MI_TIPOS_SOPORTE_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='id_tipo_soporte' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN id_tipo_soporte int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='cod_tipo_soporte' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN cod_tipo_soporte varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='tipo_soporte' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN tipo_soporte varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_soporte' AND CONSTRAINT_NAME='PK_tbn1_mi_tipos_soporte')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ADD CONSTRAINT PK_tbn1_mi_tipos_soporte PRIMARY KEY CLUSTERED (id_tipo_soporte)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_tipo_soporte,'Indefinido' AS tipo_soporte
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte AS tbn1_mi_tipos_soporte
USING query ON query.es_indefinido=tbn1_mi_tipos_soporte.es_indefinido
WHEN MATCHED AND ((tbn1_mi_tipos_soporte.cod_tipo_soporte<>query.cod_tipo_soporte OR (tbn1_mi_tipos_soporte.cod_tipo_soporte IS NULL AND query.cod_tipo_soporte IS NOT NULL) OR  (tbn1_mi_tipos_soporte.cod_tipo_soporte IS NOT NULL AND query.cod_tipo_soporte IS NULL)
                  OR tbn1_mi_tipos_soporte.tipo_soporte<>query.tipo_soporte OR (tbn1_mi_tipos_soporte.tipo_soporte IS NULL AND query.tipo_soporte IS NOT NULL) OR  (tbn1_mi_tipos_soporte.tipo_soporte IS NOT NULL AND query.tipo_soporte IS NULL))) THEN
  UPDATE SET
    cod_tipo_soporte=query.cod_tipo_soporte,
    tipo_soporte=query.tipo_soporte
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_tipo_soporte,tipo_soporte) VALUES (
    query.es_indefinido,
    query.cod_tipo_soporte,
    query.tipo_soporte);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_soporte' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte'
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
      cod_tipo_soporte,
      tipo_soporte,
      'MAESTRO' AS origen
    FROM
      (SELECT 'C' cod_tipo_soporte,'DVD, CDR' tipo_soporte
       UNION ALL SELECT 'T','Transmisión telemática'
       UNION ALL SELECT 'D','Disquete') tipos_soporte
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte AS tbn1_mi_tipos_soporte
  USING query ON query.cod_tipo_soporte=tbn1_mi_tipos_soporte.cod_tipo_soporte
  WHEN MATCHED AND ((tbn1_mi_tipos_soporte.tipo_soporte<>query.tipo_soporte OR (tbn1_mi_tipos_soporte.tipo_soporte IS NULL AND query.tipo_soporte IS NOT NULL) OR  (tbn1_mi_tipos_soporte.tipo_soporte IS NOT NULL AND query.tipo_soporte IS NULL)
                    OR tbn1_mi_tipos_soporte.origen<>query.origen OR (tbn1_mi_tipos_soporte.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_tipos_soporte.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      tipo_soporte=query.tipo_soporte,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_tipo_soporte,tipo_soporte,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_tipo_soporte,
      query.tipo_soporte,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_soporte_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad'
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
      cabe_tiposoporte AS cod_tipo_soporte,
      'SOPORTE FALTANTE MAESTRO' AS tipo_soporte,
      'APLIC. MF' AS origen
    FROM dbo.tbn1cabe_mf
    GROUP BY cabe_tiposoporte
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(cod_tipo_soporte,tipo_soporte,origen)
  SELECT
    query.cod_tipo_soporte,
    query.tipo_soporte,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ON (tbn1_mi_tipos_soporte.cod_tipo_soporte=query.cod_tipo_soporte)
  WHERE tbn1_mi_tipos_soporte.cod_tipo_soporte IS NULL;

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



IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_soporte_integridad_mf_decl' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_mf_decl;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_mf_decl(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_mf_decl'
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
      mfdecl_tiposoporte AS cod_tipo_soporte,
      'SOPORTE FALTANTE MAESTRO' AS tipo_soporte,
      'APLIC. MF' AS origen
    FROM dbo.tbn1decl_mf
    GROUP BY mfdecl_tiposoporte
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte(cod_tipo_soporte,tipo_soporte,origen)
  SELECT
    query.cod_tipo_soporte,
    query.tipo_soporte,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte ON (tbn1_mi_tipos_soporte.cod_tipo_soporte=query.cod_tipo_soporte)
  WHERE tbn1_mi_tipos_soporte.cod_tipo_soporte IS NULL;

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



IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189(
  id_clave_identificacion_189 int IDENTITY(1,1),
  cod_clave_identificacion_189 varchar(1),
  clave_identificacion_189 varchar(25),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_identificacion_189 UNIQUE (cod_clave_identificacion_189),
  CONSTRAINT PK_tbn1_mi_claves_identificacion_189 PRIMARY KEY CLUSTERED (id_clave_identificacion_189)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='id_clave_identificacion_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD id_clave_identificacion_189 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='cod_clave_identificacion_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD cod_clave_identificacion_189 varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='clave_identificacion_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD clave_identificacion_189 varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVES_IDENTIFICACION_189_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVES_IDENTIFICACION_189_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='id_clave_identificacion_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN id_clave_identificacion_189 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='cod_clave_identificacion_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN cod_clave_identificacion_189 varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='clave_identificacion_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN clave_identificacion_189 varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_identificacion_189' AND CONSTRAINT_NAME='PK_tbn1_mi_claves_identificacion_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ADD CONSTRAINT PK_tbn1_mi_claves_identificacion_189 PRIMARY KEY CLUSTERED (id_clave_identificacion_189)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_identificacion_189,'Indefinido' AS clave_identificacion_189
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 AS tbn1_mi_claves_identificacion_189
USING query ON query.es_indefinido=tbn1_mi_claves_identificacion_189.es_indefinido
WHEN MATCHED AND ((tbn1_mi_claves_identificacion_189.cod_clave_identificacion_189<>query.cod_clave_identificacion_189 OR (tbn1_mi_claves_identificacion_189.cod_clave_identificacion_189 IS NULL AND query.cod_clave_identificacion_189 IS NOT NULL) OR  (tbn1_mi_claves_identificacion_189.cod_clave_identificacion_189 IS NOT NULL AND query.cod_clave_identificacion_189 IS NULL)
                  OR tbn1_mi_claves_identificacion_189.clave_identificacion_189<>query.clave_identificacion_189 OR (tbn1_mi_claves_identificacion_189.clave_identificacion_189 IS NULL AND query.clave_identificacion_189 IS NOT NULL) OR  (tbn1_mi_claves_identificacion_189.clave_identificacion_189 IS NOT NULL AND query.clave_identificacion_189 IS NULL))) THEN
  UPDATE SET
    cod_clave_identificacion_189=query.cod_clave_identificacion_189,
    clave_identificacion_189=query.clave_identificacion_189
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_identificacion_189,clave_identificacion_189) VALUES (
    query.es_indefinido,
    query.cod_clave_identificacion_189,
    query.clave_identificacion_189);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_identificacion_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_identificacion_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_identificacion_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_identificacion_189'
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
      cod_clave_identificacion_189,
      clave_identificacion_189,
      'MAESTRO' AS origen
    FROM
      (SELECT 1 cod_clave_identificacion_189,'ISIN' clave_identificacion_189
       UNION ALL SELECT 2,'Valor extranjero'
       UNION ALL SELECT 3,'NIF') claves_identificacion_189
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 AS tbn1_mi_claves_identificacion_189
  USING query ON query.cod_clave_identificacion_189=tbn1_mi_claves_identificacion_189.cod_clave_identificacion_189
  WHEN MATCHED AND ((tbn1_mi_claves_identificacion_189.clave_identificacion_189<>query.clave_identificacion_189 OR (tbn1_mi_claves_identificacion_189.clave_identificacion_189 IS NULL AND query.clave_identificacion_189 IS NOT NULL) OR  (tbn1_mi_claves_identificacion_189.clave_identificacion_189 IS NOT NULL AND query.clave_identificacion_189 IS NULL)
                    OR tbn1_mi_claves_identificacion_189.origen<>query.origen OR (tbn1_mi_claves_identificacion_189.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_claves_identificacion_189.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_identificacion_189=query.clave_identificacion_189,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_identificacion_189,clave_identificacion_189,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_identificacion_189,
      query.clave_identificacion_189,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_identificacion_189_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_identificacion_189_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_identificacion_189_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_identificacion_189_integridad'
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
      mfpe89_clv_ident AS cod_clave_identificacion_189,
      'CLAVE FALTANTE MAESTRO' AS clave_identificacion_189,
      'MODELO 189' AS origen
    FROM dbo.tbn1pe89_mf
    GROUP BY mfpe89_clv_ident
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189(cod_clave_identificacion_189,clave_identificacion_189,origen)
  SELECT
    query.cod_clave_identificacion_189,
    query.clave_identificacion_189,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 ON (tbn1_mi_claves_identificacion_189.cod_clave_identificacion_189=query.cod_clave_identificacion_189)
  WHERE tbn1_mi_claves_identificacion_189.cod_clave_identificacion_189 IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189(
  id_clave_valor_189 int IDENTITY(1,1),
  cod_clave_valor_189 varchar(1),
  clave_valor_189 varchar(150),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  origen varchar(10) NOT NULL,
  CONSTRAINT uk_mi_clave_valor_189 UNIQUE (cod_clave_valor_189),
  CONSTRAINT PK_tbn1_mi_claves_valor_189 PRIMARY KEY CLUSTERED (id_clave_valor_189)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='id_clave_valor_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD id_clave_valor_189 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='cod_clave_valor_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD cod_clave_valor_189 varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='clave_valor_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD clave_valor_189 varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD fec_baja datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD origen varchar(10)

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVES_VALOR_189_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD CONSTRAINT DF_DBO_TBN1_MI_CLAVES_VALOR_189_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='id_clave_valor_189' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN id_clave_valor_189 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='cod_clave_valor_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN cod_clave_valor_189 varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='clave_valor_189' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN clave_valor_189 varchar(150) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN fec_baja datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_valor_189' AND CONSTRAINT_NAME='PK_tbn1_mi_claves_valor_189')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ADD CONSTRAINT PK_tbn1_mi_claves_valor_189 PRIMARY KEY CLUSTERED (id_clave_valor_189)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_clave_valor_189,'Indefinido' AS clave_valor_189
)
MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 AS tbn1_mi_claves_valor_189
USING query ON query.es_indefinido=tbn1_mi_claves_valor_189.es_indefinido
WHEN MATCHED AND ((tbn1_mi_claves_valor_189.cod_clave_valor_189<>query.cod_clave_valor_189 OR (tbn1_mi_claves_valor_189.cod_clave_valor_189 IS NULL AND query.cod_clave_valor_189 IS NOT NULL) OR  (tbn1_mi_claves_valor_189.cod_clave_valor_189 IS NOT NULL AND query.cod_clave_valor_189 IS NULL)
                  OR tbn1_mi_claves_valor_189.clave_valor_189<>query.clave_valor_189 OR (tbn1_mi_claves_valor_189.clave_valor_189 IS NULL AND query.clave_valor_189 IS NOT NULL) OR  (tbn1_mi_claves_valor_189.clave_valor_189 IS NOT NULL AND query.clave_valor_189 IS NULL))) THEN
  UPDATE SET
    cod_clave_valor_189=query.cod_clave_valor_189,
    clave_valor_189=query.clave_valor_189
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_clave_valor_189,clave_valor_189) VALUES (
    query.es_indefinido,
    query.cod_clave_valor_189,
    query.clave_valor_189);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_valor_189' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_valor_189;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_valor_189(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_valor_189'
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
      cod_clave_valor_189,
      clave_valor_189,
      'MAESTRO' AS origen
    FROM
      (SELECT 'A' cod_clave_valor_189,'Acciones o participaciones en el capital o en los fondos propios de entidades jurídicas negociados en un mercado organizado' clave_valor_189
       UNION ALL SELECT 'B','Valores representativos de la cesión a terceros de capitales propios negociados en mercados organizados'
       UNION ALL SELECT 'C','Acciones o participaciones en el capital social o fondo patrimonial de una institución de inversión colectiva'
       UNION ALL SELECT 'D','Seguros de Vida'
       UNION ALL SELECT 'E','Renta temporal o vitalicia') claves_valor_189
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 AS tbn1_mi_claves_valor_189
  USING query ON query.cod_clave_valor_189=tbn1_mi_claves_valor_189.cod_clave_valor_189
  WHEN MATCHED AND ((tbn1_mi_claves_valor_189.clave_valor_189<>query.clave_valor_189 OR (tbn1_mi_claves_valor_189.clave_valor_189 IS NULL AND query.clave_valor_189 IS NOT NULL) OR  (tbn1_mi_claves_valor_189.clave_valor_189 IS NOT NULL AND query.clave_valor_189 IS NULL)
                    OR tbn1_mi_claves_valor_189.origen<>query.origen OR (tbn1_mi_claves_valor_189.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_mi_claves_valor_189.origen IS NOT NULL AND query.origen IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      clave_valor_189=query.clave_valor_189,
      origen=query.origen,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_clave_valor_189,clave_valor_189,origen,fec_alta,fec_modificacion) VALUES (
      query.cod_clave_valor_189,
      query.clave_valor_189,
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_valor_189_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_valor_189_integridad;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_valor_189_integridad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_valor_189_integridad'
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
      mfpe89_clv_valor AS cod_clave_valor_189,
      'CLAVE FALTANTE MAESTRO' AS clave_valor_189,
      'MODELO 189' AS origen
    FROM dbo.tbn1pe89_mf
    GROUP BY mfpe89_clv_valor
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189(cod_clave_valor_189,clave_valor_189,origen)
  SELECT
    query.cod_clave_valor_189,
    query.clave_valor_189,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 ON (tbn1_mi_claves_valor_189.cod_clave_valor_189=query.cod_clave_valor_189)
  WHERE tbn1_mi_claves_valor_189.cod_clave_valor_189 IS NULL;

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



/***************************/
/*tbn1_mi_claves_percepcion*/
/***************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_claves_percepcion')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion(
	  id_clave_percepcion	int IDENTITY(1,1),
	  cod_clave_percepcion	varchar(1),
	  clave_percepcion		varchar(100),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT uk_claves_percepcion UNIQUE (cod_clave_percepcion),
	  CONSTRAINT PK_tbn1_claves_percepcion PRIMARY KEY CLUSTERED (id_clave_percepcion)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_percepcion' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_percepcion
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_percepcion(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_percepcion'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH query AS
		(
			SELECT	cod_clave_percepcion,
					clave_percepcion,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'A' cod_clave_percepcion,
							'Subvenciones o indemnizaciones exentas en el IRPF' clave_percepcion
					UNION ALL 
					SELECT	'B' cod_clave_percepcion,
							'Resto de subvenciones o indemnizaciones' clave_percepcion
					) claves_percepcion
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion AS tbn1_mi_claves_percepcion
		USING query ON query.cod_clave_percepcion = tbn1_mi_claves_percepcion.cod_clave_percepcion
		
		WHEN MATCHED AND 
		(
			tbn1_mi_claves_percepcion.clave_percepcion	<> query.clave_percepcion	OR (tbn1_mi_claves_percepcion.clave_percepcion IS NULL AND query.clave_percepcion	IS NOT NULL)	OR  (tbn1_mi_claves_percepcion.clave_percepcion	IS NOT NULL AND query.clave_percepcion	IS NULL)
		OR	tbn1_mi_claves_percepcion.origen			<> query.origen				OR (tbn1_mi_claves_percepcion.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_claves_percepcion.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				clave_percepcion = query.clave_percepcion,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_clave_percepcion,
				clave_percepcion,
				origen
			) 
			VALUES 
			(
				query.cod_clave_percepcion,
				query.clave_percepcion,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO


--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_claves_percepcion_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_percepcion_integridad
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_claves_percepcion_integridad(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_percepcion_integridad'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pe46_clave AS cod_clave_percepcion,
					'CLAVE FALTANTE MAESTRO' AS clave_percepcion,
					'MODELO 346' AS origen
			FROM	dbn1_stg_dhyf.dbo.tbn1pe46_mf
			GROUP BY pe46_clave
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion
		(
			cod_clave_percepcion,
			clave_percepcion,
			origen
		)
		SELECT	query.cod_clave_percepcion,
				query.clave_percepcion,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion 
						ON tbn1_mi_claves_percepcion.cod_clave_percepcion = query.cod_clave_percepcion
		WHERE	tbn1_mi_claves_percepcion.cod_clave_percepcion IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO


/*********************************/
/*FIN - tbn1_mi_claves_percepcion*/
/*********************************/



/**************************/
/*tbn1_mi_tipos_percepcion*/
/**************************/

--TABLA--
USE dbn1_norm_dhyf
GO

IF NOT EXISTS(SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_tipos_percepcion')
	CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion(
	  id_tipo_percepcion	int IDENTITY(1,1),
	  cod_tipo_percepcion	varchar(1),
	  tipo_percepcion		varchar(300),
	  origen				varchar(10) NOT NULL,
	  CONSTRAINT uk_tipos_percepcion UNIQUE (cod_tipo_percepcion),
	  CONSTRAINT PK_tbn1_tipos_percepcion PRIMARY KEY CLUSTERED (id_tipo_percepcion)
	)
GO

--CARGA MAESTRO--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_percepcion' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_percepcion
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_percepcion(@logpadre int) AS
BEGIN
  
	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_percepcion'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS	(
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END

	BEGIN TRY

		;WITH query AS
		(
			SELECT	cod_tipo_percepcion,
					tipo_percepcion,
					'MAESTRO' AS origen
			FROM	(
					SELECT	'1' cod_tipo_percepcion,
							'Subvenciones corrientes o indemnizaciones' tipo_percepcion
					UNION ALL 
					SELECT	'2' cod_tipo_percepcion,
							'Subvenciones de capital' tipo_percepcion
					UNION ALL 
					SELECT	'3' cod_tipo_percepcion,
							'Indemnizaciones o ayudas por daños sufridos en elementos patrimoniales pertenecientes al circulante de la actividad agrícola o ganadera del perceptor o perceptora' tipo_percepcion
					UNION ALL 
					SELECT	'4' cod_tipo_percepcion,
							'Indemnizaciones o ayudas por daños sufridos en elementos patrimoniales pertenecientes al inmovilizado de la actividad agrícola o ganadera del perceptor o perceptora' tipo_percepcion
					UNION ALL 
					SELECT	'5' cod_tipo_percepcion,
							'Indemnizaciones o ayudas por cese o abandono, total o parcial, de la actividad' tipo_percepcion
					UNION ALL 
					SELECT	'6' cod_tipo_percepcion,
							'Otras subvenciones, indemnizaciones o ayudas no especificadas anteriormente' tipo_percepcion
					) tipos_percepcion
		)
		MERGE dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion AS tbn1_mi_tipos_percepcion
		USING query ON query.cod_tipo_percepcion = tbn1_mi_tipos_percepcion.cod_tipo_percepcion
		
		WHEN MATCHED AND 
		(
			tbn1_mi_tipos_percepcion.tipo_percepcion	<> query.tipo_percepcion	OR (tbn1_mi_tipos_percepcion.tipo_percepcion IS NULL AND query.tipo_percepcion	IS NOT NULL)	OR  (tbn1_mi_tipos_percepcion.tipo_percepcion	IS NOT NULL AND query.tipo_percepcion	IS NULL)
		OR	tbn1_mi_tipos_percepcion.origen			<> query.origen				OR (tbn1_mi_tipos_percepcion.origen			IS NULL AND query.origen			IS NOT NULL)	OR  (tbn1_mi_tipos_percepcion.origen				IS NOT NULL AND query.origen			IS NULL)
		)
		THEN
			UPDATE SET
				tipo_percepcion = query.tipo_percepcion,
				origen = query.origen

		WHEN NOT MATCHED THEN
			INSERT 
			(
				cod_tipo_percepcion,
				tipo_percepcion,
				origen
			) 
			VALUES 
			(
				query.cod_tipo_percepcion,
				query.tipo_percepcion,
				query.origen
			);

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log = @log
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO


--CARGAS INTEGRIDAD--
USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_tipos_percepcion_integridad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_percepcion_integridad
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_mi_tipos_percepcion_integridad(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_percepcion_integridad'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL AND EXISTS (
											SELECT	1 AS expr1
											FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
											WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
											AND		excluido = 1
										) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs
		SET		mensaje_error = 'EXCLUÍDO'
		WHERE	id_log = @log;
		RETURN
	END
	
	BEGIN TRY

		;WITH query AS 
		(
			SELECT	pe46_tipoper AS cod_tipo_percepcion,
					'TIPO FALTANTE MAESTRO' AS tipo_percepcion,
					'MODELO 346' AS origen
			FROM	dbo.tbn1pe46_mf
			GROUP BY pe46_tipoper
		)
		INSERT dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion
		(
			cod_tipo_percepcion,
			tipo_percepcion,
			origen
		)
		SELECT	query.cod_tipo_percepcion,
				query.tipo_percepcion,
				query.origen
		FROM	query
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion 
						ON tbn1_mi_tipos_percepcion.cod_tipo_percepcion = query.cod_tipo_percepcion
		WHERE	tbn1_mi_tipos_percepcion.cod_tipo_percepcion IS NULL

		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
	
	END TRY
	
	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error = error_message(),
				procedimiento_error = error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END
GO


/********************************/
/*FIN - tbn1_mi_tipos_percepcion*/
/********************************/



/*****************/
/*SP CON LOS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_maestros_mf' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_maestros_mf;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_maestros_mf(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_mf'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_hoja @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_hoja_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_170 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_tipo_codigo_integridad_171 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_171 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_declarado_integridad_192_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_cheque_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_mercado @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_mercado_integridad_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_representacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_representacion_integridad_720 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_soporte_integridad_mf_decl @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_identificacion_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_identificacion_189_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_valor_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_valor_189_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_origen @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_origen_integridad_192_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198 @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_percepcion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_percepcion_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_percepcion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_percepcion_integridad @log;

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

