PRINT 'Script maestro_situacion_inmueble_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_situacion_inmueble' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_situacion_inmueble;
GO

CREATE FUNCTION fnn1_query_carga_maestro_situacion_inmueble() RETURNS TABLE AS RETURN

------------Query------------

	
	SELECT	'1'	AS cod_situacion_inmueble,	
			'Inmueble con referencia catastral situado en cualquier punto del territorio español, excepto País Vasco y Navarra'  AS situacion_inmueble	
	UNION
	SELECT	'2'	AS cod_situacion_inmueble,	
			'Inmueble situado en la Comunidad Autónoma del País Vasco o en la Comunidad Foral de Navarra'  AS situacion_inmueble	
	UNION
	SELECT	'3'	AS cod_situacion_inmueble,	
			'Inmueble en cualquiera de las situaciones anteriores pero sin referencia catastral/Número fijo'  AS situacion_inmueble	
	UNION
	SELECT	'4'	AS cod_situacion_inmueble,	
			'Inmueble situado en el extranjero'  AS situacion_inmueble	
	
	
GO