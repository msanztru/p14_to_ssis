
IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica_2014_full_extract' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica_2014_full_extract;
GO

CREATE PROCEDURE [dbo].[spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica_2014_full_extract](@p_id_carga int) AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_mi_ds_159_consumo_energia_electrica_2014_full_extract',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					@p_out_id		= @id OUT

----CABECERA
select  
    doc.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
	coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
    cabe.cabe_ejercicio AS ejercicio,
    coalesce(cabe.cabe_modelo,'') AS modelo,
    coalesce(cabe.cabe_admon,'') AS administracion_declarante,
    CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
	coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_159,
    coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
    CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
    coalesce(cabe.cabe_telefono,'') AS telefono,
    coalesce(cabe.cabe_persona,'') AS razon_social,
    coalesce(cabe.cabe_refpres,'') AS cod_presentador_colectivo,
    coalesce(cabe.cabe_banco,'') AS cod_banco_espania,
	cabe.cabe_tiposoporte AS cod_tipo_presentacion,
	CASE WHEN cabe.cabe_fecpres IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecpres END AS fecha_presentacion,
	CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN month(cabe.cabe_fecpres) ELSE 0 END AS mes_presentacion,
	CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN year(cabe.cabe_fecpres) ELSE 0 END AS anyo_presentacion,
    cabe.cabe_numcaja AS num_caja,
	CASE WHEN cabe.cabe_fecalta IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecalta END AS fecha_alta,
	CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN month(cabe.cabe_fecalta) ELSE 0 END AS mes_alta,
	CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN year(cabe.cabe_fecalta) ELSE 0 END AS anyo_alta,
    cabe.cabe_justif AS num_justificante,
	cabe.cabe_tipodecl AS cod_tipo_declaracion,
    cabe.cabe_crevi AS contador_revisiones,
    cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
	cabe_referdoc,
	cast(cabe.cabe_referdoc	as varchar(9)) as cabe_referdoc_v

into
 #cabecera_159
from (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='159') cabe
      --no_identificados_declarante
      LEFT JOIN (SELECT id_mae_no_identificados, ejercicio, clavagru, clavdeta  FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE  aplicacion = 'MF' AND detamodel = '159' ) mae_noid_cabe
                ON    (cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
                AND cast(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
                AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000')    
      INNER JOIN fnn1_query_carga_ds_mi_ds_159_consumo_energia_electrica_2014_f_id_documento(2) doc ON (doc.referencia_larga=CAST(cabe.cabe_ejercicio AS varchar)+'I<'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000')
	  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
      LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cabe_cifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS date))
      CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos


--DECLARADO
select
	coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
    coalesce(declarado.mfpe59_admon,'') AS administracion_declarado,
    CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
	coalesce(left(coalesce(declarado.mfpe59_cif,''),9)+' '+right(coalesce(declarado.mfpe59_cif,''),2),'') AS nif_declarado_159,
    CAST(declarado.mfpe59_secuen AS varchar) AS secuencia,
    coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
    CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
    CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
	declarado.mfpe59_tipo_codigo AS cod_clave_tipo_codigo,
	coalesce(declarado.mfpe59_iban,'') AS codigo_iban,
    coalesce(declarado.mfpe59_ccc_banco,'') AS codigo_entidad,
    coalesce(declarado.mfpe59_ccc_sucur,'') AS codigo_sucursal,
    coalesce(declarado.mfpe59_ccc_dc,'') AS digito_control,
    coalesce(declarado.mfpe59_ccc_cuenta,'') AS numero_cuenta,
	declarado.mfpe59_cie_pais AS cod_pais_residencia,
    declarado.mfpe59_cie_codigo AS identificacion_extranjero,
    declarado.mfpe59_contrato AS contrato_suministro,
	declarado.mfpe59_cups_pais AS cod_cups_pais,
    declarado.mfpe59_cups_dist AS cups_distribuidora,
    declarado.mfpe59_cups_libre AS cups_num_libre_asignacion,  
    declarado.mfpe59_cups_dc AS cups_digito_control,
    declarado.mfpe59_cups_medida AS cups_medida,  
    declarado.mfpe59_cups_suministro AS cups_suministro, 
	declarado.mfpe59_tipo_bien AS cod_tipo_bien, 
    declarado.mfpe59_situacion AS cod_situacion_inmueble, 
    declarado.mfpe59_refcat AS referencia_catastral,
	CASE WHEN declarado.mfpe59_fecalta IS NULL THEN '0001-01-01' ELSE declarado.mfpe59_fecalta END AS fecha_alta_contrato,
	CASE WHEN declarado.mfpe59_fecalta IS NOT NULL THEN month(declarado.mfpe59_fecalta) ELSE 0 END AS mes_alta_contrato,
	CASE WHEN declarado.mfpe59_fecalta IS NOT NULL THEN year(declarado.mfpe59_fecalta) ELSE 0 END AS anyo_alta_contrato,
	CASE WHEN declarado.mfpe59_fecbaja IS NULL THEN '0001-01-01' ELSE declarado.mfpe59_fecbaja END AS fecha_baja_contrato,
	CASE WHEN declarado.mfpe59_fecbaja IS NOT NULL THEN month(declarado.mfpe59_fecbaja) ELSE 0 END AS mes_baja_contrato,
	CASE WHEN declarado.mfpe59_fecbaja IS NOT NULL THEN year(declarado.mfpe59_fecbaja) ELSE 0 END AS anyo_baja_contrato,
    declarado.mfpe59_unidad_medida AS cod_unidad_consumo,
    declarado.mfpe59_pot_unidad AS cod_unidad_potencia,
	CAST(declarado.mfpe59_pot_maxima AS decimal)/100  AS potencia_maxima_contratada,

	declarado.mfpe59_referdoc  AS referdoc,
	cabe.*

into 
#declarado_159	
from dbn1_stg_dhyf.dbo.tbn1pe59_mf declarado  
     INNER JOIN #cabecera_159 cabe ON cabe.ejercicio=declarado.mfpe59_ejercicio AND cabe.cabe_referdoc=declarado.mfpe59_referdoc AND cabe.administracion_declarante=declarado.mfpe59_admon
     --no_identificados_declarado
     LEFT JOIN (SELECT id_mae_no_identificados, ejercicio, clavagru, clavdeta  FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE  aplicacion = 'MF' AND detamodel = '159' ) mae_noid_det
                ON    declarado.mfpe59_ejercicio = mae_noid_det.ejercicio
                AND cast(declarado.mfpe59_referdoc as varchar) = mae_noid_det.clavagru
                AND right('0000000000000' +  cast(declarado.mfpe59_secuen  as varchar) , 13)=  mae_noid_det.clavdeta
     LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d ON (declarado.mfpe59_cif=d.nif_maestro AND d.fec_fin_vigencia=CAST('21000101' AS date))
	
     CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

--DOMICILIO
select
	domicilio.sddomi_municipio AS domi_municipio,
	domicilio.sddomi_cdgo_mun AS domi_codigo_municipio,
	coalesce(domicilio.sddomi_cdgo_prov, '-') AS domi_codigo_provincia,
	domicilio.sddomi_cdgo_postal AS domi_codigo_postal,
	domicilio.sddomi_tipo_via AS domi_tipo_via,
	domicilio.sddomi_nombre_via AS domi_nombre_via,
	domicilio.sddomi_tipo_numero AS domi_tipo_numero,
	domicilio.sddomi_numero_casa AS domi_numero_casa,
	domicilio.sddomi_calificador AS domi_calificador,
	domicilio.sddomi_bloque AS domi_bloque,
	domicilio.sddomi_portal AS domi_portal,
	domicilio.sddomi_escalera AS domi_escalera,
	domicilio.sddomi_piso AS domi_piso,
	domicilio.sddomi_puerta AS domi_puerta,
	domicilio.sddomi_complemento AS domi_complemento,
	domicilio.sddomi_localidad AS domi_localidad,
	
	sddomi_ejercicio AS domi_ejercicio,
	sddomi_admon AS domi_admon,
	sddomi_referdoc AS domi_referdoc,
	cabe.*,
	cast(cabe.secuencia as int) sec_int

into 
--drop table 
#domicilio_159	
from dbn1_stg_dhyf.dbo.tbn1domi_sd domicilio 
	INNER  JOIN #declarado_159 cabe ON cabe.ejercicio=domicilio.sddomi_ejercicio AND sddomi_modelo='159'AND cabe.administracion_declarante=
	domicilio.sddomi_admon AND cabe.cabe_referdoc_v=
	domicilio.sddomi_referdoc-- = '159400055'
	and domicilio.sddomi_secuen = cabe.secuencia

--CONSUMOS - IMPORTES
INSERT INTO #result_extract (
   id_documento ,
   id_expediente ,
   id_mae_no_id_declarante ,
   id_mae_no_id_declarado ,
   ejercicio ,
   modelo,
   administracion_declarante,
   es_externo_declarante ,
   nif_declarante_159 ,
   id_contribuyente_declarante ,
   es_identificado_declarante ,
   telefono ,
   razon_social ,
   cod_presentador_colectivo ,
   cod_banco_espania,
   cod_tipo_presentacion ,
   fecha_presentacion ,
   mes_presentacion ,
   anyo_presentacion ,
   num_caja ,
   fecha_alta ,
   mes_alta ,
   anyo_alta ,
   num_justificante,
   cod_tipo_declaracion,
   contador_revisiones ,
   regimen_fiscal_deducciones,
   administracion_declarado,
   es_externo_declarado ,
   nif_declarado_159,
   secuencia,
   id_contribuyente_declarado ,
   es_identificado_declarado ,
   es_erroneo_declarado ,
   cod_clave_tipo_codigo,
   codigo_iban,
   codigo_entidad,
   codigo_sucursal,
   digito_control ,
   numero_cuenta ,
   cod_pais_residencia,
   identificacion_extranjero ,
   contrato_suministro ,
   cod_cups_pais,
   cups_distribuidora,
   cups_num_libre_asignacion ,
   cups_digito_control,
   cups_medida,
   cups_suministro ,
   cod_tipo_bien,
   cod_situacion_inmueble,
   referencia_catastral ,
   fecha_alta_contrato ,
   anyo_alta_contrato ,
   mes_alta_contrato ,
   fecha_baja_contrato ,
   mes_baja_contrato ,
   anyo_baja_contrato ,
   cod_unidad_consumo ,
   cod_unidad_potencia ,
   potencia_maxima_contratada ,
   cod_tipo_importe,
   importe ,
   cod_periodo_facturado ,
   consumo_facturado ,
   cod_tipo_lectura ,
   domi_municipio ,
   domi_codigo_municipio ,
   domi_codigo_provincia ,
   domi_codigo_postal ,
   domi_tipo_via ,
   domi_nombre_via ,
   domi_tipo_numero ,
   domi_numero_casa ,
   domi_calificador ,
   domi_bloque ,
   domi_portal ,
   domi_escalera ,
   domi_piso ,
   domi_puerta ,
   domi_complemento ,
   domi_localidad
  )
  select    id_documento ,
   id_expediente ,
   id_mae_no_id_declarante ,
   id_mae_no_id_declarado ,
   ejercicio ,
   modelo,
   administracion_declarante,
   es_externo_declarante ,
   nif_declarante_159 ,
   id_contribuyente_declarante ,
   es_identificado_declarante ,
   telefono ,
   razon_social ,
   cod_presentador_colectivo ,
   cod_banco_espania,
   cod_tipo_presentacion ,
   fecha_presentacion ,
   mes_presentacion ,
   anyo_presentacion ,
   num_caja ,
   fecha_alta ,
   mes_alta ,
   anyo_alta ,
   num_justificante,
   cod_tipo_declaracion,
   contador_revisiones ,
   regimen_fiscal_deducciones,
   administracion_declarado,
   es_externo_declarado ,
   nif_declarado_159,
   secuencia,
   id_contribuyente_declarado ,
   es_identificado_declarado ,
   es_erroneo_declarado ,
   cod_clave_tipo_codigo,
   codigo_iban,
   codigo_entidad,
   codigo_sucursal,
   digito_control ,
   numero_cuenta ,
   cod_pais_residencia,
   identificacion_extranjero ,
   contrato_suministro ,
   cod_cups_pais,
   cups_distribuidora,
   cups_num_libre_asignacion ,
   cups_digito_control,
   cups_medida,
   cups_suministro ,
   cod_tipo_bien,
   cod_situacion_inmueble,
   referencia_catastral ,
   fecha_alta_contrato ,
   anyo_alta_contrato ,
   mes_alta_contrato ,
   fecha_baja_contrato ,
   mes_baja_contrato ,
   anyo_baja_contrato ,
   cod_unidad_consumo ,
   cod_unidad_potencia ,
   potencia_maxima_contratada ,
   cod_tipo_importe,
   importe ,
   cod_periodo_facturado ,
   consumo_facturado ,
   cod_tipo_lectura ,
   domi_municipio ,
   domi_codigo_municipio ,
   domi_codigo_provincia ,
   domi_codigo_postal ,
   domi_tipo_via ,
   domi_nombre_via ,
   domi_tipo_numero ,
   domi_numero_casa ,
   domi_calificador,
   domi_bloque ,
   domi_portal ,
   domi_escalera ,
   domi_piso ,
   domi_puerta ,
   domi_complemento ,
   domi_localidad
   from (
	select 
	cabe.*,
	c.mfco59_admon as admon,
	null as cod_tipo_importe, 0 as importe, c.mfco59_periodo as cod_periodo_facturado, c.mfco59_con_fact as consumo_facturado, c.mfco59_con_tipo as cod_tipo_lectura
	from tbn1co59_mf c
	inner join #domicilio_159 cabe ON cabe.ejercicio=c.mfco59_ejercicio AND cabe.administracion_declarante=c.mfco59_admon AND cabe.cabe_referdoc=c.mfco59_referdoc and cabe.sec_int = c.mfco59_secuen

union all

	select cabe.*,i.mfim59_admon as admon,i.mfim59_tipo as cod_tipo_importe, round(i.mfim59_importe/100,2) as importe, null as cod_periodo_facturado, 0 as consumo_facturado, null as cod_tipo_lectura
	from tbn1im59_mf i
	inner join #domicilio_159 cabe ON cabe.ejercicio=i.mfim59_ejercicio AND cabe.administracion_declarante=i.mfim59_admon AND cabe.cabe_referdoc=i.mfim59_referdoc and cabe.secuencia = i.mfim59_secuen
	) t


	EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT
END TRY
	BEGIN CATCH
		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)
		
		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
	END CATCH


END
