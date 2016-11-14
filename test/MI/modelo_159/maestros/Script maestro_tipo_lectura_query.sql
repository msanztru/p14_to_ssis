PRINT 'Script maestro_tipo_lectura_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_tipo_lectura' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_tipo_lectura;
GO

CREATE FUNCTION fnn1_query_carga_maestro_tipo_lectura() RETURNS TABLE AS RETURN

------------Query------------

	SELECT	'R'	AS cod_tipo_lectura,	
			'Consumo facturado real'  AS tipo_lectura	
	UNION
	SELECT	'E'	AS cod_tipo_lectura,	
			'Consumo facturado estimado'  AS tipo_lectura
			
			
GO	


