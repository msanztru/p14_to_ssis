PRINT 'Script maestro_unidad_potencia_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_unidad_potencia' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_unidad_potencia;
GO

CREATE FUNCTION fnn1_query_carga_maestro_unidad_potencia() RETURNS TABLE AS RETURN

------------Query------------

	SELECT	'K'		AS cod_unidad_potencia,	
			'Kw' 	AS unidad_potencia	
	UNION
	SELECT	'M'			AS cod_unidad_potencia,	
			'Megaw' 	AS unidad_potencia
	UNION
	SELECT	'G'			AS cod_unidad_potencia,	
			'Gigaw' 	AS unidad_potencia	
	UNION
	SELECT	'T'			AS cod_unidad_potencia,	
			'Teraw' 	AS unidad_potencia	

GO	

