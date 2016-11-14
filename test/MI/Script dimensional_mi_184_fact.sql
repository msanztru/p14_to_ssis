PRINT 'dimensional_mi_184_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_marcas_declarante int NOT NULL,
	id_dim_declarantes int NOT NULL,
	id_dim_declarantes_2 int NOT NULL,
	id_dim_datos_detalle int NOT NULL,
	id_dim_marcas_declarado int NOT NULL,
	id_dim_declarados int NOT NULL,
	id_dim_datos_economicos_declarante int NOT NULL,
	id_dim_datos_economicos_declarado int NOT NULL,
	volumen_operaciones decimal (18, 2),
	num_dias_miembro decimal(3, 0),
	porcentaje_participacion decimal(7, 4),
	porcentaje_atribucion decimal(7, 4),
	valor_declarante bigint,
	valor_declarado bigint,
	contador_declarados int,
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_marcas_declarante FOREIGN KEY (id_dim_marcas_declarante) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante(id_dim_marcas_declarante),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes(id_dim_declarantes),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarantes_2 FOREIGN KEY (id_dim_declarantes_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2(id_dim_declarantes_2),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle(id_dim_datos_detalle),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_marcas_declarado FOREIGN KEY (id_dim_marcas_declarado) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado(id_dim_marcas_declarado),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados(id_dim_declarados),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_economicos_declarante FOREIGN KEY (id_dim_datos_economicos_declarante) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante(id_dim_datos_economicos_declarante),
	CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_economicos_declarado FOREIGN KEY (id_dim_datos_economicos_declarado) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado(id_dim_datos_economicos_declarado),
	CONSTRAINT PK_tbn1_mi_184_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_marcas_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_marcas_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_declarantes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_declarantes_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_datos_detalle int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_marcas_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_marcas_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_declarados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_economicos_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_datos_economicos_declarante int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_economicos_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD id_dim_datos_economicos_declarado int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='volumen_operaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD volumen_operaciones decimal (18, 2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='num_dias_miembro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD num_dias_miembro decimal(3, 0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='porcentaje_participacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD porcentaje_participacion decimal(7, 4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='porcentaje_atribucion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD porcentaje_atribucion decimal(7, 4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='valor_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD valor_declarante bigint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='valor_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD valor_declarado bigint
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='contador_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD contador_declarados int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_marcas_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_marcas_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_declarantes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_declarantes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_declarantes_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_declarantes_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_datos_detalle int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_marcas_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_marcas_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_declarados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_declarados int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_economicos_declarante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_datos_economicos_declarante int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='id_dim_datos_economicos_declarado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN id_dim_datos_economicos_declarado int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='volumen_operaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN volumen_operaciones decimal (18, 2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='num_dias_miembro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN num_dias_miembro decimal(3, 0) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='porcentaje_participacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN porcentaje_participacion decimal(7, 4) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='porcentaje_atribucion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN porcentaje_atribucion decimal(7, 4) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='valor_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN valor_declarante bigint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='valor_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN valor_declarado bigint NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND COLUMN_NAME='contador_declarados' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ALTER COLUMN contador_declarados int NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_184_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT PK_tbn1_mi_184_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_marcas_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_marcas_declarante FOREIGN KEY (id_dim_marcas_declarante) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante(id_dim_marcas_declarante)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarantes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarantes FOREIGN KEY (id_dim_declarantes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes(id_dim_declarantes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarantes_2 FOREIGN KEY (id_dim_declarantes_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2(id_dim_declarantes_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_detalle FOREIGN KEY (id_dim_datos_detalle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle(id_dim_datos_detalle)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_marcas_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_marcas_declarado FOREIGN KEY (id_dim_marcas_declarado) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado(id_dim_marcas_declarado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_declarados FOREIGN KEY (id_dim_declarados) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados(id_dim_declarados)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_economicos_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_economicos_declarante FOREIGN KEY (id_dim_datos_economicos_declarante) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante(id_dim_datos_economicos_declarante)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_184_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_economicos_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact ADD CONSTRAINT FK_tbn1_mi_184_fact_tbn1_mi_184_dim_datos_economicos_declarado FOREIGN KEY (id_dim_datos_economicos_declarado) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado(id_dim_datos_economicos_declarado)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_184_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_184_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_184_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_fact'
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
			documentos.id_dim_documentos AS id_dim_documentos,
			periodos.id_dim_periodos AS id_dim_periodos,
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			marcas_declarante.id_dim_marcas_declarante AS id_dim_marcas_declarante,
			declarantes.id_dim_declarantes AS id_dim_declarantes,
			declarantes_2.id_dim_declarantes_2 AS id_dim_declarantes_2,
			datos_detalle.id_dim_datos_detalle AS id_dim_datos_detalle,
			marcas_declarado.id_dim_marcas_declarado AS id_dim_marcas_declarado,
			declarados.id_dim_declarados AS id_dim_declarados,
			datos_economicos_declarante.id_dim_datos_economicos_declarante AS id_dim_datos_economicos_declarante,
			datos_economicos_declarado.id_dim_datos_economicos_declarado AS id_dim_datos_economicos_declarado,
			sum(ds_t.volumen_operaciones) AS volumen_operaciones,
			sum(ds_t.num_dias_miembro) AS num_dias_miembro,
			sum(ds_t.porcentaje_participacion) AS porcentaje_participacion,
			sum(ds_t.porcentaje_atribucion) AS porcentaje_atribucion,
			sum(ds_t.valor_declarante) AS valor_declarante,
			sum(ds_t.valor_declarado) AS valor_declarado,
			sum(ds_t.contador_declarados) AS contador_declarados
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_184_irfp_sociedades_irnr ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_documentos AS documentos ON ((documentos.id_documento=ds_t.id_documento OR (documentos.id_documento IS NULL AND ds_t.id_documento IS NULL)) AND (documentos.id_expediente=ds_t.id_expediente OR (documentos.id_expediente IS NULL AND ds_t.id_expediente IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_periodos AS periodos ON ((periodos.ejercicio=ds_t.ejercicio OR (periodos.ejercicio IS NULL AND ds_t.ejercicio IS NULL)) AND (periodos.fecha_presentacion=ds_t.fecha_presentacion OR (periodos.fecha_presentacion IS NULL AND ds_t.fecha_presentacion IS NULL)) AND (periodos.mes_presentacion=ds_t.mes_presentacion OR (periodos.mes_presentacion IS NULL AND ds_t.mes_presentacion IS NULL)) AND (periodos.anyo_presentacion=ds_t.anyo_presentacion OR (periodos.anyo_presentacion IS NULL AND ds_t.anyo_presentacion IS NULL)) AND (periodos.fecha_alta=ds_t.fecha_alta OR (periodos.fecha_alta IS NULL AND ds_t.fecha_alta IS NULL)) AND (periodos.mes_alta=ds_t.mes_alta OR (periodos.mes_alta IS NULL AND ds_t.mes_alta IS NULL)) AND (periodos.anyo_alta=ds_t.anyo_alta OR (periodos.anyo_alta IS NULL AND ds_t.anyo_alta IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_caratula AS datos_caratula ON ((datos_caratula.modelo=ds_t.modelo OR (datos_caratula.modelo IS NULL AND ds_t.modelo IS NULL)) AND (datos_caratula.id_administracion_declarante=ds_t.id_administracion_declarante OR (datos_caratula.id_administracion_declarante IS NULL AND ds_t.id_administracion_declarante IS NULL)) AND (datos_caratula.id_mae_entidades_bancarias=ds_t.id_mae_entidades_bancarias OR (datos_caratula.id_mae_entidades_bancarias IS NULL AND ds_t.id_mae_entidades_bancarias IS NULL)) AND (datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion OR (datos_caratula.id_tipo_presentacion IS NULL AND ds_t.id_tipo_presentacion IS NULL)) AND (datos_caratula.id_tipo_declaracion=ds_t.id_tipo_declaracion OR (datos_caratula.id_tipo_declaracion IS NULL AND ds_t.id_tipo_declaracion IS NULL)) AND (datos_caratula.regimen_fiscal_deducciones=ds_t.regimen_fiscal_deducciones OR (datos_caratula.regimen_fiscal_deducciones IS NULL AND ds_t.regimen_fiscal_deducciones IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarante AS marcas_declarante ON ((marcas_declarante.es_externo_declarante=ds_t.es_externo_declarante OR (marcas_declarante.es_externo_declarante IS NULL AND ds_t.es_externo_declarante IS NULL)) AND (marcas_declarante.es_contribuyente_declarante=ds_t.es_contribuyente_declarante OR (marcas_declarante.es_contribuyente_declarante IS NULL AND ds_t.es_contribuyente_declarante IS NULL)) AND (marcas_declarante.es_identificado_declarante=ds_t.es_identificado_declarante OR (marcas_declarante.es_identificado_declarante IS NULL AND ds_t.es_identificado_declarante IS NULL)) AND (marcas_declarante.sw_identificado_declarante=ds_t.sw_identificado_declarante OR (marcas_declarante.sw_identificado_declarante IS NULL AND ds_t.sw_identificado_declarante IS NULL)) AND (marcas_declarante.es_objeto_extranjero=ds_t.es_objeto_extranjero OR (marcas_declarante.es_objeto_extranjero IS NULL AND ds_t.es_objeto_extranjero IS NULL)) AND (marcas_declarante.es_regimen_impuesto_soc_extranjero=ds_t.es_regimen_impuesto_soc_extranjero OR (marcas_declarante.es_regimen_impuesto_soc_extranjero IS NULL AND ds_t.es_regimen_impuesto_soc_extranjero IS NULL)) AND (marcas_declarante.es_erroneo_dato_ec_declarante=ds_t.es_erroneo_dato_ec_declarante OR (marcas_declarante.es_erroneo_dato_ec_declarante IS NULL AND ds_t.es_erroneo_dato_ec_declarante IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes AS declarantes ON ((declarantes.nif_declarante_184=ds_t.nif_declarante_184 OR (declarantes.nif_declarante_184 IS NULL AND ds_t.nif_declarante_184 IS NULL)) AND (declarantes.nif_declarante_no_identificado=ds_t.nif_declarante_no_identificado OR (declarantes.nif_declarante_no_identificado IS NULL AND ds_t.nif_declarante_no_identificado IS NULL)) AND (declarantes.id_contribuyente_declarante=ds_t.id_contribuyente_declarante OR (declarantes.id_contribuyente_declarante IS NULL AND ds_t.id_contribuyente_declarante IS NULL)) AND (declarantes.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante OR (declarantes.id_mae_no_id_declarante IS NULL AND ds_t.id_mae_no_id_declarante IS NULL)) AND (declarantes.telefono=ds_t.telefono OR (declarantes.telefono IS NULL AND ds_t.telefono IS NULL)) AND (declarantes.persona_relacionarse=ds_t.persona_relacionarse OR (declarantes.persona_relacionarse IS NULL AND ds_t.persona_relacionarse IS NULL)) AND (declarantes.cod_presentador_colectivo=ds_t.cod_presentador_colectivo OR (declarantes.cod_presentador_colectivo IS NULL AND ds_t.cod_presentador_colectivo IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarantes_2 AS declarantes_2 ON ((declarantes_2.id_mae_claves_tipos_entidad=ds_t.id_mae_claves_tipos_entidad OR (declarantes_2.id_mae_claves_tipos_entidad IS NULL AND ds_t.id_mae_claves_tipos_entidad IS NULL)) AND (declarantes_2.id_mae_claves_actividad_ppal=ds_t.id_mae_claves_actividad_ppal OR (declarantes_2.id_mae_claves_actividad_ppal IS NULL AND ds_t.id_mae_claves_actividad_ppal IS NULL)) AND (declarantes_2.id_mae_claves_tipos_entidad_extranjero=ds_t.id_mae_claves_tipos_entidad_extranjero OR (declarantes_2.id_mae_claves_tipos_entidad_extranjero IS NULL AND ds_t.id_mae_claves_tipos_entidad_extranjero IS NULL)) AND (declarantes_2.id_pais_extranjero=ds_t.id_pais_extranjero OR (declarantes_2.id_pais_extranjero IS NULL AND ds_t.id_pais_extranjero IS NULL)) AND (declarantes_2.renta_residentes_extranjero=ds_t.renta_residentes_extranjero OR (declarantes_2.renta_residentes_extranjero IS NULL AND ds_t.renta_residentes_extranjero IS NULL)) AND (declarantes_2.cif_representante=ds_t.cif_representante OR (declarantes_2.cif_representante IS NULL AND ds_t.cif_representante IS NULL)) AND (declarantes_2.nombre_representante=ds_t.nombre_representante OR (declarantes_2.nombre_representante IS NULL AND ds_t.nombre_representante IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_detalle AS datos_detalle ON ((datos_detalle.id_administracion_declarado=ds_t.id_administracion_declarado OR (datos_detalle.id_administracion_declarado IS NULL AND ds_t.id_administracion_declarado IS NULL)) AND (datos_detalle.id_provincia=ds_t.id_provincia OR (datos_detalle.id_provincia IS NULL AND ds_t.id_provincia IS NULL)) AND (datos_detalle.id_pais=ds_t.id_pais OR (datos_detalle.id_pais IS NULL AND ds_t.id_pais IS NULL)) AND (datos_detalle.domicilio_fiscal=ds_t.domicilio_fiscal OR (datos_detalle.domicilio_fiscal IS NULL AND ds_t.domicilio_fiscal IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_marcas_declarado AS marcas_declarado ON ((marcas_declarado.es_externo_declarado=ds_t.es_externo_declarado OR (marcas_declarado.es_externo_declarado IS NULL AND ds_t.es_externo_declarado IS NULL)) AND (marcas_declarado.es_contribuyente_declarado=ds_t.es_contribuyente_declarado OR (marcas_declarado.es_contribuyente_declarado IS NULL AND ds_t.es_contribuyente_declarado IS NULL)) AND (marcas_declarado.es_identificado_declarado=ds_t.es_identificado_declarado OR (marcas_declarado.es_identificado_declarado IS NULL AND ds_t.es_identificado_declarado IS NULL)) AND (marcas_declarado.sw_identificado_declarado=ds_t.sw_identificado_declarado OR (marcas_declarado.sw_identificado_declarado IS NULL AND ds_t.sw_identificado_declarado IS NULL)) AND (marcas_declarado.es_representante=ds_t.es_representante OR (marcas_declarado.es_representante IS NULL AND ds_t.es_representante IS NULL)) AND (marcas_declarado.id_mae_claves_participe_184=ds_t.id_mae_claves_participe_184 OR (marcas_declarado.id_mae_claves_participe_184 IS NULL AND ds_t.id_mae_claves_participe_184 IS NULL)) AND (marcas_declarado.es_miembro_31_diciembre=ds_t.es_miembro_31_diciembre OR (marcas_declarado.es_miembro_31_diciembre IS NULL AND ds_t.es_miembro_31_diciembre IS NULL)) AND (marcas_declarado.es_ejerce_actividad=ds_t.es_ejerce_actividad OR (marcas_declarado.es_ejerce_actividad IS NULL AND ds_t.es_ejerce_actividad IS NULL)) AND (marcas_declarado.es_erroneo_declarado=ds_t.es_erroneo_declarado OR (marcas_declarado.es_erroneo_declarado IS NULL AND ds_t.es_erroneo_declarado IS NULL)) AND (marcas_declarado.es_erroneo_dato_ec_declarado=ds_t.es_erroneo_dato_ec_declarado OR (marcas_declarado.es_erroneo_dato_ec_declarado IS NULL AND ds_t.es_erroneo_dato_ec_declarado IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_declarados AS declarados ON ((declarados.secuencia=ds_t.secuencia OR (declarados.secuencia IS NULL AND ds_t.secuencia IS NULL)) AND (declarados.nif_declarado_184=ds_t.nif_declarado_184 OR (declarados.nif_declarado_184 IS NULL AND ds_t.nif_declarado_184 IS NULL)) AND (declarados.nif_declarado_no_identificado=ds_t.nif_declarado_no_identificado OR (declarados.nif_declarado_no_identificado IS NULL AND ds_t.nif_declarado_no_identificado IS NULL)) AND (declarados.id_contribuyente_declarado=ds_t.id_contribuyente_declarado OR (declarados.id_contribuyente_declarado IS NULL AND ds_t.id_contribuyente_declarado IS NULL)) AND (declarados.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado OR (declarados.id_mae_no_id_declarado IS NULL AND ds_t.id_mae_no_id_declarado IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarante AS datos_economicos_declarante ON ((datos_economicos_declarante.id_mae_claves_184_declarante=ds_t.id_mae_claves_184_declarante OR (datos_economicos_declarante.id_mae_claves_184_declarante IS NULL AND ds_t.id_mae_claves_184_declarante IS NULL)) AND (datos_economicos_declarante.id_mae_subclaves_184_declarante=ds_t.id_mae_subclaves_184_declarante OR (datos_economicos_declarante.id_mae_subclaves_184_declarante IS NULL AND ds_t.id_mae_subclaves_184_declarante IS NULL)) AND (datos_economicos_declarante.campo_declarante=ds_t.campo_declarante OR (datos_economicos_declarante.campo_declarante IS NULL AND ds_t.campo_declarante IS NULL)) AND (datos_economicos_declarante.orden_declarante=ds_t.orden_declarante OR (datos_economicos_declarante.orden_declarante IS NULL AND ds_t.orden_declarante IS NULL)))
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_184_dim_datos_economicos_declarado AS datos_economicos_declarado ON ((datos_economicos_declarado.id_mae_claves_184_declarado=ds_t.id_mae_claves_184_declarado OR (datos_economicos_declarado.id_mae_claves_184_declarado IS NULL AND ds_t.id_mae_claves_184_declarado IS NULL)) AND (datos_economicos_declarado.id_mae_subclaves_184_declarado=ds_t.id_mae_subclaves_184_declarado OR (datos_economicos_declarado.id_mae_subclaves_184_declarado IS NULL AND ds_t.id_mae_subclaves_184_declarado IS NULL)) AND (datos_economicos_declarado.campo_declarado=ds_t.campo_declarado OR (datos_economicos_declarado.campo_declarado IS NULL AND ds_t.campo_declarado IS NULL)) AND (datos_economicos_declarado.orden_declarado=ds_t.orden_declarado OR (datos_economicos_declarado.orden_declarado IS NULL AND ds_t.orden_declarado IS NULL)))
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			periodos.id_dim_periodos,
			datos_caratula.id_dim_datos_caratula,
			marcas_declarante.id_dim_marcas_declarante,
			declarantes.id_dim_declarantes,
			declarantes_2.id_dim_declarantes_2,
			datos_detalle.id_dim_datos_detalle,
			marcas_declarado.id_dim_marcas_declarado,
			declarados.id_dim_declarados,
			datos_economicos_declarante.id_dim_datos_economicos_declarante,
			datos_economicos_declarado.id_dim_datos_economicos_declarado
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_184_fact AS tbn1_mi_184_fact
	USING query ON query.id_dim_documentos=tbn1_mi_184_fact.id_dim_documentos AND query.id_dim_periodos=tbn1_mi_184_fact.id_dim_periodos AND query.id_dim_datos_caratula=tbn1_mi_184_fact.id_dim_datos_caratula AND query.id_dim_marcas_declarante=tbn1_mi_184_fact.id_dim_marcas_declarante AND query.id_dim_declarantes=tbn1_mi_184_fact.id_dim_declarantes AND query.id_dim_declarantes_2=tbn1_mi_184_fact.id_dim_declarantes_2 AND query.id_dim_datos_detalle=tbn1_mi_184_fact.id_dim_datos_detalle AND query.id_dim_marcas_declarado=tbn1_mi_184_fact.id_dim_marcas_declarado AND query.id_dim_declarados=tbn1_mi_184_fact.id_dim_declarados AND query.id_dim_datos_economicos_declarante=tbn1_mi_184_fact.id_dim_datos_economicos_declarante AND query.id_dim_datos_economicos_declarado=tbn1_mi_184_fact.id_dim_datos_economicos_declarado
	WHEN MATCHED AND ((tbn1_mi_184_fact.volumen_operaciones<>query.volumen_operaciones OR (tbn1_mi_184_fact.volumen_operaciones IS NULL AND query.volumen_operaciones IS NOT NULL) OR (tbn1_mi_184_fact.volumen_operaciones IS NOT NULL AND query.volumen_operaciones IS NULL)
			OR tbn1_mi_184_fact.num_dias_miembro<>query.num_dias_miembro OR (tbn1_mi_184_fact.num_dias_miembro IS NULL AND query.num_dias_miembro IS NOT NULL) OR (tbn1_mi_184_fact.num_dias_miembro IS NOT NULL AND query.num_dias_miembro IS NULL)
			OR tbn1_mi_184_fact.porcentaje_participacion<>query.porcentaje_participacion OR (tbn1_mi_184_fact.porcentaje_participacion IS NULL AND query.porcentaje_participacion IS NOT NULL) OR (tbn1_mi_184_fact.porcentaje_participacion IS NOT NULL AND query.porcentaje_participacion IS NULL)
			OR tbn1_mi_184_fact.porcentaje_atribucion<>query.porcentaje_atribucion OR (tbn1_mi_184_fact.porcentaje_atribucion IS NULL AND query.porcentaje_atribucion IS NOT NULL) OR (tbn1_mi_184_fact.porcentaje_atribucion IS NOT NULL AND query.porcentaje_atribucion IS NULL)
			OR tbn1_mi_184_fact.valor_declarante<>query.valor_declarante OR (tbn1_mi_184_fact.valor_declarante IS NULL AND query.valor_declarante IS NOT NULL) OR (tbn1_mi_184_fact.valor_declarante IS NOT NULL AND query.valor_declarante IS NULL)
			OR tbn1_mi_184_fact.valor_declarado<>query.valor_declarado OR (tbn1_mi_184_fact.valor_declarado IS NULL AND query.valor_declarado IS NOT NULL) OR (tbn1_mi_184_fact.valor_declarado IS NOT NULL AND query.valor_declarado IS NULL)
			OR tbn1_mi_184_fact.contador_declarados<>query.contador_declarados OR (tbn1_mi_184_fact.contador_declarados IS NULL AND query.contador_declarados IS NOT NULL) OR (tbn1_mi_184_fact.contador_declarados IS NOT NULL AND query.contador_declarados IS NULL))) THEN
		UPDATE SET
			volumen_operaciones=query.volumen_operaciones,
			num_dias_miembro=query.num_dias_miembro,
			porcentaje_participacion=query.porcentaje_participacion,
			porcentaje_atribucion=query.porcentaje_atribucion,
			valor_declarante=query.valor_declarante,
			valor_declarado=query.valor_declarado,
			contador_declarados=query.contador_declarados
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_periodos,id_dim_datos_caratula,id_dim_marcas_declarante,id_dim_declarantes,id_dim_declarantes_2,id_dim_datos_detalle,id_dim_marcas_declarado,id_dim_declarados,id_dim_datos_economicos_declarante,id_dim_datos_economicos_declarado,volumen_operaciones,num_dias_miembro,porcentaje_participacion,porcentaje_atribucion,valor_declarante,valor_declarado,contador_declarados) VALUES (
			query.id_dim_documentos,
			query.id_dim_periodos,
			query.id_dim_datos_caratula,
			query.id_dim_marcas_declarante,
			query.id_dim_declarantes,
			query.id_dim_declarantes_2,
			query.id_dim_datos_detalle,
			query.id_dim_marcas_declarado,
			query.id_dim_declarados,
			query.id_dim_datos_economicos_declarante,
			query.id_dim_datos_economicos_declarado,
			query.volumen_operaciones,
			query.num_dias_miembro,
			query.porcentaje_participacion,
			query.porcentaje_atribucion,
			query.valor_declarante,
			query.valor_declarado,
			query.contador_declarados
			)
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

/*****************/
/*SP CON LOS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_184_irfp_sociedades_irnr' AND ROUTINE_TYPE='PROCEDURE')
	DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_184_irfp_sociedades_irnr;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_184_irfp_sociedades_irnr(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_184_irfp_sociedades_irnr'
	SET NOCOUNT ON;
	DECLARE @log int;
	EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
	DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
	DECLARE @continuar_en_caso_error bit=0;
	IF @logpadre IS NOT NULL 
	AND EXISTS
	(
		SELECT	1 AS expr1
		FROM	dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
		WHERE	'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
		AND		excluido=1
	) 
	BEGIN
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error='EXCLUÍDO'
		WHERE	id_log=@log;
		RETURN
	END
	
	BEGIN TRY

		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_documentos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_periodos @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_caratula @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_marcas_declarante @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_declarantes @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_declarantes_2 @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_detalle @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_marcas_declarado @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_declarados @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_economicos_declarante @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_dim_datos_economicos_declarado @log
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_184_fact @log
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;

	END TRY

	BEGIN CATCH
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
		UPDATE	dbn1_norm_dhyf.audit.tbn1_logs 
		SET		mensaje_error=error_message(),
				procedimiento_error=error_procedure()
		WHERE	id_log=@log;
		IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
	END CATCH

END

/***********************/
/*FIN - SP CON LOS EXEC*/
/***********************/