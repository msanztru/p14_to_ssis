PRINT 'Script maestro_clave_operacion_193_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_clave_operacion_193' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_clave_operacion_193;
GO

CREATE FUNCTION fnn1_query_carga_maestro_clave_operacion_193() RETURNS TABLE AS RETURN

------------Query------------

	
	SELECT	'A'	AS cod_clave_operacion_193,	
			'A Rendimientos o rentas obtenidos por la participación en los fondos propios de cualquier entidad' AS clave_operacion_193	
	UNION
	SELECT	'B'	AS cod_clave_operacion_193,	
			'B Rendimientos o rentas obtenidos por la cesión a terceros de capitales propios cuando no correspondan a clave D.' AS clave_operacion_193	
	UNION
	SELECT	'C'	AS cod_clave_operacion_193,	
			'C Otros rendimientos del capital mobiliario o rentas no incluidos en las claves A, B ó D.' AS clave_operacion_193	
	UNION
	SELECT	'D'	AS cod_clave_operacion_193,	
			'D Rendimientos o rentas obtenidos por la cesión a terceros de capitales propios procedentes de entidades vinculadas cuando el perceptor sea contribuyente del IRPF.' AS clave_operacion_193	
	UNION
	SELECT	''	AS cod_clave_operacion_193,	
			'' 	AS clave_operacion_193	
	
GO	

