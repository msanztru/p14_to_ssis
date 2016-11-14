﻿PRINT 'cargar_dimensional_modelo_194.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos(
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
  CONSTRAINT PK_tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_documento,administracion_hacienda),
  CONSTRAINT FK_tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD nif_declarante varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta_af')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_alta_af date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD razon_social varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='delegacion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD delegacion_hacienda varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion_hacienda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD administracion_hacienda varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD telefono varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_presentador_colectivo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD cod_presentador_colectivo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_entidad_gestora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD cod_entidad_gestora varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD cod_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD tipo_presentacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_presentacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_caja')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD num_caja varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_declarados_erroneos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD num_declarados_erroneos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='hay_observaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD hay_observaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_historico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD es_historico varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD volumen_operaciones numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_justificante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD num_justificante numeric(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_declaracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD tipo_declaracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='contador_revisiones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD contador_revisiones int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_expediente varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN nif_declarante varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_alta_af' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_alta_af date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN razon_social varchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_contribuyente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='delegacion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN delegacion_hacienda varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion_hacienda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN administracion_hacienda varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='telefono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN telefono varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_presentador_colectivo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_presentador_colectivo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_entidad_gestora' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_entidad_gestora varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_tipo_presentacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_presentacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_presentacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_caja' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_caja varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_declarados_erroneos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_declarados_erroneos int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='hay_observaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN hay_observaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_historico varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN volumen_operaciones numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_justificante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_justificante numeric(13) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_declaracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_declaracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='contador_revisiones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN contador_revisiones int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='PK_tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT PK_tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_documentos_informativos_194' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_194;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_documentos_informativos_194(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_194'
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

  -- Materialized query: query
  SELECT
    doc_194.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
    e.cod_expediente AS cod_expediente,
    coalesce(left(doc_194.nif_declarante,9)+' '+right(doc_194.nif_declarante,2),'') AS nif_declarante,
    doc_194.fec_alta_af AS fec_alta_af,
    coalesce(doc_194.razon_social,'') AS razon_social,
    CASE WHEN doc_194.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    doc_194.id_contribuyente AS id_contribuyente,
    coalesce(doc_194.delegacion_hacienda,'') AS delegacion_hacienda,
    coalesce(doc_194.administracion_hacienda,'') AS administracion_hacienda,
    coalesce(doc_194.telefono,'') AS telefono,
    coalesce(doc_194.cod_presentador_colectivo,'') AS cod_presentador_colectivo,
    coalesce(doc_194.cod_entidad_gestora,'') AS cod_entidad_gestora,
    tipo_pres.cod_tipo_presentacion AS cod_tipo_presentacion,
    tipo_pres.tipo_presentacion AS tipo_presentacion,
    doc_194.fec_presentacion AS fec_presentacion,
    coalesce(doc_194.num_caja,'') AS num_caja,
    CASE WHEN doc_194.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    doc_194.num_declarados_erroneos AS num_declarados_erroneos,
    CASE WHEN doc_194.hay_observaciones=1 THEN 'S' ELSE 'N' END AS hay_observaciones,
    CASE WHEN doc_194.es_historico=1 THEN 'S' ELSE 'N' END AS es_historico,
    doc_194.volumen_operaciones AS volumen_operaciones,
    doc_194.num_justificante AS num_justificante,
    coalesce(doc_194.tipo_declaracion,'') AS tipo_declaracion,
    doc_194.contador_revisiones AS contador_revisiones,
    doc_194.fec_baja AS fec_baja
  INTO #query__FF1BC
  FROM dbn1_norm_dhyf.dbo.tbn1_documentos_informativos_194_bonos_y_capitales_ajenos doc_194
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (e.id_expediente=doc_194.id_expediente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (e.id_contribuyente=c.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.id_tipo_presentacion=doc_194.id_tipo_presentacion)
  WHERE doc_194.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__85843 ON #query__FF1BC (id_documento,administracion_hacienda)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos AS tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos
  USING #query__FF1BC AS query ON query.id_documento=tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.administracion_hacienda
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos AS tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos
  USING #query__FF1BC AS query ON query.id_documento=tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_documento AND query.administracion_hacienda=tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.administracion_hacienda
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_expediente<>query.id_expediente OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_expediente IS NULL AND query.id_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_expediente IS NOT NULL AND query.id_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_expediente<>query.cod_expediente OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.nif_declarante<>query.nif_declarante OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.nif_declarante IS NULL AND query.nif_declarante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.nif_declarante IS NOT NULL AND query.nif_declarante IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.fec_alta_af<>query.fec_alta_af OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.fec_alta_af IS NULL AND query.fec_alta_af IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.fec_alta_af IS NOT NULL AND query.fec_alta_af IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.razon_social<>query.razon_social OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_contribuyente<>query.es_contribuyente OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_contribuyente<>query.id_contribuyente OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.delegacion_hacienda<>query.delegacion_hacienda OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.delegacion_hacienda IS NULL AND query.delegacion_hacienda IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.delegacion_hacienda IS NOT NULL AND query.delegacion_hacienda IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.telefono<>query.telefono OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.telefono IS NULL AND query.telefono IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.telefono IS NOT NULL AND query.telefono IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_presentador_colectivo<>query.cod_presentador_colectivo OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_presentador_colectivo IS NULL AND query.cod_presentador_colectivo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_presentador_colectivo IS NOT NULL AND query.cod_presentador_colectivo IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_entidad_gestora<>query.cod_entidad_gestora OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_entidad_gestora IS NULL AND query.cod_entidad_gestora IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_entidad_gestora IS NOT NULL AND query.cod_entidad_gestora IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_tipo_presentacion<>query.cod_tipo_presentacion OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_tipo_presentacion IS NULL AND query.cod_tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.cod_tipo_presentacion IS NOT NULL AND query.cod_tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_presentacion<>query.tipo_presentacion OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_presentacion IS NULL AND query.tipo_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_presentacion IS NOT NULL AND query.tipo_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.fec_presentacion<>query.fec_presentacion OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.fec_presentacion IS NULL AND query.fec_presentacion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.fec_presentacion IS NOT NULL AND query.fec_presentacion IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_caja<>query.num_caja OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_caja IS NULL AND query.num_caja IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_caja IS NOT NULL AND query.num_caja IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_erroneo<>query.es_erroneo OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_declarados_erroneos<>query.num_declarados_erroneos OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_declarados_erroneos IS NULL AND query.num_declarados_erroneos IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_declarados_erroneos IS NOT NULL AND query.num_declarados_erroneos IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.hay_observaciones<>query.hay_observaciones OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.hay_observaciones IS NULL AND query.hay_observaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.hay_observaciones IS NOT NULL AND query.hay_observaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_historico<>query.es_historico OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_historico IS NULL AND query.es_historico IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.es_historico IS NOT NULL AND query.es_historico IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.volumen_operaciones<>query.volumen_operaciones OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_justificante<>query.num_justificante OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_justificante IS NULL AND query.num_justificante IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.num_justificante IS NOT NULL AND query.num_justificante IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_declaracion<>query.tipo_declaracion OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_declaracion IS NULL AND query.tipo_declaracion IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.tipo_declaracion IS NOT NULL AND query.tipo_declaracion IS NULL)
                    OR tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.contador_revisiones<>query.contador_revisiones OR (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.contador_revisiones IS NULL AND query.contador_revisiones IS NOT NULL) OR  (tbn1_dim_documentos_informativos_194_bonos_y_capitales_ajenos.contador_revisiones IS NOT NULL AND query.contador_revisiones IS NULL))) THEN
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos(
  id_detalles_194 int NOT NULL,
  id_documento int NOT NULL,
  secuencia varchar(11) NOT NULL,
  administracion varchar(1) NOT NULL,
  nif_declarado varchar(12) NOT NULL,
  es_contribuyente varchar(1),
  id_contribuyente int,
  es_externo varchar(1) NOT NULL,
  es_representante varchar(1) NOT NULL,
  provincia varchar(50) NOT NULL,
  porcentaje_participacion numeric(18,4),
  tipo_registro varchar(1) NOT NULL,
  cod_tipo_codigo varchar(1) NOT NULL,
  tipo_codigo varchar(50) NOT NULL,
  banco varchar(4) NOT NULL,
  sucursal varchar(4) NOT NULL,
  num_cuenta varchar(12) NOT NULL,
  es_identificado varchar(1) NOT NULL,
  es_erroneo varchar(1) NOT NULL,
  num_perceptor int,
  cod_clave_codigo varchar(1) NOT NULL,
  clave_codigo varchar(50) NOT NULL,
  emisor varchar(12) NOT NULL,
  percepcion_integra numeric(18,2),
  tipo_retencion numeric(18,4),
  retencion_a_ingresar numeric(18,2),
  cod_origen_operacion varchar(1) NOT NULL,
  origen_operacion varchar(70) NOT NULL,
  vinculacion varchar(1) NOT NULL,
  transmision numeric(18,2),
  reduccion numeric(18,2),
  gastos numeric(18,2),
  adquisicion numeric(18,2),
  CONSTRAINT PK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_detalles_194),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
)

GO

/*
IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_detalles_194')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_detalles_194 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD secuencia varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD nif_declarado varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_contribuyente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_externo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_externo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_representante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD provincia varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD porcentaje_participacion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_registro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD tipo_registro varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD cod_tipo_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD tipo_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='banco')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD banco varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='sucursal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD sucursal varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD num_cuenta varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD es_erroneo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_perceptor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD num_perceptor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_clave_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD cod_clave_codigo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='clave_codigo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD clave_codigo varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='emisor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD emisor varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='percepcion_integra')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD percepcion_integra numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_retencion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD tipo_retencion numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='retencion_a_ingresar')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD retencion_a_ingresar numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_origen_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD cod_origen_operacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='origen_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD origen_operacion varchar(70)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='vinculacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD vinculacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='transmision')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD transmision numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='reduccion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD reduccion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD gastos numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='adquisicion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD adquisicion numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_ES_CONTRIBUYENTE DEFAULT 0 FOR es_contribuyente

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='vinculacion' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT DF_DBO_TBN1_FACT_DETALLES_INFORMATIVOS_194_BONOS_Y_CAPITALES_AJENOS_VINCULACION DEFAULT '' FOR vinculacion

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_detalles_194' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_detalles_194 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN secuencia varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='administracion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN administracion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='nif_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN nif_declarado varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_contribuyente varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN id_contribuyente int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_externo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_externo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_representante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_representante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='provincia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN provincia varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN porcentaje_participacion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_registro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_registro varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_tipo_codigo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_codigo varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='banco' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN banco varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='sucursal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN sucursal varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_cuenta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_cuenta varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='es_erroneo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN es_erroneo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='num_perceptor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN num_perceptor int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_clave_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_clave_codigo varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='clave_codigo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN clave_codigo varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='emisor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN emisor varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='percepcion_integra' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN percepcion_integra numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='tipo_retencion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN tipo_retencion numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='retencion_a_ingresar' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN retencion_a_ingresar numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='cod_origen_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN cod_origen_operacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='origen_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN origen_operacion varchar(70) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='vinculacion' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos SET vinculacion='' WHERE vinculacion IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN vinculacion varchar(1) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='transmision' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN transmision numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='reduccion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN reduccion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='gastos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN gastos numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND COLUMN_NAME='adquisicion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ALTER COLUMN adquisicion numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT PK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos PRIMARY KEY CLUSTERED (id_detalles_194)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos ADD CONSTRAINT FK_tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO
*/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_detalles_informativos_194' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_194;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_detalles_informativos_194(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_194'
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

  -- Materialized query: query
  SELECT
    det_194.id_detalles_194 AS id_detalles_194,
    det_194.id_documento AS id_documento,
    det_194.secuencia AS secuencia,
    coalesce(det_194.administracion,'') AS administracion,
    coalesce(left(det_194.nif_declarado,9)+' '+right(det_194.nif_declarado,2),'') AS nif_declarado,
    CASE WHEN det_194.es_contribuyente=1 THEN 'S' ELSE 'N' END AS es_contribuyente,
    det_194.id_contribuyente AS id_contribuyente,
    CASE WHEN det_194.es_externo=1 THEN 'S' ELSE 'N' END AS es_externo,
    CASE WHEN det_194.es_representante=1 THEN 'S' ELSE 'N' END AS es_representante,
    provincia.provincia AS provincia,
    det_194.porcentaje_participacion AS porcentaje_participacion,
    coalesce(det_194.tipo_registro,'') AS tipo_registro,
    tipo_codigo.cod_tipo_codigo AS cod_tipo_codigo,
    tipo_codigo.tipo_codigo AS tipo_codigo,
    coalesce(det_194.banco,'') AS banco,
    coalesce(det_194.sucursal,'') AS sucursal,
    coalesce(det_194.num_cuenta,'') AS num_cuenta,
    CASE WHEN det_194.es_identificado=1 THEN 'S' ELSE 'N' END AS es_identificado,
    CASE WHEN det_194.es_erroneo=1 THEN 'S' ELSE 'N' END AS es_erroneo,
    det_194.num_perceptor AS num_perceptor,
    clave_codigo.cod_clave_codigo AS cod_clave_codigo,
    clave_codigo.clave_codigo AS clave_codigo,
    coalesce(det_194.emisor,'') AS emisor,
    det_194.percepcion_integra AS percepcion_integra,
    coalesce(det_194.tipo_retencion,'') AS tipo_retencion,
    det_194.retencion_a_ingresar AS retencion_a_ingresar,
    origen_operacion.cod_origen_operacion AS cod_origen_operacion,
    origen_operacion.origen_operacion AS origen_operacion,
    coalesce(det_194.vinculacion,'') AS vinculacion,
    det_194.transmision AS transmision,
    det_194.reduccion AS reduccion,
    det_194.gastos AS gastos,
    det_194.adquisicion AS adquisicion,
    det_194.fec_baja AS fec_baja
  INTO #query__61B54
  FROM dbn1_norm_dhyf.dbo.tbn1_detalles_informativos_194_bonos_y_capitales_ajenos det_194
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc_194 ON (doc_194.id_documento=det_194.id_documento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes c ON (c.id_contribuyente=det_194.id_contribuyente)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.id_provincia=det_194.id_provincia)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_codigo ON (tipo_codigo.id_tipo_codigo=det_194.id_tipo_codigo)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_codigo clave_codigo ON (clave_codigo.id_clave_codigo=det_194.id_clave_codigo)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_origen_operacion origen_operacion ON (origen_operacion.id_origen_operacion=det_194.id_origen_operacion)
  WHERE det_194.fec_modificacion>@fecha_ultima_carga
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_query__1F97F ON #query__61B54 (id_detalles_194)
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos AS tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos
  USING #query__61B54 AS query ON query.id_detalles_194=tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_detalles_194
  WHEN MATCHED AND query.fec_baja IS NOT NULL THEN DELETE;
  
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos AS tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos
  USING #query__61B54 AS query ON query.id_detalles_194=tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_detalles_194
  WHEN MATCHED AND (NOT (query.fec_baja IS NOT NULL) AND 
                    (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_documento<>query.id_documento OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.secuencia<>query.secuencia OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.secuencia IS NULL AND query.secuencia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.secuencia IS NOT NULL AND query.secuencia IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.administracion<>query.administracion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.administracion IS NULL AND query.administracion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.administracion IS NOT NULL AND query.administracion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado<>query.nif_declarado OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado IS NULL AND query.nif_declarado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.nif_declarado IS NOT NULL AND query.nif_declarado IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente<>query.es_contribuyente OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NULL AND query.es_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_contribuyente IS NOT NULL AND query.es_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo<>query.es_externo OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo IS NULL AND query.es_externo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_externo IS NOT NULL AND query.es_externo IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante<>query.es_representante OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante IS NULL AND query.es_representante IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_representante IS NOT NULL AND query.es_representante IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.provincia<>query.provincia OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.provincia IS NULL AND query.provincia IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.provincia IS NOT NULL AND query.provincia IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro<>query.tipo_registro OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_tipo_codigo<>query.cod_tipo_codigo OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_tipo_codigo IS NULL AND query.cod_tipo_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_tipo_codigo IS NOT NULL AND query.cod_tipo_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_codigo<>query.tipo_codigo OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_codigo IS NULL AND query.tipo_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_codigo IS NOT NULL AND query.tipo_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.banco<>query.banco OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.banco IS NULL AND query.banco IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.banco IS NOT NULL AND query.banco IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal<>query.sucursal OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal IS NULL AND query.sucursal IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.sucursal IS NOT NULL AND query.sucursal IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta<>query.num_cuenta OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado<>query.es_identificado OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo<>query.es_erroneo OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NULL AND query.es_erroneo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.es_erroneo IS NOT NULL AND query.es_erroneo IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.num_perceptor<>query.num_perceptor OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.num_perceptor IS NULL AND query.num_perceptor IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.num_perceptor IS NOT NULL AND query.num_perceptor IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_clave_codigo<>query.cod_clave_codigo OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_clave_codigo IS NULL AND query.cod_clave_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_clave_codigo IS NOT NULL AND query.cod_clave_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.clave_codigo<>query.clave_codigo OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.clave_codigo IS NULL AND query.clave_codigo IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.clave_codigo IS NOT NULL AND query.clave_codigo IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.emisor<>query.emisor OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.emisor IS NULL AND query.emisor IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.emisor IS NOT NULL AND query.emisor IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra<>query.percepcion_integra OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra IS NULL AND query.percepcion_integra IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.percepcion_integra IS NOT NULL AND query.percepcion_integra IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion<>query.tipo_retencion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion IS NULL AND query.tipo_retencion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.tipo_retencion IS NOT NULL AND query.tipo_retencion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar<>query.retencion_a_ingresar OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar IS NULL AND query.retencion_a_ingresar IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.retencion_a_ingresar IS NOT NULL AND query.retencion_a_ingresar IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_origen_operacion<>query.cod_origen_operacion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_origen_operacion IS NULL AND query.cod_origen_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.cod_origen_operacion IS NOT NULL AND query.cod_origen_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.origen_operacion<>query.origen_operacion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.origen_operacion IS NULL AND query.origen_operacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.origen_operacion IS NOT NULL AND query.origen_operacion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion<>query.vinculacion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion IS NULL AND query.vinculacion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.vinculacion IS NOT NULL AND query.vinculacion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.transmision<>query.transmision OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.transmision IS NULL AND query.transmision IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.transmision IS NOT NULL AND query.transmision IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion<>query.reduccion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion IS NULL AND query.reduccion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.reduccion IS NOT NULL AND query.reduccion IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.gastos<>query.gastos OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.gastos IS NULL AND query.gastos IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.gastos IS NOT NULL AND query.gastos IS NULL)
                    OR tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion<>query.adquisicion OR (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion IS NULL AND query.adquisicion IS NOT NULL) OR  (tbn1_fact_detalles_informativos_194_bonos_y_capitales_ajenos.adquisicion IS NOT NULL AND query.adquisicion IS NULL))) THEN
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
      porcentaje_participacion=query.porcentaje_participacion,
      tipo_registro=query.tipo_registro,
      cod_tipo_codigo=query.cod_tipo_codigo,
      tipo_codigo=query.tipo_codigo,
      banco=query.banco,
      sucursal=query.sucursal,
      num_cuenta=query.num_cuenta,
      es_identificado=query.es_identificado,
      es_erroneo=query.es_erroneo,
      num_perceptor=query.num_perceptor,
      cod_clave_codigo=query.cod_clave_codigo,
      clave_codigo=query.clave_codigo,
      emisor=query.emisor,
      percepcion_integra=query.percepcion_integra,
      tipo_retencion=query.tipo_retencion,
      retencion_a_ingresar=query.retencion_a_ingresar,
      cod_origen_operacion=query.cod_origen_operacion,
      origen_operacion=query.origen_operacion,
      vinculacion=query.vinculacion,
      transmision=query.transmision,
      reduccion=query.reduccion,
      gastos=query.gastos,
      adquisicion=query.adquisicion
  WHEN NOT MATCHED AND NOT (query.fec_baja IS NOT NULL) THEN
    INSERT (id_detalles_194,id_documento,secuencia,administracion,nif_declarado,es_contribuyente,id_contribuyente,es_externo,es_representante,provincia,porcentaje_participacion,tipo_registro,cod_tipo_codigo,tipo_codigo,banco,sucursal,num_cuenta,es_identificado,es_erroneo,num_perceptor,cod_clave_codigo,clave_codigo,emisor,percepcion_integra,tipo_retencion,retencion_a_ingresar,cod_origen_operacion,origen_operacion,vinculacion,transmision,reduccion,gastos,adquisicion) VALUES (
      query.id_detalles_194,
      query.id_documento,
      query.secuencia,
      query.administracion,
      query.nif_declarado,
      query.es_contribuyente,
      query.id_contribuyente,
      query.es_externo,
      query.es_representante,
      query.provincia,
      query.porcentaje_participacion,
      query.tipo_registro,
      query.cod_tipo_codigo,
      query.tipo_codigo,
      query.banco,
      query.sucursal,
      query.num_cuenta,
      query.es_identificado,
      query.es_erroneo,
      query.num_perceptor,
      query.cod_clave_codigo,
      query.clave_codigo,
      query.emisor,
      query.percepcion_integra,
      query.tipo_retencion,
      query.retencion_a_ingresar,
      query.cod_origen_operacion,
      query.origen_operacion,
      query.vinculacion,
      query.transmision,
      query.reduccion,
      query.gastos,
      query.adquisicion);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_modelo_194' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_modelo_194;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_modelo_194(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_modelo_194'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_documentos_informativos_194 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_detalles_informativos_194 @log;

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

