PRINT 'Script maestro_no_identificados.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(
	id_mae_no_identificados int IDENTITY(1,1),
	aplicacion varchar(2),
	ejercicio decimal(4,0),
	clavagru varchar(9),
	clavdeta varchar(13),
	detamodel varchar(3),
	detaperio varchar(1),
	detadpto varchar(2),
	detaadmi varchar(2),
	detaprov varchar(2),
	telefono varchar(15),
	email varchar(70),
	refcat varchar(25),
	claveoperacion varchar(1),
	subclaveoperacion varchar(2),
	nif_representante varchar(12),
	importe decimal(12,0),
	nif varchar(12),
	chec varchar(1),
	forjur varchar(1),
	tipo_nif varchar(1),
	anagrama varchar(8),
	razon_social varchar(40),
	sigcal varchar(2),
	nomcal varchar(33),
	porcal varchar(6),
	porbis varchar(1),
	elemen varchar(6),
	clamun decimal(3,0),
	nommun varchar(25),
	codigo_postal decimal(5,0),
	nombre_provincia varchar(25),
	feident date,
	fecha_nacimiento date,
	num_cuenta varchar(20),
	apellido1 varchar(25),
	apellido2 varchar(25),
	nombrepila varchar(25),
	origen varchar(10)
	CONSTRAINT PK_tbn1_mae_no_identificados PRIMARY KEY CLUSTERED (id_mae_no_identificados)
)
WITH (DATA_COMPRESSION=PAGE)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='id_mae_no_identificados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD id_mae_no_identificados int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='aplicacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD aplicacion varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD ejercicio decimal(4,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='clavagru')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD clavagru varchar(9)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='clavdeta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD clavdeta varchar(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='detamodel')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD detamodel varchar(3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='detaperio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD detaperio varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='detadpto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD detadpto varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='detaadmi')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD detaadmi varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='detaprov')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD detaprov varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='telefono')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD telefono varchar(15)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='email')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD email varchar(70)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='refcat')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD refcat varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='claveoperacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD claveoperacion varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='subclaveoperacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD subclaveoperacion varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='nif_representante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD nif_representante varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD importe decimal(12,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD nif varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='chec')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD chec varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='forjur')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD forjur varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='tipo_nif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD tipo_nif varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='anagrama')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD anagrama varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD razon_social varchar(40)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='sigcal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD sigcal varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='nomcal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD nomcal varchar(33)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='porcal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD porcal varchar(6)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='porbis')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD porbis varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='elemen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD elemen varchar(6)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='clamun')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD clamun decimal(3,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='nommun')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD nommun varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='codigo_postal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD codigo_postal decimal(5,0)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='nombre_provincia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD nombre_provincia varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='feident')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD feident date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='fecha_nacimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD fecha_nacimiento date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD num_cuenta varchar(20)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='apellido1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD apellido1 varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='apellido2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD apellido2 varchar(25)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_mae_no_identificados' AND COLUMN_NAME='nombrepila')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ADD nombrepila varchar(25)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_no_identificados_unique')
DROP INDEX IX_tbn1_mae_no_identificados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
CREATE UNIQUE NONCLUSTERED INDEX IX_tbn1_mae_no_identificados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados (aplicacion,ejercicio,clavagru,clavdeta) INCLUDE (id_mae_no_identificados)

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_maestro_no_identificados' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_maestro_no_identificados;
GO

CREATE PROCEDURE dbo.spn1_cargar_maestro_no_identificados(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_maestro_no_identificados'
	SET NOCOUNT ON;
	DECLARE @log int;
	DECLARE @rc int;
	DECLARE @count_all int;
	DECLARE @count_ins int;
	DECLARE @idx_reclim int;
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

		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados ON
		IF NOT EXISTS(SELECT 1 FROM dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE id_mae_no_identificados=-1)
			INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(id_mae_no_identificados,aplicacion,ejercicio,clavagru,clavdeta,origen)
			VALUES(-1,NULL,NULL,NULL,NULL,'MAESTRO')
		SET IDENTITY_INSERT dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados OFF

		IF OBJECT_ID('tempdb..#tmp_mae_no_identificados') IS NOT NULL
			DROP TABLE #tmp_mae_no_identificados
		CREATE table #tmp_mae_no_identificados(
			rr_mode varchar(1),
			id_mae_no_identificados int,
			t_aplicacion varchar(2),
			t_ejercicio decimal(4,0),
			t_clavagru varchar(9),
			t_clavdeta varchar(13),
			aplicacion varchar(2),
			ejercicio decimal(4,0),
			clavagru varchar(9),
			clavdeta varchar(13),
			detamodel varchar(3),
			detaperio varchar(1),
			detadpto varchar(2),
			detaadmi varchar(2),
			detaprov varchar(2),
			telefono varchar(15),
			email varchar(70),
			refcat varchar(25),
			claveoperacion varchar(1),
			subclaveoperacion varchar(2),
			nif_representante varchar(12),
			importe decimal(12,0),
			nif varchar(12),
			chec varchar(1),
			forjur varchar(1),
			tipo_nif varchar(1),
			anagrama varchar(8),
			razon_social varchar(40),
			sigcal varchar(2),
			nomcal varchar(33),
			porcal varchar(6),
			porbis varchar(1),
			elemen varchar(6),
			clamun decimal(3,0),
			nommun varchar(25),
			codigo_postal decimal(5,0),
			nombre_provincia varchar(25),
			feident date,
			fecha_nacimiento date,
			num_cuenta varchar(20),
			apellido1 varchar(25),
			apellido2 varchar(25),
			nombrepila varchar(25)
		);

		;WITH
		query AS (
			SELECT
				aplicacion,
				ejercicio,
				clavagru,
				clavdeta,
				detamodel,
				detaperio,
				detadpto,
				detaadmi,
				detaprov,
				telefono,
				email,
				refcat,
				claveoperacion,
				subclaveoperacion,
				nif_representante,
				importe,
				nif,
				chec,
				forjur,
				tipo_nif,
				anagrama,
				razon_social,
				sigcal,
				nomcal,
				porcal,
				porbis,
				elemen,
				clamun,
				nommun,
				codigo_postal,
				nombre_provincia,
				feident,
				fecha_nacimiento,
				num_cuenta,
				apellido1,
				apellido2,
				nombrepila
			FROM dbo.fnn1_query_carga_maestro_no_identificados()
		)
		INSERT INTO #tmp_mae_no_identificados (rr_mode,id_mae_no_identificados,t_aplicacion,t_ejercicio,t_clavagru,t_clavdeta,aplicacion,ejercicio,clavagru,clavdeta,detamodel,detaperio,detadpto,detaadmi,detaprov,telefono,email,refcat,claveoperacion,subclaveoperacion,nif_representante,importe,nif,chec,forjur,tipo_nif,anagrama,razon_social,sigcal,nomcal,porcal,porbis,elemen,clamun,nommun,codigo_postal,nombre_provincia,feident,fecha_nacimiento,num_cuenta,apellido1,apellido2,nombrepila)
		SELECT
			rr_mode=
				CASE
					WHEN tbn1_mae_no_identificados.id_mae_no_identificados IS NULL THEN 'I'
					WHEN query.aplicacion IS NULL AND query.ejercicio IS NULL AND query.clavagru IS NULL AND query.clavdeta IS NULL AND id_mae_no_identificados<>-1 THEN 'D'
					ELSE 'U' END,
			tbn1_mae_no_identificados.id_mae_no_identificados AS id_mae_no_identificados,
			tbn1_mae_no_identificados.aplicacion AS t_aplicacion,
			tbn1_mae_no_identificados.ejercicio AS t_ejercicio,
			tbn1_mae_no_identificados.clavagru AS t_clavagru,
			tbn1_mae_no_identificados.clavdeta AS t_clavdeta,
			query.aplicacion AS aplicacion,
			query.ejercicio AS ejercicio,
			query.clavagru AS clavagru,
			query.clavdeta AS clavdeta,
			query.detamodel AS detamodel,
			query.detaperio AS detaperio,
			query.detadpto AS detadpto,
			query.detaadmi AS detaadmi,
			query.detaprov AS detaprov,
			query.telefono AS telefono,
			query.email AS email,
			query.refcat AS refcat,
			query.claveoperacion AS claveoperacion,
			query.subclaveoperacion AS subclaveoperacion,
			query.nif_representante AS nif_representante,
			query.importe AS importe,
			query.nif AS nif,
			query.chec AS chec,
			query.forjur AS forjur,
			query.tipo_nif AS tipo_nif,
			query.anagrama AS anagrama,
			query.razon_social AS razon_social,
			query.sigcal AS sigcal,
			query.nomcal AS nomcal,
			query.porcal AS porcal,
			query.porbis AS porbis,
			query.elemen AS elemen,
			query.clamun AS clamun,
			query.nommun AS nommun,
			query.codigo_postal AS codigo_postal,
			query.nombre_provincia AS nombre_provincia,
			query.feident AS feident,
			query.fecha_nacimiento AS fecha_nacimiento,
			query.num_cuenta AS num_cuenta,
			query.apellido1 AS apellido1,
			query.apellido2 AS apellido2,
			query.nombrepila AS nombrepila
		FROM dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados AS tbn1_mae_no_identificados
		FULL JOIN query on ((query.aplicacion=tbn1_mae_no_identificados.aplicacion OR (query.aplicacion IS NULL AND tbn1_mae_no_identificados.aplicacion IS NULL)) AND (query.ejercicio=tbn1_mae_no_identificados.ejercicio OR (query.ejercicio IS NULL AND tbn1_mae_no_identificados.ejercicio IS NULL)) AND (query.clavagru=tbn1_mae_no_identificados.clavagru OR (query.clavagru IS NULL AND tbn1_mae_no_identificados.clavagru IS NULL)) AND (query.clavdeta=tbn1_mae_no_identificados.clavdeta OR (query.clavdeta IS NULL AND tbn1_mae_no_identificados.clavdeta IS NULL)))
		WHERE 
			id_mae_no_identificados IS NULL OR
			(query.aplicacion IS NULL AND query.ejercicio IS NULL AND query.clavagru IS NULL AND query.clavdeta IS NULL AND id_mae_no_identificados<>-1) OR
			(tbn1_mae_no_identificados.detamodel<>query.detamodel OR (tbn1_mae_no_identificados.detamodel IS NULL AND query.detamodel IS NOT NULL) OR (tbn1_mae_no_identificados.detamodel IS NOT NULL AND query.detamodel IS NULL)
				OR tbn1_mae_no_identificados.detaperio<>query.detaperio OR (tbn1_mae_no_identificados.detaperio IS NULL AND query.detaperio IS NOT NULL) OR (tbn1_mae_no_identificados.detaperio IS NOT NULL AND query.detaperio IS NULL)
				OR tbn1_mae_no_identificados.detadpto<>query.detadpto OR (tbn1_mae_no_identificados.detadpto IS NULL AND query.detadpto IS NOT NULL) OR (tbn1_mae_no_identificados.detadpto IS NOT NULL AND query.detadpto IS NULL)
				OR tbn1_mae_no_identificados.detaadmi<>query.detaadmi OR (tbn1_mae_no_identificados.detaadmi IS NULL AND query.detaadmi IS NOT NULL) OR (tbn1_mae_no_identificados.detaadmi IS NOT NULL AND query.detaadmi IS NULL)
				OR tbn1_mae_no_identificados.detaprov<>query.detaprov OR (tbn1_mae_no_identificados.detaprov IS NULL AND query.detaprov IS NOT NULL) OR (tbn1_mae_no_identificados.detaprov IS NOT NULL AND query.detaprov IS NULL)
				OR tbn1_mae_no_identificados.telefono<>query.telefono OR (tbn1_mae_no_identificados.telefono IS NULL AND query.telefono IS NOT NULL) OR (tbn1_mae_no_identificados.telefono IS NOT NULL AND query.telefono IS NULL)
				OR tbn1_mae_no_identificados.email<>query.email OR (tbn1_mae_no_identificados.email IS NULL AND query.email IS NOT NULL) OR (tbn1_mae_no_identificados.email IS NOT NULL AND query.email IS NULL)
				OR tbn1_mae_no_identificados.refcat<>query.refcat OR (tbn1_mae_no_identificados.refcat IS NULL AND query.refcat IS NOT NULL) OR (tbn1_mae_no_identificados.refcat IS NOT NULL AND query.refcat IS NULL)
				OR tbn1_mae_no_identificados.claveoperacion<>query.claveoperacion OR (tbn1_mae_no_identificados.claveoperacion IS NULL AND query.claveoperacion IS NOT NULL) OR (tbn1_mae_no_identificados.claveoperacion IS NOT NULL AND query.claveoperacion IS NULL)
				OR tbn1_mae_no_identificados.subclaveoperacion<>query.subclaveoperacion OR (tbn1_mae_no_identificados.subclaveoperacion IS NULL AND query.subclaveoperacion IS NOT NULL) OR (tbn1_mae_no_identificados.subclaveoperacion IS NOT NULL AND query.subclaveoperacion IS NULL)
				OR tbn1_mae_no_identificados.nif_representante<>query.nif_representante OR (tbn1_mae_no_identificados.nif_representante IS NULL AND query.nif_representante IS NOT NULL) OR (tbn1_mae_no_identificados.nif_representante IS NOT NULL AND query.nif_representante IS NULL)
				OR tbn1_mae_no_identificados.importe<>query.importe OR (tbn1_mae_no_identificados.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_mae_no_identificados.importe IS NOT NULL AND query.importe IS NULL)
				OR tbn1_mae_no_identificados.nif<>query.nif OR (tbn1_mae_no_identificados.nif IS NULL AND query.nif IS NOT NULL) OR (tbn1_mae_no_identificados.nif IS NOT NULL AND query.nif IS NULL)
				OR tbn1_mae_no_identificados.chec<>query.chec OR (tbn1_mae_no_identificados.chec IS NULL AND query.chec IS NOT NULL) OR (tbn1_mae_no_identificados.chec IS NOT NULL AND query.chec IS NULL)
				OR tbn1_mae_no_identificados.forjur<>query.forjur OR (tbn1_mae_no_identificados.forjur IS NULL AND query.forjur IS NOT NULL) OR (tbn1_mae_no_identificados.forjur IS NOT NULL AND query.forjur IS NULL)
				OR tbn1_mae_no_identificados.tipo_nif<>query.tipo_nif OR (tbn1_mae_no_identificados.tipo_nif IS NULL AND query.tipo_nif IS NOT NULL) OR (tbn1_mae_no_identificados.tipo_nif IS NOT NULL AND query.tipo_nif IS NULL)
				OR tbn1_mae_no_identificados.anagrama<>query.anagrama OR (tbn1_mae_no_identificados.anagrama IS NULL AND query.anagrama IS NOT NULL) OR (tbn1_mae_no_identificados.anagrama IS NOT NULL AND query.anagrama IS NULL)
				OR tbn1_mae_no_identificados.razon_social<>query.razon_social OR (tbn1_mae_no_identificados.razon_social IS NULL AND query.razon_social IS NOT NULL) OR (tbn1_mae_no_identificados.razon_social IS NOT NULL AND query.razon_social IS NULL)
				OR tbn1_mae_no_identificados.sigcal<>query.sigcal OR (tbn1_mae_no_identificados.sigcal IS NULL AND query.sigcal IS NOT NULL) OR (tbn1_mae_no_identificados.sigcal IS NOT NULL AND query.sigcal IS NULL)
				OR tbn1_mae_no_identificados.nomcal<>query.nomcal OR (tbn1_mae_no_identificados.nomcal IS NULL AND query.nomcal IS NOT NULL) OR (tbn1_mae_no_identificados.nomcal IS NOT NULL AND query.nomcal IS NULL)
				OR tbn1_mae_no_identificados.porcal<>query.porcal OR (tbn1_mae_no_identificados.porcal IS NULL AND query.porcal IS NOT NULL) OR (tbn1_mae_no_identificados.porcal IS NOT NULL AND query.porcal IS NULL)
				OR tbn1_mae_no_identificados.porbis<>query.porbis OR (tbn1_mae_no_identificados.porbis IS NULL AND query.porbis IS NOT NULL) OR (tbn1_mae_no_identificados.porbis IS NOT NULL AND query.porbis IS NULL)
				OR tbn1_mae_no_identificados.elemen<>query.elemen OR (tbn1_mae_no_identificados.elemen IS NULL AND query.elemen IS NOT NULL) OR (tbn1_mae_no_identificados.elemen IS NOT NULL AND query.elemen IS NULL)
				OR tbn1_mae_no_identificados.clamun<>query.clamun OR (tbn1_mae_no_identificados.clamun IS NULL AND query.clamun IS NOT NULL) OR (tbn1_mae_no_identificados.clamun IS NOT NULL AND query.clamun IS NULL)
				OR tbn1_mae_no_identificados.nommun<>query.nommun OR (tbn1_mae_no_identificados.nommun IS NULL AND query.nommun IS NOT NULL) OR (tbn1_mae_no_identificados.nommun IS NOT NULL AND query.nommun IS NULL)
				OR tbn1_mae_no_identificados.codigo_postal<>query.codigo_postal OR (tbn1_mae_no_identificados.codigo_postal IS NULL AND query.codigo_postal IS NOT NULL) OR (tbn1_mae_no_identificados.codigo_postal IS NOT NULL AND query.codigo_postal IS NULL)
				OR tbn1_mae_no_identificados.nombre_provincia<>query.nombre_provincia OR (tbn1_mae_no_identificados.nombre_provincia IS NULL AND query.nombre_provincia IS NOT NULL) OR (tbn1_mae_no_identificados.nombre_provincia IS NOT NULL AND query.nombre_provincia IS NULL)
				OR tbn1_mae_no_identificados.feident<>query.feident OR (tbn1_mae_no_identificados.feident IS NULL AND query.feident IS NOT NULL) OR (tbn1_mae_no_identificados.feident IS NOT NULL AND query.feident IS NULL)
				OR tbn1_mae_no_identificados.fecha_nacimiento<>query.fecha_nacimiento OR (tbn1_mae_no_identificados.fecha_nacimiento IS NULL AND query.fecha_nacimiento IS NOT NULL) OR (tbn1_mae_no_identificados.fecha_nacimiento IS NOT NULL AND query.fecha_nacimiento IS NULL)
				OR tbn1_mae_no_identificados.num_cuenta<>query.num_cuenta OR (tbn1_mae_no_identificados.num_cuenta IS NULL AND query.num_cuenta IS NOT NULL) OR (tbn1_mae_no_identificados.num_cuenta IS NOT NULL AND query.num_cuenta IS NULL)
				OR tbn1_mae_no_identificados.apellido1<>query.apellido1 OR (tbn1_mae_no_identificados.apellido1 IS NULL AND query.apellido1 IS NOT NULL) OR (tbn1_mae_no_identificados.apellido1 IS NOT NULL AND query.apellido1 IS NULL)
				OR tbn1_mae_no_identificados.apellido2<>query.apellido2 OR (tbn1_mae_no_identificados.apellido2 IS NULL AND query.apellido2 IS NOT NULL) OR (tbn1_mae_no_identificados.apellido2 IS NOT NULL AND query.apellido2 IS NULL)
				OR tbn1_mae_no_identificados.nombrepila<>query.nombrepila OR (tbn1_mae_no_identificados.nombrepila IS NULL AND query.nombrepila IS NOT NULL) OR (tbn1_mae_no_identificados.nombrepila IS NOT NULL AND query.nombrepila IS NULL))

		SET @idx_reclim = 10000
		SELECT @count_all = count(*) from #tmp_mae_no_identificados
		SELECT @count_ins = count(*) from #tmp_mae_no_identificados where rr_mode='I'

		--IF @count_all >= @idx_reclim --Si hay indices no unique se desactivan
		--BEGIN

		--END

		UPDATE dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
			SET
				origen='MAESTRO',
				aplicacion=s.aplicacion,
				ejercicio=s.ejercicio,
				clavagru=s.clavagru,
				clavdeta=s.clavdeta,
				detamodel=s.detamodel,
				detaperio=s.detaperio,
				detadpto=s.detadpto,
				detaadmi=s.detaadmi,
				detaprov=s.detaprov,
				telefono=s.telefono,
				email=s.email,
				refcat=s.refcat,
				claveoperacion=s.claveoperacion,
				subclaveoperacion=s.subclaveoperacion,
				nif_representante=s.nif_representante,
				importe=s.importe,
				nif=s.nif,
				chec=s.chec,
				forjur=s.forjur,
				tipo_nif=s.tipo_nif,
				anagrama=s.anagrama,
				razon_social=s.razon_social,
				sigcal=s.sigcal,
				nomcal=s.nomcal,
				porcal=s.porcal,
				porbis=s.porbis,
				elemen=s.elemen,
				clamun=s.clamun,
				nommun=s.nommun,
				codigo_postal=s.codigo_postal,
				nombre_provincia=s.nombre_provincia,
				feident=s.feident,
				fecha_nacimiento=s.fecha_nacimiento,
				num_cuenta=s.num_cuenta,
				apellido1=s.apellido1,
				apellido2=s.apellido2,
				nombrepila=s.nombrepila
		FROM (
			SELECT
				aplicacion,
				ejercicio,
				clavagru,
				clavdeta,
				detamodel,
				detaperio,
				detadpto,
				detaadmi,
				detaprov,
				telefono,
				email,
				refcat,
				claveoperacion,
				subclaveoperacion,
				nif_representante,
				importe,
				nif,
				chec,
				forjur,
				tipo_nif,
				anagrama,
				razon_social,
				sigcal,
				nomcal,
				porcal,
				porbis,
				elemen,
				clamun,
				nommun,
				codigo_postal,
				nombre_provincia,
				feident,
				fecha_nacimiento,
				num_cuenta,
				apellido1,
				apellido2,
				nombrepila
			FROM #tmp_mae_no_identificados
			WHERE rr_mode='U') s
		WHERE (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.aplicacion=s.aplicacion OR (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.aplicacion IS NULL AND s.aplicacion IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.ejercicio=s.ejercicio OR (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.ejercicio IS NULL AND s.ejercicio IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.clavagru=s.clavagru OR (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.clavagru IS NULL AND s.clavagru IS NULL)) AND (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.clavdeta=s.clavdeta OR (dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados.clavdeta IS NULL AND s.clavdeta IS NULL));
		SET @rc=@@ROWCOUNT;

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_no_identificados_unique')
			ALTER INDEX IX_tbn1_mae_no_identificados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados DISABLE
		END

		INSERT INTO dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados(aplicacion,ejercicio,clavagru,clavdeta,detamodel,detaperio,detadpto,detaadmi,detaprov,telefono,email,refcat,claveoperacion,subclaveoperacion,nif_representante,importe,nif,chec,forjur,tipo_nif,anagrama,razon_social,sigcal,nomcal,porcal,porbis,elemen,clamun,nommun,codigo_postal,nombre_provincia,feident,fecha_nacimiento,num_cuenta,apellido1,apellido2,nombrepila,origen)
		SELECT
			aplicacion,
			ejercicio,
			clavagru,
			clavdeta,
			detamodel,
			detaperio,
			detadpto,
			detaadmi,
			detaprov,
			telefono,
			email,
			refcat,
			claveoperacion,
			subclaveoperacion,
			nif_representante,
			importe,
			nif,
			chec,
			forjur,
			tipo_nif,
			anagrama,
			razon_social,
			sigcal,
			nomcal,
			porcal,
			porbis,
			elemen,
			clamun,
			nommun,
			codigo_postal,
			nombre_provincia,
			feident,
			fecha_nacimiento,
			num_cuenta,
			apellido1,
			apellido2,
			nombrepila
			,'MAESTRO' as origen
			FROM #tmp_mae_no_identificados
			WHERE rr_mode='I';
		SET @rc=@rc + @@ROWCOUNT;

		--IF @count_all >= @idx_reclim --Si hay indices no unique -> rebuild
		--BEGIN

		--END

		IF @count_ins >= @idx_reclim
		BEGIN
			IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.sys.indexes WHERE name = 'IX_tbn1_mae_no_identificados_unique')
			ALTER INDEX IX_tbn1_mae_no_identificados_unique ON dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados REBUILD
		END

		IF OBJECT_ID('tempdb..#tmp_mae_no_identificados') IS NOT NULL
			DROP TABLE #tmp_mae_no_identificados
		EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@rc;
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
