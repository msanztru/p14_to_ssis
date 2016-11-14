PRINT 'Script maestro_tipo_importe_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_tipo_importe' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_tipo_importe;
GO

CREATE FUNCTION fnn1_query_carga_maestro_tipo_importe() RETURNS TABLE AS RETURN

------------Query------------

SELECT
		CAST(NULL AS varchar(2)) AS cod_tipo_importe,
		CAST(NULL AS varchar(50)) AS tipo_importe
	--FROM table t
	WHERE 1 = 0

	
GO	