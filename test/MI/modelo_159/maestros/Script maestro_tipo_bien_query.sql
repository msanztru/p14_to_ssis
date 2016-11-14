PRINT 'Script maestro_tipo_bien_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_tipo_bien' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_tipo_bien;
GO

CREATE FUNCTION fnn1_query_carga_maestro_tipo_bien() RETURNS TABLE AS RETURN

------------Query------------

	SELECT	'1'	AS cod_tipo_bien,	
			'Referencia de Finca' 	AS tipo_bien	
	UNION
	SELECT	'2'	AS cod_tipo_bien,	
			'Referencia Catastral Individualizada' 	AS tipo_bien


GO

