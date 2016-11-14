PRINT 'cargar_dimensional_modelo_193.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario(
  id_documento int NOT NULL,
  id_expediente int NOT NULL,
  cod_expediente varchar(40) NOT NULL,
  nif_declarante varchar(12) NOT NULL,
  fec_alta_af date,
  razon_social varchar(25) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  delegacion_hacienda varchar(2) NOT NULL,
  administracion_hacienda varchar(3) NOT NULL,
  telefono varchar(10) NOT NULL,
  cod_presentador_colectivo int NOT NULL,
  cod_entidad_gestora varchar(4) NOT NULL,
  cod_tipo_presentacion varchar(1) NOT NULL,
  tipo_presentacion varchar(50) NOT NULL,
  fec_presentacion date,
  num_caja varchar(8) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  num_declarados_erroneos int,
  hay_observaciones varchar(1) NOT NULL,
  es_historico varchar(1) NOT NULL,
  volumen_operaciones numeric(18,2),
  num_justificante numeric(13),
  tipo_declaracion varchar(1) NOT NULL,
  contador_revisiones int,
  CONSTRAINT PK_tbn1_dim_documentos_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_193_capital_mobiliario_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD hay_observaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD es_historico varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD contador_revisiones int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN razon_social varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN administracion_hacienda varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN telefono varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN cod_presentador_colectivo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN hay_observaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN es_historico varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN tipo_declaracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ALTER COLUMN contador_revisiones int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_193_capital_mobiliario')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_193_capital_mobiliario_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_193_capital_mobiliario_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_193_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_193_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_193_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_documentos_informativos_193_ssis',
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

  -- Materialized query: query
  SELECT
    doc_193.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(left(doc_193.nif_declarante,9)+' '+right(doc_193.nif_declarante,2),'') AS nif_declarante,
    doc_193.fec_alta_af AS fec_alta_af,
    coalesce(doc_193.razon_social,'') AS razon_social,
    CASE WHEN doc_193.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_193.id_contribuyente AS id_contribuyente,
    coalesce(doc_193.delegacion_hacienda,'') AS delegacion_hacienda,
    coalesce(doc_193.administracion_hacienda,'') AS administracion_hacienda,
    coalesce(doc_193.telefono,'') AS telefono,
    coalesce(doc_193.cod_presentador_colectivo,'') AS cod_presentador_colectivo,
    coalesce(doc_193.cod_entidad_gestora,'') AS cod_entidad_gestora,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_193.fec_presentacion AS fec_presentacion,
    coalesce(doc_193.num_caja,'') AS num_caja,
    CASE WHEN doc_193.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    doc_193.num_declarados_erroneos AS num_declarados_erroneos,
    CASE WHEN doc_193.hay_observaciones=1 THEN 'S' ELSE 'N' END AS hay_observaciones,
    CASE WHEN doc_193.es_historico=1 THEN 'S' ELSE 'N' END AS es_historico,
    doc_193.volumen_operaciones AS volumen_operaciones,
    doc_193.num_justificante AS num_justificante,
    coalesce(doc_193.tipo_declaracion,'') AS tipo_declaracion,
    doc_193.contador_revisiones AS contador_revisiones,
    doc_193.fec_baja AS fec_baja
  INTO #query__94248
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_193_capital_mobiliario doc_193
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_193.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_193.id_tipo_presentacion)
  WHERE doc_193.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__46C40 ON #query__94248 (id_documento,administracion_hacienda)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario AS tbn1_dim_documentos_informativos_193_capital_mobiliario
  USING #query__94248 AS query ON query.id_documento=tbn1_dim_documentos_informativos_193_capital_mobiliario.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_193_capital_mobiliario.administracion_hacienda
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_193_capital_mobiliario AS tbn1_dim_documentos_informativos_193_capital_mobiliario
  USING #query__94248 AS query ON query.id_documento=tbn1_dim_documentos_informativos_193_capital_mobiliario.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_193_capital_mobiliario.administracion_hacienda
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_193_capital_mobiliario.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.fec_alta_af<>query.fec_alta_af OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.telefono<>query.telefono OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.es_erroneo<>query.es_erroneo OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.hay_observaciones<>query.hay_observaciones OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.es_historico<>query.es_historico OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.volumen_operaciones<>query.volumen_operaciones OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.num_justificante<>query.num_justificante OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_193_capital_mobiliario.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_193_capital_mobiliario.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_193_capital_mobiliario.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL))) THEN
    UPDATE SET
      id_expediente=query.id_expediente,
      cod_expediente=query.cod_expediente,
      nif_declarante=query.nif_declarante,
      fec_alta_af=query.fec_alta_af,
      razon_social=query.razon_social,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      delegacion_hacienda=query.delegacion_hacienda,
      telefono=query.telefono,
      cod_presentador_colectivo=query.cod_presentador_colectivo,
      cod_entidad_gestora=query.cod_entidad_gestora,
      cod_tipo_presentacion=query.cod_tipo_presentacion,
      tipo_presentacion=query.tipo_presentacion,
      fec_presentacion=query.fec_presentacion,
      num_caja=query.num_caja,
      es_erroneo=query.es_erroneo,
      num_declarados_erroneos=query.num_declarados_erroneos,
      hay_observaciones=query.hay_observaciones,
      es_historico=query.es_historico,
      volumen_operaciones=query.volumen_operaciones,
      num_justificante=query.num_justificante,
      tipo_declaracion=query.tipo_declaracion,
      contador_revisiones=query.contador_revisiones
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_documento,id_expediente,cod_expediente,nif_declarante,fec_alta_af,razon_social,es_contribuyente,id_contribuyente,delegacion_hacienda,administracion_hacienda,telefono,cod_presentador_colectivo,cod_entidad_gestora,cod_tipo_presentacion,tipo_presentacion,fec_presentacion,num_caja,es_erroneo,num_declarados_erroneos,hay_observaciones,es_historico,volumen_operaciones,num_justificante,tipo_declaracion,contador_revisiones) VALUES (
      query.id_documento,
      query.id_expediente,
      query.cod_expediente,
      query.nif_declarante,
      query.fec_alta_af,
      query.razon_social,
      query.es_contribuyente,
      query.id_contribuyente,
      query.delegacion_hacienda,
      query.administracion_hacienda,
      query.telefono,
      query.cod_presentador_colectivo,
      query.cod_entidad_gestora,
      query.cod_tipo_presentacion,
      query.tipo_presentacion,
      query.fec_presentacion,
      query.num_caja,
      query.es_erroneo,
      query.num_declarados_erroneos,
      query.hay_observaciones,
      query.es_historico,
      query.volumen_operaciones,
      query.num_justificante,
      query.tipo_declaracion,
      query.contador_revisiones);

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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario(
  id_detalles_193 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_externo varchar(1) NOT NULL,
  es_mediador varchar(1) NOT NULL,
  es_representante varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_tipo_registro varchar(1) NOT NULL,
  tipo_registro varchar(50) NOT NULL,
  cod_tipo_percepcion varchar(1) NOT NULL,
  tipo_percepcion varchar(50) NOT NULL,
  porcentaje_participacion numeric(18,4),
  multiplicador varchar(3),
  es_identificado varchar(1) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  --id_mae_clave_operacion_193 int,  
  cod_clave_operacion_193 varchar(1) NOT NULL DEFAULT '',	----(**) NOT NULL
  clave_operacion_193 varchar(200) NOT NULL DEFAULT '',	----(**) NOT NULL
  clave_percepcion varchar(1) NOT NULL,
  cod_naturaleza varchar(2) NOT NULL,
  naturaleza varchar(150) NOT NULL,
  num_perceptores int,
  cod_pago varchar(1) NOT NULL,
  pago varchar(50) NOT NULL,
  cod_clave_codigo varchar(1) NOT NULL,
  clave_codigo varchar(50) NOT NULL,
  emisor varchar(12) NOT NULL,
  base_retenciones numeric(18,2),
  tipo_retencion numeric(18,4),
  retenciones_ingresos_cuenta numeric(18,2),
  valores_pendientes_abono varchar(1) NOT NULL,
  ejercicio_devengo int,
  periodificacion varchar(1) NOT NULL,
  cod_operacion_tipo_registro varchar(1) NOT NULL,
  operacion_tipo_registro varchar(50) NOT NULL,
  importe_percepcion numeric(18,2),
  cantidad_no_integrada numeric(18,2),
  ingresos_ejercicios_anteriores numeric(18,2),
  gastos numeric(18,2),
  cod_tipo_codigo varchar(1) NOT NULL,
  tipo_codigo varchar(60) NOT NULL,
  banco varchar(4) NOT NULL,
  sucursal varchar(4) NOT NULL,
  num_cuenta varchar(12) NOT NULL,
  fec_inicio_prestamo date,
  fec_vencimiento_prestamo date,
  compensaciones numeric(18,2),
  garantias numeric(18,2),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_detalles_193),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_193_capital_mobiliario_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_193_capital_mobiliario_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_detalles_193')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD id_detalles_193 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_mediador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD es_mediador varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_registro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_tipo_registro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_registro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD tipo_registro varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_tipo_percepcion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD tipo_percepcion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD porcentaje_participacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='multiplicador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD multiplicador varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD es_erroneo varchar(1)

GO
----(**)
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_clave_operacion_193')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_clave_operacion_193 varchar(1) 

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_operacion_193')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD clave_operacion_193 varchar(200)


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD clave_percepcion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_naturaleza')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_naturaleza varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='naturaleza')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD naturaleza varchar(150)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_perceptores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD num_perceptores int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_pago varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='pago')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD pago varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_clave_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_clave_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD clave_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='emisor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD emisor varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='base_retenciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD base_retenciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD tipo_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='retenciones_ingresos_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD retenciones_ingresos_cuenta numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='valores_pendientes_abono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD valores_pendientes_abono varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ejercicio_devengo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD ejercicio_devengo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='periodificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD periodificacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_operacion_tipo_registro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_operacion_tipo_registro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='operacion_tipo_registro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD operacion_tipo_registro varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='importe_percepcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD importe_percepcion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cantidad_no_integrada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cantidad_no_integrada numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ingresos_ejercicios_anteriores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD ingresos_ejercicios_anteriores numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD gastos numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD cod_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD tipo_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD banco varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD sucursal varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD num_cuenta varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_inicio_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD fec_inicio_prestamo date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_vencimiento_prestamo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD fec_vencimiento_prestamo date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='compensaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD compensaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='garantias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD garantias numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_detalles_193' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_detalles_193 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_mediador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_mediador varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_registro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_tipo_registro varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_registro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN tipo_registro varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_tipo_percepcion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN tipo_percepcion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN porcentaje_participacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='multiplicador' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN multiplicador varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN es_erroneo varchar(1) NOT NULL

----(**)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_clave_operacion_193' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_clave_operacion_193 varchar(1) NOT NULL 
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_operacion_193' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN clave_operacion_193 varchar(200) NOT NULL 
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_percepcion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN clave_percepcion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_naturaleza varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN naturaleza varchar(150) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_perceptores' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN num_perceptores int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_pago varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='pago' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN pago varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_clave_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_clave_codigo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='clave_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN clave_codigo varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='emisor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN emisor varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='base_retenciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN base_retenciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN tipo_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='retenciones_ingresos_cuenta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN retenciones_ingresos_cuenta numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='valores_pendientes_abono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN valores_pendientes_abono varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ejercicio_devengo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN ejercicio_devengo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='periodificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN periodificacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_operacion_tipo_registro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_operacion_tipo_registro varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='operacion_tipo_registro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN operacion_tipo_registro varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='importe_percepcion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN importe_percepcion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cantidad_no_integrada' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cantidad_no_integrada numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='ingresos_ejercicios_anteriores' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN ingresos_ejercicios_anteriores numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='gastos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN gastos numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='cod_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN cod_tipo_codigo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN tipo_codigo varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='banco' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN banco varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN sucursal varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN num_cuenta varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_inicio_prestamo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_inicio_prestamo date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='fec_vencimiento_prestamo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN fec_vencimiento_prestamo date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='compensaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN compensaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND COLUMN_NAME='garantias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ALTER COLUMN garantias numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_193_capital_mobiliario')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_193_capital_mobiliario PRIMARY KEY CLUSTERED (id_detalles_193)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_193_capital_mobiliario_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_193_capital_mobiliario_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_193_capital_mobiliario' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_193_capital_mobiliario_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_193_capital_mobiliario_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_193_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_193_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_193_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_detalles_informativos_193_ssis',
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

  -- Materialized query: query
  SELECT
    det_193.id_detalles_193 AS id_detalles_193,
    det_193.id_documento AS id_documento,
    det_193.secuencia AS secuencia,
    coalesce(det_193.administracion,'') AS administracion,
    coalesce(left(det_193.nif_declarado,9)+' '+right(det_193.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_193.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    c.id_contribuyente AS id_contribuyente,
    CASE WHEN det_193.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN det_193.es_mediador=1 THEN 'S' ELSE 'N' END AS es_mediador,
    CASE WHEN det_193.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    provincia.provincia AS provincia,
    tipo_registro.cod_tipo_registro AS cod_tipo_registro,
    tipo_registro.tipo_registro AS tipo_registro,
    tipo_percepcion.cod_modalidad AS cod_tipo_percepcion,
    tipo_percepcion.modalidad AS tipo_percepcion,
    det_193.porcentaje_participacion AS porcentaje_participacion,
    coalesce(det_193.multiplicador,'') AS multiplicador,
    CASE WHEN det_193.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_193.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
	
	--det_193.id_mae_clave_operacion_193 AS id_mae_clave_operacion_193, --(**)
	clave_operacion.cod_clave_operacion_193 AS cod_clave_operacion_193, ----(**)
	clave_operacion.clave_operacion_193 AS clave_operacion_193,			----(**)
	
    coalesce(det_193.clave_percepcion,'') AS clave_percepcion,
    naturaleza.cod_naturaleza AS cod_naturaleza,
    naturaleza.naturaleza AS naturaleza,
    det_193.num_perceptores AS num_perceptores,
    pago.cod_pago AS cod_pago,
    pago.pago AS pago,
    clave_codigo.cod_clave_codigo AS cod_clave_codigo,
    clave_codigo.clave_codigo AS clave_codigo,
    coalesce(det_193.emisor,'') AS emisor,
    det_193.base_retenciones AS base_retenciones,
    det_193.tipo_retencion AS tipo_retencion,
    det_193.retenciones_ingresos_cuenta AS retenciones_ingresos_cuenta,
    det_193.valores_pendientes_abono AS valores_pendientes_abono,
    det_193.ejercicio_devengo AS ejercicio_devengo,
    coalesce(det_193.periodificacion,'') AS periodificacion,
    op_tipo_registro.cod_tipo_registro AS cod_operacion_tipo_registro,
    op_tipo_registro.tipo_registro AS operacion_tipo_registro,
    det_193.importe_percepcion AS importe_percepcion,
    det_193.cantidad_no_integrada AS cantidad_no_integrada,
    det_193.ingresos_ejercicios_anteriores AS ingresos_ejercicios_anteriores,
    det_193.gastos AS gastos,
    tipo_codigo.cod_tipo_codigo AS cod_tipo_codigo,
    tipo_codigo.tipo_codigo AS tipo_codigo,
    coalesce(det_193.banco,'') AS banco,
    coalesce(det_193.sucursal,'') AS sucursal,
    coalesce(det_193.num_cuenta,'') AS num_cuenta,
    det_193.fec_inicio_prestamo AS fec_inicio_prestamo,
    det_193.fec_vencimiento_prestamo AS fec_vencimiento_prestamo,
    det_193.compensaciones AS compensaciones,
    det_193.garantias AS garantias,
    det_193.fec_baja AS fec_baja
  INTO #query__82500
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_193_capital_mobiliario det_193
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_193 ON (doc_193.id_documento=det_193.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_193.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_193.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro tipo_registro ON (tipo_registro.id_tipo_registro=det_193.id_tipo_registro)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza_193 naturaleza ON (naturaleza.id_naturaleza=det_193.id_naturaleza)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_modalidad tipo_percepcion ON (tipo_percepcion.id_modalidad=det_193.id_tipo_percepcion)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_pago pago ON (pago.id_pago=det_193.id_pago)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo clave_codigo ON (clave_codigo.id_clave_codigo=det_193.id_clave_codigo)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.id_tipo_codigo=det_193.id_tipo_codigo)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_registro op_tipo_registro ON (op_tipo_registro.id_tipo_registro=det_193.id_tipo_registro)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_clave_operacion_193 clave_operacion ON (clave_operacion.id_mae_clave_operacion_193 = det_193.id_mae_clave_operacion_193)
  WHERE det_193.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__63FD7 ON #query__82500 (id_detalles_193)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario AS tbn1_fact_detalles_informativos_193_capital_mobiliario
  USING #query__82500 AS query ON query.id_detalles_193=tbn1_fact_detalles_informativos_193_capital_mobiliario.id_detalles_193
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_193_capital_mobiliario AS tbn1_fact_detalles_informativos_193_capital_mobiliario
  USING #query__82500 AS query ON query.id_detalles_193=tbn1_fact_detalles_informativos_193_capital_mobiliario.id_detalles_193
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_193_capital_mobiliario.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.es_mediador<>query.es_mediador OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_mediador IS NULL AND query.es_mediador IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_mediador IS NOT NULL AND query.es_mediador IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_registro<>query.cod_tipo_registro OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_registro IS NULL AND query.cod_tipo_registro IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_registro IS NOT NULL AND query.cod_tipo_registro IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_registro<>query.tipo_registro OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_percepcion<>query.cod_tipo_percepcion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_percepcion IS NULL AND query.cod_tipo_percepcion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_percepcion IS NOT NULL AND query.cod_tipo_percepcion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_percepcion<>query.tipo_percepcion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_percepcion IS NULL AND query.tipo_percepcion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_percepcion IS NOT NULL AND query.tipo_percepcion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.multiplicador<>query.multiplicador OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.multiplicador IS NULL AND query.multiplicador IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.multiplicador IS NOT NULL AND query.multiplicador IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.es_erroneo<>query.es_erroneo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    ----(**)
					OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_clave_operacion_193<>query.cod_clave_operacion_193 OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_clave_operacion_193 IS NULL AND query.cod_clave_operacion_193 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_clave_operacion_193 IS NOT NULL AND query.cod_clave_operacion_193 IS NULL)
					OR tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_operacion_193<>query.clave_operacion_193 OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_operacion_193 IS NULL AND query.clave_operacion_193 IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_operacion_193 IS NOT NULL AND query.clave_operacion_193 IS NULL)
                    
					OR tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_percepcion<>query.clave_percepcion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_percepcion IS NULL AND query.clave_percepcion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_percepcion IS NOT NULL AND query.clave_percepcion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_naturaleza<>query.cod_naturaleza OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_naturaleza IS NULL AND query.cod_naturaleza IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_naturaleza IS NOT NULL AND query.cod_naturaleza IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.naturaleza<>query.naturaleza OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.naturaleza IS NOT NULL AND query.naturaleza IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.num_perceptores<>query.num_perceptores OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.num_perceptores IS NULL AND query.num_perceptores IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.num_perceptores IS NOT NULL AND query.num_perceptores IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_pago<>query.cod_pago OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_pago IS NULL AND query.cod_pago IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_pago IS NOT NULL AND query.cod_pago IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.pago<>query.pago OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.pago IS NULL AND query.pago IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.pago IS NOT NULL AND query.pago IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_clave_codigo<>query.cod_clave_codigo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_clave_codigo IS NULL AND query.cod_clave_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_clave_codigo IS NOT NULL AND query.cod_clave_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_codigo<>query.clave_codigo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_codigo IS NULL AND query.clave_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.clave_codigo IS NOT NULL AND query.clave_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.emisor<>query.emisor OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.emisor IS NULL AND query.emisor IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.emisor IS NOT NULL AND query.emisor IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.base_retenciones<>query.base_retenciones OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.base_retenciones IS NULL AND query.base_retenciones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.base_retenciones IS NOT NULL AND query.base_retenciones IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_retencion<>query.tipo_retencion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta<>query.retenciones_ingresos_cuenta OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta IS NULL AND query.retenciones_ingresos_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.retenciones_ingresos_cuenta IS NOT NULL AND query.retenciones_ingresos_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono<>query.valores_pendientes_abono OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono IS NULL AND query.valores_pendientes_abono IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.valores_pendientes_abono IS NOT NULL AND query.valores_pendientes_abono IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.ejercicio_devengo<>query.ejercicio_devengo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.ejercicio_devengo IS NULL AND query.ejercicio_devengo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.ejercicio_devengo IS NOT NULL AND query.ejercicio_devengo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.periodificacion<>query.periodificacion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.periodificacion IS NULL AND query.periodificacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.periodificacion IS NOT NULL AND query.periodificacion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_operacion_tipo_registro<>query.cod_operacion_tipo_registro OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_operacion_tipo_registro IS NULL AND query.cod_operacion_tipo_registro IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_operacion_tipo_registro IS NOT NULL AND query.cod_operacion_tipo_registro IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.operacion_tipo_registro<>query.operacion_tipo_registro OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.operacion_tipo_registro IS NULL AND query.operacion_tipo_registro IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.operacion_tipo_registro IS NOT NULL AND query.operacion_tipo_registro IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.importe_percepcion<>query.importe_percepcion OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.importe_percepcion IS NULL AND query.importe_percepcion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.importe_percepcion IS NOT NULL AND query.importe_percepcion IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada<>query.cantidad_no_integrada OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada IS NULL AND query.cantidad_no_integrada IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cantidad_no_integrada IS NOT NULL AND query.cantidad_no_integrada IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores<>query.ingresos_ejercicios_anteriores OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores IS NULL AND query.ingresos_ejercicios_anteriores IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.ingresos_ejercicios_anteriores IS NOT NULL AND query.ingresos_ejercicios_anteriores IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.gastos<>query.gastos OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.gastos IS NULL AND query.gastos IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.gastos IS NOT NULL AND query.gastos IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_codigo<>query.cod_tipo_codigo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_codigo<>query.tipo_codigo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_codigo IS NULL AND query.tipo_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.tipo_codigo IS NOT NULL AND query.tipo_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.banco<>query.banco OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.sucursal<>query.sucursal OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.num_cuenta<>query.num_cuenta OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo<>query.fec_inicio_prestamo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo IS NULL AND query.fec_inicio_prestamo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.fec_inicio_prestamo IS NOT NULL AND query.fec_inicio_prestamo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo<>query.fec_vencimiento_prestamo OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo IS NULL AND query.fec_vencimiento_prestamo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.fec_vencimiento_prestamo IS NOT NULL AND query.fec_vencimiento_prestamo IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.compensaciones<>query.compensaciones OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.compensaciones IS NULL AND query.compensaciones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.compensaciones IS NOT NULL AND query.compensaciones IS NULL)
                    OR tbn1_fact_detalles_informativos_193_capital_mobiliario.garantias<>query.garantias OR (tbn1_fact_detalles_informativos_193_capital_mobiliario.garantias IS NULL AND query.garantias IS NOT NULL) OR  (tbn1_fact_detalles_informativos_193_capital_mobiliario.garantias IS NOT NULL AND query.garantias IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      secuencia=query.secuencia,
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_mediador=query.es_mediador,
      es_representante=query.es_representante,
      provincia=query.provincia,
      cod_tipo_registro=query.cod_tipo_registro,
      tipo_registro=query.tipo_registro,
      cod_tipo_percepcion=query.cod_tipo_percepcion,
      tipo_percepcion=query.tipo_percepcion,
      porcentaje_participacion=query.porcentaje_participacion,
      multiplicador=query.multiplicador,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
	  cod_clave_operacion_193=query.cod_clave_operacion_193,
      clave_operacion_193=query.clave_operacion_193,
      clave_percepcion=query.clave_percepcion,
      cod_naturaleza=query.cod_naturaleza,
      naturaleza=query.naturaleza,
      num_perceptores=query.num_perceptores,
      cod_pago=query.cod_pago,
      pago=query.pago,
      cod_clave_codigo=query.cod_clave_codigo,
      clave_codigo=query.clave_codigo,
      emisor=query.emisor,
      base_retenciones=query.base_retenciones,
      tipo_retencion=query.tipo_retencion,
      retenciones_ingresos_cuenta=query.retenciones_ingresos_cuenta,
      valores_pendientes_abono=query.valores_pendientes_abono,
      ejercicio_devengo=query.ejercicio_devengo,
      periodificacion=query.periodificacion,
      cod_operacion_tipo_registro=query.cod_operacion_tipo_registro,
      operacion_tipo_registro=query.operacion_tipo_registro,
      importe_percepcion=query.importe_percepcion,
      cantidad_no_integrada=query.cantidad_no_integrada,
      ingresos_ejercicios_anteriores=query.ingresos_ejercicios_anteriores,
      gastos=query.gastos,
      cod_tipo_codigo=query.cod_tipo_codigo,
      tipo_codigo=query.tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      fec_inicio_prestamo=query.fec_inicio_prestamo,
      fec_vencimiento_prestamo=query.fec_vencimiento_prestamo,
      compensaciones=query.compensaciones,
      garantias=query.garantias
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_193,id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_mediador,es_representante,provincia,cod_tipo_registro,tipo_registro,cod_tipo_percepcion,tipo_percepcion,porcentaje_participacion,multiplicador,es_identificado,es_erroneo,cod_clave_operacion_193,clave_operacion_193,clave_percepcion,cod_naturaleza,naturaleza,num_perceptores,cod_pago,pago,cod_clave_codigo,clave_codigo,emisor,base_retenciones,tipo_retencion,retenciones_ingresos_cuenta,valores_pendientes_abono,ejercicio_devengo,periodificacion,cod_operacion_tipo_registro,operacion_tipo_registro,importe_percepcion,cantidad_no_integrada,ingresos_ejercicios_anteriores,gastos,cod_tipo_codigo,tipo_codigo,banco,sucursal,num_cuenta,fec_inicio_prestamo,fec_vencimiento_prestamo,compensaciones,garantias) VALUES (
      query.id_detalles_193,
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_mediador,
      query.es_representante,
      query.provincia,
      query.cod_tipo_registro,
      query.tipo_registro,
      query.cod_tipo_percepcion,
      query.tipo_percepcion,
      query.porcentaje_participacion,
      query.multiplicador,
      query.es_identificado,
      query.es_erroneo,
	  query.cod_clave_operacion_193,
	  query.clave_operacion_193,
      query.clave_percepcion,
      query.cod_naturaleza,
      query.naturaleza,
      query.num_perceptores,
      query.cod_pago,
      query.pago,
      query.cod_clave_codigo,
      query.clave_codigo,
      query.emisor,
      query.base_retenciones,
      query.tipo_retencion,
      query.retenciones_ingresos_cuenta,
      query.valores_pendientes_abono,
      query.ejercicio_devengo,
      query.periodificacion,
      query.cod_operacion_tipo_registro,
      query.operacion_tipo_registro,
      query.importe_percepcion,
      query.cantidad_no_integrada,
      query.ingresos_ejercicios_anteriores,
      query.gastos,
      query.cod_tipo_codigo,
      query.tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.fec_inicio_prestamo,
      query.fec_vencimiento_prestamo,
      query.compensaciones,
      query.garantias);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_193_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_193_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_193_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_modelo_193_ssis',
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_193_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_193_ssis @log;

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

