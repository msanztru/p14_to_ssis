PRINT 'cargar_dimensional_modelo_187.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones(
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
  CONSTRAINT PK_tbn1_dim_documentos_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_187_operaciones_con_acciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD hay_observaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD es_historico varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD contador_revisiones int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN razon_social varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN administracion_hacienda varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN telefono varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN cod_presentador_colectivo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN hay_observaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN es_historico varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_declaracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ALTER COLUMN contador_revisiones int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_187_operaciones_con_acciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_187_operaciones_con_acciones_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_187_operaciones_con_acciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_187_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_187_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_187_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_documentos_informativos_187_ssis',
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
    doc_187.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(left(doc_187.nif_declarante,9)+' '+right(doc_187.nif_declarante,2),'') AS nif_declarante,
    doc_187.fec_alta_af AS fec_alta_af,
    coalesce(doc_187.razon_social,'') AS razon_social,
    CASE WHEN doc_187.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_187.id_contribuyente AS id_contribuyente,
    coalesce(doc_187.delegacion_hacienda,'') AS delegacion_hacienda,
    coalesce(doc_187.administracion_hacienda,'') AS administracion_hacienda,
    coalesce(doc_187.telefono,'') AS telefono,
    coalesce(doc_187.cod_presentador_colectivo,'') AS cod_presentador_colectivo,
    coalesce(doc_187.cod_entidad_gestora,'') AS cod_entidad_gestora,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_187.fec_presentacion AS fec_presentacion,
    coalesce(doc_187.num_caja,'') AS num_caja,
    CASE WHEN doc_187.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    doc_187.num_declarados_erroneos AS num_declarados_erroneos,
    CASE WHEN doc_187.hay_observaciones=1 THEN 'S' ELSE 'N' END AS hay_observaciones,
    CASE WHEN doc_187.es_historico=1 THEN 'S' ELSE 'N' END AS es_historico,
    doc_187.volumen_operaciones AS volumen_operaciones,
    doc_187.num_justificante AS num_justificante,
    coalesce(doc_187.tipo_declaracion,'') AS tipo_declaracion,
    doc_187.contador_revisiones AS contador_revisiones,
    doc_187.fec_baja AS fec_baja
  INTO #query__421A6
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_187_operaciones_con_acciones doc_187
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_187.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_187.id_tipo_presentacion)
  WHERE doc_187.fec_modificacion>@fecha_ultima_carga
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__64A35 ON #query__421A6 (id_documento,administracion_hacienda)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones AS tbn1_dim_documentos_informativos_187_operaciones_con_acciones
  USING #query__421A6 AS query ON query.id_documento=tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_187_operaciones_con_acciones.administracion_hacienda

  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_187_operaciones_con_acciones AS tbn1_dim_documentos_informativos_187_operaciones_con_acciones
  USING #query__421A6 AS query ON query.id_documento=tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_187_operaciones_con_acciones.administracion_hacienda

  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.fec_alta_af<>query.fec_alta_af OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.telefono<>query.telefono OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_erroneo<>query.es_erroneo OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.hay_observaciones<>query.hay_observaciones OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_historico<>query.es_historico OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.volumen_operaciones<>query.volumen_operaciones OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_justificante<>query.num_justificante OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_187_operaciones_con_acciones.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_187_operaciones_con_acciones.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL))) THEN
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones(
  id_detalles_187 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1) NOT NULL,
  id_contribuyente int,
  es_externo varchar(1) NOT NULL,
  es_representante varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  cod_pais varchar(3) NOT NULL,
  cod_tipo_socio varchar(1) NOT NULL,
  tipo_socio varchar(50) NOT NULL,
  cod_naturaleza varchar(1) NOT NULL,
  naturaleza varchar(50) NOT NULL,
  cod_clave_identificacion_fondo int NOT NULL,
  clave_identificacion_fondo varchar(25) NOT NULL,
  cod_tipo_operacion varchar(1) NOT NULL,
  tipo_operacion varchar(50) NOT NULL,
  fec_operacion date,
  num_acciones decimal(16,0),
  clave_origen varchar(1) NOT NULL,
  tipo_retencion numeric(18,4),
  es_identificado varchar(1) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  importe_adquisicion numeric(18,2),
  ganancia_antiguo numeric(18,2),
  ganancia numeric(18,2),
  retencion numeric(18,2),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_detalles_187),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_detalles_187')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD id_detalles_187 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_pais')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD cod_pais varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_tipo_socio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD cod_tipo_socio varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_socio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD tipo_socio varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_naturaleza')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD cod_naturaleza varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='naturaleza')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD naturaleza varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD cod_clave_identificacion_fondo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='clave_identificacion_fondo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD clave_identificacion_fondo varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_tipo_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD cod_tipo_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD tipo_operacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD fec_operacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_acciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD num_acciones decimal(16,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='clave_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD clave_origen varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD tipo_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='importe_adquisicion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD importe_adquisicion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia_antiguo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD ganancia_antiguo numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD ganancia numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD retencion numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_detalles_187' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_detalles_187 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_pais' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN cod_pais varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_tipo_socio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN cod_tipo_socio varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_socio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_socio varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN cod_naturaleza varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='naturaleza' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN naturaleza varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN cod_clave_identificacion_fondo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='clave_identificacion_fondo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN clave_identificacion_fondo varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='cod_tipo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN cod_tipo_operacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_operacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='fec_operacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN fec_operacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='num_acciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN num_acciones decimal(16,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='clave_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN clave_origen varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN tipo_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='importe_adquisicion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN importe_adquisicion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia_antiguo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN ganancia_antiguo numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='ganancia' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN ganancia numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND COLUMN_NAME='retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ALTER COLUMN retencion numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones PRIMARY KEY CLUSTERED (id_detalles_187)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_187_operaciones_con_acciones' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_187_operaciones_con_acciones_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_187_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_187_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_187_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_detalles_informativos_187_ssis',
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
    det_187.id_detalles_187 AS id_detalles_187,
    det_187.id_documento AS id_documento,
    det_187.secuencia AS secuencia,
    coalesce(det_187.administracion,'') AS administracion,
    coalesce(left(det_187.nif_declarado,9)+' '+right(det_187.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_187.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_187.id_contribuyente AS id_contribuyente,
    CASE WHEN det_187.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN det_187.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    provincia.provincia AS provincia,
    coalesce(det_187.cod_pais,'') AS cod_pais,
    tipo_socio.cod_tipo_socio AS cod_tipo_socio,
    tipo_socio.tipo_socio AS tipo_socio,
    naturaleza.cod_naturaleza AS cod_naturaleza,
    naturaleza.naturaleza AS naturaleza,
    clave_ident_fondo.cod_clave_identificacion_fondo AS cod_clave_identificacion_fondo,
    clave_ident_fondo.clave_identificacion_fondo AS clave_identificacion_fondo,
    tipo_operacion.cod_tipo_operacion AS cod_tipo_operacion,
    tipo_operacion.tipo_operacion AS tipo_operacion,
    det_187.fec_operacion AS fec_operacion,
    det_187.num_acciones AS num_acciones,
    coalesce(det_187.clave_origen,'') AS clave_origen,
    coalesce(det_187.tipo_retencion,'') AS tipo_retencion,
    CASE WHEN det_187.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_187.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    det_187.importe_adquisicion AS importe_adquisicion,
    det_187.ganancia_antiguo AS ganancia_antiguo,
    det_187.ganancia AS ganancia,
    det_187.retencion AS retencion,
    det_187.fec_Baja AS fec_Baja
  INTO #query__30B35
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_187_operaciones_con_acciones det_187
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_187 ON (doc_187.id_documento=det_187.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_187.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_187.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_socio tipo_socio ON (tipo_socio.id_tipo_socio=det_187.id_tipo_socio)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_naturaleza naturaleza ON (naturaleza.id_naturaleza=det_187.id_naturaleza)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo clave_ident_fondo ON (clave_ident_fondo.id_clave_identificacion_fondo=det_187.id_clave_identificacion_fondo)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_operacion tipo_operacion ON (tipo_operacion.id_tipo_operacion=det_187.id_tipo_operacion)
  WHERE det_187.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__51D82 ON #query__30B35 (id_detalles_187)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones AS tbn1_fact_detalles_informativos_187_operaciones_con_acciones
  USING #query__30B35 AS query ON query.id_detalles_187=tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_detalles_187
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_187_operaciones_con_acciones AS tbn1_fact_detalles_informativos_187_operaciones_con_acciones
  USING #query__30B35 AS query ON query.id_detalles_187=tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_detalles_187
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_pais<>query.cod_pais OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_pais IS NULL AND query.cod_pais IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_pais IS NOT NULL AND query.cod_pais IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_tipo_socio<>query.cod_tipo_socio OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_tipo_socio IS NULL AND query.cod_tipo_socio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_tipo_socio IS NOT NULL AND query.cod_tipo_socio IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_socio<>query.tipo_socio OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_socio IS NULL AND query.tipo_socio IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_socio IS NOT NULL AND query.tipo_socio IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_naturaleza<>query.cod_naturaleza OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_naturaleza IS NULL AND query.cod_naturaleza IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_naturaleza IS NOT NULL AND query.cod_naturaleza IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.naturaleza<>query.naturaleza OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.naturaleza IS NULL AND query.naturaleza IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.naturaleza IS NOT NULL AND query.naturaleza IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_clave_identificacion_fondo<>query.cod_clave_identificacion_fondo OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_clave_identificacion_fondo IS NULL AND query.cod_clave_identificacion_fondo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_clave_identificacion_fondo IS NOT NULL AND query.cod_clave_identificacion_fondo IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.clave_identificacion_fondo<>query.clave_identificacion_fondo OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.clave_identificacion_fondo IS NULL AND query.clave_identificacion_fondo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.clave_identificacion_fondo IS NOT NULL AND query.clave_identificacion_fondo IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_tipo_operacion<>query.cod_tipo_operacion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_tipo_operacion IS NULL AND query.cod_tipo_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.cod_tipo_operacion IS NOT NULL AND query.cod_tipo_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_operacion<>query.tipo_operacion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_operacion IS NULL AND query.tipo_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_operacion IS NOT NULL AND query.tipo_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.fec_operacion<>query.fec_operacion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.fec_operacion IS NULL AND query.fec_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.fec_operacion IS NOT NULL AND query.fec_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.num_acciones<>query.num_acciones OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.num_acciones IS NULL AND query.num_acciones IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.num_acciones IS NOT NULL AND query.num_acciones IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.clave_origen<>query.clave_origen OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.clave_origen IS NULL AND query.clave_origen IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.clave_origen IS NOT NULL AND query.clave_origen IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_retencion<>query.tipo_retencion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_erroneo<>query.es_erroneo OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion<>query.importe_adquisicion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion IS NULL AND query.importe_adquisicion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.importe_adquisicion IS NOT NULL AND query.importe_adquisicion IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo<>query.ganancia_antiguo OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo IS NULL AND query.ganancia_antiguo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.ganancia_antiguo IS NOT NULL AND query.ganancia_antiguo IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.ganancia<>query.ganancia OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.ganancia IS NULL AND query.ganancia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.ganancia IS NOT NULL AND query.ganancia IS NULL)
                    OR tbn1_fact_detalles_informativos_187_operaciones_con_acciones.retencion<>query.retencion OR (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.retencion IS NULL AND query.retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_187_operaciones_con_acciones.retencion IS NOT NULL AND query.retencion IS NULL))) THEN
    UPDATE SET
      id_documento=query.id_documento,
      secuencia=query.secuencia,
      administracion=query.administracion,
      nif_declarado=query.nif_declarado,
      es_contribuyente=query.es_contribuyente,
      id_contribuyente=query.id_contribuyente,
      es_externo=query.es_externo,
      es_representante=query.es_representante,
      provincia=query.provincia,
      cod_pais=query.cod_pais,
      cod_tipo_socio=query.cod_tipo_socio,
      tipo_socio=query.tipo_socio,
      cod_naturaleza=query.cod_naturaleza,
      naturaleza=query.naturaleza,
      cod_clave_identificacion_fondo=query.cod_clave_identificacion_fondo,
      clave_identificacion_fondo=query.clave_identificacion_fondo,
      cod_tipo_operacion=query.cod_tipo_operacion,
      tipo_operacion=query.tipo_operacion,
      fec_operacion=query.fec_operacion,
      num_acciones=query.num_acciones,
      clave_origen=query.clave_origen,
      tipo_retencion=query.tipo_retencion,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      importe_adquisicion=query.importe_adquisicion,
      ganancia_antiguo=query.ganancia_antiguo,
      ganancia=query.ganancia,
      retencion=query.retencion
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_187,id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,provincia,cod_pais,cod_tipo_socio,tipo_socio,cod_naturaleza,naturaleza,cod_clave_identificacion_fondo,clave_identificacion_fondo,cod_tipo_operacion,tipo_operacion,fec_operacion,num_acciones,clave_origen,tipo_retencion,es_identificado,es_erroneo,importe_adquisicion,ganancia_antiguo,ganancia,retencion) VALUES (
      query.id_detalles_187,
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.provincia,
      query.cod_pais,
      query.cod_tipo_socio,
      query.tipo_socio,
      query.cod_naturaleza,
      query.naturaleza,
      query.cod_clave_identificacion_fondo,
      query.clave_identificacion_fondo,
      query.cod_tipo_operacion,
      query.tipo_operacion,
      query.fec_operacion,
      query.num_acciones,
      query.clave_origen,
      query.tipo_retencion,
      query.es_identificado,
      query.es_erroneo,
      query.importe_adquisicion,
      query.ganancia_antiguo,
      query.ganancia,
      query.retencion);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_187_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_187_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_187_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_dimensional_modelo_187_ssis',
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_187_ssis @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_187_ssis @log;

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

