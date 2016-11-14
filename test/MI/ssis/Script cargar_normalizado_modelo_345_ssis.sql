PRINT 'cargar_normalizado_modelo_345.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  administracion varchar(1),
  nif_declarante varchar(11),
  es_contribuyente bit,
  id_contribuyente int,
  es_complementaria bit NOT NULL,
  es_sustitutiva bit NOT NULL,
  id_tipo_presentacion int NOT NULL,
  fec_presentacion date,
  telefono_contacto varchar(9),
  nombre_contacto varchar(40),
  ref_presentacion_colectiva int,
  num_caja varchar(8),
  contador_revisiones int,
  fec_baja_declarante date,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_doc_mod345 UNIQUE (id_documento),
  CONSTRAINT PK_tbn1_documentos_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente),
  CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD nif_declarante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_complementaria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD es_complementaria bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_sustitutiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD es_sustitutiva bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD id_tipo_presentacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='telefono_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD telefono_contacto varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nombre_contacto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD nombre_contacto varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='ref_presentacion_colectiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD ref_presentacion_colectiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD contador_revisiones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja_declarante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD fec_baja_declarante date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_345_PLANES_PENSIONES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_complementaria' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_345_PLANES_PENSIONES_ES_COMPLEMENTARIA DEFAULT 0 FOR es_complementaria

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_sustitutiva' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT DF_DBO_TBN1_DOCUMENTOS_INFORMATIVOS_345_PLANES_PENSIONES_ES_SUSTITUTIVA DEFAULT 0 FOR es_sustitutiva

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN nif_declarante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_complementaria' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones SET es_complementaria=0 WHERE es_complementaria IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN es_complementaria bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='es_sustitutiva' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones SET es_sustitutiva=0 WHERE es_sustitutiva IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN es_sustitutiva bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='id_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN id_tipo_presentacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='telefono_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN telefono_contacto varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='nombre_contacto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN nombre_contacto varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='ref_presentacion_colectiva' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN ref_presentacion_colectiva int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN num_caja varchar(8) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN contador_revisiones int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_baja_declarante date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='PK_tbn1_documentos_informativos_345_planes_pensiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT PK_tbn1_documentos_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_expedientes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_expedientes FOREIGN KEY (id_expediente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_expedientes(id_expediente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_documentos_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_mi_tipo_presentacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_documentos_informativos_345_planes_pensiones_tbn1_mi_tipo_presentacion FOREIGN KEY (id_tipo_presentacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion(id_tipo_presentacion)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_documentos_informativos_345_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_345_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_documentos_informativos_345_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_documentos_informativos_345_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  ;WITH
  query AS (
    SELECT
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      decl.deadmon AS administracion,
      decl.denifdt AS nif_declarante,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      CASE WHEN decl.decompl='S' THEN 1 ELSE 0 END AS es_complementaria,
      CASE WHEN decl.desusti='S' THEN 1 ELSE 0 END AS es_sustitutiva,
      coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
      decl.defecpr AS fec_presentacion,
      decl.detelco AS telefono_contacto,
      decl.denomco AS nombre_contacto,
      decl.derfcol AS ref_presentacion_colectiva,
      decl.dencaja AS num_caja,
      decl.decrevi AS contador_revisiones,
      decl.defecba AS fec_baja_declarante
    FROM dbn1_stg_dhyf.dbo.tbn1decl_fp decl
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(decl.deejerc AS varchar)+'AL'+CAST(decl.derefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (decl.denifdt=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipos)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_345_planes_pensiones AS tbn1_documentos_informativos_345_planes_pensiones
  USING query ON query.id_documento=tbn1_documentos_informativos_345_planes_pensiones.id_documento
  WHEN MATCHED AND ((tbn1_documentos_informativos_345_planes_pensiones.id_expediente<>query.id_expediente OR (tbn1_documentos_informativos_345_planes_pensiones.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.administracion<>query.administracion OR (tbn1_documentos_informativos_345_planes_pensiones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.nif_declarante<>query.nif_declarante OR (tbn1_documentos_informativos_345_planes_pensiones.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.es_contribuyente<>query.es_contribuyente OR (tbn1_documentos_informativos_345_planes_pensiones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.id_contribuyente<>query.id_contribuyente OR (tbn1_documentos_informativos_345_planes_pensiones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.es_complementaria<>query.es_complementaria OR (tbn1_documentos_informativos_345_planes_pensiones.es_complementaria IS NULL AND query.es_complementaria IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.es_complementaria IS NOT NULL AND query.es_complementaria IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.es_sustitutiva<>query.es_sustitutiva OR (tbn1_documentos_informativos_345_planes_pensiones.es_sustitutiva IS NULL AND query.es_sustitutiva IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.es_sustitutiva IS NOT NULL AND query.es_sustitutiva IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.id_tipo_presentacion<>query.id_tipo_presentacion OR (tbn1_documentos_informativos_345_planes_pensiones.id_tipo_presentacion IS NULL AND query.id_tipo_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.id_tipo_presentacion IS NOT NULL AND query.id_tipo_presentacion IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.fec_presentacion<>query.fec_presentacion OR (tbn1_documentos_informativos_345_planes_pensiones.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.telefono_contacto<>query.telefono_contacto OR (tbn1_documentos_informativos_345_planes_pensiones.telefono_contacto IS NULL AND query.telefono_contacto IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.telefono_contacto IS NOT NULL AND query.telefono_contacto IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.nombre_contacto<>query.nombre_contacto OR (tbn1_documentos_informativos_345_planes_pensiones.nombre_contacto IS NULL AND query.nombre_contacto IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.nombre_contacto IS NOT NULL AND query.nombre_contacto IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.ref_presentacion_colectiva<>query.ref_presentacion_colectiva OR (tbn1_documentos_informativos_345_planes_pensiones.ref_presentacion_colectiva IS NULL AND query.ref_presentacion_colectiva IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.ref_presentacion_colectiva IS NOT NULL AND query.ref_presentacion_colectiva IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.num_caja<>query.num_caja OR (tbn1_documentos_informativos_345_planes_pensiones.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.contador_revisiones<>query.contador_revisiones OR (tbn1_documentos_informativos_345_planes_pensiones.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL)
                    OR tbn1_documentos_informativos_345_planes_pensiones.fec_baja_declarante<>query.fec_baja_declarante OR (tbn1_documentos_informativos_345_planes_pensiones.fec_baja_declarante IS NULL AND query.fec_baja_declarante IS NOT NULL) OR  (tbn1_documentos_informativos_345_planes_pensiones.fec_baja_declarante IS NOT NULL AND query.fec_baja_declarante IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      administracion=query.administracion,
      nif_declarante=query.nif_declarante,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_complementaria=query.es_complementaria,
      es_sustitutiva=query.es_sustitutiva,
      id_tipo_presentacion=query.id_tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      telefono_contacto=query.telefono_contacto,
      nombre_contacto=query.nombre_contacto,
      ref_presentacion_colectiva=query.ref_presentacion_colectiva,
      num_caja=query.num_caja,
      contador_revisiones=query.contador_revisiones,
      fec_baja_declarante=query.fec_baja_declarante,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,id_expediente,administracion,nif_declarante,es_contribuyente,id_contribuyente,es_complementaria,es_sustitutiva,id_tipo_presentacion,fec_presentacion,telefono_contacto,nombre_contacto,ref_presentacion_colectiva,num_caja,contador_revisiones,fec_baja_declarante,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.id_expediente,
      query.administracion,
      query.nif_declarante,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_complementaria,
      query.es_sustitutiva,
      query.id_tipo_presentacion,
      query.fec_presentacion,
      query.telefono_contacto,
      query.nombre_contacto,
      query.ref_presentacion_colectiva,
      query.num_caja,
      query.contador_revisiones,
      query.fec_baja_declarante,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones(
  id_detalles_345 int IDENTITY(1,1),
  id_documento int NOT NULL,
  secuencia varchar(11),
  administracion varchar(1),
  nif_declarado varchar(11),
  es_representante bit NOT NULL,
  [año_nacimiento] decimal(4,0) NOT NULL,
  id_provincia int,
  es_contribuyente bit,
  id_contribuyente int,
  clave_operacion varchar(1),
  subclave_operacion numeric(4,0),
  importe_operacion numeric(13,2),
  nif_beneficiario_minusvalido varchar(11),
  denom_plan_pensiones varchar(40),
  num_registro_fondo_pensiones varchar(5),
  nif_fondo_pensiones varchar(11),
  nif_entidad_aseguradora varchar(11),
  fec_primera_prima date,
  importe_acum_PIAS numeric(13,2),
  base_deduccion_prev_social numeric(13,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_det_mod345 UNIQUE (id_documento,secuencia),
  CONSTRAINT PK_tbn1_detalles_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_detalles_345),
  CONSTRAINT FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia),
  CONSTRAINT FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_detalles_345')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD id_detalles_345 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD nif_declarado varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD es_representante bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='año_nacimiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD [año_nacimiento] decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_provincia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD id_provincia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD es_contribuyente bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='clave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD clave_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='subclave_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD subclave_operacion numeric(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD importe_operacion numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_beneficiario_minusvalido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD nif_beneficiario_minusvalido varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='denom_plan_pensiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD denom_plan_pensiones varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='num_registro_fondo_pensiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD num_registro_fondo_pensiones varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_fondo_pensiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD nif_fondo_pensiones varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_entidad_aseguradora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD nif_entidad_aseguradora varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_primera_prima')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD fec_primera_prima date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_acum_PIAS')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD importe_acum_PIAS numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='base_deduccion_prev_social')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD base_deduccion_prev_social numeric(13,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_representante' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_345_PLANES_PENSIONES_ES_REPRESENTANTE DEFAULT 0 FOR es_representante

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD CONSTRAINT DF_DBO_TBN1_DETALLES_INFORMATIVOS_345_PLANES_PENSIONES_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_detalles_345' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN id_detalles_345 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN secuencia varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_declarado varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones SET es_representante=0 WHERE es_representante IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN es_representante bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='año_nacimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN [año_nacimiento] decimal(4,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_provincia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN id_provincia int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN es_contribuyente bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='clave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN clave_operacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='subclave_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN subclave_operacion numeric(4,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN importe_operacion numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_beneficiario_minusvalido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_beneficiario_minusvalido varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='denom_plan_pensiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN denom_plan_pensiones varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='num_registro_fondo_pensiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN num_registro_fondo_pensiones varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_fondo_pensiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_fondo_pensiones varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='nif_entidad_aseguradora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN nif_entidad_aseguradora varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_primera_prima' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN fec_primera_prima date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='importe_acum_PIAS' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN importe_acum_PIAS numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='base_deduccion_prev_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN base_deduccion_prev_social numeric(13,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='PK_tbn1_detalles_informativos_345_planes_pensiones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD CONSTRAINT PK_tbn1_detalles_informativos_345_planes_pensiones PRIMARY KEY CLUSTERED (id_detalles_345)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_provincias')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_provincias FOREIGN KEY (id_provincia) REFERENCES dbn1_norm_dhyf.dbo.tbn1_provincias(id_provincia)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_detalles_informativos_345_planes_pensiones' AND CONSTRAINT_NAME='FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones ADD CONSTRAINT FK_tbn1_detalles_informativos_345_planes_pensiones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_detalles_informativos_345_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_345_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_detalles_informativos_345_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_detalles_informativos_345_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  ;WITH
  query AS (
    SELECT
      doc.id_documento AS id_documento,
      CAST(ddos.dosecue AS varchar) AS secuencia,
      ddos.doadmon AS administracion,
      ddos.donifdo AS nif_declarado,
      CASE WHEN ddos.dorepre='S' THEN 1 ELSE 0 END AS es_representante,
      ddos.doejnac AS [año_nacimiento],
      coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      ddos.doclave AS clave_operacion,
      ddos.dosubcl AS subclave_operacion,
      ddos.doimpor/100 AS importe_operacion,
      ddos.donifmv AS nif_beneficiario_minusvalido,
      ddos.donompp AS denom_plan_pensiones,
      ddos.donumfp AS num_registro_fondo_pensiones,
      ddos.doniffp AS nif_fondo_pensiones,
      ddos.donifea AS nif_entidad_aseguradora,
      ddos.dofecpp AS fec_primera_prima,
      ddos.doipias/100 AS importe_acum_PIAS,
      ddos.dodeduc/100 AS base_deduccion_prev_social
    FROM dbn1_stg_dhyf.dbo.tbn1ddos_fp ddos
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.doejerc AS varchar)+'AL'+CAST(ddos.dorefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (ddos.donifdo=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.docodpr)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      CAST(ddos.dosecue AS varchar),
      ddos.doadmon,
      ddos.donifdo,
      CASE WHEN ddos.dorepre='S' THEN 1 ELSE 0 END,
      ddos.doejnac,
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente),
      ddos.doclave,
      ddos.dosubcl,
      ddos.doimpor/100,
      ddos.donifmv,
      ddos.donompp,
      ddos.donumfp,
      ddos.doniffp,
      ddos.donifea,
      ddos.dofecpp,
      ddos.doipias/100,
      ddos.dodeduc/100
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_345_planes_pensiones AS tbn1_detalles_informativos_345_planes_pensiones
  USING query ON query.id_documento=tbn1_detalles_informativos_345_planes_pensiones.id_documento AND query.secuencia=tbn1_detalles_informativos_345_planes_pensiones.secuencia
  WHEN MATCHED AND ((tbn1_detalles_informativos_345_planes_pensiones.administracion<>query.administracion OR (tbn1_detalles_informativos_345_planes_pensiones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.nif_declarado<>query.nif_declarado OR (tbn1_detalles_informativos_345_planes_pensiones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.es_representante<>query.es_representante OR (tbn1_detalles_informativos_345_planes_pensiones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.año_nacimiento<>query.año_nacimiento OR (tbn1_detalles_informativos_345_planes_pensiones.año_nacimiento IS NULL AND query.año_nacimiento IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.año_nacimiento IS NOT NULL AND query.año_nacimiento IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.id_provincia<>query.id_provincia OR (tbn1_detalles_informativos_345_planes_pensiones.id_provincia IS NULL AND query.id_provincia IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.id_provincia IS NOT NULL AND query.id_provincia IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.es_contribuyente<>query.es_contribuyente OR (tbn1_detalles_informativos_345_planes_pensiones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.id_contribuyente<>query.id_contribuyente OR (tbn1_detalles_informativos_345_planes_pensiones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.clave_operacion<>query.clave_operacion OR (tbn1_detalles_informativos_345_planes_pensiones.clave_operacion IS NULL AND query.clave_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.clave_operacion IS NOT NULL AND query.clave_operacion IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.subclave_operacion<>query.subclave_operacion OR (tbn1_detalles_informativos_345_planes_pensiones.subclave_operacion IS NULL AND query.subclave_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.subclave_operacion IS NOT NULL AND query.subclave_operacion IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.importe_operacion<>query.importe_operacion OR (tbn1_detalles_informativos_345_planes_pensiones.importe_operacion IS NULL AND query.importe_operacion IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.importe_operacion IS NOT NULL AND query.importe_operacion IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.nif_beneficiario_minusvalido<>query.nif_beneficiario_minusvalido OR (tbn1_detalles_informativos_345_planes_pensiones.nif_beneficiario_minusvalido IS NULL AND query.nif_beneficiario_minusvalido IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.nif_beneficiario_minusvalido IS NOT NULL AND query.nif_beneficiario_minusvalido IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.denom_plan_pensiones<>query.denom_plan_pensiones OR (tbn1_detalles_informativos_345_planes_pensiones.denom_plan_pensiones IS NULL AND query.denom_plan_pensiones IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.denom_plan_pensiones IS NOT NULL AND query.denom_plan_pensiones IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.num_registro_fondo_pensiones<>query.num_registro_fondo_pensiones OR (tbn1_detalles_informativos_345_planes_pensiones.num_registro_fondo_pensiones IS NULL AND query.num_registro_fondo_pensiones IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.num_registro_fondo_pensiones IS NOT NULL AND query.num_registro_fondo_pensiones IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.nif_fondo_pensiones<>query.nif_fondo_pensiones OR (tbn1_detalles_informativos_345_planes_pensiones.nif_fondo_pensiones IS NULL AND query.nif_fondo_pensiones IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.nif_fondo_pensiones IS NOT NULL AND query.nif_fondo_pensiones IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.nif_entidad_aseguradora<>query.nif_entidad_aseguradora OR (tbn1_detalles_informativos_345_planes_pensiones.nif_entidad_aseguradora IS NULL AND query.nif_entidad_aseguradora IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.nif_entidad_aseguradora IS NOT NULL AND query.nif_entidad_aseguradora IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.fec_primera_prima<>query.fec_primera_prima OR (tbn1_detalles_informativos_345_planes_pensiones.fec_primera_prima IS NULL AND query.fec_primera_prima IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.fec_primera_prima IS NOT NULL AND query.fec_primera_prima IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.importe_acum_PIAS<>query.importe_acum_PIAS OR (tbn1_detalles_informativos_345_planes_pensiones.importe_acum_PIAS IS NULL AND query.importe_acum_PIAS IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.importe_acum_PIAS IS NOT NULL AND query.importe_acum_PIAS IS NULL)
                    OR tbn1_detalles_informativos_345_planes_pensiones.base_deduccion_prev_social<>query.base_deduccion_prev_social OR (tbn1_detalles_informativos_345_planes_pensiones.base_deduccion_prev_social IS NULL AND query.base_deduccion_prev_social IS NOT NULL) OR  (tbn1_detalles_informativos_345_planes_pensiones.base_deduccion_prev_social IS NOT NULL AND query.base_deduccion_prev_social IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_representante=query.es_representante,
      año_nacimiento=query.año_nacimiento,
      id_provincia=query.id_provincia,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      clave_operacion=query.clave_operacion,
      subclave_operacion=query.subclave_operacion,
      importe_operacion=query.importe_operacion,
      nif_beneficiario_minusvalido=query.nif_beneficiario_minusvalido,
      denom_plan_pensiones=query.denom_plan_pensiones,
      num_registro_fondo_pensiones=query.num_registro_fondo_pensiones,
      nif_fondo_pensiones=query.nif_fondo_pensiones,
      nif_entidad_aseguradora=query.nif_entidad_aseguradora,
      fec_primera_prima=query.fec_primera_prima,
      importe_acum_PIAS=query.importe_acum_PIAS,
      base_deduccion_prev_social=query.base_deduccion_prev_social,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_documento,secuencia,administracion,nif_declarado,es_representante,año_nacimiento,id_provincia,es_contribuyente,id_contribuyente,clave_operacion,subclave_operacion,importe_operacion,nif_beneficiario_minusvalido,denom_plan_pensiones,num_registro_fondo_pensiones,nif_fondo_pensiones,nif_entidad_aseguradora,fec_primera_prima,importe_acum_PIAS,base_deduccion_prev_social,fec_alta,fec_modificacion) VALUES (
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_representante,
      query.año_nacimiento,
      query.id_provincia,
      query.es_contribuyente,
      query.id_contribuyente,
      query.clave_operacion,
      query.subclave_operacion,
      query.importe_operacion,
      query.nif_beneficiario_minusvalido,
      query.denom_plan_pensiones,
      query.num_registro_fondo_pensiones,
      query.nif_fondo_pensiones,
      query.nif_entidad_aseguradora,
      query.fec_primera_prima,
      query.importe_acum_PIAS,
      query.base_deduccion_prev_social,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_modelo_345_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_modelo_345_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_modelo_345_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_modelo_345_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_documentos_informativos_345_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_detalles_informativos_345_ssis @log;

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

