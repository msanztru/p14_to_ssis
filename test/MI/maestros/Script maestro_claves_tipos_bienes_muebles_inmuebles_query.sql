PRINT 'Script maestro_claves_tipos_bienes_muebles_inmuebles_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_claves_tipos_bienes_muebles_inmuebles' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_claves_tipos_bienes_muebles_inmuebles;
GO

CREATE FUNCTION fnn1_query_carga_maestro_claves_tipos_bienes_muebles_inmuebles() RETURNS TABLE AS RETURN

	SELECT	'U' AS cod_clave_tipo_bien_mueble_inmueble,
			'Urbano' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'R' AS cod_clave_tipo_bien_mueble_inmueble,
			'Rústico' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'J' AS cod_clave_tipo_bien_mueble_inmueble,
			'Joyas y pieles' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'A' AS cod_clave_tipo_bien_mueble_inmueble,
			'Objetos de arte y antigüedades' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'C' AS cod_clave_tipo_bien_mueble_inmueble,
			'Concesiones administrativas' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'D' AS cod_clave_tipo_bien_mueble_inmueble,
			'Derechos de la propiedad intelectual e industrial' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'N' AS cod_clave_tipo_bien_mueble_inmueble,
			'Opciones contractuales' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'O' AS cod_clave_tipo_bien_mueble_inmueble,
			'Otros bienes y derechos de contenido económico' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'V' AS cod_clave_tipo_bien_mueble_inmueble,
			'Vehículos' AS clave_tipo_bien_mueble_inmueble
	UNION
	SELECT	'E' AS cod_clave_tipo_bien_mueble_inmueble,
			'Embarcaciones y aeronaves' AS clave_tipo_bien_mueble_inmueble
GO