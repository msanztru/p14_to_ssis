PRINT 'Script maestro_tipo_domicilio_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_tipo_domicilio' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_tipo_domicilio;
GO

CREATE FUNCTION fnn1_query_carga_maestro_tipo_domicilio() RETURNS TABLE AS RETURN

------------Query------------

	SELECT	'I'	AS cod_tipo_domicilio,	
			'Inmueble'  AS tipo_domicilio	
	UNION
	SELECT	'D'	AS cod_tipo_domicilio,	
			'Domicilio'  AS tipo_domicilio
			
			
GO	

