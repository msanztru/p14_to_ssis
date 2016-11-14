PRINT 'Script maestro_claves_caracteres_intervencion_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_claves_caracteres_intervencion' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_claves_caracteres_intervencion;
GO

CREATE FUNCTION fnn1_query_carga_maestro_claves_caracteres_intervencion() RETURNS TABLE AS RETURN

SELECT	'1' AS cod_clave_caracter_intervencion,
		'En nombre propio' AS clave_caracter_intervencion
UNION
SELECT	'2' AS cod_clave_caracter_intervencion,
		'En nombre de terceros' AS clave_caracter_intervencion

GO