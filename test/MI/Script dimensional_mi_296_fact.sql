PRINT 'dimensional_mi_296_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact(
	id int IDENTITY(1,1),
	id_dim_documentos int NOT NULL,
	id_dim_datos_caratula int NOT NULL,
	id_dim_periodos int NOT NULL,
	id_dim_marcas int NOT NULL,
	id_dim_declarantes_1 int NOT NULL,
	id_dim_declarados_1 int NOT NULL,
	id_dim_datos_detalle_1 int NOT NULL,
	id_dim_declarantes_2 int NOT NULL,
	id_dim_datos_detalle_2 int NOT NULL,
	id_dim_declarados_2 int NOT NULL,
	base_retenciones_declarante decimal(18,2),
	retenciones_declarante decimal(18,2),
	retenciones_ingdosto_declarante decimal(18,2),
	base_retenciones_declarado decimal(18,2),
	porcentaje_retencion_declarado decimal(5,2),
	retenciones_declarado decimal(18,2),
	remuneracion_prestamista decimal(18,2),
	compensaciones decimal(18,2),
	garantias decimal(18,2),
	importe_asociado_declarante decimal(18,2),
	importe_asociado_declarado decimal(18,2),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos(id_dim_documentos),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula(id_dim_datos_caratula),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos(id_dim_periodos),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas(id_dim_marcas),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarantes_1 FOREIGN KEY (id_dim_declarantes_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1(id_dim_declarantes_1),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarados_1 FOREIGN KEY (id_dim_declarados_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1(id_dim_declarados_1),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_detalle_1 FOREIGN KEY (id_dim_datos_detalle_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1(id_dim_datos_detalle_1),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarantes_2 FOREIGN KEY (id_dim_declarantes_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2(id_dim_declarantes_2),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_detalle_2 FOREIGN KEY (id_dim_datos_detalle_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2(id_dim_datos_detalle_2),
	CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarados_2 FOREIGN KEY (id_dim_declarados_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2(id_dim_declarados_2),
	CONSTRAINT PK_tbn1_mi_296_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_documentos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_datos_caratula int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_periodos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_marcas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarantes_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_declarantes_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarados_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_declarados_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_datos_detalle_1 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_declarantes_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_datos_detalle_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarados_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD id_dim_declarados_2 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='base_retenciones_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD base_retenciones_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='retenciones_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD retenciones_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='retenciones_ingdosto_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD retenciones_ingdosto_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='base_retenciones_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD base_retenciones_declarado decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='porcentaje_retencion_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD porcentaje_retencion_declarado decimal(5,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='retenciones_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD retenciones_declarado decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='remuneracion_prestamista')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD remuneracion_prestamista decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='compensaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD compensaciones decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='garantias')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD garantias decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='importe_asociado_declarante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD importe_asociado_declarante decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='importe_asociado_declarado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD importe_asociado_declarado decimal(18,2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_documentos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_documentos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_datos_caratula' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_datos_caratula int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_periodos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_periodos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_marcas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarantes_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_declarantes_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarados_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_declarados_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_datos_detalle_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_datos_detalle_1 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarantes_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_declarantes_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_datos_detalle_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_datos_detalle_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='id_dim_declarados_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN id_dim_declarados_2 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='base_retenciones_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN base_retenciones_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='retenciones_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN retenciones_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='retenciones_ingdosto_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN retenciones_ingdosto_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='base_retenciones_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN base_retenciones_declarado decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='porcentaje_retencion_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN porcentaje_retencion_declarado decimal(5,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='retenciones_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN retenciones_declarado decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='remuneracion_prestamista' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN remuneracion_prestamista decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='compensaciones' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN compensaciones decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='garantias' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN garantias decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='importe_asociado_declarante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN importe_asociado_declarante decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND COLUMN_NAME='importe_asociado_declarado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ALTER COLUMN importe_asociado_declarado decimal(18,2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='PK_tbn1_mi_296_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT PK_tbn1_mi_296_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_documentos FOREIGN KEY (id_dim_documentos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos(id_dim_documentos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_caratula')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_caratula FOREIGN KEY (id_dim_datos_caratula) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula(id_dim_datos_caratula)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_periodos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_periodos FOREIGN KEY (id_dim_periodos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos(id_dim_periodos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas(id_dim_marcas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarantes_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarantes_1 FOREIGN KEY (id_dim_declarantes_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1(id_dim_declarantes_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarados_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarados_1 FOREIGN KEY (id_dim_declarados_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1(id_dim_declarados_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_detalle_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_detalle_1 FOREIGN KEY (id_dim_datos_detalle_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1(id_dim_datos_detalle_1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarantes_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarantes_2 FOREIGN KEY (id_dim_declarantes_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2(id_dim_declarantes_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_detalle_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_datos_detalle_2 FOREIGN KEY (id_dim_datos_detalle_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2(id_dim_datos_detalle_2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mi_296_fact' AND CONSTRAINT_NAME='FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarados_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact ADD CONSTRAINT FK_tbn1_mi_296_fact_tbn1_mi_296_dim_declarados_2 FOREIGN KEY (id_dim_declarados_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2(id_dim_declarados_2)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_mi_296_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_mi_296_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_mi_296_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_fact'
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
			datos_caratula.id_dim_datos_caratula AS id_dim_datos_caratula,
			periodos.id_dim_periodos AS id_dim_periodos,
			marcas.id_dim_marcas AS id_dim_marcas,
			declarantes_1.id_dim_declarantes_1 AS id_dim_declarantes_1,
			declarados_1.id_dim_declarados_1 AS id_dim_declarados_1,
			datos_detalle_1.id_dim_datos_detalle_1 AS id_dim_datos_detalle_1,
			declarantes_2.id_dim_declarantes_2 AS id_dim_declarantes_2,
			datos_detalle_2.id_dim_datos_detalle_2 AS id_dim_datos_detalle_2,
			declarados_2.id_dim_declarados_2 AS id_dim_declarados_2,
			sum(ds_t.base_retenciones_declarante) AS base_retenciones_declarante,
			sum(ds_t.retenciones_declarante) AS retenciones_declarante,
			sum(ds_t.retenciones_ingdosto_declarante) AS retenciones_ingdosto_declarante,
			sum(ds_t.base_retenciones_declarado) AS base_retenciones_declarado,
			sum(ds_t.porcentaje_retencion_declarado) AS porcentaje_retencion_declarado,
			sum(ds_t.retenciones_declarado) AS retenciones_declarado,
			sum(ds_t.remuneracion_prestamista) AS remuneracion_prestamista,
			sum(ds_t.compensaciones) AS compensaciones,
			sum(ds_t.garantias) AS garantias,
			sum(ds_t.importe_asociado_declarante) AS importe_asociado_declarante,
			sum(ds_t.importe_asociado_declarado) AS importe_asociado_declarado
		FROM dbn1_norm_dhyf.dbo.tbn1_mi_ds_296_renta_no_residentes_sin_establecimiento_permanente ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_documentos AS documentos ON (documentos.id_documento=ds_t.id_documento AND documentos.id_expediente=ds_t.id_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_caratula AS datos_caratula ON (datos_caratula.id_tipo_presentacion=ds_t.id_tipo_presentacion AND datos_caratula.id_tipo_soporte=ds_t.id_tipo_soporte AND datos_caratula.referencia_presentacion_colectiva=ds_t.referencia_presentacion_colectiva AND datos_caratula.id_tipo_declaracion=ds_t.id_tipo_declaracion AND datos_caratula.contador_revisiones=ds_t.contador_revisiones AND datos_caratula.usuario_retenedor=ds_t.usuario_retenedor AND datos_caratula.id_administracion_declarante=ds_t.id_administracion_declarante)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_periodos AS periodos ON (periodos.fecha_presentacion=ds_t.fecha_presentacion AND periodos.mes_presentacion=ds_t.mes_presentacion AND periodos.anyo_presentacion=ds_t.anyo_presentacion AND periodos.fecha_devengo=ds_t.fecha_devengo AND periodos.mes_devengo=ds_t.mes_devengo AND periodos.anyo_devengo=ds_t.anyo_devengo AND periodos.fecha_inicio_prestamo=ds_t.fecha_inicio_prestamo AND periodos.mes_inicio_prestamo=ds_t.mes_inicio_prestamo AND periodos.anyo_inicio_prestamo=ds_t.anyo_inicio_prestamo AND periodos.fecha_vencimiento_prestamo=ds_t.fecha_vencimiento_prestamo AND periodos.mes_vencimiento_prestamo=ds_t.mes_vencimiento_prestamo AND periodos.anyo_vencimiento_prestamo=ds_t.anyo_vencimiento_prestamo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_marcas AS marcas ON (marcas.es_anulada=ds_t.es_anulada AND marcas.es_mediador=ds_t.es_mediador AND marcas.es_pendiente=ds_t.es_pendiente AND marcas.es_contribuyente_declarante=ds_t.es_contribuyente_declarante AND marcas.es_identificado_declarante=ds_t.es_identificado_declarante AND marcas.sw_identificado_declarante=ds_t.sw_identificado_declarante AND marcas.es_contribuyente_declarado=ds_t.es_contribuyente_declarado AND marcas.es_identificado_declarado=ds_t.es_identificado_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_1 AS declarantes_1 ON (declarantes_1.telefono_contacto=ds_t.telefono_contacto AND declarantes_1.nombre_contacto=ds_t.nombre_contacto AND declarantes_1.nif_declarante_296=ds_t.nif_declarante_296 AND declarantes_1.nif_declarante_no_identificado=ds_t.nif_declarante_no_identificado AND declarantes_1.id_contribuyente_declarante=ds_t.id_contribuyente_declarante AND declarantes_1.id_mae_no_id_declarante=ds_t.id_mae_no_id_declarante)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_1 AS declarados_1 ON (declarados_1.secuencia=ds_t.secuencia AND declarados_1.nif_declarado_296=ds_t.nif_declarado_296 AND declarados_1.nif_declarado_no_identificado=ds_t.nif_declarado_no_identificado AND declarados_1.id_contribuyente_declarado=ds_t.id_contribuyente_declarado AND declarados_1.sw_identificado_declarado=ds_t.sw_identificado_declarado AND declarados_1.id_mae_no_id_declarado=ds_t.id_mae_no_id_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_1 AS datos_detalle_1 ON (datos_detalle_1.id_pais=ds_t.id_pais AND datos_detalle_1.id_mae_naturalezas_renta=ds_t.id_mae_naturalezas_renta AND datos_detalle_1.id_mae_claves_tipos_renta=ds_t.id_mae_claves_tipos_renta AND datos_detalle_1.id_mae_subclaves_tipos_renta=ds_t.id_mae_subclaves_tipos_renta AND datos_detalle_1.id_clave_identificacion_fondo=ds_t.id_clave_identificacion_fondo AND datos_detalle_1.cod_emisor=ds_t.cod_emisor AND datos_detalle_1.id_mae_claves_pago=ds_t.id_mae_claves_pago AND datos_detalle_1.id_tipo_codigo=ds_t.id_tipo_codigo AND datos_detalle_1.id_mae_entidades_bancarias=ds_t.id_mae_entidades_bancarias AND datos_detalle_1.sucursal=ds_t.sucursal AND datos_detalle_1.digito_control=ds_t.digito_control AND datos_detalle_1.num_cuenta=ds_t.num_cuenta AND datos_detalle_1.ejercicio_devengo=ds_t.ejercicio_devengo AND datos_detalle_1.clave_presentacion_2008=ds_t.clave_presentacion_2008)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarantes_2 AS declarantes_2 ON (declarantes_2.cod_extranjero_declarante=ds_t.cod_extranjero_declarante AND declarantes_2.nombre_declarante=ds_t.nombre_declarante AND declarantes_2.id_mae_claves_personalidad_declarante=ds_t.id_mae_claves_personalidad_declarante AND declarantes_2.c_o_declarante=ds_t.c_o_declarante AND declarantes_2.fecha_poder_declarante=ds_t.fecha_poder_declarante AND declarantes_2.mes_poder_declarante=ds_t.mes_poder_declarante AND declarantes_2.anyo_poder_declarante=ds_t.anyo_poder_declarante AND declarantes_2.nacionalidad_declarante=ds_t.nacionalidad_declarante AND declarantes_2.id_mae_sexos_declarante=ds_t.id_mae_sexos_declarante AND declarantes_2.fecha_nacimiento_declarante=ds_t.fecha_nacimiento_declarante AND declarantes_2.mes_nacimiento_declarante=ds_t.mes_nacimiento_declarante AND declarantes_2.anyo_nacimiento_declarante=ds_t.anyo_nacimiento_declarante AND declarantes_2.nif_pais_residencia_fiscal_declarante=ds_t.nif_pais_residencia_fiscal_declarante)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_datos_detalle_2 AS datos_detalle_2 ON (datos_detalle_2.id_administracion_declarado=ds_t.id_administracion_declarado AND datos_detalle_2.fecha_poder_declarado=ds_t.fecha_poder_declarado AND datos_detalle_2.mes_poder_declarado=ds_t.mes_poder_declarado AND datos_detalle_2.anyo_poder_declarado=ds_t.anyo_poder_declarado)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mi_296_dim_declarados_2 AS declarados_2 ON (declarados_2.cod_extranjero_declarado=ds_t.cod_extranjero_declarado AND declarados_2.nombre_declarado=ds_t.nombre_declarado AND declarados_2.id_mae_claves_personalidad_declarado=ds_t.id_mae_claves_personalidad_declarado AND declarados_2.c_o_declarado=ds_t.c_o_declarado AND declarados_2.nacionalidad_declarado=ds_t.nacionalidad_declarado AND declarados_2.id_mae_sexos_declarado=ds_t.id_mae_sexos_declarado AND declarados_2.fecha_nacimiento_declarado=ds_t.fecha_nacimiento_declarado AND declarados_2.mes_nacimiento_declarado=ds_t.mes_nacimiento_declarado AND declarados_2.anyo_nacimiento_declarado=ds_t.anyo_nacimiento_declarado AND declarados_2.nif_pais_residencia_fiscal_declarado=ds_t.nif_pais_residencia_fiscal_declarado)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			documentos.id_dim_documentos,
			datos_caratula.id_dim_datos_caratula,
			periodos.id_dim_periodos,
			marcas.id_dim_marcas,
			declarantes_1.id_dim_declarantes_1,
			declarados_1.id_dim_declarados_1,
			datos_detalle_1.id_dim_datos_detalle_1,
			declarantes_2.id_dim_declarantes_2,
			datos_detalle_2.id_dim_datos_detalle_2,
			declarados_2.id_dim_declarados_2
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_mi_296_fact AS tbn1_mi_296_fact
	USING query ON query.id_dim_documentos=tbn1_mi_296_fact.id_dim_documentos AND query.id_dim_datos_caratula=tbn1_mi_296_fact.id_dim_datos_caratula AND query.id_dim_periodos=tbn1_mi_296_fact.id_dim_periodos AND query.id_dim_marcas=tbn1_mi_296_fact.id_dim_marcas AND query.id_dim_declarantes_1=tbn1_mi_296_fact.id_dim_declarantes_1 AND query.id_dim_declarados_1=tbn1_mi_296_fact.id_dim_declarados_1 AND query.id_dim_datos_detalle_1=tbn1_mi_296_fact.id_dim_datos_detalle_1 AND query.id_dim_declarantes_2=tbn1_mi_296_fact.id_dim_declarantes_2 AND query.id_dim_datos_detalle_2=tbn1_mi_296_fact.id_dim_datos_detalle_2 AND query.id_dim_declarados_2=tbn1_mi_296_fact.id_dim_declarados_2
	WHEN MATCHED AND ((tbn1_mi_296_fact.base_retenciones_declarante<>query.base_retenciones_declarante OR (tbn1_mi_296_fact.base_retenciones_declarante IS NULL AND query.base_retenciones_declarante IS NOT NULL) OR (tbn1_mi_296_fact.base_retenciones_declarante IS NOT NULL AND query.base_retenciones_declarante IS NULL)
			OR tbn1_mi_296_fact.retenciones_declarante<>query.retenciones_declarante OR (tbn1_mi_296_fact.retenciones_declarante IS NULL AND query.retenciones_declarante IS NOT NULL) OR (tbn1_mi_296_fact.retenciones_declarante IS NOT NULL AND query.retenciones_declarante IS NULL)
			OR tbn1_mi_296_fact.retenciones_ingdosto_declarante<>query.retenciones_ingdosto_declarante OR (tbn1_mi_296_fact.retenciones_ingdosto_declarante IS NULL AND query.retenciones_ingdosto_declarante IS NOT NULL) OR (tbn1_mi_296_fact.retenciones_ingdosto_declarante IS NOT NULL AND query.retenciones_ingdosto_declarante IS NULL)
			OR tbn1_mi_296_fact.base_retenciones_declarado<>query.base_retenciones_declarado OR (tbn1_mi_296_fact.base_retenciones_declarado IS NULL AND query.base_retenciones_declarado IS NOT NULL) OR (tbn1_mi_296_fact.base_retenciones_declarado IS NOT NULL AND query.base_retenciones_declarado IS NULL)
			OR tbn1_mi_296_fact.porcentaje_retencion_declarado<>query.porcentaje_retencion_declarado OR (tbn1_mi_296_fact.porcentaje_retencion_declarado IS NULL AND query.porcentaje_retencion_declarado IS NOT NULL) OR (tbn1_mi_296_fact.porcentaje_retencion_declarado IS NOT NULL AND query.porcentaje_retencion_declarado IS NULL)
			OR tbn1_mi_296_fact.retenciones_declarado<>query.retenciones_declarado OR (tbn1_mi_296_fact.retenciones_declarado IS NULL AND query.retenciones_declarado IS NOT NULL) OR (tbn1_mi_296_fact.retenciones_declarado IS NOT NULL AND query.retenciones_declarado IS NULL)
			OR tbn1_mi_296_fact.remuneracion_prestamista<>query.remuneracion_prestamista OR (tbn1_mi_296_fact.remuneracion_prestamista IS NULL AND query.remuneracion_prestamista IS NOT NULL) OR (tbn1_mi_296_fact.remuneracion_prestamista IS NOT NULL AND query.remuneracion_prestamista IS NULL)
			OR tbn1_mi_296_fact.compensaciones<>query.compensaciones OR (tbn1_mi_296_fact.compensaciones IS NULL AND query.compensaciones IS NOT NULL) OR (tbn1_mi_296_fact.compensaciones IS NOT NULL AND query.compensaciones IS NULL)
			OR tbn1_mi_296_fact.garantias<>query.garantias OR (tbn1_mi_296_fact.garantias IS NULL AND query.garantias IS NOT NULL) OR (tbn1_mi_296_fact.garantias IS NOT NULL AND query.garantias IS NULL)
			OR tbn1_mi_296_fact.importe_asociado_declarante<>query.importe_asociado_declarante OR (tbn1_mi_296_fact.importe_asociado_declarante IS NULL AND query.importe_asociado_declarante IS NOT NULL) OR (tbn1_mi_296_fact.importe_asociado_declarante IS NOT NULL AND query.importe_asociado_declarante IS NULL)
			OR tbn1_mi_296_fact.importe_asociado_declarado<>query.importe_asociado_declarado OR (tbn1_mi_296_fact.importe_asociado_declarado IS NULL AND query.importe_asociado_declarado IS NOT NULL) OR (tbn1_mi_296_fact.importe_asociado_declarado IS NOT NULL AND query.importe_asociado_declarado IS NULL))) THEN
		UPDATE SET
			base_retenciones_declarante=query.base_retenciones_declarante,
			retenciones_declarante=query.retenciones_declarante,
			retenciones_ingdosto_declarante=query.retenciones_ingdosto_declarante,
			base_retenciones_declarado=query.base_retenciones_declarado,
			porcentaje_retencion_declarado=query.porcentaje_retencion_declarado,
			retenciones_declarado=query.retenciones_declarado,
			remuneracion_prestamista=query.remuneracion_prestamista,
			compensaciones=query.compensaciones,
			garantias=query.garantias,
			importe_asociado_declarante=query.importe_asociado_declarante,
			importe_asociado_declarado=query.importe_asociado_declarado
	WHEN NOT MATCHED THEN
		INSERT (id_dim_documentos,id_dim_datos_caratula,id_dim_periodos,id_dim_marcas,id_dim_declarantes_1,id_dim_declarados_1,id_dim_datos_detalle_1,id_dim_declarantes_2,id_dim_datos_detalle_2,id_dim_declarados_2,base_retenciones_declarante,retenciones_declarante,retenciones_ingdosto_declarante,base_retenciones_declarado,porcentaje_retencion_declarado,retenciones_declarado,remuneracion_prestamista,compensaciones,garantias,importe_asociado_declarante,importe_asociado_declarado) VALUES (
			query.id_dim_documentos,
			query.id_dim_datos_caratula,
			query.id_dim_periodos,
			query.id_dim_marcas,
			query.id_dim_declarantes_1,
			query.id_dim_declarados_1,
			query.id_dim_datos_detalle_1,
			query.id_dim_declarantes_2,
			query.id_dim_datos_detalle_2,
			query.id_dim_declarados_2,
			query.base_retenciones_declarante,
			query.retenciones_declarante,
			query.retenciones_ingdosto_declarante,
			query.base_retenciones_declarado,
			query.porcentaje_retencion_declarado,
			query.retenciones_declarado,
			query.remuneracion_prestamista,
			query.compensaciones,
			query.garantias,
			query.importe_asociado_declarante,
			query.importe_asociado_declarado
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
/*SP CON LAS EXEC*/
/*****************/

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_mi_296_renta_no_residentes_sin_establecimiento_permanente' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_mi_296_renta_no_residentes_sin_establecimiento_permanente;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_mi_296_renta_no_residentes_sin_establecimiento_permanente(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_mi_296_renta_no_residentes_sin_establecimiento_permanente'
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
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_documentos @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_periodos @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_datos_caratula @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_marcas @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarantes_1 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarantes_2 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_datos_detalle_1 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_datos_detalle_2 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarados_1 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_dim_declarados_2 @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_cargar_mi_296_fact @log;
		EXEC dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
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