PRINT 'Script maestro_unidad_consumo_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_unidad_consumo' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_unidad_consumo;
GO

CREATE FUNCTION fnn1_query_carga_maestro_unidad_consumo() RETURNS TABLE AS RETURN

------------Query------------


	SELECT	'K'		AS cod_unidad_consumo,	
			'Kwh' 	AS unidad_consumo	
	UNION
	SELECT	'M'			AS cod_unidad_consumo,	
			'Megawh' 	AS unidad_consumo
	UNION
	SELECT	'G'			AS cod_unidad_consumo,	
			'Gigawh' 	AS unidad_consumo	
	UNION
	SELECT	'T'			AS cod_unidad_consumo,	
			'Terawh' 	AS unidad_consumo	

			
GO	



